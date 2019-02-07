#define NOMINMAX
// API Abstraction
#include "PrimeEngine/APIAbstraction/APIAbstractionDefines.h"

#include "GhostManager.h"

// Outer-Engine includes

// Inter-Engine includes

#include "../Lua/LuaEnvironment.h"

// additional lua includes needed
extern "C"
{
#include "../../luasocket_dist/src/socket.h"
#include "../../luasocket_dist/src/inet.h"
};

#include "../../../GlobalConfig/GlobalConfig.h"

#include "PrimeEngine/GameObjectModel/GameObjectManager.h"
#include "PrimeEngine/Networking/NetworkManager.h"
#include "PrimeEngine/Networking/Server/ServerNetworkManager.h"

#include "PrimeEngine/Scene/DebugRenderer.h"

#include "StreamManager.h"

#include "CharacterControl/Tank/ClientTank.h"
// Sibling/Children includes

namespace PE {
namespace Components {

PE_IMPLEMENT_CLASS1(GhostManager, Component);

GhostManager::GhostManager(PE::GameContext &context, PE::MemoryArena arena, PE::NetworkContext &netContext, Handle hMyself)
: Component(context, arena, hMyself)
{
	m_pNetContext = &netContext;


	if (m_pContext->getNetworkManager()->isInstanceOf<ServerNetworkManager>())
	{
		ServerNetworkManager *sm = (ServerNetworkManager*)m_pContext->getNetworkManager();
		m_targetObjects = &sm->m_ghostTargets;
	}
	else
	{
		m_targetObjects = new std::map<PrimitiveTypes::Byte, Networkable*>();
	}
}

GhostManager::~GhostManager()
{

}

void GhostManager::initialize()
{

}

void GhostManager::addDefaultComponents()
{
	Component::addDefaultComponents();
}

int GhostManager::haveGhostsToSend()
{
	return m_ghostsToSend.size();
}

void GhostManager::tryPrepareAll()
{
	for each(std::pair<PrimitiveTypes::Byte, Networkable*> p in *m_targetObjects) prepareGhost(p.second);
}

void GhostManager::prepareGhost(PE::Networkable *pGhost)
{
	//m_ghostsToSend.push_back(GhostTransmissionData());
	//GhostTransmissionData &back = m_ghostsToSend.back();
	GhostTransmissionData back;
	int dataSize = 0;

	PrimitiveTypes::Int32 classId = pGhost->net_getClassMetaInfo()->m_classId;

	if (classId == -1)
	{
		assert(!"Event's class id is -1, need to add it to global registry");
	}

	// allocate size for class id
	dataSize += 4;
	int ghostSize = pGhost->packStateData(&back.m_payload[dataSize]);
	
	if (ghostSize == 0)
	{
		// cleanup since we won't send this
		//m_ghostsToSend.pop_back();
		return;
	}

	StreamManager::WriteInt32(classId, &back.m_payload[0]);
	dataSize += ghostSize;

	back.m_size = dataSize;

	if (m_pContext->getNetworkManager()->isInstanceOf<ServerNetworkManager>())
	{
		ServerNetworkManager* snm = (ServerNetworkManager*)m_pContext->getNetworkManager();
		for (int i = 0; i < snm->m_clientConnections.m_size; i++)
		{
			snm->m_clientConnections[i].getGhostManager()->m_ghostsToSend.push_back(GhostTransmissionData());
			GhostTransmissionData &foo = snm->m_clientConnections[i].getGhostManager()->m_ghostsToSend.back();
			foo = back;
		}
	}
	else
	{
		m_ghostsToSend.push_back(GhostTransmissionData());
		GhostTransmissionData &foo = m_ghostsToSend.back();
		foo = back;
	}
}

int GhostManager::fillInNextPacket(char *pDataStream, TransmissionRecord *pRecord, int packetSizeAllocated, bool &out_usefulDataSent, bool &out_wantToSendMore)
{
	out_usefulDataSent = false;
    out_wantToSendMore = false;

	if (m_targetObjects->size() == 0) return 0;

	int size = 0;
	size += 4; //allocate some size to know how many ghosts we're sending
	int sizeLeft = packetSizeAllocated - size;

	//if(m_ghostsToSend.size() == 0)
	//for each(std::pair<PrimitiveTypes::Byte, Networkable*> p in *m_targetObjects) prepareGhost(p.second);

	int ghostsSent = 0;
	for (int i = 0; i < m_ghostsToSend.size(); ++i)
	{
		GhostTransmissionData &gst = m_ghostsToSend[i];

		if (gst.m_size > sizeLeft)
		{
			// can't fit this, break out
            out_wantToSendMore = true;
			break;
		}

		// store this to be able to resolve which events were delivered or dropped on transmittion notification
		pRecord->m_sentGhosts.push_back(gst);
		
		memcpy(&pDataStream[size], &gst.m_payload[0], gst.m_size);
		size += gst.m_size;
		sizeLeft = packetSizeAllocated - size;

		ghostsSent++;
	}
	if (ghostsSent > 0)
	{
		StreamManager::WriteInt32(ghostsSent, &pDataStream[0]);
		m_ghostsToSend.erase(m_ghostsToSend.begin(), m_ghostsToSend.begin() + ghostsSent);
	}
	// we are probably sending useful data if we reach here
	if (size > 0)
		out_usefulDataSent = true;

	return size;
}

void GhostManager::processNotification(TransmissionRecord *pTransmittionRecord, bool delivered)
{
	for (unsigned int i = 0; i < pTransmittionRecord->m_sentGhosts.size(); ++i)
	{
		GhostTransmissionData &gst = pTransmittionRecord->m_sentGhosts[i];

		
	}
}

void GhostManager::debugRender(int &threadOwnershipMask, float xoffset/* = 0*/, float yoffset/* = 0*/)
{
	float dy = 0.025f;
	float dx = 0.01f;
	sprintf(PEString::s_buf, "Ghost Manager State Masks:");
	DebugRenderer::Instance()->createTextMesh(
		PEString::s_buf, true, false, false, false, 0,
		Vector3(xoffset, yoffset, 0), 1.0f, threadOwnershipMask);

	char tmpBuf[1024];
	
	sprintf(tmpBuf, "%s", "->");
	for (int j = 0; j < m_targetObjects->size(); ++j)
	{
		// Dario note: I feel sad that tankrep is hardcoded, but oh well
		std::map<PrimitiveTypes::Byte, Networkable*>::iterator it = m_targetObjects->find(j);
		char statemask = ((CharacterControl::Components::TankRep*)it->second)->m_bitmask;

		sprintf(tmpBuf, "%s[", tmpBuf);
		for (int i = 0; i < 8; ++i)
		{
			sprintf(tmpBuf, "%s%d", tmpBuf, ((statemask >> (7-i)) & 1));
		}
		sprintf(tmpBuf, "%s]", tmpBuf);
	}


	DebugRenderer::Instance()->createTextMesh(
		tmpBuf, true, false, false, false, 0,
		Vector3(xoffset + dx, yoffset + dy, 0), 1.f, threadOwnershipMask);

}


int GhostManager::receiveNextPacket(char *pDataStream)
{
	int read = 0;

	int ghostsReceived = 0;
	read += StreamManager::ReadInt32(&pDataStream[0], ghostsReceived);

	for (int i = 0; i < ghostsReceived; ++i)
	{
		PrimitiveTypes::Int32 classId;
		read += StreamManager::ReadInt32(&pDataStream[read], classId);

		PrimitiveTypes::Byte ghostId;
		StreamManager::ReadByte(&pDataStream[read], ghostId);

		if (!m_pContext->m_isServer && ghostId == 1)
			PEINFO("test");

		PrimitiveTypes::Byte statemask;
		StreamManager::ReadByte(&pDataStream[read+1], statemask);

		//Component *pTarget;
		CharacterControl::Components::TankRep* pTarget;

		bool somethingnew = false;
		std::map<PrimitiveTypes::Byte, Networkable*>::iterator it = m_targetObjects->find(ghostId);
		if (it == m_targetObjects->end())
		{
			GlobalRegistry *globalRegistry = GlobalRegistry::Instance();
			MetaInfo *pMetaInfo = globalRegistry->getMetaInfo(classId);
			if (!pMetaInfo->getFactoryConstructFunction())
			{
				assert(!"Received network creation command but don't have factory create function associated with the given class");
			}

			void *p = (pMetaInfo->getFactoryConstructFunction())(*m_pContext, m_arena);
			if (!p)
				assert(!"Factory construct function returned null");

			//pTarget = (Component*)(p);
			pTarget = (CharacterControl::Components::TankRep*)p;

			if(m_pContext->getNetworkManager()->isInstanceOf<ServerNetworkManager>())
				m_targetObjects->insert(std::pair<PrimitiveTypes::Byte, Networkable *>(ghostId, (Networkable*)pTarget));

			somethingnew = true;
		}
		else
		{
			//pTarget = (Component*)it->second;
			pTarget = (CharacterControl::Components::TankRep*)it->second;
		}
		// dario note: for some reason another function gets called if we use component instead of tank rep???
		read += pTarget->constructFromStream(&pDataStream[read]);

		if (!m_pContext->getNetworkManager()->isInstanceOf<ServerNetworkManager>() && somethingnew)
			pTarget->getHandle().release();
	}

	return read;
}

#if 0 // template
//////////////////////////////////////////////////////////////////////////
// ConnectionManager Lua Interface
//////////////////////////////////////////////////////////////////////////
//
void ConnectionManager::SetLuaFunctions(PE::Components::LuaEnvironment *pLuaEnv, lua_State *luaVM)
{
	/*
	static const struct luaL_Reg l_functions[] = {
		{"l_clientConnectToTCPServer", l_clientConnectToTCPServer},
		{NULL, NULL} // sentinel
	};

	luaL_register(luaVM, 0, l_functions);
	*/

	lua_register(luaVM, "l_clientConnectToTCPServer", l_clientConnectToTCPServer);


	// run a script to add additional functionality to Lua side of Skin
	// that is accessible from Lua
// #if APIABSTRACTION_IOS
// 	LuaEnvironment::Instance()->runScriptWorkspacePath("Code/PrimeEngine/Scene/Skin.lua");
// #else
// 	LuaEnvironment::Instance()->runScriptWorkspacePath("Code\\PrimeEngine\\Scene\\Skin.lua");
// #endif

}

int ConnectionManager::l_clientConnectToTCPServer(lua_State *luaVM)
{
	lua_Number lPort = lua_tonumber(luaVM, -1);
	int port = (int)(lPort);

	const char *strAddr = lua_tostring(luaVM, -2);

	GameContext *pContext = (GameContext *)(lua_touserdata(luaVM, -3));

	lua_pop(luaVM, 3);

	pContext->getConnectionManager()->clientConnectToTCPServer(strAddr, port);

	return 0; // no return values
}
#endif
//////////////////////////////////////////////////////////////////////////

	
}; // namespace Components
}; // namespace PE

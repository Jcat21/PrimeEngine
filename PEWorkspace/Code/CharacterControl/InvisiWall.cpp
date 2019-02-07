#include "PrimeEngine/APIAbstraction/APIAbstractionDefines.h"

#include "PrimeEngine/Lua/LuaEnvironment.h"
#include "PrimeEngine/Lua/EventGlue/EventDataCreators.h"
#include "PrimeEngine/Scene/RootSceneNode.h"

#include "PrimeEngine/PrimeEngineIncludes.h"

#include "PrimeEngine/Physics/PhysicsManager.h"
#include "InvisiWall.h"

using namespace PE;
using namespace PE::Components;
using namespace CharacterControl::Events;

namespace CharacterControl{
namespace Events{

PE_IMPLEMENT_CLASS1(Event_Create_InvisiWall, PE::Events::Event_CREATE_MESH);

void Event_Create_InvisiWall::SetLuaFunctions(PE::Components::LuaEnvironment *pLuaEnv, lua_State *luaVM)
{
	static const struct luaL_Reg l_Event_Create_InvisiWall[] = {
		{"Construct", l_Construct},
		{NULL, NULL} // sentinel
	};

	// register the functions in current lua table which is the table for Event_CreateSoldierNPC
	luaL_register(luaVM, 0, l_Event_Create_InvisiWall);
}

int Event_Create_InvisiWall::l_Construct(lua_State* luaVM)
{
    PE::Handle h("Checkpoint", sizeof(Event_Create_InvisiWall));

	// get arguments from stack
	int numArgs, numArgsConst;
	numArgs = numArgsConst = 14;

	PE::GameContext *pContext = (PE::GameContext*)(lua_touserdata(luaVM, -numArgs--));
	Event_Create_InvisiWall *pEvt = new(h) Event_Create_InvisiWall(*pContext);

	float positionFactor = 1.0f / 100.0f;
	Vector3 pos, u, v, n;
	pos.m_x = (float)lua_tonumber(luaVM, -numArgs--) * positionFactor;
	pos.m_y = (float)lua_tonumber(luaVM, -numArgs--) * positionFactor;
	pos.m_z = (float)lua_tonumber(luaVM, -numArgs--) * positionFactor;

	u.m_x = (float)lua_tonumber(luaVM, -numArgs--); u.m_y = (float)lua_tonumber(luaVM, -numArgs--); u.m_z = (float)lua_tonumber(luaVM, -numArgs--);
	v.m_x = (float)lua_tonumber(luaVM, -numArgs--); v.m_y = (float)lua_tonumber(luaVM, -numArgs--); v.m_z = (float)lua_tonumber(luaVM, -numArgs--);
	n.m_x = (float)lua_tonumber(luaVM, -numArgs--); n.m_y = (float)lua_tonumber(luaVM, -numArgs--); n.m_z = (float)lua_tonumber(luaVM, -numArgs--);

	pEvt->m_peuuid = LuaGlue::readPEUUID(luaVM, -numArgs--);
	
	lua_pop(luaVM, numArgsConst); //Second arg is a count of how many to pop

	pEvt->hasCustomOrientation = true;
	pEvt->m_pos = pos;
	pEvt->m_u = u;
	pEvt->m_v = v;
	pEvt->m_n = n;

	LuaGlue::pushTableBuiltFromHandle(luaVM, h); 

	pEvt->sendToServer(pContext);

	return 1;
}

void *Event_Create_InvisiWall::FactoryConstruct(PE::GameContext& context, PE::MemoryArena arena)
{
	Event_Create_InvisiWall *pEvt = new (arena) Event_Create_InvisiWall(context);
	return pEvt;
}

int Event_Create_InvisiWall::packCreationData(char *pDataStream)
{
	int size = 0;
	size += PE::Components::StreamManager::WriteVector3(m_u, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteVector3(m_v, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteVector3(m_n, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteVector3(m_pos, &pDataStream[size]);
	size += PE::Components::StreamManager::WritePEUUID(m_peuuid, &pDataStream[size]);
	return size;
}

int Event_Create_InvisiWall::constructFromStream(char *pDataStream)
{
	int read = 0;
	read += PE::Components::StreamManager::ReadVector3(&pDataStream[read], m_u);
	read += PE::Components::StreamManager::ReadVector3(&pDataStream[read], m_v);
	read += PE::Components::StreamManager::ReadVector3(&pDataStream[read], m_n);
	read += PE::Components::StreamManager::ReadVector3(&pDataStream[read], m_pos);
	read += PE::Components::StreamManager::ReadPEUUID(&pDataStream[read], m_peuuid);
	return read;
}


PE_IMPLEMENT_CLASS1(Event_Create_Server_InvisiWall, Event_Create_InvisiWall);

Event_Create_Server_InvisiWall::Event_Create_Server_InvisiWall(PE::GameContext &context)
	: Event_Create_InvisiWall(context)
{

}

void *Event_Create_Server_InvisiWall::FactoryConstruct(PE::GameContext& context, PE::MemoryArena arena)
{
	Event_Create_Server_InvisiWall *pEvt = new (arena) Event_Create_Server_InvisiWall(context);
	return pEvt;
}

int Event_Create_Server_InvisiWall::packCreationData(char *pDataStream)
{
	int size = 0;
	size += Event_Create_InvisiWall::packCreationData(&pDataStream[size]);
	size += PE::Components::StreamManager::WriteInt32(m_clientTankId, &pDataStream[size]);
	return size;
}

int Event_Create_Server_InvisiWall::constructFromStream(char *pDataStream)
{
	int read = 0;
	read += Event_Create_InvisiWall::constructFromStream(&pDataStream[read]);
	read += PE::Components::StreamManager::ReadInt32(&pDataStream[read], m_clientTankId);
	return read;
}

};
namespace Components {

PE_IMPLEMENT_CLASS1(InvisiWall, Component);

// create Checkpoint form creation event
InvisiWall::InvisiWall(PE::GameContext &context, PE::MemoryArena arena, PE::Handle hMyself, Events::Event_Create_InvisiWall *pEvt)
: Component(context, arena, hMyself)
{
	// need to acquire redner context for this code to execute thread-safe
	m_pContext->getGPUScreen()->AcquireRenderContextOwnership(pEvt->m_threadOwnershipMask);

	PE::Handle hSN("SCENE_NODE", sizeof(SceneNode));
	SceneNode *pSN = new(hSN) SceneNode(*m_pContext, m_arena, hSN);
	pSN->addDefaultComponents();

	pSN->m_base.setPos(pEvt->m_pos);
	pSN->m_base.setU(pEvt->m_u);
	pSN->m_base.setV(pEvt->m_v);
	pSN->m_base.setN(pEvt->m_n);

	RootSceneNode::Instance()->addComponent(hSN);

	addComponent(hSN);

	m_pContext->getGPUScreen()->ReleaseRenderContextOwnership(pEvt->m_threadOwnershipMask);

	// create the wall
	Handle hPC("PHYSICS_COMPONENT", sizeof(PhysicsComponent));
	PhysicsComponent *pPC = new(hPC) PhysicsComponent(*m_pContext, m_arena, hPC, false, false);
	pSN->addComponent(hPC);
	
	Handle hBox("PHYSICS_BOX", sizeof(PhysicsBox));
	PhysicsBox *pBox = new(hBox) PhysicsBox(*m_pContext, m_arena, hBox, Vector3(), Vector3(1,1,1));
	pPC->m_shapes.add(hBox);
	pPC->addComponent(hBox);

	PhysicsManager::Instance()->addPhysCompToList(hPC);
}

void InvisiWall::addDefaultComponents()
{
	Component::addDefaultComponents();
}

}; // namespace Components
}; // namespace CharacterControl

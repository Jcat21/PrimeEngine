#include "PrimeEngine/APIAbstraction/APIAbstractionDefines.h"

#include "PrimeEngine/Lua/LuaEnvironment.h"
#include "PrimeEngine/Lua/EventGlue/EventDataCreators.h"
#include "PrimeEngine/Scene/MeshInstance.h"
#include "PrimeEngine/Scene/RootSceneNode.h"

#include "PrimeEngine/PrimeEngineIncludes.h"

#include "PrimeEngine/Physics/PhysicsManager.h"
#include "PowerUpBlock.h"

//class that triggers the event
#include "CharacterControl/Tank/ClientTank.h"

using namespace PE;
using namespace PE::Components;
using namespace CharacterControl::Events;

namespace CharacterControl{
namespace Events{

PE_IMPLEMENT_CLASS1(Event_Create_PowerUpBlock, PE::Events::Event_CREATE_MESH);

void Event_Create_PowerUpBlock::SetLuaFunctions(PE::Components::LuaEnvironment *pLuaEnv, lua_State *luaVM)
{
	static const struct luaL_Reg l_Event_Create_PowerUpBlock[] = {
		{"Construct", l_Construct},
		{NULL, NULL} // sentinel
	};

	// register the functions in current lua table which is the table for Event_CreateSoldierNPC
	luaL_register(luaVM, 0, l_Event_Create_PowerUpBlock);
}

int Event_Create_PowerUpBlock::l_Construct(lua_State* luaVM)
{
    PE::Handle h("Power-Up Block", sizeof(Event_Create_PowerUpBlock));

	// get arguments from stack
	int numArgs, numArgsConst;
	numArgs = numArgsConst = 16;

	PE::GameContext *pContext = (PE::GameContext*)(lua_touserdata(luaVM, -numArgs--));
	Event_Create_PowerUpBlock *pEvt = new(h) Event_Create_PowerUpBlock(*pContext);

	const char* name = lua_tostring(luaVM, -numArgs--);
	const char* package = lua_tostring(luaVM, -numArgs--);

	float positionFactor = 1.0f / 100.0f;
	Vector3 pos, u, v, n;
	pos.m_x = (float)lua_tonumber(luaVM, -numArgs--) * positionFactor;
	pos.m_y = (float)lua_tonumber(luaVM, -numArgs--) * positionFactor;
	pos.m_z = (float)lua_tonumber(luaVM, -numArgs--) * positionFactor;

	u.m_x = (float)lua_tonumber(luaVM, -numArgs--); u.m_y = (float)lua_tonumber(luaVM, -numArgs--); u.m_z = (float)lua_tonumber(luaVM, -numArgs--);
	v.m_x = (float)lua_tonumber(luaVM, -numArgs--); v.m_y = (float)lua_tonumber(luaVM, -numArgs--); v.m_z = (float)lua_tonumber(luaVM, -numArgs--);
	n.m_x = (float)lua_tonumber(luaVM, -numArgs--); n.m_y = (float)lua_tonumber(luaVM, -numArgs--); n.m_z = (float)lua_tonumber(luaVM, -numArgs--);

	pEvt->m_peuuid = LuaGlue::readPEUUID(luaVM, -numArgs--);

	// set data values before popping memory off stack
	StringOps::writeToString(name, pEvt->m_meshFilename, 255);
	StringOps::writeToString(package, pEvt->m_package, 255);
	
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


void *Event_Create_PowerUpBlock::FactoryConstruct(PE::GameContext& context, PE::MemoryArena arena)
{
	Event_Create_PowerUpBlock *pEvt = new (arena) Event_Create_PowerUpBlock(context);
	return pEvt;
}

int Event_Create_PowerUpBlock::packCreationData(char *pDataStream)
{
	int size = 0;
	size += PE::Components::StreamManager::WriteString(m_meshFilename, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteString(m_package, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteVector3(m_u, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteVector3(m_v, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteVector3(m_n, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteVector3(m_pos, &pDataStream[size]);
	size += PE::Components::StreamManager::WritePEUUID(m_peuuid, &pDataStream[size]);
	return size;
}

int Event_Create_PowerUpBlock::constructFromStream(char *pDataStream)
{
	int read = 0;
	read += PE::Components::StreamManager::ReadString(&pDataStream[read], m_meshFilename);
	read += PE::Components::StreamManager::ReadString(&pDataStream[read], m_package);
	read += PE::Components::StreamManager::ReadVector3(&pDataStream[read], m_u);
	read += PE::Components::StreamManager::ReadVector3(&pDataStream[read], m_v);
	read += PE::Components::StreamManager::ReadVector3(&pDataStream[read], m_n);
	read += PE::Components::StreamManager::ReadVector3(&pDataStream[read], m_pos);
	read += PE::Components::StreamManager::ReadPEUUID(&pDataStream[read], m_peuuid);
	return read;
}


PE_IMPLEMENT_CLASS1(Event_Create_Server_PowerUpBlock, Event_Create_PowerUpBlock);

Event_Create_Server_PowerUpBlock::Event_Create_Server_PowerUpBlock(PE::GameContext &context)
	: Event_Create_PowerUpBlock(context)
{

}

void *Event_Create_Server_PowerUpBlock::FactoryConstruct(PE::GameContext& context, PE::MemoryArena arena)
{
	Event_Create_Server_PowerUpBlock *pEvt = new (arena) Event_Create_Server_PowerUpBlock(context);
	return pEvt;
}

int Event_Create_Server_PowerUpBlock::packCreationData(char *pDataStream)
{
	int size = 0;
	size += Event_Create_PowerUpBlock::packCreationData(&pDataStream[size]);
	size += PE::Components::StreamManager::WriteInt32(m_clientTankId, &pDataStream[size]);
	return size;
}

int Event_Create_Server_PowerUpBlock::constructFromStream(char *pDataStream)
{
	int read = 0;
	read += Event_Create_PowerUpBlock::constructFromStream(&pDataStream[read]);
	read += PE::Components::StreamManager::ReadInt32(&pDataStream[read], m_clientTankId);
	return read;
}

};
namespace Components {

PE_IMPLEMENT_CLASS1(PowerUpBlock, Component);

// create power-up block form creation event
PowerUpBlock::PowerUpBlock(PE::GameContext &context, PE::MemoryArena arena, PE::Handle hMyself, Events::Event_Create_PowerUpBlock *pEvt)
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

	PE::Handle hMeshInstance("MeshInstance", sizeof(MeshInstance));
	MeshInstance *pMeshInstance = new(hMeshInstance) MeshInstance(*m_pContext, m_arena, hMeshInstance);
	pMeshInstance->addDefaultComponents();

	//dario todo: fix lua and py scripts
	pMeshInstance->initFromFile("powerup.mesha", "Powerup", pEvt->m_threadOwnershipMask);

	// add mesh to scene node
	pSN->addComponent(hMeshInstance);

	m_pContext->getGPUScreen()->ReleaseRenderContextOwnership(pEvt->m_threadOwnershipMask);

	// Trigger Volume
	// 1 - set the trigger event with the handle to be released after we passed it
	PE::Handle h("Out of Bounds", sizeof(Event_PowerupReached));
	Events::Event_PowerupReached *test= new(h) Event_PowerupReached();

	// 2 - create the trigger volume
	PE::Handle hTV("TRIGGER_VOLUME", sizeof(TriggerVolume));
	TriggerVolume *pTV = new(hTV) TriggerVolume(*m_pContext, m_arena, hTV, test, test->getClassSize(), TankController::GetClassId(), 5.0f);//if you want a 5 second cooldown , 5.f);
		
	// 3 - add the trigger volume to the scene node
	pSN->addComponent(hTV);

	// 4 - add the shapes to the trigger volume
	PE::Handle hSphere("PHYSICS_SPHERE", sizeof(PhysicsSphere));
	PhysicsSphere *pSphere = new(hSphere) PhysicsSphere(*m_pContext, m_arena, hSphere, Vector3(0, 2, 0), 1);
	pTV->m_shapes.add(hSphere);
	pTV->addComponent(hSphere);

	// 5 - add the trigger volume to the physics manager
	PhysicsManager::Instance()->addTrigCompToList(hTV);
}

void PowerUpBlock::addDefaultComponents()
{
	Component::addDefaultComponents();

	// custom methods of this component
	PE_REGISTER_EVENT_HANDLER(PE::Events::Event_UPDATE, PowerUpBlock::do_UPDATE);
}

void PowerUpBlock::do_UPDATE(PE::Events::Event *pEvt)
{
	PE::Events::Event_UPDATE *pRealEvt = (PE::Events::Event_UPDATE *)(pEvt);

	PE::Handle hFisrtSN = getFirstComponentHandle<SceneNode>();
	if (!hFisrtSN.isValid())
	{
		assert(!"wrong setup. must have scene node referenced");
		return;
	}

	SceneNode *pFirstSN = hFisrtSN.getObject<SceneNode>();

	pFirstSN->m_base.turnRight(0.05f);

	// show or hide the thingy depending on whether it's cooling down
	TriggerVolume *pTV = pFirstSN->getFirstComponent<TriggerVolume>();
	MeshInstance *pMI = pFirstSN->getFirstComponent<MeshInstance>();
	
	if (pTV->m_isCoolingDown && !pMI->m_culledOut)
	{
		pMI->m_culledOut = true;
	}
	else if (!pTV->m_isCoolingDown && pMI->m_culledOut)
	{
		pMI->m_culledOut = false;
	}
}

}; // namespace Components
}; // namespace CharacterControl

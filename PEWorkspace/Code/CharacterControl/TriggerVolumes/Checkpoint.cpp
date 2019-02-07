#include "PrimeEngine/APIAbstraction/APIAbstractionDefines.h"

#include "PrimeEngine/Lua/LuaEnvironment.h"
#include "PrimeEngine/Lua/EventGlue/EventDataCreators.h"
#include "PrimeEngine/Scene/MeshInstance.h"
#include "PrimeEngine/Scene/RootSceneNode.h"

#include "PrimeEngine/PrimeEngineIncludes.h"

#include "PrimeEngine/Physics/PhysicsManager.h"
#include "Checkpoint.h"

//class that triggers the event
#include "CharacterControl/Tank/ClientTank.h"

using namespace PE;
using namespace PE::Components;
using namespace CharacterControl::Events;

namespace CharacterControl{
namespace Events{

PE_IMPLEMENT_CLASS1(Event_Create_Checkpoint, PE::Events::Event_CREATE_MESH);

void Event_Create_Checkpoint::SetLuaFunctions(PE::Components::LuaEnvironment *pLuaEnv, lua_State *luaVM)
{
	static const struct luaL_Reg l_Event_Create_Checkpoint[] = {
		{"Construct", l_Construct},
		{NULL, NULL} // sentinel
	};

	// register the functions in current lua table which is the table for Event_CreateSoldierNPC
	luaL_register(luaVM, 0, l_Event_Create_Checkpoint);
}

int Event_Create_Checkpoint::l_Construct(lua_State* luaVM)
{
    PE::Handle h("Checkpoint", sizeof(Event_Create_Checkpoint));

	// get arguments from stack
	int numArgs, numArgsConst;
	numArgs = numArgsConst = 16;

	PE::GameContext *pContext = (PE::GameContext*)(lua_touserdata(luaVM, -numArgs--));
	Event_Create_Checkpoint *pEvt = new(h) Event_Create_Checkpoint(*pContext);

	const char* checkpointName = lua_tostring(luaVM, -numArgs--);
	const char* nextCheckpoint = lua_tostring(luaVM, -numArgs--);

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
	StringOps::writeToString(checkpointName, pEvt->m_name, 32);
	StringOps::writeToString(nextCheckpoint, pEvt->m_next, 32);
	
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

void *Event_Create_Checkpoint::FactoryConstruct(PE::GameContext& context, PE::MemoryArena arena)
{
	Event_Create_Checkpoint *pEvt = new (arena) Event_Create_Checkpoint(context);
	return pEvt;
}

int Event_Create_Checkpoint::packCreationData(char *pDataStream)
{
	int size = 0;
	size += PE::Components::StreamManager::WriteString(m_name, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteString(m_next, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteVector3(m_u, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteVector3(m_v, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteVector3(m_n, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteVector3(m_pos, &pDataStream[size]);
	size += PE::Components::StreamManager::WritePEUUID(m_peuuid, &pDataStream[size]);
	return size;
}

int Event_Create_Checkpoint::constructFromStream(char *pDataStream)
{
	int read = 0;
	read += PE::Components::StreamManager::ReadString(&pDataStream[read], m_name);
	read += PE::Components::StreamManager::ReadString(&pDataStream[read], m_next);
	read += PE::Components::StreamManager::ReadVector3(&pDataStream[read], m_u);
	read += PE::Components::StreamManager::ReadVector3(&pDataStream[read], m_v);
	read += PE::Components::StreamManager::ReadVector3(&pDataStream[read], m_n);
	read += PE::Components::StreamManager::ReadVector3(&pDataStream[read], m_pos);
	read += PE::Components::StreamManager::ReadPEUUID(&pDataStream[read], m_peuuid);
	return read;
}


PE_IMPLEMENT_CLASS1(Event_Create_Server_Checkpoint, Event_Create_Checkpoint);

Event_Create_Server_Checkpoint::Event_Create_Server_Checkpoint(PE::GameContext &context)
	: Event_Create_Checkpoint(context)
{

}

void *Event_Create_Server_Checkpoint::FactoryConstruct(PE::GameContext& context, PE::MemoryArena arena)
{
	Event_Create_Server_Checkpoint *pEvt = new (arena) Event_Create_Server_Checkpoint(context);
	return pEvt;
}

int Event_Create_Server_Checkpoint::packCreationData(char *pDataStream)
{
	int size = 0;
	size += Event_Create_Checkpoint::packCreationData(&pDataStream[size]);
	size += PE::Components::StreamManager::WriteInt32(m_clientTankId, &pDataStream[size]);
	return size;
}

int Event_Create_Server_Checkpoint::constructFromStream(char *pDataStream)
{
	int read = 0;
	read += Event_Create_Checkpoint::constructFromStream(&pDataStream[read]);
	read += PE::Components::StreamManager::ReadInt32(&pDataStream[read], m_clientTankId);
	return read;
}

};

namespace Components {

PE_IMPLEMENT_CLASS1(Checkpoint, Component);

// create Checkpoint form creation event
Checkpoint::Checkpoint(PE::GameContext &context, PE::MemoryArena arena, PE::Handle hMyself, Events::Event_Create_Checkpoint *pEvt)
: Component(context, arena, hMyself)
{
	StringOps::writeToString(pEvt->m_name, m_name, 32);
	StringOps::writeToString(pEvt->m_next, m_next, 32);

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

	// Trigger Volume Sample
	// 1 - set the trigger event with the handle to be released after we passed it
	PE::Handle h("Event_CheckpointReached", sizeof(Event_CheckpointReached));
	Event_CheckpointReached *test= new(h) Event_CheckpointReached(m_name, m_next);

	// 2 - create the trigger volume
	PE::Handle hTV("TRIGGER_VOLUME", sizeof(TriggerVolume));
	// new parameters: the event, the size of the event, the class of the object that will both trigger and handle the event
	TriggerVolume *pTV = new(hTV) TriggerVolume(*m_pContext, m_arena, hTV, test, test->getClassSize(), TankController::GetClassId());//if you want a 5 second cooldown , 5.f);
		
	// 3 - add the trigger volume to the scene node
	pSN->addComponent(hTV);

	// 4 - add the shapes to the trigger volume
	PE::Handle hBox("PHYSICS_BOX", sizeof(PhysicsBox));

	PhysicsBox *pBox = new(hBox) PhysicsBox(*m_pContext, m_arena, hBox, Vector3(0,2.5f,0), Vector3(10,5,3));
	pTV->m_shapes.add(hBox);
	pTV->addComponent(hBox);

	// 5 - add the trigger volume to the physics manager
	PhysicsManager::Instance()->addTrigCompToList(hTV);
}

void Checkpoint::addDefaultComponents()
{
	Component::addDefaultComponents();

	// custom methods of this component
	PE_REGISTER_EVENT_HANDLER(PE::Events::Event_UPDATE, Checkpoint::do_UPDATE);
}

void Checkpoint::do_UPDATE(PE::Events::Event *pEvt)
{

}

}; // namespace Components
}; // namespace CharacterControl

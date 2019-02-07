#include "PrimeEngine/PrimeEngineIncludes.h"
#include "PrimeEngine/Lua/LuaEnvironment.h"
#include "Events.h"


using namespace PE;
namespace CharacterControl {
namespace Events{

PE_IMPLEMENT_CLASS1(Event_CreateSoldierNPC, PE::Events::Event_CREATE_SKELETON);

void Event_CreateSoldierNPC::SetLuaFunctions(PE::Components::LuaEnvironment *pLuaEnv, lua_State *luaVM)
{
	static const struct luaL_Reg l_Event_CreateSoldierNPC[] = {
		{"Construct", l_Construct},
		{NULL, NULL} // sentinel
	};

	// register the functions in current lua table which is the table for Event_CreateSoldierNPC
	luaL_register(luaVM, 0, l_Event_CreateSoldierNPC);
}

int Event_CreateSoldierNPC::l_Construct(lua_State* luaVM)
{
    PE::Handle h("EVENT", sizeof(Event_CreateSoldierNPC));
	
	// get arguments from stack
	int numArgs, numArgsConst;
	numArgs = numArgsConst = 20;

	PE::GameContext *pContext = (PE::GameContext*)(lua_touserdata(luaVM, -numArgs--));

	// this function should only be called frm game thread, so we can use game thread thread owenrship mask
	Event_CreateSoldierNPC *pEvt = new(h) Event_CreateSoldierNPC(*pContext);

	const char* name = lua_tostring(luaVM, -numArgs--);
	const char* package = lua_tostring(luaVM, -numArgs--);

	const char* gunMeshName = lua_tostring(luaVM, -numArgs--);
	const char* gunMeshPackage = lua_tostring(luaVM, -numArgs--);

	int shape;
	int physShapeType[8];
	float physShapeTranslate[8][3];
	float physShapeScale[8][3];
	float physShapeRadius[8];

	// LUA MAGIC FOR PHYSICS SHAPES!
	lua_pushvalue(luaVM, -numArgs);
	lua_pushnil(luaVM);
	for (shape = 0; lua_next(luaVM, -2); shape++)
	{
		lua_pushnil(luaVM);
		for (; lua_next(luaVM, -2);)
		{
			lua_pushvalue(luaVM, -2);
			if (StringOps::strcmp("type", lua_tostring(luaVM, -1)) == 0)
			{
				if (StringOps::strcmp(lua_tostring(luaVM, -2), "sphere") == 0)
					physShapeType[shape] = 1;
				else if (StringOps::strcmp(lua_tostring(luaVM, -2), "box") == 0)
					physShapeType[shape] = 2;
				else
					physShapeType[shape] = 0;
			}
			else if (StringOps::strcmp("radius", lua_tostring(luaVM, -1)) == 0)
			{
				physShapeRadius[shape] = (float)lua_tonumber(luaVM, -2);
			}
			else if (StringOps::strcmp("scale", lua_tostring(luaVM, -1)) == 0)
			{
				lua_pushvalue(luaVM, -2);
				lua_pushnil(luaVM);
				for (int i = 0; lua_next(luaVM, -2); i++)
				{
					lua_pushvalue(luaVM, -2);
					physShapeScale[shape][i] = (float)lua_tonumber(luaVM, -2);
					lua_pop(luaVM, 2);
				}
				lua_pop(luaVM, 1);
			}
			else if (StringOps::strcmp("translate", lua_tostring(luaVM, -1)) == 0)
			{
				lua_pushvalue(luaVM, -2);
				lua_pushnil(luaVM);
				for (int i = 0; lua_next(luaVM, -2); i++)
				{
					lua_pushvalue(luaVM, -2);
					physShapeTranslate[shape][i] = (float)lua_tonumber(luaVM, -2);
					lua_pop(luaVM, 2);
				}
				lua_pop(luaVM, 1);
			}
			lua_pop(luaVM, 2);
		}
		lua_pop(luaVM, 1);
	}
	lua_pop(luaVM, 1);
	numArgs--;

	// enter in the physics data
	pEvt->m_numShapes = shape;
	for (int i = 0; i < shape; i++)
	{
		pEvt->m_physShapeType[i] = physShapeType[i];
		pEvt->m_physShapeTranslate[i] = Vector3(physShapeTranslate[i][0], physShapeTranslate[i][1], physShapeTranslate[i][2]);
		pEvt->m_physShapeScale[i] = Vector3(physShapeScale[i][0], physShapeScale[i][1], physShapeScale[i][2]);
		pEvt->m_physShapeRadius[i] = physShapeRadius[i];
	}

	float positionFactor = 1.0f / 100.0f;

	Vector3 playerPos, u, v, n;
	playerPos.m_x = (float)lua_tonumber(luaVM, -numArgs--) * positionFactor;
	playerPos.m_y = (float)lua_tonumber(luaVM, -numArgs--) * positionFactor;
	playerPos.m_z = (float)lua_tonumber(luaVM, -numArgs--) * positionFactor;

	u.m_x = (float)lua_tonumber(luaVM, -numArgs--); u.m_y = (float)lua_tonumber(luaVM, -numArgs--); u.m_z = (float)lua_tonumber(luaVM, -numArgs--);
	v.m_x = (float)lua_tonumber(luaVM, -numArgs--); v.m_y = (float)lua_tonumber(luaVM, -numArgs--); v.m_z = (float)lua_tonumber(luaVM, -numArgs--);
	n.m_x = (float)lua_tonumber(luaVM, -numArgs--); n.m_y = (float)lua_tonumber(luaVM, -numArgs--); n.m_z = (float)lua_tonumber(luaVM, -numArgs--);

	pEvt->m_peuuid = LuaGlue::readPEUUID(luaVM, -numArgs--);

	const char* wayPointName = NULL;

	if (!lua_isnil(luaVM, -numArgs))
	{
		// have patrol waypoint name
		wayPointName = lua_tostring(luaVM, -numArgs--);
	}
	else
		// ignore
		numArgs--;


	// set data values before popping memory off stack
	StringOps::writeToString(name, pEvt->m_meshFilename, 255);
	StringOps::writeToString(package, pEvt->m_package, 255);

	StringOps::writeToString(gunMeshName, pEvt->m_gunMeshName, 64);
	StringOps::writeToString(gunMeshPackage, pEvt->m_gunMeshPackage, 64);
	StringOps::writeToString(wayPointName, pEvt->m_patrolWayPoint, 32);

	lua_pop(luaVM, numArgsConst); //Second arg is a count of how many to pop

	pEvt->hasCustomOrientation = true;
	pEvt->m_pos = playerPos;
	pEvt->m_u = u;
	pEvt->m_v = v;
	pEvt->m_n = n;

	LuaGlue::pushTableBuiltFromHandle(luaVM, h); 

	return 1;
}

PE_IMPLEMENT_CLASS1(Event_MoveTank_C_to_S, Event);

Event_MoveTank_C_to_S::Event_MoveTank_C_to_S(PE::GameContext &context)
: Networkable(context, this)
{

}

void *Event_MoveTank_C_to_S::FactoryConstruct(PE::GameContext& context, PE::MemoryArena arena)
{
	Event_MoveTank_C_to_S *pEvt = new (arena) Event_MoveTank_C_to_S(context);
	return pEvt;
}

int Event_MoveTank_C_to_S::packCreationData(char *pDataStream)
{
	return PE::Components::StreamManager::WriteMatrix4x4(m_transform, pDataStream);
}

int Event_MoveTank_C_to_S::constructFromStream(char *pDataStream)
{
	int read = 0;
	read += PE::Components::StreamManager::ReadMatrix4x4(&pDataStream[read], m_transform);
	return read;
}


PE_IMPLEMENT_CLASS1(Event_MoveTank_S_to_C, Event_MoveTank_C_to_S);

Event_MoveTank_S_to_C::Event_MoveTank_S_to_C(PE::GameContext &context)
: Event_MoveTank_C_to_S(context)
{

}

void *Event_MoveTank_S_to_C::FactoryConstruct(PE::GameContext& context, PE::MemoryArena arena)
{
	Event_MoveTank_S_to_C *pEvt = new (arena) Event_MoveTank_S_to_C(context);
	return pEvt;
}

int Event_MoveTank_S_to_C::packCreationData(char *pDataStream)
{
	int size = 0;
	size += Event_MoveTank_C_to_S::packCreationData(&pDataStream[size]);
	size += PE::Components::StreamManager::WriteInt32(m_clientTankId, &pDataStream[size]);
	return size;
}

int Event_MoveTank_S_to_C::constructFromStream(char *pDataStream)
{
	int read = 0;
	read += Event_MoveTank_C_to_S::constructFromStream(&pDataStream[read]);
	read += PE::Components::StreamManager::ReadInt32(&pDataStream[read], m_clientTankId);
	return read;
}

PE_IMPLEMENT_CLASS1(Event_Tank_Throttle, Event);

PE_IMPLEMENT_CLASS1(Event_Tank_Turn, Event);

PE_IMPLEMENT_CLASS1(Event_OutOfBounds, Event);

PE_IMPLEMENT_CLASS1(Event_PowerupReached, Event);

PE_IMPLEMENT_CLASS1(Event_BananaReached, Event);



PE_IMPLEMENT_CLASS1(Event_CheckpointReached, Event);
Event_CheckpointReached::Event_CheckpointReached(char name[32], char next[32])
{ 
	StringOps::writeToString(name, m_checkpointName, 32);
	StringOps::writeToString(next, m_nextCheckpoint, 32);
}


PE_IMPLEMENT_CLASS1(Event_LevelLoading_Done, Event);

Event_LevelLoading_Done::Event_LevelLoading_Done(PE::GameContext &context)
	: Networkable(context, this)
{

}

void Event_LevelLoading_Done::SetLuaFunctions(PE::Components::LuaEnvironment *pLuaEnv, lua_State *luaVM)
{
	static const struct luaL_Reg l_Event_LevelLoading_Done[] = {
		{ "Construct", l_Construct },
		{ NULL, NULL } // sentinel
	};

	// register the functions in current lua table which is the table for Event_CreateSoldierNPC
	luaL_register(luaVM, 0, l_Event_LevelLoading_Done);
}

int Event_LevelLoading_Done::l_Construct(lua_State* luaVM)
{
	PE::Handle h("EVENT", sizeof(Event_LevelLoading_Done));

	// get arguments from stack
	int numArgs, numArgsConst;
	numArgs = numArgsConst = 1;

	PE::GameContext *pContext = (PE::GameContext*)(lua_touserdata(luaVM, -numArgs--));

	// this function should only be called frm game thread, so we can use game thread thread owenrship mask
	Event_LevelLoading_Done *pEvt = new(h) Event_LevelLoading_Done(*pContext);

	lua_pop(luaVM, numArgsConst); //Second arg is a count of how many to pop
	LuaGlue::pushTableBuiltFromHandle(luaVM, h);

	PE::Components::ClientNetworkManager *pNetworkManager = (PE::Components::ClientNetworkManager *)(pContext->getNetworkManager());
	pNetworkManager->getNetworkContext().getEventManager()->scheduleEvent(pEvt, pContext->getGameObjectManager(), true);

	return 1;
}

void *Event_LevelLoading_Done::FactoryConstruct(PE::GameContext& context, PE::MemoryArena arena)
{
	Event_LevelLoading_Done *pEvt = new (arena) Event_LevelLoading_Done(context);
	return pEvt;
}

int Event_LevelLoading_Done::packCreationData(char *pDataStream)
{
	return 0;
}

int Event_LevelLoading_Done::constructFromStream(char *pDataStream)
{
	return 0;
}


PE_IMPLEMENT_CLASS1(Event_LevelLoading_Done_Server, Event_LevelLoading_Done);

Event_LevelLoading_Done_Server::Event_LevelLoading_Done_Server(PE::GameContext &context)
	: Event_LevelLoading_Done(context)
{

}

void *Event_LevelLoading_Done_Server::FactoryConstruct(PE::GameContext& context, PE::MemoryArena arena)
{
	Event_LevelLoading_Done_Server *pEvt = new (arena) Event_LevelLoading_Done_Server(context);
	return pEvt;
}

int Event_LevelLoading_Done_Server::packCreationData(char *pDataStream)
{
	int size = 0;
	size += PE::Components::StreamManager::WriteInt32(m_clientTankId, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteBool(m_activate, &pDataStream[size]);
	return size;
}

int Event_LevelLoading_Done_Server::constructFromStream(char *pDataStream)
{
	int read = 0;
	read += PE::Components::StreamManager::ReadInt32(&pDataStream[read], m_clientTankId);
	read += PE::Components::StreamManager::ReadBool(&pDataStream[read], m_activate);
	return read;
}


///////////////////////////////////
//SOMEONE WON
///////////////////////////////////
PE_IMPLEMENT_CLASS1(Event_SomeoneWon_C_to_S, Event);

Event_SomeoneWon_C_to_S::Event_SomeoneWon_C_to_S(PE::GameContext &context)
	: Networkable(context, this)
{

}

void *Event_SomeoneWon_C_to_S::FactoryConstruct(PE::GameContext& context, PE::MemoryArena arena)
{
	Event_SomeoneWon_C_to_S *pEvt = new (arena) Event_SomeoneWon_C_to_S(context);
	return pEvt;
}

int Event_SomeoneWon_C_to_S::packCreationData(char *pDataStream)
{
	return 0;
}

int Event_SomeoneWon_C_to_S::constructFromStream(char *pDataStream)
{
	return 0;
}


PE_IMPLEMENT_CLASS1(Event_SomeoneWon_S_to_C, Event_SomeoneWon_C_to_S);

Event_SomeoneWon_S_to_C::Event_SomeoneWon_S_to_C(PE::GameContext &context)
	: Event_SomeoneWon_C_to_S(context)
{

}

void *Event_SomeoneWon_S_to_C::FactoryConstruct(PE::GameContext& context, PE::MemoryArena arena)
{
	Event_SomeoneWon_S_to_C *pEvt = new (arena) Event_SomeoneWon_S_to_C(context);
	return pEvt;
}

int Event_SomeoneWon_S_to_C::packCreationData(char *pDataStream)
{
	int size = 0;
	size += PE::Components::StreamManager::WriteInt32(m_clientTankId, &pDataStream[size]);
	return size;
}

int Event_SomeoneWon_S_to_C::constructFromStream(char *pDataStream)
{
	int read = 0;
	read += PE::Components::StreamManager::ReadInt32(&pDataStream[read], m_clientTankId);
	return read;
}

};
};


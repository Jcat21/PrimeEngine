
#include "StandardEvents.h"

#include "PrimeEngine/Lua/LuaEnvironment.h"
#include "PrimeEngine/Lua/EventGlue/EventDataCreators.h"

#include "PrimeEngine/Networking/StreamManager.h"

#include "PrimeEngine/PrimeEngineIncludes.h"

namespace PE {
namespace Events {
	PE_IMPLEMENT_CLASS1(Event_UPDATE, Event);
	PE_IMPLEMENT_CLASS1(Event_SCENE_GRAPH_UPDATE, Event);
	PE_IMPLEMENT_CLASS1(Event_PRE_RENDER_needsRC, Event);
	PE_IMPLEMENT_CLASS1(Event_GATHER_DRAWCALLS, Event);
	PE_IMPLEMENT_CLASS1(Event_GATHER_DRAWCALLS_Z_ONLY, Event);
	PE_IMPLEMENT_CLASS1(Event_CALCULATE_TRANSFORMATIONS, Event);
	PE_IMPLEMENT_CLASS1(Event_PRE_GATHER_DRAWCALLS, Event);

//////////////////////////////////////////////////////////////////////////
// Event_POP_SHADERS
//////////////////////////////////////////////////////////////////////////

PE_IMPLEMENT_CLASS1(Event_POP_SHADERS, Event);

void Event_POP_SHADERS::SetLuaFunctions(PE::Components::LuaEnvironment *pLuaEnv, lua_State *luaVM)
{
	static const struct luaL_Reg l_Event_POP_SHADERS[] = {
		{"Construct", l_Construct},
		{NULL, NULL} // sentinel
	};

	// register the functions in current lua table which is the table for Event_POP_SHADERS
	luaL_register(luaVM, 0, l_Event_POP_SHADERS);
}

// this function is called form Lua whenever Lua wants to create an event
int Event_POP_SHADERS::l_Construct(lua_State* luaVM)
{
	Handle h("EVENT", sizeof(Event_POP_SHADERS));
	/*Event_POP_SHADERS *pEvt = */new(h) Event_POP_SHADERS;

	LuaGlue::pushTableBuiltFromHandle(luaVM, h); 
	return 1;
}

//////////////////////////////////////////////////////////////////////////
// Event_CHANGE_TO_DEBUG_SHADER
//////////////////////////////////////////////////////////////////////////

PE_IMPLEMENT_CLASS1(Event_CHANGE_TO_DEBUG_SHADER, Event);

void Event_CHANGE_TO_DEBUG_SHADER::SetLuaFunctions(PE::Components::LuaEnvironment *pLuaEnv, lua_State *luaVM)
{
	static const struct luaL_Reg l_Event_CHANGE_TO_DEBUG_SHADER[] = {
		{"Construct", l_Construct},
		{NULL, NULL} // sentinel
	};

	// register the functions in current lua table which is the table for Event_CHANGE_TO_DEBUG_SHADER
	luaL_register(luaVM, 0, l_Event_CHANGE_TO_DEBUG_SHADER);
}

// this function is called form Lua whenever Lua wants to create an event
int Event_CHANGE_TO_DEBUG_SHADER::l_Construct(lua_State* luaVM)
{
	Handle h("EVENT", sizeof(Event_CHANGE_TO_DEBUG_SHADER));
	/*Event_CHANGE_TO_DEBUG_SHADER *pEvt = */new(h) Event_CHANGE_TO_DEBUG_SHADER;

	LuaGlue::pushTableBuiltFromHandle(luaVM, h); 
	return 1;
}

//////////////////////////////////////////////////////////////////////////

PE_IMPLEMENT_CLASS1(Event_CLOSED_WINDOW, Event);

//////////////////////////////////////////////////////////////////////////

PE_IMPLEMENT_CLASS1(Event_PLAY_ANIMATION, Event);

void Event_PLAY_ANIMATION::SetLuaFunctions(PE::Components::LuaEnvironment *pLuaEnv, lua_State *luaVM)
{
	static const struct luaL_Reg l_Event_PLAY_ANIMATION[] = {
		{"Construct", l_Construct},
		{NULL, NULL} // sentinel
	};

	// register the functions in current lua table which is the table for Event_PLAY_ANIMATION
	luaL_register(luaVM, 0, l_Event_PLAY_ANIMATION);
}

// this function is called form Lua whenever Lua wants to create this event
int Event_PLAY_ANIMATION::l_Construct(lua_State* luaVM)
{
	Handle h("EVENT", sizeof(Event_PLAY_ANIMATION));
	Event_PLAY_ANIMATION *pEvt = new(h) Event_PLAY_ANIMATION;

	// read single number
	pEvt->m_animSetIndex = (PrimitiveTypes::Int32)(lua_tonumber(luaVM, -2));
	pEvt->m_animIndex = (PrimitiveTypes::Int32)(lua_tonumber(luaVM, -1));
	lua_pop(luaVM, 2);

	LuaGlue::pushTableBuiltFromHandle(luaVM, h); 
	return 1;
}

//////////////////////////////////////////////////////////////////////////

PE_IMPLEMENT_CLASS1(Event_ANIMATION_ENDED, Event);

//////////////////////////////////////////////////////////////////////////

PE_IMPLEMENT_CLASS1(Event_IK_REPORT, Event);

//////////////////////////////////////////////////////////////////////////
// Event_CREATE_LIGHT
//////////////////////////////////////////////////////////////////////////

PE_IMPLEMENT_CLASS1(Event_CREATE_LIGHT, Event);

// override SetLuaFunctions() since we are adding custom Lua interface
void Event_CREATE_LIGHT::SetLuaFunctions(PE::Components::LuaEnvironment *pLuaEnv, lua_State *luaVM)
{
	static const struct luaL_Reg l_Event_CREATE_LIGHT[] = {
		{"Construct", l_Construct},
		{NULL, NULL} // sentinel
	};

	// register the functions in current lua table which is the table for Event_CREATE_LIGHT
	luaL_register(luaVM, 0, l_Event_CREATE_LIGHT);
}

// Lua interface prefixed with l_
int Event_CREATE_LIGHT::l_Construct(lua_State* luaVM)
{
	int numArgs, iNumArgs;
	numArgs = iNumArgs = 33;

	Handle h("EVENT", sizeof(Event_CREATE_LIGHT));

	PE::GameContext *pContext = (PE::GameContext*)(lua_touserdata(luaVM, -iNumArgs--));
	Event_CREATE_LIGHT *pEvt = new(h) Event_CREATE_LIGHT(*pContext);

	Vector3 pos, u, v, n, attenuation;
	Vector4 diffuse, spec, ambient;
	float spotPower, range;
	bool isShadowCaster;
	
	float positionFactor = 1.0f / 100.0f;

	pos.m_x = (float)lua_tonumber(luaVM, -iNumArgs--) * positionFactor;
	pos.m_y = (float)lua_tonumber(luaVM, -iNumArgs--) * positionFactor;
	pos.m_z = (float)lua_tonumber(luaVM, -iNumArgs--) * positionFactor;

	u.m_x = (float)lua_tonumber(luaVM, -iNumArgs--);
	u.m_y = (float)lua_tonumber(luaVM, -iNumArgs--);
	u.m_z = (float)lua_tonumber(luaVM, -iNumArgs--);

	v.m_x = (float)lua_tonumber(luaVM, -iNumArgs--);
	v.m_y = (float)lua_tonumber(luaVM, -iNumArgs--);
	v.m_z = (float)lua_tonumber(luaVM, -iNumArgs--);

	n.m_x = (float)lua_tonumber(luaVM, -iNumArgs--);
	n.m_y = (float)lua_tonumber(luaVM, -iNumArgs--);
	n.m_z = (float)lua_tonumber(luaVM, -iNumArgs--);

	const char* typeStr = lua_tostring(luaVM, -iNumArgs--);

	diffuse.m_x = (float)lua_tonumber(luaVM, -iNumArgs--);
	diffuse.m_y = (float)lua_tonumber(luaVM, -iNumArgs--);
	diffuse.m_z = (float)lua_tonumber(luaVM, -iNumArgs--);
	diffuse.m_w = (float)lua_tonumber(luaVM, -iNumArgs--);

	spec.m_x = (float)lua_tonumber(luaVM, -iNumArgs--);
	spec.m_y = (float)lua_tonumber(luaVM, -iNumArgs--);
	spec.m_z = (float)lua_tonumber(luaVM, -iNumArgs--);
	spec.m_w = (float)lua_tonumber(luaVM, -iNumArgs--);

	ambient.m_x = (float)lua_tonumber(luaVM, -iNumArgs--);
	ambient.m_y = (float)lua_tonumber(luaVM, -iNumArgs--);
	ambient.m_z = (float)lua_tonumber(luaVM, -iNumArgs--);
	ambient.m_w = (float)lua_tonumber(luaVM, -iNumArgs--);

	attenuation.m_x = (float)lua_tonumber(luaVM, -iNumArgs--);
	attenuation.m_y = (float)lua_tonumber(luaVM, -iNumArgs--);
	attenuation.m_z = (float)lua_tonumber(luaVM, -iNumArgs--);

	spotPower = (float)lua_tonumber(luaVM, -iNumArgs--);
	range = (float)lua_tonumber(luaVM, -iNumArgs--);
	isShadowCaster = lua_toboolean(luaVM, -iNumArgs--) != 0;

	pEvt->m_peuuid = LuaGlue::readPEUUID(luaVM, -iNumArgs--);

	
	lua_pop(luaVM, numArgs); //Second arg is a count of how many to pop

	pEvt->m_pos = pos;
	pEvt->m_u = u;
	pEvt->m_v = v;
	pEvt->m_n = n;

	pEvt->m_diffuse = diffuse;
	pEvt->m_spec = spec;
	pEvt->m_ambient = ambient;
	pEvt->m_att = attenuation;
	pEvt->m_spotPower = spotPower;
	pEvt->m_range = range;
	pEvt->m_isShadowCaster = isShadowCaster;

	if (StringOps::strcmp(typeStr, "directional") == 0)
	{
		pEvt->m_type = 1;
	} else if (StringOps::strcmp(typeStr, "spot") == 0)
	{
		pEvt->m_type = 2;
	}
	
	LuaGlue::pushTableBuiltFromHandle(luaVM, h); 

	PE::Components::ClientNetworkManager *pNetworkManager = (PE::Components::ClientNetworkManager*)(pContext->getNetworkManager());
	pNetworkManager->getNetworkContext().getEventManager()->scheduleEvent(pEvt, pContext->getGameObjectManager(), true);

	return 1;
}

void *Event_CREATE_LIGHT::FactoryConstruct(PE::GameContext& context, PE::MemoryArena arena)
{
	Event_CREATE_LIGHT *pEvt = new (arena) Event_CREATE_LIGHT(context);
	return pEvt;
}

int Event_CREATE_LIGHT::packCreationData(char *pDataStream)
{
	int size = 0;
	size += PE::Components::StreamManager::WriteVector3(m_u, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteVector3(m_v, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteVector3(m_n, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteVector3(m_pos, &pDataStream[size]);
	size += PE::Components::StreamManager::WritePEUUID(m_peuuid, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteVector4(m_ambient, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteVector4(m_diffuse, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteVector4(m_spec, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteVector3(m_att, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteFloat32(m_spotPower, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteFloat32(m_range, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteBool(m_isShadowCaster, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteFloat32(m_type, &pDataStream[size]); //0 = point, 1 = directional, 2 = spot
	return size;
}

int Event_CREATE_LIGHT::constructFromStream(char *pDataStream)
{
	int read = 0;
	read += PE::Components::StreamManager::ReadVector3(&pDataStream[read], m_u);
	read += PE::Components::StreamManager::ReadVector3(&pDataStream[read], m_v);
	read += PE::Components::StreamManager::ReadVector3(&pDataStream[read], m_n);
	read += PE::Components::StreamManager::ReadVector3(&pDataStream[read], m_pos);
	read += PE::Components::StreamManager::ReadPEUUID(&pDataStream[read], m_peuuid);
	read += PE::Components::StreamManager::ReadVector4(&pDataStream[read], m_ambient);
	read += PE::Components::StreamManager::ReadVector4(&pDataStream[read], m_diffuse);
	read += PE::Components::StreamManager::ReadVector4(&pDataStream[read], m_spec);
	read += PE::Components::StreamManager::ReadVector3(&pDataStream[read], m_att);
	read += PE::Components::StreamManager::ReadFloat32(&pDataStream[read], m_spotPower);
	read += PE::Components::StreamManager::ReadFloat32(&pDataStream[read], m_range);
	read += PE::Components::StreamManager::ReadBool(&pDataStream[read], m_isShadowCaster);
	read += PE::Components::StreamManager::ReadFloat32(&pDataStream[read], m_type);
	return read;
}


PE_IMPLEMENT_CLASS1(Event_CREATE_LIGHT_Server, Event_CREATE_LIGHT);

Event_CREATE_LIGHT_Server::Event_CREATE_LIGHT_Server(PE::GameContext &context)
	: Event_CREATE_LIGHT(context)
{

}

void *Event_CREATE_LIGHT_Server::FactoryConstruct(PE::GameContext& context, PE::MemoryArena arena)
{
	Event_CREATE_LIGHT_Server *pEvt = new (arena) Event_CREATE_LIGHT_Server(context);
	return pEvt;
}

int Event_CREATE_LIGHT_Server::packCreationData(char *pDataStream)
{
	int size = 0;
	size += Event_CREATE_LIGHT::packCreationData(&pDataStream[size]);
	size += PE::Components::StreamManager::WriteInt32(m_clientTankId, &pDataStream[size]);
	return size;
}

int Event_CREATE_LIGHT_Server::constructFromStream(char *pDataStream)
{
	int read = 0;
	read += Event_CREATE_LIGHT::constructFromStream(&pDataStream[read]);
	read += PE::Components::StreamManager::ReadInt32(&pDataStream[read], m_clientTankId);
	return read;
}

//////////////////////////////////////////////////////////////////////////
// Event_CREATE_MESH
//////////////////////////////////////////////////////////////////////////

PE_IMPLEMENT_CLASS1(Event_CREATE_MESH, Event);

void Event_CREATE_MESH::SetLuaFunctions(PE::Components::LuaEnvironment *pLuaEnv, lua_State *luaVM)
{
	static const struct luaL_Reg l_Event_CREATE_MESH[] = {
		{"Construct", l_Construct},
		{NULL, NULL} // sentinel
	};

	// register the functions in current lua table which is the table for Event_CREATE_MESH
	luaL_register(luaVM, 0, l_Event_CREATE_MESH);
}

// this function is called form lua whenever Lua wants to create an event
int Event_CREATE_MESH::l_Construct(lua_State* luaVM)
{
	Handle h("EVENT", sizeof(Event_CREATE_MESH));

	int numArgs, numArgsConst;
	numArgs = numArgsConst = 17;

	PE::GameContext *pContext = (PE::GameContext*)(lua_touserdata(luaVM, -numArgs--));
	
	Event_CREATE_MESH *pEvt = new(h) Event_CREATE_MESH(*pContext);

	const char* name = lua_tostring(luaVM, -numArgs--);
	const char* package = lua_tostring(luaVM, -numArgs--);

	int shape;
	int physShapeType[8];
	float physShapeTranslate[8][3];
	float physShapeScale[8][3];
	float physShapeRadius[8];

	// LUA MAGIC FOR PHYSICS SHAPES!
	if (!lua_isnil(luaVM, -numArgs))
	{
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
	}
	else
	{
		numArgs--;
		pEvt->m_numShapes = 0;
	}

	float positionFactor = 1.0f / 100.0f;
	Vector3 pos, u, v, n;
	pos.m_x = (float)lua_tonumber(luaVM, -numArgs--) * positionFactor;
	pos.m_y = (float)lua_tonumber(luaVM, -numArgs--) * positionFactor;
	pos.m_z = (float)lua_tonumber(luaVM, -numArgs--) * positionFactor;

	u.m_x = (float)lua_tonumber(luaVM, -numArgs--);
	u.m_y = (float)lua_tonumber(luaVM, -numArgs--);
	u.m_z = (float)lua_tonumber(luaVM, -numArgs--);

	v.m_x = (float)lua_tonumber(luaVM, -numArgs--);
	v.m_y = (float)lua_tonumber(luaVM, -numArgs--);
	v.m_z = (float)lua_tonumber(luaVM, -numArgs--);

	n.m_x = (float)lua_tonumber(luaVM, -numArgs--);
	n.m_y = (float)lua_tonumber(luaVM, -numArgs--);
	n.m_z = (float)lua_tonumber(luaVM, -numArgs--);

	pEvt->m_peuuid = LuaGlue::readPEUUID(luaVM, -numArgs--);

	// set data values
	StringOps::writeToString(name, pEvt->m_meshFilename, 255);
	StringOps::writeToString(package, pEvt->m_package, 255);

	lua_pop(luaVM, numArgsConst); //Second arg is a count of how many to pop

	pEvt->hasCustomOrientation = true;

	pEvt->m_pos = pos;
	pEvt->m_u = u;
	pEvt->m_v = v;
	pEvt->m_n = n;
	pEvt->hasCustomOrientation = true;
	LuaGlue::pushTableBuiltFromHandle(luaVM, h); 

	pEvt->sendToServer(pContext);

	return 1;
}

void Event_CREATE_MESH::sendToServer(GameContext *context)
{
	PE::Components::ClientNetworkManager *pNetworkManager = (PE::Components::ClientNetworkManager*)(context->getNetworkManager());
	pNetworkManager->getNetworkContext().getEventManager()->scheduleEvent(this, context->getGameObjectManager(), true);
}

void *Event_CREATE_MESH::FactoryConstruct(PE::GameContext& context, PE::MemoryArena arena)
{
	Event_CREATE_MESH *pEvt = new (arena) Event_CREATE_MESH(context);
	return pEvt;
}

int Event_CREATE_MESH::packCreationData(char *pDataStream)
{
	int size = 0;
	size += PE::Components::StreamManager::WriteString(m_meshFilename, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteString(m_package, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteBool(hasCustomOrientation, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteVector3(m_u, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteVector3(m_v, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteVector3(m_n, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteVector3(m_pos, &pDataStream[size]);
	size += PE::Components::StreamManager::WritePEUUID(m_peuuid, &pDataStream[size]);

	size += PE::Components::StreamManager::WriteInt32(m_numShapes, &pDataStream[size]);
	for (int i = 0; i < m_numShapes; i++)
	{
		size += PE::Components::StreamManager::WriteInt32(m_physShapeType[i], &pDataStream[size]);
		size += PE::Components::StreamManager::WriteVector3(m_physShapeTranslate[i], &pDataStream[size]);
		size += PE::Components::StreamManager::WriteVector3(m_physShapeScale[i], &pDataStream[size]);
		size += PE::Components::StreamManager::WriteFloat32(m_physShapeRadius[i], &pDataStream[size]);
	}

	return size;
}

int Event_CREATE_MESH::constructFromStream(char *pDataStream)
{
	int read = 0;

	read += PE::Components::StreamManager::ReadString(&pDataStream[read], m_meshFilename);
	read += PE::Components::StreamManager::ReadString(&pDataStream[read], m_package);
	read += PE::Components::StreamManager::ReadBool(&pDataStream[read], hasCustomOrientation);
	read += PE::Components::StreamManager::ReadVector3(&pDataStream[read], m_u);
	read += PE::Components::StreamManager::ReadVector3(&pDataStream[read], m_v);
	read += PE::Components::StreamManager::ReadVector3(&pDataStream[read], m_n);
	read += PE::Components::StreamManager::ReadVector3(&pDataStream[read], m_pos);
	read += PE::Components::StreamManager::ReadPEUUID(&pDataStream[read], m_peuuid);

	read += PE::Components::StreamManager::ReadInt32(&pDataStream[read], m_numShapes);
	for (int i = 0; i < m_numShapes; i++)
	{
		read += PE::Components::StreamManager::ReadInt32(&pDataStream[read], m_physShapeType[i]);
		read += PE::Components::StreamManager::ReadVector3(&pDataStream[read], m_physShapeTranslate[i]);
		read += PE::Components::StreamManager::ReadVector3(&pDataStream[read], m_physShapeScale[i]);
		read += PE::Components::StreamManager::ReadFloat32(&pDataStream[read], m_physShapeRadius[i]);
	}

	return read;
}


PE_IMPLEMENT_CLASS1(Event_CREATE_MESH_Server, Event_CREATE_MESH);

Event_CREATE_MESH_Server::Event_CREATE_MESH_Server(PE::GameContext &context)
	: Event_CREATE_MESH(context)
{

}

void *Event_CREATE_MESH_Server::FactoryConstruct(PE::GameContext& context, PE::MemoryArena arena)
{
	Event_CREATE_MESH_Server *pEvt = new (arena) Event_CREATE_MESH_Server(context);
	return pEvt;
}

int Event_CREATE_MESH_Server::packCreationData(char *pDataStream)
{
	int size = 0;
	size += Event_CREATE_MESH::packCreationData(&pDataStream[size]);
	size += PE::Components::StreamManager::WriteInt32(m_clientTankId, &pDataStream[size]);
	return size;
}

int Event_CREATE_MESH_Server::constructFromStream(char *pDataStream)
{
	int read = 0;
	read += Event_CREATE_MESH::constructFromStream(&pDataStream[read]);
	read += PE::Components::StreamManager::ReadInt32(&pDataStream[read], m_clientTankId);
	return read;
}

//////////////////////////////////////////////////////////////////////////
// Event_CREATE_SKELETON
//////////////////////////////////////////////////////////////////////////

PE_IMPLEMENT_CLASS1(Event_CREATE_SKELETON, Event);

void Event_CREATE_SKELETON::SetLuaFunctions(PE::Components::LuaEnvironment *pLuaEnv, lua_State *luaVM)
{
	static const struct luaL_Reg l_Event_CREATE_SKELETON[] = {
		{"Construct", l_Construct},
		{NULL, NULL} // sentinel
	};

	// register the functions in current lua table which is the table for Event_CREATE_SKELETON
	luaL_register(luaVM, 0, l_Event_CREATE_SKELETON);
}

// this function is called form lua whenever Lua wants to create an event
int Event_CREATE_SKELETON::l_Construct(lua_State* luaVM)
{
	Handle h("EVENT", sizeof(Event_CREATE_SKELETON));
	
	// get arguments from stack
	PE::GameContext *pContext = (PE::GameContext*)(lua_touserdata(luaVM, -16));

	Event_CREATE_SKELETON *pEvt = new(h) Event_CREATE_SKELETON(*pContext);

	const char* name = lua_tostring(luaVM, -15);
	const char* package = lua_tostring(luaVM, -14);
	
	float positionFactor = 1.0f / 100.0f;

	Vector3 playerPos, u, v, n;
	playerPos.m_x = (float)lua_tonumber(luaVM, -13) * positionFactor;
	playerPos.m_y = (float)lua_tonumber(luaVM, -12) * positionFactor;
	playerPos.m_z = (float)lua_tonumber(luaVM, -11) * positionFactor;

	u.m_x = (float)lua_tonumber(luaVM, -10); u.m_y = (float)lua_tonumber(luaVM, -9); u.m_z = (float)lua_tonumber(luaVM, -8);
	v.m_x = (float)lua_tonumber(luaVM, -7); v.m_y = (float)lua_tonumber(luaVM, -6); v.m_z = (float)lua_tonumber(luaVM, -5);
	n.m_x = (float)lua_tonumber(luaVM, -4); n.m_y = (float)lua_tonumber(luaVM, -3); n.m_z = (float)lua_tonumber(luaVM, -2);

	pEvt->m_peuuid = LuaGlue::readPEUUID(luaVM, -1);
	pEvt->hasCustomOrientation = true;

	// set data values
	StringOps::writeToString(name, pEvt->m_skelFilename, 255);
	StringOps::writeToString(package, pEvt->m_package, 255);

	pEvt->hasCustomOrientation = true;
	pEvt->m_pos = playerPos;
	pEvt->m_u = u;
	pEvt->m_v = v;
	pEvt->m_n = n;

	lua_pop(luaVM, 15); //Second arg is a count of how many to pop

	LuaGlue::pushTableBuiltFromHandle(luaVM, h); 

	pEvt->sendToServer(pContext);

	return 1;
}

void Event_CREATE_SKELETON::sendToServer(GameContext *context)
{
	PE::Components::ClientNetworkManager *pNetworkManager = (PE::Components::ClientNetworkManager*)(context->getNetworkManager());
	pNetworkManager->getNetworkContext().getEventManager()->scheduleEvent(this, context->getGameObjectManager(), true);
}

void *Event_CREATE_SKELETON::FactoryConstruct(PE::GameContext& context, PE::MemoryArena arena)
{
	Event_CREATE_SKELETON *pEvt = new (arena) Event_CREATE_SKELETON(context);
	return pEvt;
}

int Event_CREATE_SKELETON::packCreationData(char *pDataStream)
{
	int size = 0;
	size += PE::Components::StreamManager::WriteString(m_skelFilename, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteString(m_package, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteBool(hasCustomOrientation, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteVector3(m_u, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteVector3(m_v, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteVector3(m_n, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteVector3(m_pos, &pDataStream[size]);
	size += PE::Components::StreamManager::WritePEUUID(m_peuuid, &pDataStream[size]);

	return size;
}

int Event_CREATE_SKELETON::constructFromStream(char *pDataStream)
{
	int read = 0;

	read += PE::Components::StreamManager::ReadString(&pDataStream[read], m_skelFilename);
	read += PE::Components::StreamManager::ReadString(&pDataStream[read], m_package);
	read += PE::Components::StreamManager::ReadBool(&pDataStream[read], hasCustomOrientation);
	read += PE::Components::StreamManager::ReadVector3(&pDataStream[read], m_u);
	read += PE::Components::StreamManager::ReadVector3(&pDataStream[read], m_v);
	read += PE::Components::StreamManager::ReadVector3(&pDataStream[read], m_n);
	read += PE::Components::StreamManager::ReadVector3(&pDataStream[read], m_pos);
	read += PE::Components::StreamManager::ReadPEUUID(&pDataStream[read], m_peuuid);

	return read;
}


PE_IMPLEMENT_CLASS1(Event_CREATE_SKELETON_Server, Event_CREATE_SKELETON);

Event_CREATE_SKELETON_Server::Event_CREATE_SKELETON_Server(PE::GameContext &context)
	: Event_CREATE_SKELETON(context)
{

}

void *Event_CREATE_SKELETON_Server::FactoryConstruct(PE::GameContext& context, PE::MemoryArena arena)
{
	Event_CREATE_SKELETON_Server *pEvt = new (arena) Event_CREATE_SKELETON_Server(context);
	return pEvt;
}

int Event_CREATE_SKELETON_Server::packCreationData(char *pDataStream)
{
	int size = 0;
	size += Event_CREATE_SKELETON::packCreationData(&pDataStream[size]);
	size += PE::Components::StreamManager::WriteInt32(m_clientTankId, &pDataStream[size]);
	return size;
}

int Event_CREATE_SKELETON_Server::constructFromStream(char *pDataStream)
{
	int read = 0;
	read += Event_CREATE_SKELETON::constructFromStream(&pDataStream[read]);
	read += PE::Components::StreamManager::ReadInt32(&pDataStream[read], m_clientTankId);
	return read;
}


//////////////////////////////////////////////////////////////////////////
// Event_CREATE_ANIM_SET
//////////////////////////////////////////////////////////////////////////

PE_IMPLEMENT_CLASS1(Event_CREATE_ANIM_SET, Event);

void Event_CREATE_ANIM_SET::SetLuaFunctions(PE::Components::LuaEnvironment *pLuaEnv, lua_State *luaVM)
{
	static const struct luaL_Reg l_Event_CREATE_ANIM_SET[] = {
		{"Construct", l_Construct},
		{NULL, NULL} // sentinel
	};

	// register the functions in current lua table which is the table for Event_CREATE_ANIM_SET
	luaL_register(luaVM, 0, l_Event_CREATE_ANIM_SET);
}

// this function is called form lua whenever Lua wants to create an event
int Event_CREATE_ANIM_SET::l_Construct(lua_State* luaVM)
{
	Handle h("EVENT", sizeof(Event_CREATE_ANIM_SET));

	// get arguments from stack
	PE::GameContext *pContext = (PE::GameContext*)(lua_touserdata(luaVM, -4));

	Event_CREATE_ANIM_SET *pEvt = new(h) Event_CREATE_ANIM_SET(*pContext);

	const char* name = lua_tostring(luaVM, -3);
	const char* package = lua_tostring(luaVM, -2);

	pEvt->m_peuuid = LuaGlue::readPEUUID(luaVM, -1);

	// set data values
	StringOps::writeToString(name, pEvt->animSetFilename, 255);
	StringOps::writeToString(package, pEvt->m_package, 255);

	lua_pop(luaVM, 3); //Second arg is a count of how many to pop

	LuaGlue::pushTableBuiltFromHandle(luaVM, h); 

	pEvt->sendToServer(pContext);

	return 1;
}

void Event_CREATE_ANIM_SET::sendToServer(GameContext *context)
{
	PE::Components::ClientNetworkManager *pNetworkManager = (PE::Components::ClientNetworkManager*)(context->getNetworkManager());
	pNetworkManager->getNetworkContext().getEventManager()->scheduleEvent(this, context->getGameObjectManager(), true);
}

void *Event_CREATE_ANIM_SET::FactoryConstruct(PE::GameContext& context, PE::MemoryArena arena)
{
	Event_CREATE_ANIM_SET *pEvt = new (arena) Event_CREATE_ANIM_SET(context);
	return pEvt;
}

int Event_CREATE_ANIM_SET::packCreationData(char *pDataStream)
{
	int size = 0;
	size += PE::Components::StreamManager::WriteString(animSetFilename, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteString(m_package, &pDataStream[size]);
	size += PE::Components::StreamManager::WritePEUUID(m_peuuid, &pDataStream[size]);
	return size;
}

int Event_CREATE_ANIM_SET::constructFromStream(char *pDataStream)
{
	int read = 0;
	read += PE::Components::StreamManager::ReadString(&pDataStream[read], animSetFilename);
	read += PE::Components::StreamManager::ReadString(&pDataStream[read], m_package);;
	read += PE::Components::StreamManager::ReadPEUUID(&pDataStream[read], m_peuuid);
	return read;
}


PE_IMPLEMENT_CLASS1(Event_CREATE_ANIM_SET_Server, Event_CREATE_ANIM_SET);

Event_CREATE_ANIM_SET_Server::Event_CREATE_ANIM_SET_Server(PE::GameContext &context)
	: Event_CREATE_ANIM_SET(context)
{

}

void *Event_CREATE_ANIM_SET_Server::FactoryConstruct(PE::GameContext& context, PE::MemoryArena arena)
{
	Event_CREATE_ANIM_SET_Server *pEvt = new (arena) Event_CREATE_ANIM_SET_Server(context);
	return pEvt;
}

int Event_CREATE_ANIM_SET_Server::packCreationData(char *pDataStream)
{
	int size = 0;
	size += Event_CREATE_ANIM_SET::packCreationData(&pDataStream[size]);
	size += PE::Components::StreamManager::WriteInt32(m_clientTankId, &pDataStream[size]);
	return size;
}

int Event_CREATE_ANIM_SET_Server::constructFromStream(char *pDataStream)
{
	int read = 0;
	read += Event_CREATE_ANIM_SET::constructFromStream(&pDataStream[read]);
	read += PE::Components::StreamManager::ReadInt32(&pDataStream[read], m_clientTankId);
	return read;
}


PE_IMPLEMENT_CLASS1(Event_CREATE_NAVGRID, Event);
PE_IMPLEMENT_CLASS1(Event_PHYSICS_END, Event);
PE_IMPLEMENT_CLASS1(Event_PHYSICS_START, Event);
PE_IMPLEMENT_CLASS1(Event_VORTEX_ENDED, Event);

//////////////////////////////////////////////////////////////////////////
//
//////////////////////////////////////////////////////////////////////////

PE_IMPLEMENT_CLASS1(Event_MOVE, Event);

void Event_MOVE::SetLuaFunctions(PE::Components::LuaEnvironment *pLuaEnv, lua_State *luaVM)
{
	static const struct luaL_Reg l_Event_MOVE[] = {
		{"Construct", l_Construct},
		{NULL, NULL} // sentinel
	};

	// register the functions in current lua table which is the table for Event_MOVE
	luaL_register(luaVM, 0, l_Event_MOVE);
}

// this function is called form lua whenever Lua wants to create an event
int Event_MOVE::l_Construct(lua_State* luaVM)
{
	Handle h("EVENT", sizeof(Event_MOVE));
	Event_MOVE *pEvt = new(h) Event_MOVE;

	Vector3 dir;
	dir.m_x = (float)lua_tonumber(luaVM, -3);
	dir.m_y = (float)lua_tonumber(luaVM, -2);
	dir.m_z = (float)lua_tonumber(luaVM, -1);

	lua_pop(luaVM, 3); //Second arg is a count of how many to pop

	// set data values
	pEvt->m_dir = dir;
	LuaGlue::pushTableBuiltFromHandle(luaVM, h); 

	return 1;
}

PE_IMPLEMENT_CLASS1(Event_SET_DEBUG_TARGET_HANDLE, Event);


void Event_SET_DEBUG_TARGET_HANDLE::SetLuaFunctions(PE::Components::LuaEnvironment *pLuaEnv, lua_State *luaVM)
{
	static const struct luaL_Reg l_Event_SET_DEBUG_TARGET_HANDLE[] = {
		{"Construct", l_Construct},
		{NULL, NULL} // sentinel
	};

	// register the functions in current lua table which is the table for Event_MOVE
	luaL_register(luaVM, 0, l_Event_SET_DEBUG_TARGET_HANDLE);
}

// this function is called form lua whenever Lua wants to create this event
int Event_SET_DEBUG_TARGET_HANDLE::l_Construct(lua_State* luaVM)
{
	Handle h("EVENT", sizeof(Event_SET_DEBUG_TARGET_HANDLE));
	Event_SET_DEBUG_TARGET_HANDLE *pEvt = new(h) Event_SET_DEBUG_TARGET_HANDLE;
	
	// arguments are on the stack in reverse order
	int evtClassId = (int)(lua_tonumber(luaVM, -1));
	lua_pop(luaVM, 1);

	Handle dbgTarget;
	LuaGlue::popHandleFromTableOnStackAndPopTable(luaVM, dbgTarget);

	
	// set data values
	pEvt->m_hDebugTarget = dbgTarget;
	pEvt->m_debugEvent = evtClassId;

	LuaGlue::pushTableBuiltFromHandle(luaVM, h); 

	return 1;
}


PE_IMPLEMENT_CLASS1(Event_CONSTRUCT_SOUND, Event);
PE_IMPLEMENT_CLASS1(Event_ADDED_AS_COMPONENT, Event);
PE_IMPLEMENT_CLASS1(Event_CHARACTER_HIT_BY_MELEE, Event);

PE_IMPLEMENT_CLASS1(Event_SERVER_CLIENT_CONNECTION_ACK, Event);
Event_SERVER_CLIENT_CONNECTION_ACK::Event_SERVER_CLIENT_CONNECTION_ACK(PE::GameContext &context)
: Networkable(context, this)
, m_clientId(-1)
{

}

Event_SERVER_CLIENT_CONNECTION_ACK::~Event_SERVER_CLIENT_CONNECTION_ACK()
{
	assert("Quick test");
}


void *Event_SERVER_CLIENT_CONNECTION_ACK::FactoryConstruct(PE::GameContext& context, PE::MemoryArena arena)
{
	Event_SERVER_CLIENT_CONNECTION_ACK *pEvt = new (arena) Event_SERVER_CLIENT_CONNECTION_ACK(context);
	return pEvt;
}

int Event_SERVER_CLIENT_CONNECTION_ACK::packCreationData(char *pDataStream)
{
	int size = 0;
	size += PE::Components::StreamManager::WriteInt32(m_clientId, pDataStream);
	size += PE::Components::StreamManager::WriteSocketAddr(m_targetSock, &pDataStream[size]);
	return size;
}

int Event_SERVER_CLIENT_CONNECTION_ACK::constructFromStream(char *pDataStream)
{
	int read = 0;
	read += PE::Components::StreamManager::ReadInt32(&pDataStream[read], m_clientId);
	read += PE::Components::StreamManager::ReadSocketAddr(&pDataStream[read], m_targetSock);
	return read;
}


PE_IMPLEMENT_CLASS1(Event_CLIENT_JOIN, Event);
Event_CLIENT_JOIN::Event_CLIENT_JOIN(PE::GameContext &context)
	: Networkable(context, this)
	, m_clientId(-1)
{

}

Event_CLIENT_JOIN::~Event_CLIENT_JOIN()
{
	assert("Quick test");
}


void *Event_CLIENT_JOIN::FactoryConstruct(PE::GameContext& context, PE::MemoryArena arena)
{
	Event_CLIENT_JOIN *pEvt = new (arena) Event_CLIENT_JOIN(context);
	return pEvt;
}

int Event_CLIENT_JOIN::packCreationData(char *pDataStream)
{
	int size = 0;
	size += PE::Components::StreamManager::WriteInt32(m_clientId, &pDataStream[size]);
	size += PE::Components::StreamManager::WriteSocketAddr(m_targetSock, &pDataStream[size]);
	return size;
}

int Event_CLIENT_JOIN::constructFromStream(char *pDataStream)
{
	int read = 0;
	read += PE::Components::StreamManager::ReadInt32(&pDataStream[read], m_clientId);
	read += PE::Components::StreamManager::ReadSocketAddr(&pDataStream[read], m_targetSock);
	return read;
}

};
};


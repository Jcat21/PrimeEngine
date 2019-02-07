#ifndef _CHARACTER_CONTROL_GAME_SERVER_OBJ_REP_
#define _CHARACTER_CONTROL_GAME_SERVER_OBJ_REP_

#include "PrimeEngine/PrimeEngineIncludes.h"
#include "PrimeEngine/Lua/LuaEnvironment.h"
#include "PrimeEngine/Events/Component.h"

using namespace PE::Components;
using namespace PE::Events;
//using namespace CharacterControl::Events;
//using namespace CharacterControl::Components;

namespace CharacterControl
{
namespace Components
{
	struct ServerGameObject : public Component
	{
		PE_DECLARE_CLASS(ServerGameObject);
		ServerGameObject(PE::GameContext context, PE::MemoryArena arena, PE::Handle hMyself): Component(context, arena, hMyself){}
		
		PEUUID m_peuuid;
		Vector3 m_u;
		Vector3 m_v;
		Vector3 m_n;
		Vector3 m_pos;
	};

	struct ServerLight : ServerGameObject
	{
		PE_DECLARE_CLASS(ServerLight);
		ServerLight(PE::GameContext context, PE::MemoryArena arena, PE::Handle hMyself) : ServerGameObject(context, arena, hMyself) {}
	
		Vector4	m_ambient;
		Vector4	m_diffuse;
		Vector4	m_spec;
		Vector3	m_att;
		float	m_spotPower;
		float	m_range;
		bool m_isShadowCaster;
		float	m_type; //0 = point, 1 = directional, 2 = spot
	};

	struct ServerMesh : ServerGameObject
	{
		PE_DECLARE_CLASS(ServerMesh);
		ServerMesh(PE::GameContext context, PE::MemoryArena arena, PE::Handle hMyself) : ServerGameObject(context, arena, hMyself) {}
		char m_meshFilename[255];
		char m_package[255];
		bool hasCustomOrientation;

		// for physics
		int m_numShapes;
		int m_physShapeType[8]; // sphere = 1, box = 2
		Vector3 m_physShapeTranslate[8];
		Vector3 m_physShapeScale[8];
		float m_physShapeRadius[8];
	};

	struct ServerSkel : ServerGameObject
	{
		PE_DECLARE_CLASS(ServerSkel);
		ServerSkel(PE::GameContext context, PE::MemoryArena arena, PE::Handle hMyself) : ServerGameObject(context, arena, hMyself) {}
		char m_skelFilename[255];
		char m_package[255];
		bool hasCustomOrientation;
	};

	struct ServerAnimSet : ServerGameObject
	{
		PE_DECLARE_CLASS(ServerAnimSet);
		ServerAnimSet(PE::GameContext context, PE::MemoryArena arena, PE::Handle hMyself) : ServerGameObject(context, arena, hMyself) {}

		//dario note: we actually only need this thing so that creation events are properly ordered in the client
		char animSetFilename[255];
		char m_package[255];
	};

	struct ServerPowerUpBlock : ServerMesh 
	{
		PE_DECLARE_CLASS(ServerPowerUpBlock);
		ServerPowerUpBlock(PE::GameContext context, PE::MemoryArena arena, PE::Handle hMyself) : ServerMesh(context, arena, hMyself) {}
	};
	struct ServerBanana : ServerMesh
	{
		PE_DECLARE_CLASS(ServerBanana);
		ServerBanana(PE::GameContext context, PE::MemoryArena arena, PE::Handle hMyself) : ServerMesh(context, arena, hMyself) {}
	};
	
	struct ServerCheckpoint : ServerMesh 
	{
		PE_DECLARE_CLASS(ServerCheckpoint);
		ServerCheckpoint(PE::GameContext context, PE::MemoryArena arena, PE::Handle hMyself) : ServerMesh(context, arena, hMyself) {} 

		char m_name[32];
		char m_next[32];
	};
	struct ServerInvisiWall : ServerMesh { 
		PE_DECLARE_CLASS(ServerInvisiWall);
		ServerInvisiWall(PE::GameContext context, PE::MemoryArena arena, PE::Handle hMyself) : ServerMesh(context, arena, hMyself) {} 
	};
}
}

#endif
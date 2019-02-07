#ifndef _CHARACTER_CONTROL_EVENTS_
#define _CHARACTER_CONTROL_EVENTS_

#include "PrimeEngine/Events/StandardEvents.h"

namespace CharacterControl
{
namespace Events
{
struct Event_CreateSoldierNPC : public PE::Events::Event_CREATE_MESH
{
	PE_DECLARE_CLASS(Event_CreateSoldierNPC);

	Event_CreateSoldierNPC(PE::GameContext context): PE::Events::Event_CREATE_MESH(context){}
	// override SetLuaFunctions() since we are adding custom Lua interface
	static void SetLuaFunctions(PE::Components::LuaEnvironment *pLuaEnv, lua_State *luaVM);

	// Lua interface prefixed with l_
	static int l_Construct(lua_State* luaVM);

	int m_npcType;
	char m_gunMeshName[64];
	char m_gunMeshPackage[64];
	char m_patrolWayPoint[32];

	int m_numShapes;
	int m_physShapeType[8]; // sphere = 1, box = 2
	Vector3 m_physShapeTranslate[8];
	Vector3 m_physShapeScale[8];
	float m_physShapeRadius[8];
};

struct Event_MoveTank_C_to_S : public PE::Events::Event, public PE::Networkable
{
	PE_DECLARE_CLASS(Event_MoveTank_C_to_S);
	PE_DECLARE_NETWORKABLE_CLASS

	Event_MoveTank_C_to_S(PE::GameContext &context);
	// Netoworkable:
	virtual int packCreationData(char *pDataStream);
	virtual int constructFromStream(char *pDataStream);


	// Factory function used by network
	static void *FactoryConstruct(PE::GameContext&, PE::MemoryArena);


	Matrix4x4 m_transform;
};


struct Event_MoveTank_S_to_C : public Event_MoveTank_C_to_S
{
	PE_DECLARE_CLASS(Event_MoveTank_S_to_C);
	PE_DECLARE_NETWORKABLE_CLASS

	Event_MoveTank_S_to_C(PE::GameContext &context);
	// Netoworkable:
	virtual int packCreationData(char *pDataStream);
	virtual int constructFromStream(char *pDataStream);


	// Factory function used by network
	static void *FactoryConstruct(PE::GameContext&, PE::MemoryArena);

	int m_clientTankId;
};

struct Event_SomeoneWon_C_to_S : public PE::Events::Event, public PE::Networkable
{
	PE_DECLARE_CLASS(Event_SomeoneWon_C_to_S);
	PE_DECLARE_NETWORKABLE_CLASS

	Event_SomeoneWon_C_to_S(PE::GameContext &context);
	// Networkable:
	virtual int packCreationData(char *pDataStream);
	virtual int constructFromStream(char *pDataStream);


	// Factory function used by network
	static void *FactoryConstruct(PE::GameContext&, PE::MemoryArena);
};


struct Event_SomeoneWon_S_to_C : public Event_SomeoneWon_C_to_S
{
	PE_DECLARE_CLASS(Event_SomeoneWon_S_to_C);
	PE_DECLARE_NETWORKABLE_CLASS

	Event_SomeoneWon_S_to_C(PE::GameContext &context);
	// Netoworkable:
	virtual int packCreationData(char *pDataStream);
	virtual int constructFromStream(char *pDataStream);


	// Factory function used by network
	static void *FactoryConstruct(PE::GameContext&, PE::MemoryArena);

	int m_clientTankId;
};

// tank input controls

struct Event_Tank_Throttle : public PE::Events::Event {
	PE_DECLARE_CLASS(Event_Tank_Throttle);

	Event_Tank_Throttle(){}
	virtual ~Event_Tank_Throttle(){}

	Vector3 m_relativeMove;
};

struct Event_Tank_Turn : public PE::Events::Event {
	PE_DECLARE_CLASS(Event_Tank_Turn);

	Event_Tank_Turn(){}
	virtual ~Event_Tank_Turn(){}

	Vector3 m_relativeRotate;
};

struct Event_OutOfBounds : public PE::Events::Event {
	PE_DECLARE_CLASS(Event_OutOfBounds);

	Event_OutOfBounds() {}
	virtual ~Event_OutOfBounds() {}
}; 

struct Event_PowerupReached : public PE::Events::Event {
	PE_DECLARE_CLASS(Event_PowerupReached);

	Event_PowerupReached() {}
	virtual ~Event_PowerupReached() {}
};

struct Event_BananaReached : public PE::Events::Event {
	PE_DECLARE_CLASS(Event_BananaReached);

	Event_BananaReached() {}
	virtual ~Event_BananaReached() {}
};


struct Event_CheckpointReached : public PE::Events::Event {
	PE_DECLARE_CLASS(Event_CheckpointReached);

	Event_CheckpointReached(char name[32], char next[32]);
	virtual ~Event_CheckpointReached() {}

	char m_checkpointName[32];
	char m_nextCheckpoint[32];
};

struct Event_LevelLoading_Done : public PE::Events::Event, public PE::Networkable
{
	PE_DECLARE_CLASS(Event_LevelLoading_Done);
	PE_DECLARE_NETWORKABLE_CLASS

	Event_LevelLoading_Done(PE::GameContext &context);
	// Networkable:
	virtual int packCreationData(char *pDataStream);
	virtual int constructFromStream(char *pDataStream);

	// Factory function used by network
	static void *FactoryConstruct(PE::GameContext&, PE::MemoryArena);

	static void SetLuaFunctions(PE::Components::LuaEnvironment *pLuaEnv, lua_State *luaVM);

	// Lua interface prefixed with l_
	static int l_Construct(lua_State* luaVM);
};


struct Event_LevelLoading_Done_Server : public Event_LevelLoading_Done
{
	PE_DECLARE_CLASS(Event_LevelLoading_Done_Server);
	PE_DECLARE_NETWORKABLE_CLASS

	Event_LevelLoading_Done_Server(PE::GameContext &context);
	// Netoworkable:
	virtual int packCreationData(char *pDataStream);
	virtual int constructFromStream(char *pDataStream);

	// Factory function used by network
	static void *FactoryConstruct(PE::GameContext&, PE::MemoryArena);

	bool m_activate;
	int m_clientTankId;
};

}; // namespace Events
}; // namespace CharacterControl

#endif

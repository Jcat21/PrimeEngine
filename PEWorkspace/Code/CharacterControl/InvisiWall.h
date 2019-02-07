#ifndef _CHARACTER_CONTROL_INVISIWALL_
#define _CHARACTER_CONTROL_INVISIWALL_

#include "PrimeEngine/Events/Component.h"
#include "PrimeEngine/Events/StandardEvents.h"
#include "PrimeEngine/Math/Matrix4x4.h"

namespace CharacterControl{
namespace Events{
struct Event_Create_InvisiWall : public PE::Events::Event_CREATE_MESH
{
	PE_DECLARE_CLASS(Event_Create_InvisiWall);
	PE_DECLARE_NETWORKABLE_CLASS

	Event_Create_InvisiWall(PE::GameContext &context) : PE::Events::Event_CREATE_MESH(context)
	, m_scale(Vector3(1, 1, 1)) {}
	// override SetLuaFunctions() since we are adding custom Lua interface
	static void SetLuaFunctions(PE::Components::LuaEnvironment *pLuaEnv, lua_State *luaVM);

	// Lua interface prefixed with l_
	static int l_Construct(lua_State* luaVM);

	// Networkable:
	virtual int packCreationData(char *pDataStream);
	virtual int constructFromStream(char *pDataStream);

	// Factory function used by network
	static void *FactoryConstruct(PE::GameContext&, PE::MemoryArena);

	Vector3 m_scale;
};

struct Event_Create_Server_InvisiWall : public Event_Create_InvisiWall
{
	PE_DECLARE_CLASS(Event_Create_Server_InvisiWall);
	PE_DECLARE_NETWORKABLE_CLASS

	Event_Create_Server_InvisiWall(PE::GameContext &context);
	// Netoworkable:
	virtual int packCreationData(char *pDataStream);
	virtual int constructFromStream(char *pDataStream);


	// Factory function used by network
	static void *FactoryConstruct(PE::GameContext&, PE::MemoryArena);

	int m_clientTankId;
};

}
namespace Components {

struct InvisiWall : public PE::Components::Component
{
	PE_DECLARE_CLASS(InvisiWall);

	InvisiWall( PE::GameContext &context, PE::MemoryArena arena, PE::Handle hMyself, Events::Event_Create_InvisiWall *pEvt);

	virtual void addDefaultComponents();
};
}; // namespace Components
}; // namespace CharacterControl
#endif


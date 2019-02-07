#ifndef _CHARACTER_CONTROL_CHECKPOINT_
#define _CHARACTER_CONTROL_CHECKPOINT_

#include "PrimeEngine/Events/Component.h"
#include "PrimeEngine/Events/StandardEvents.h"
#include "PrimeEngine/Math/Matrix4x4.h"

#include "../Events/Events.h"

namespace CharacterControl{
namespace Events{
struct Event_Create_Checkpoint : public PE::Events::Event_CREATE_MESH
{
	PE_DECLARE_CLASS(Event_Create_Checkpoint);
	PE_DECLARE_NETWORKABLE_CLASS

	Event_Create_Checkpoint(PE::GameContext &context) : PE::Events::Event_CREATE_MESH(context) {}
	// override SetLuaFunctions() since we are adding custom Lua interface
	static void SetLuaFunctions(PE::Components::LuaEnvironment *pLuaEnv, lua_State *luaVM);

	// Lua interface prefixed with l_
	static int l_Construct(lua_State* luaVM);

	// Networkable:
	virtual int packCreationData(char *pDataStream);
	virtual int constructFromStream(char *pDataStream);

	// Factory function used by network
	static void *FactoryConstruct(PE::GameContext&, PE::MemoryArena);

	char m_name[32];
	char m_next[32];
};

struct Event_Create_Server_Checkpoint : public Event_Create_Checkpoint
{
	PE_DECLARE_CLASS(Event_Create_Server_Checkpoint);
	PE_DECLARE_NETWORKABLE_CLASS

	Event_Create_Server_Checkpoint(PE::GameContext &context);
	// Netoworkable:
	virtual int packCreationData(char *pDataStream);
	virtual int constructFromStream(char *pDataStream);


	// Factory function used by network
	static void *FactoryConstruct(PE::GameContext&, PE::MemoryArena);

	int m_clientTankId;
};

}
namespace Components {

struct Checkpoint : public PE::Components::Component
{
	PE_DECLARE_CLASS(Checkpoint);

	Checkpoint( PE::GameContext &context, PE::MemoryArena arena, PE::Handle hMyself, Events::Event_Create_Checkpoint *pEvt);

	virtual void addDefaultComponents();

	PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_UPDATE);
	virtual void do_UPDATE(PE::Events::Event *pEvt);

	char m_name[32];
	char m_next[32];
};
}; // namespace Components
}; // namespace CharacterControl
#endif


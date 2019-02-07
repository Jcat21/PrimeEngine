#ifndef _CHARACTER_CONTROL_POWERUPBLOCK_
#define _CHARACTER_CONTROL_POWERUPBLOCK_

#include "PrimeEngine/Events/Component.h"
#include "PrimeEngine/Events/StandardEvents.h"
#include "PrimeEngine/Math/Matrix4x4.h"

#include "../Events/Events.h"

namespace CharacterControl{
namespace Events{
	// dario note: flow goes kind of like this
	// construction from lua actually only creates event that's sent to the server
	// server broadcasts an event back to clients for actual creation
	// the client game object manager then constructs the actual event
struct Event_Create_PowerUpBlock : public PE::Events::Event_CREATE_MESH
{
	PE_DECLARE_CLASS(Event_Create_PowerUpBlock);
	PE_DECLARE_NETWORKABLE_CLASS

	Event_Create_PowerUpBlock(PE::GameContext &context) : PE::Events::Event_CREATE_MESH(context) {}
	// override SetLuaFunctions() since we are adding custom Lua interface
	static void SetLuaFunctions(PE::Components::LuaEnvironment *pLuaEnv, lua_State *luaVM);

	// Lua interface prefixed with l_
	static int l_Construct(lua_State* luaVM);

	// Networkable:
	virtual int packCreationData(char *pDataStream);
	virtual int constructFromStream(char *pDataStream);

	// Factory function used by network
	static void *FactoryConstruct(PE::GameContext&, PE::MemoryArena);
};

struct Event_Create_Server_PowerUpBlock : public Event_Create_PowerUpBlock
{
	PE_DECLARE_CLASS(Event_Create_Server_PowerUpBlock);
	PE_DECLARE_NETWORKABLE_CLASS

	Event_Create_Server_PowerUpBlock(PE::GameContext &context);
	// Netoworkable:
	virtual int packCreationData(char *pDataStream);
	virtual int constructFromStream(char *pDataStream);


	// Factory function used by network
	static void *FactoryConstruct(PE::GameContext&, PE::MemoryArena);

	int m_clientTankId;
};

}
namespace Components {

struct PowerUpBlock : public PE::Components::Component
{
	PE_DECLARE_CLASS(PowerUpBlock);

	PowerUpBlock( PE::GameContext &context, PE::MemoryArena arena, PE::Handle hMyself, Events::Event_Create_PowerUpBlock *pEvt);

	virtual void addDefaultComponents() ;

	PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_UPDATE);
	virtual void do_UPDATE(PE::Events::Event *pEvt);

};
}; // namespace Components
}; // namespace CharacterControl
#endif

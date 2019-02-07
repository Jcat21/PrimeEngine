#ifndef _CHARACTER_CONTROL_CLIENT_GAME_OBJ_MANAGER_ADDON_
#define _CHARACTER_CONTROL_CLIENT_GAME_OBJ_MANAGER_ADDON_

#include "GameObjectMangerAddon.h"
#include "Events/Events.h"

#include "WayPoint.h"

namespace CharacterControl
{
namespace Components
{

// This struct will be added to GameObjectManager as component
// as a result events sent to game object manager will be able to get to this component
// so we can create custom game objects through this class
struct ClientGameObjectManagerAddon : public GameObjectManagerAddon
{
	PE_DECLARE_CLASS(ClientGameObjectManagerAddon); // creates a static handle and GteInstance*() methods. still need to create construct

	ClientGameObjectManagerAddon(PE::GameContext &context, PE::MemoryArena arena, PE::Handle hMyself) : GameObjectManagerAddon(context, arena, hMyself)
	{}

	// sub-component and event registration
	virtual void addDefaultComponents() ;

	PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_CreateSoldierNPC);
	virtual void do_CreateSoldierNPC(PE::Events::Event *pEvt);

	PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_CREATE_WAYPOINT);
	virtual void do_CREATE_WAYPOINT(PE::Events::Event *pEvt);

	PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_Create_PowerUpBlock);
	virtual void do_Create_PowerUpBlock(PE::Events::Event *pEvt);

	PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_Create_Banana);
	virtual void do_Create_Banana(PE::Events::Event *pEvt);

	PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_Create_Checkpoint);
	virtual void do_Create_Checkpoint(PE::Events::Event *pEvt);

	PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_Create_InvisiWall);
	virtual void do_Create_InvisiWall(PE::Events::Event *pEvt);

	// will load level when local client is connected
	PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_SERVER_CLIENT_CONNECTION_ACK);
	virtual void do_SERVER_CLIENT_CONNECTION_ACK(PE::Events::Event *pEvt);

	// sent from server, sets position of non-local client tanks
	PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_MoveTank);
	virtual void do_MoveTank(PE::Events::Event *pEvt);

	// sent from server, basically you're not the winner
	PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_SomeoneWon);
	virtual void do_SomeoneWon(PE::Events::Event *pEvt);

	// sent from server, basically it's done loading the level for you and will activate tank :3
	PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_LevelLoading_Done);
	virtual void do_LevelLoading_Done(PE::Events::Event *pEvt);

	// no need to implement this as eent since tank creation will be hardcoded
	void createTank(int index, int &threadOwnershipMask);
	void createSpaceShip(int &threadOwnershipMask);
	void createSoldierNPC(PE::GameContext context);
	void createSoldierNPC(Events::Event_CreateSoldierNPC *pTrueEvent);
	void createBanana(int &threadOwnershipMask);


	//////////////////////////////////////////////////////////////////////////
	// Game Specific functionality
	//////////////////////////////////////////////////////////////////////////
	//
	// waypoint search
	WayPoint *getWayPoint(const char *name);
	class SoldierNPC* getActor(const char *name);

	Vector3 getLastCheckpointPosition(const char* name);

	Vector3 getEnemyPosition(int yourId);
};


}
}

#endif

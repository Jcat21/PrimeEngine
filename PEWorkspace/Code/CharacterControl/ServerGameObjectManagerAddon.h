#ifndef _CHARACTER_CONTROL_GAME_SERVER_OBJ_MANAGER_ADDON_
#define _CHARACTER_CONTROL_GAME_SERVER_OBJ_MANAGER_ADDON_

#include "GameObjectMangerAddon.h"
#include "Events/Events.h"

#include "ServerGameObjectRep.h"
#include "WayPoint.h"

namespace CharacterControl
{
namespace Components
{

// This struct will be added to GameObjectManager as component
// as a result events sent to game object manager will be able to get to this component
// so we can create custom game objects through this class
struct ServerGameObjectManagerAddon : public GameObjectManagerAddon
{
	PE_DECLARE_SINGLETON_CLASS(ServerGameObjectManagerAddon); // creates a static handle and GteInstance*() methods. still need to create construct

	ServerGameObjectManagerAddon(PE::GameContext &context, PE::MemoryArena arena, PE::Handle hMyself) : GameObjectManagerAddon(context, arena, hMyself), m_serverGameObjects(context, arena, 256)
	{}

	// sub-component and event registration
	virtual void addDefaultComponents() ;

	PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_MoveTank);
	virtual void do_MoveTank(PE::Events::Event *pEvt);

	PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_SomeoneWon);
	virtual void do_SomeoneWon(PE::Events::Event *pEvt);

	PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_Create_PowerUpBlock);
	virtual void do_Create_PowerUpBlock(PE::Events::Event *pEvt);

	PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_Create_Banana);
	virtual void do_Create_Banana(PE::Events::Event *pEvt);

	PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_Create_Checkpoint);
	virtual void do_Create_Checkpoint(PE::Events::Event *pEvt);

	PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_Create_InvisiWall);
	virtual void do_Create_InvisiWall(PE::Events::Event *pEvt);

	PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_Create_Light);
	virtual void do_Create_Light(PE::Events::Event *pEvt);

	PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_Create_Mesh);
	virtual void do_Create_Mesh(PE::Events::Event *pEvt);

	PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_Create_Skel);
	virtual void do_Create_Skel(PE::Events::Event *pEvt);

	PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_Create_AnimSet);
	virtual void do_Create_AnimSet(PE::Events::Event *pEvt);

	PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_LevelLoading_Done);
	virtual void do_LevelLoading_Done(PE::Events::Event *pEvt);

	//////////////////////////////////////////////////////////////////////////
	// Game Specific functionality
	//////////////////////////////////////////////////////////////////////////
	//

	ServerGameObject* getFromServerGameObjectList(PEUUID peuuid, int classid);
	ServerGameObject* addToListFromEvent(PE::Events::Event *pEvt);
	void fillFwdEvent(PE::Events::Event *pEvt, ServerGameObject *sgo);

	Array<PE::Handle, 1> m_serverGameObjects;
};


}
}

#endif

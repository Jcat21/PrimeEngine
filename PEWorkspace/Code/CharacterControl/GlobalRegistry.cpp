#include "PrimeEngine/APIAbstraction/APIAbstractionDefines.h"

#include "GlobalRegistry.h"

#include "WayPoint.h"
#include "Characters/SoldierNPC.h"
#include "Characters/SoldierNPCAnimationSM.h"
#include "Characters/SoldierNPCMovementSM.h"
#include "Characters/SoldierNPCBehaviorSM.h"
#include "Events/Events.h"
#include "GameObjectMangerAddon.h"
#include "ClientGameObjectManagerAddon.h"
#include "ServerGameObjectManagerAddon.h"
#include "ClientCharacterControlGame.h"
#include "ServerCharacterControlGame.h"
#include "Tank/ClientTank.h"
#include "CharacterControl/Client/ClientSpaceShip.h"
#include "CharacterControl/Client/ClientSpaceShipControls.h"

#include "TriggerVolumes/PowerUpBlock.h"
#include "TriggerVolumes/Banana.h"
#include "TriggerVolumes/Checkpoint.h"
#include "InvisiWall.h"

#include "ServerGameObjectRep.h"

using namespace PE::Components;
using namespace CharacterControl::Components;
using namespace CharacterControl::Events;
namespace CharacterControl
{
	bool setLuaMetaDataOnly = 0;
}

void CharacterControl::Register(PE::Components::LuaEnvironment *pLuaEnv, PE::GlobalRegistry *pRegistry)
{
	// register classes defined in CharacterControl

	pLuaEnv->StartRootRegistrationTable();
	// start root
	{
		pLuaEnv->StartRegistrationTable("CharacterControl");
		// start root.CharacterControl
		{
			pLuaEnv->StartRegistrationTable("Components");
			// start root.CharacterControl.Components
			{
				WayPoint::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				PowerUpBlock::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				Banana::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				Checkpoint::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				InvisiWall::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				SoldierNPC::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				SoldierNPCAnimationSM::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				SoldierNPCMovementSM::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				SoldierNPCBehaviorSM::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				TankController::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				TankRep::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				TankGameControls::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				GameObjectManagerAddon::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
					ClientGameObjectManagerAddon::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
					ServerGameObjectManagerAddon::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				ClientSpaceShip::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				SpaceShipGameControls::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);

				ServerGameObject::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				ServerMesh::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				ServerSkel::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				ServerLight::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				ServerPowerUpBlock::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				ServerBanana::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				ServerInvisiWall::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				ServerCheckpoint::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
			}
			// end root.CharacterControl.Components
			pLuaEnv->EndRegistrationTable();


			pLuaEnv->StartRegistrationTable("Events");
			// start root.CharacterControl.Events
			{
				Event_CreateSoldierNPC::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				Event_CREATE_WAYPOINT::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				Event_Create_PowerUpBlock::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				Event_Create_Server_PowerUpBlock::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				Event_Create_Banana::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				Event_Create_Server_Banana::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
		
				Event_Create_Checkpoint::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				Event_Create_Server_Checkpoint::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				Event_Create_InvisiWall::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				Event_Create_Server_InvisiWall::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				SoldierNPCAnimSM_Event_STOP::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				SoldierNPCAnimSM_Event_WALK::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				SoldierNPCMovementSM_Event_MOVE_TO::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				SoldierNPCMovementSM_Event_TARGET_REACHED::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				SoldierNPCMovementSM_Event_STOP::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				Event_MoveTank_C_to_S::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				Event_MoveTank_S_to_C::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				Event_Tank_Throttle::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				Event_Tank_Turn::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				Event_OutOfBounds::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				Event_CheckpointReached::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				Event_PowerupReached::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				Event_BananaReached::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				Event_SomeoneWon_C_to_S::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				Event_SomeoneWon_S_to_C::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				Event_LevelLoading_Done::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
				Event_LevelLoading_Done_Server::InitializeAndRegister(pLuaEnv, pRegistry, setLuaMetaDataOnly);
			}
			// end root.CharacterControl.Events
			pLuaEnv->EndRegistrationTable();
		}
		// end root.CharacterControl
		pLuaEnv->EndRegistrationTable();
	}
	// end root
	pLuaEnv->EndRootRegistrationTable();

	setLuaMetaDataOnly = true; // make sure on next pass we dont reset class id, we just set registration values in lua
}


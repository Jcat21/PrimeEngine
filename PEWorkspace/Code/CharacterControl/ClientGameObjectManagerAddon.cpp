#include "ClientGameObjectManagerAddon.h"

#include "PrimeEngine/PrimeEngineIncludes.h"

#include "Characters/SoldierNPC.h"
#include "WayPoint.h"
#include "Tank/ClientTank.h"
#include "CharacterControl/Client/ClientSpaceShip.h"

#include "TriggerVolumes/PowerUpBlock.h"
#include "TriggerVolumes/Banana.h"
#include "TriggerVolumes/Checkpoint.h"
#include "InvisiWall.h"




using namespace PE::Components;
using namespace PE::Events;
using namespace CharacterControl::Events;
using namespace CharacterControl::Components;

namespace CharacterControl {
	namespace Components
	{




		PE_IMPLEMENT_CLASS1(ClientGameObjectManagerAddon, Component); // creates a static handle and GteInstance*() methods. still need to create construct

		void ClientGameObjectManagerAddon::addDefaultComponents()
		{
			GameObjectManagerAddon::addDefaultComponents();

			PE_REGISTER_EVENT_HANDLER(Event_CreateSoldierNPC, ClientGameObjectManagerAddon::do_CreateSoldierNPC);
			PE_REGISTER_EVENT_HANDLER(Event_CREATE_WAYPOINT, ClientGameObjectManagerAddon::do_CREATE_WAYPOINT);

			PE_REGISTER_EVENT_HANDLER(Event_Create_Server_PowerUpBlock, ClientGameObjectManagerAddon::do_Create_PowerUpBlock);
			PE_REGISTER_EVENT_HANDLER(Event_Create_Server_Checkpoint, ClientGameObjectManagerAddon::do_Create_Checkpoint);
			PE_REGISTER_EVENT_HANDLER(Event_Create_Server_InvisiWall, ClientGameObjectManagerAddon::do_Create_InvisiWall);
			PE_REGISTER_EVENT_HANDLER(Event_Create_Server_Banana, ClientGameObjectManagerAddon::do_Create_Banana);

			PE_REGISTER_EVENT_HANDLER(Event_LevelLoading_Done_Server, ClientGameObjectManagerAddon::do_LevelLoading_Done);

			// note this component (game obj addon) is added to game object manager after network manager, so network manager will process this event first
			PE_REGISTER_EVENT_HANDLER(PE::Events::Event_SERVER_CLIENT_CONNECTION_ACK, ClientGameObjectManagerAddon::do_SERVER_CLIENT_CONNECTION_ACK);

			PE_REGISTER_EVENT_HANDLER(Event_MoveTank_S_to_C, ClientGameObjectManagerAddon::do_MoveTank);
			PE_REGISTER_EVENT_HANDLER(Event_SomeoneWon_S_to_C, ClientGameObjectManagerAddon::do_SomeoneWon);

		}

		void ClientGameObjectManagerAddon::do_CreateSoldierNPC(PE::Events::Event *pEvt)
		{
			assert(pEvt->isInstanceOf<Event_CreateSoldierNPC>());

			Event_CreateSoldierNPC *pTrueEvent = (Event_CreateSoldierNPC*)(pEvt);

			createSoldierNPC(pTrueEvent);
		}

		void ClientGameObjectManagerAddon::createSoldierNPC(PE::GameContext context)
		{
			Event_CreateSoldierNPC evt(context);
			evt.m_pos = Vector3();
			evt.m_u = Vector3(1.0f, 0, 0);
			evt.m_v = Vector3(0, 1.0f, 0);
			evt.m_n = Vector3(0, 0, 1.0f);

			StringOps::writeToString("SoldierTransform.mesha", evt.m_meshFilename, 255);
			StringOps::writeToString("Soldier", evt.m_package, 255);
			StringOps::writeToString("mg34.x_mg34main_mesh.mesha", evt.m_gunMeshName, 64);
			StringOps::writeToString("CharacterControl", evt.m_gunMeshPackage, 64);
			StringOps::writeToString("", evt.m_patrolWayPoint, 32);
			createSoldierNPC(&evt);
		}

		void ClientGameObjectManagerAddon::createSoldierNPC(Event_CreateSoldierNPC *pTrueEvent)
		{
			PEINFO("CharacterControl: GameObjectManagerAddon: Creating CreateSoldierNPC\n");

			PE::Handle hSoldierNPC("SoldierNPC", sizeof(SoldierNPC));
			SoldierNPC *pSoldierNPC = new(hSoldierNPC) SoldierNPC(*m_pContext, m_arena, hSoldierNPC, pTrueEvent);
			pSoldierNPC->addDefaultComponents();

			// add the soldier as component to the ObjecManagerComponentAddon
			// all objects of this demo live in the ObjecManagerComponentAddon
			addComponent(hSoldierNPC);
		}

		void ClientGameObjectManagerAddon::createBanana(int & threadOwnershipMask)
		{

			//m_pContext->getGPUScreen()->AcquireRenderContextOwnership(threadOwnershipMask);

			PE::Handle hSN("SCENE_NODE", sizeof(SceneNode));
			SceneNode *pSN = new(hSN) SceneNode(*m_pContext, m_arena, hSN);
			pSN->addDefaultComponents();

			pSN->m_base.setPos(Vector3(0,-100,0));
			pSN->m_base.setU(Vector3(1, 0, 0));
			pSN->m_base.setV(Vector3(0, 1, 0));
			pSN->m_base.setN(Vector3(0, 0, 1));

			pSN->m_base.scaleN(10);
			pSN->m_base.scaleU(10);
			pSN->m_base.scaleV(10);
			pSN->m_base.turnDown(1.5);

			RootSceneNode::Instance()->addComponent(hSN);

			addComponent(hSN);

			PE::Handle hMeshInstance("MeshInstance", sizeof(MeshInstance));
			MeshInstance *pMeshInstance = new(hMeshInstance) MeshInstance(*m_pContext, m_arena, hMeshInstance);
			pMeshInstance->addDefaultComponents();

			//dario todo: fix lua and py scripts
			pMeshInstance->initFromFile("banana.001.mesha", "Banana", threadOwnershipMask);

			// add mesh to scene node
			pSN->addComponent(hMeshInstance);

			//m_pContext->getGPUScreen()->ReleaseRenderContextOwnership(threadOwnershipMask);

			//Trigger Volume
			// 1 - set the trigger event with the handle to be released after we passed it
			PE::Handle h("Event_BananaReached", sizeof(Event_BananaReached));
			Events::Event_BananaReached *test = new(h) Event_BananaReached();

			// 2 - create the trigger volume
			PE::Handle hTV("TRIGGER_VOLUME", sizeof(TriggerVolume));
			TriggerVolume *pTV = new(hTV) TriggerVolume(*m_pContext, m_arena, hTV, test, test->getClassSize(), TankController::GetClassId(), 500.0f);//if you want a 5 second cooldown , 5.f);																					   // 3 - add the trigger volume to the scene node
			pSN->addComponent(hTV);
			// 4 - add the shapes to the trigger volume
			PE::Handle hSphere("PHYSICS_SPHERE", sizeof(PhysicsSphere));
			PhysicsSphere *pSphere = new(hSphere) PhysicsSphere(*m_pContext, m_arena, hSphere, Vector3(0, 2, 0), 1);
			pTV->m_shapes.add(hSphere);
			pTV->addComponent(hSphere);

			// 5 - add the trigger volume to the physics manager
			PhysicsManager::Instance()->addTrigCompToList(hTV);

				
		}

		void ClientGameObjectManagerAddon::do_Create_PowerUpBlock(PE::Events::Event *pEvt)
		{
			assert(pEvt->isInstanceOf<Event_Create_Server_PowerUpBlock>());

			Event_Create_Server_PowerUpBlock *pTrueEvent = (Event_Create_Server_PowerUpBlock*)(pEvt);

			PEINFO("GameObjectManagerAddon::do_Create_PowerUpBlock()\n");
			PE::Handle h("Power-Up Block", sizeof(Event_Create_PowerUpBlock));
			Event_Create_PowerUpBlock createEvt(*m_pContext);

			StringOps::writeToString(pTrueEvent->m_meshFilename, createEvt.m_meshFilename, sizeof(createEvt.m_meshFilename));
			StringOps::writeToString(pTrueEvent->m_package, createEvt.m_package, sizeof(createEvt.m_package));
			createEvt.m_u = pTrueEvent->m_u;
			createEvt.m_v = pTrueEvent->m_v;
			createEvt.m_n = pTrueEvent->m_n;
			createEvt.m_pos = pTrueEvent->m_pos;

			PE::Handle hPUB("Power-up Block", sizeof(PowerUpBlock));
			PowerUpBlock *pPUB = new(hPUB) PowerUpBlock(*m_pContext, m_arena, hPUB, &createEvt);
			pPUB->addDefaultComponents();

			addComponent(hPUB);
		}

		void ClientGameObjectManagerAddon::do_Create_Banana(PE::Events::Event *pEvt)
		{
			assert(pEvt->isInstanceOf<Event_Create_Server_Banana>());

			Event_Create_Server_Banana *pTrueEvent = (Event_Create_Server_Banana*)(pEvt);

			PEINFO("GameObjectManagerAddon::do_Create_Banana()\n");
			PE::Handle h("Banana", sizeof(Event_Create_Banana));
			Event_Create_Banana createEvt(*m_pContext);

			StringOps::writeToString(pTrueEvent->m_meshFilename, createEvt.m_meshFilename, sizeof(createEvt.m_meshFilename));
			StringOps::writeToString(pTrueEvent->m_package, createEvt.m_package, sizeof(createEvt.m_package));
			createEvt.m_u = pTrueEvent->m_u;
			createEvt.m_v = pTrueEvent->m_v;
			createEvt.m_n = pTrueEvent->m_n;
			createEvt.m_pos = pTrueEvent->m_pos;

			PE::Handle hPUB("Banana", sizeof(Banana));
			Banana *pPUB = new(hPUB) Banana(*m_pContext, m_arena, hPUB, &createEvt);
			pPUB->addDefaultComponents();

			addComponent(hPUB);
		}

		void ClientGameObjectManagerAddon::do_Create_Checkpoint(PE::Events::Event *pEvt)
		{
			assert(pEvt->isInstanceOf<Event_Create_Server_Checkpoint>());

			Event_Create_Server_Checkpoint *pTrueEvent = (Event_Create_Server_Checkpoint*)(pEvt);

			PEINFO("GameObjectManagerAddon::do_Create_PowerUpBlock()\n");
			PE::Handle h("Power-Up Block", sizeof(Event_Create_Checkpoint));
			Event_Create_Checkpoint createEvt(*m_pContext);

			StringOps::writeToString(pTrueEvent->m_name, createEvt.m_name, sizeof(createEvt.m_name));
			StringOps::writeToString(pTrueEvent->m_next, createEvt.m_next, sizeof(createEvt.m_next));
			createEvt.m_u = pTrueEvent->m_u;
			createEvt.m_v = pTrueEvent->m_v;
			createEvt.m_n = pTrueEvent->m_n;
			createEvt.m_pos = pTrueEvent->m_pos;

			PE::Handle hC("Checkpoint", sizeof(Checkpoint));
			Checkpoint *pC = new(hC) Checkpoint(*m_pContext, m_arena, hC, pTrueEvent);
			pC->addDefaultComponents();

			addComponent(hC);

			if (StringOps::strcmp(pC->m_name, "0") == 0)
			{
				{
					EmitterParams ep;
					{
						ep.colorinitial = Vector4(0.8, 0.2, 0.2, 0.4);
						ep.velVariance = Vector3(1, 0, 1);
						ep.lifetime = 5;
						ep.lifeVariance = 3;
						ep.velocityMagnitude = 2;
						ep.sizeinit = 0;
						ep.sizefinal = 1;
						ep.rotateinit = 0;
						ep.rotatefinal = 3.141592 * 2;
					}

					PE::Handle hPEb("Particle Emitter", sizeof(ParticleEmitter));
					ParticleEmitter *pPEb = new(hPEb) ParticleEmitter(*m_pContext, m_arena, hPEb);
					pPEb->addDefaultComponents();
					ep.colorinitial = Vector4(0.5, 0.5, 0.5, 0.3);
					ep.colorfinal = Vector4(1.0, 0.0, 0.2, 0.2);
					pPEb->initializeEmitter(1000, 2, "smokey.dds", "Default", "Particles_Blended_Glow_Tech", ep);
					pPEb->m_base.setPos(getLastCheckpointPosition(pC->m_name));
					RootSceneNode::Instance()->addComponent(hPEb);
				}
			}
		}

		void ClientGameObjectManagerAddon::do_Create_InvisiWall(PE::Events::Event *pEvt)
		{
			assert(pEvt->isInstanceOf<Event_Create_Server_InvisiWall>());

			Event_Create_Server_InvisiWall *pTrueEvent = (Event_Create_Server_InvisiWall*)(pEvt);

			PEINFO("GameObjectManagerAddon::do_Create_InvisiWall()\n");
			PE::Handle h("Power-Up Block", sizeof(Event_Create_InvisiWall));
			Event_Create_InvisiWall createEvt(*m_pContext);

			createEvt.m_u = pTrueEvent->m_u;
			createEvt.m_v = pTrueEvent->m_v;
			createEvt.m_n = pTrueEvent->m_n;
			createEvt.m_pos = pTrueEvent->m_pos;

			PE::Handle hC("InvisiWall", sizeof(InvisiWall));
			InvisiWall *pC = new(hC) InvisiWall(*m_pContext, m_arena, hC, pTrueEvent);
			pC->addDefaultComponents();

			addComponent(hC);
		}

		void ClientGameObjectManagerAddon::do_CREATE_WAYPOINT(PE::Events::Event *pEvt)
		{
			PEINFO("GameObjectManagerAddon::do_CREATE_WAYPOINT()\n");

			assert(pEvt->isInstanceOf<Event_CREATE_WAYPOINT>());

			Event_CREATE_WAYPOINT *pTrueEvent = (Event_CREATE_WAYPOINT*)(pEvt);

			PE::Handle hWayPoint("WayPoint", sizeof(WayPoint));
			WayPoint *pWayPoint = new(hWayPoint) WayPoint(*m_pContext, m_arena, hWayPoint, pTrueEvent);
			pWayPoint->addDefaultComponents();

			addComponent(hWayPoint);
		}

		WayPoint *ClientGameObjectManagerAddon::getWayPoint(const char *name)
		{
			PE::Handle *pHC = m_components.getFirstPtr();

			for (PrimitiveTypes::UInt32 i = 0; i < m_components.m_size; i++, pHC++) // fast array traversal (increasing ptr)
			{
				Component *pC = (*pHC).getObject<Component>();

				if (pC->isInstanceOf<WayPoint>())
				{
					WayPoint *pWP = (WayPoint *)(pC);
					if (StringOps::strcmp(pWP->m_name, name) == 0)
					{
						// equal strings, found our waypoint
						return pWP;
					}
				}
			}
			return NULL;
		}

		SoldierNPC* ClientGameObjectManagerAddon::getActor(const char *name)
		{
			PE::Handle *pHC = m_components.getFirstPtr();

			for (PrimitiveTypes::UInt32 i = 0; i < m_components.m_size; i++, pHC++) // fast array traversal (increasing ptr)
			{
				Component *pC = (*pHC).getObject<Component>();

				if (pC->isInstanceOf<SoldierNPC>())
				{
					SoldierNPC *pMD = (SoldierNPC *)(pC);
					if (StringOps::strcmp(pMD->m_theDudesName, name) == 0)
					{
						// equal strings, found our waypoint
						return pMD;
					}
				}
			}
			return NULL;
		}

		Vector3 ClientGameObjectManagerAddon::getLastCheckpointPosition(const char *name)
		{
			PE::Handle *pHC = m_components.getFirstPtr();

			for (PrimitiveTypes::UInt32 i = 0; i < m_components.m_size; i++, pHC++) // fast array traversal (increasing ptr)
			{
				Component *pC = (*pHC).getObject<Component>();

				if (pC->isInstanceOf<Checkpoint>())
				{
					Checkpoint *pCP = (Checkpoint *)(pC);
					if (StringOps::strcmp(pCP->m_name, name) == 0)
					{
						// equal strings, found our checkpoint
						return pCP->getFirstComponent<SceneNode>()->m_base.getPos();
					}
				}
			}
			return Vector3();
		}

		Vector3 ClientGameObjectManagerAddon::getEnemyPosition(int yourId)
		{
			PE::Handle *pHC = m_components.getFirstPtr();

			for (PrimitiveTypes::UInt32 i = 0; i < m_components.m_size; i++, pHC++) // fast array traversal (increasing ptr)
			{
				Component *pC = (*pHC).getObject<Component>();

				if (pC->isInstanceOf<TankController>())
				{
					TankController *pTK = (TankController *)(pC);
					if (pTK->m_pTankRep->m_ghostId != yourId)
					{
						// equal strings, found our checkpoint
						return pTK->m_pTankRep->m_position;
					}
				}
			}
			return Vector3();
		}

		void ClientGameObjectManagerAddon::createTank(int index, int &threadOwnershipMask)
		{

			//create hierarchy:
			//scene root
			//  scene node // tracks position/orientation
			//    Tank

			//game object manager
			//  TankController
			//    scene node

			PE::Handle hMeshInstance("MeshInstance", sizeof(MeshInstance));
			MeshInstance *pMeshInstance = new(hMeshInstance) MeshInstance(*m_pContext, m_arena, hMeshInstance);

			pMeshInstance->addDefaultComponents();
			pMeshInstance->initFromFile("body.mesha", "Lambor", threadOwnershipMask);


			// need to create a scene node for this mesh
			PE::Handle hSN("SCENE_NODE", sizeof(SceneNode));
			SceneNode *pSN = new(hSN) SceneNode(*m_pContext, m_arena, hSN);
			pSN->addDefaultComponents();

			float xOffset = -34;
			float yOffset = 0.5;
			float zOffset = 24;

			Vector3 spawnPos(3.0f * index + xOffset, yOffset, zOffset);
			pSN->m_base.setPos(spawnPos);
			pSN->m_base.turnAboutAxis(3.1415962, Vector3(0, 1, 0));
			
			pSN->m_base.scaleN(0.5);
			pSN->m_base.scaleU(0.5);
			pSN->m_base.scaleV(0.5);
			Quaternion spawnRot = pSN->m_base.createQuat();

			pSN->addComponent(hMeshInstance);
			RootSceneNode::Instance()->addComponent(hSN);


			// add physics component for this scene node
			PE::Handle hPC("PHYSICS_COMPONENT", sizeof(PhysicsComponent));
			PhysicsComponent *pPC = new(hPC) PhysicsComponent(*m_pContext, m_arena, hPC, false, false); //not affected initially
			pSN->addComponent(hPC);

			PE::Handle hSphere("PHYSICS_SPHERE", sizeof(PhysicsSphere));
			PhysicsSphere *pSphere = new(hSphere) PhysicsSphere(*m_pContext, m_arena, hSphere, Vector3(0, 1, 0), 1);
			pPC->m_shapes.add(hSphere);
			pPC->addComponent(hSphere);
			PhysicsManager::Instance()->addPhysCompToList(hPC);


			// This section of the code is for attaching wheels to wheechair
			Vector3 frontWheelRight = Vector3(0.9f, 0.2, 1.3f);
			Vector3 frontWheelLeft = Vector3(-0.9f, 0.2, 1.3f);
			Vector3 backWheelRight = Vector3(0.0f, 0.2, -1.45f);
			Vector3 backWheelLeft = Vector3(-0.0f, 0.2, -1.4f);



			// front wheel right
			PE::Handle hfwrMeshInstance("MeshInstance", sizeof(MeshInstance));
			MeshInstance *pfwrMeshInstance = new(hfwrMeshInstance) MeshInstance(*m_pContext, m_arena, hfwrMeshInstance);
			pfwrMeshInstance->addDefaultComponents();
			pfwrMeshInstance->initFromFile("Wheel_FR.mesha", "Lamborfrwheel", threadOwnershipMask);

			PE::Handle hfwrSN("SCENE_NODE", sizeof(SceneNode));
			SceneNode *pfwrSN = new(hfwrSN) SceneNode(*m_pContext, m_arena, hfwrSN);
			pfwrSN->addDefaultComponents();
			pfwrSN->m_base.setPos(frontWheelRight);
			pfwrSN->addComponent(hfwrMeshInstance);


			// front wheel left
			PE::Handle hfwlMeshInstance("MeshInstance", sizeof(MeshInstance));
			MeshInstance *pfwlMeshInstance = new(hfwlMeshInstance) MeshInstance(*m_pContext, m_arena, hfwlMeshInstance);

			pfwlMeshInstance->addDefaultComponents();
			pfwlMeshInstance->initFromFile("Wheel_FL.mesha", "Lamborflwheel", threadOwnershipMask);

			PE::Handle hfwlSN("SCENE_NODE", sizeof(SceneNode));
			SceneNode *pfwlSN = new(hfwlSN) SceneNode(*m_pContext, m_arena, hfwlSN);
			pfwlSN->addDefaultComponents();

			pfwlSN->m_base.setPos(frontWheelLeft);
			pfwlSN->addComponent(hfwlMeshInstance);



			//back wheel right

			PE::Handle hbwrMeshInstance("MeshInstance", sizeof(MeshInstance));
			MeshInstance *pbwrMeshInstance = new(hbwrMeshInstance) MeshInstance(*m_pContext, m_arena, hbwrMeshInstance);

			pbwrMeshInstance->addDefaultComponents();
			pbwrMeshInstance->initFromFile("Wheel_RR.mesha", "Lamborbkwheel", threadOwnershipMask);

			PE::Handle hbwrSN("SCENE_NODE", sizeof(SceneNode));
			SceneNode *pbwrSN = new(hbwrSN) SceneNode(*m_pContext, m_arena, hbwrSN);
			pbwrSN->addDefaultComponents();

			pbwrSN->m_base.setPos(backWheelRight);
			pbwrSN->addComponent(hbwrMeshInstance);


			//back wheel left

			PE::Handle hbwlMeshInstance("MeshInstance", sizeof(MeshInstance));
			MeshInstance *pbwlMeshInstance = new(hbwlMeshInstance) MeshInstance(*m_pContext, m_arena, hbwlMeshInstance);

			pbwlMeshInstance->addDefaultComponents();
			pbwlMeshInstance->initFromFile("Wheel_RL.mesha", "Lamborbkwheel", threadOwnershipMask);

			PE::Handle hbwlSN("SCENE_NODE", sizeof(SceneNode));
			SceneNode *pbwlSN = new(hbwlSN) SceneNode(*m_pContext, m_arena, hbwlSN);
			pbwlSN->addDefaultComponents();

			pbwlSN->m_base.setPos(backWheelLeft);
			pbwlSN->addComponent(hbwlMeshInstance);

			PE::Handle hglassMeshInstance("MeshInstance", sizeof(MeshInstance));
			MeshInstance *pglassMeshInstance = new(hglassMeshInstance) MeshInstance(*m_pContext, m_arena, hglassMeshInstance);

			pglassMeshInstance->addDefaultComponents();
			pglassMeshInstance->initFromFile("Glass.mesha", "Lambor", threadOwnershipMask);

			PE::Handle hglassSN("SCENE_NODE", sizeof(SceneNode));
			SceneNode *pglassSN = new(hglassSN) SceneNode(*m_pContext, m_arena, hglassSN);
			pglassSN->addDefaultComponents();

			pglassSN->m_base.setPos(pSN->m_base.getPos());
			pglassSN->addComponent(hglassMeshInstance);



			pSN->addComponent(pfwlSN);
			pSN->addComponent(pfwrSN);
			pSN->addComponent(pbwlSN);
			pSN->addComponent(pbwrSN);
			pSN->addComponent(pglassSN);

			//**************************************

			// now add game objects

			PE::Handle hTankController("TankController", sizeof(TankController));
			int numCheckpointsToWin = 13;
			TankController *pTankController = new(hTankController) TankController(*m_pContext, m_arena, hTankController, 0.05f, spawnPos, spawnRot, numCheckpointsToWin, 0.05f);
			pTankController->addDefaultComponents();

			addComponent(hTankController);

			// add the same scene node to tank controller
			static int alllowedEventsToPropagate[] = { 0,1,2 }; // we will pass empty array as allowed events to propagate so that when we add
																// scene node to the square controller, the square controller doesnt try to handle scene node's events
																// because scene node handles events through scene graph, and is child of square controller just for referencing purposes


			pTankController->addComponent(hSN, &alllowedEventsToPropagate[0]);



			// dario todo: edit
			StringOps::writeToString("0", pTankController->m_nextCheckpointName, 32);
			StringOps::writeToString("0", pTankController->m_currCheckpointName, 32);
		}

		void ClientGameObjectManagerAddon::createSpaceShip(int &threadOwnershipMask)
		{

			//create hierarchy:
			//scene root
			//  scene node // tracks position/orientation
			//    SpaceShip

			//game object manager
			//  SpaceShipController
			//    scene node

			PE::Handle hMeshInstance("MeshInstance", sizeof(MeshInstance));
			MeshInstance *pMeshInstance = new(hMeshInstance) MeshInstance(*m_pContext, m_arena, hMeshInstance);

			pMeshInstance->addDefaultComponents();
			pMeshInstance->initFromFile("space_frigate_6.mesha", "FregateTest", threadOwnershipMask);

			// need to create a scene node for this mesh
			PE::Handle hSN("SCENE_NODE", sizeof(SceneNode));
			SceneNode *pSN = new(hSN) SceneNode(*m_pContext, m_arena, hSN);
			pSN->addDefaultComponents();

			Vector3 spawnPos(0, 0, 0.0f);
			pSN->m_base.setPos(spawnPos);

			pSN->addComponent(hMeshInstance);

			RootSceneNode::Instance()->addComponent(hSN);

			// now add game objects

			PE::Handle hSpaceShip("ClientSpaceShip", sizeof(ClientSpaceShip));
			ClientSpaceShip *pSpaceShip = new(hSpaceShip) ClientSpaceShip(*m_pContext, m_arena, hSpaceShip, 0.05f, spawnPos, 0.05f);
			pSpaceShip->addDefaultComponents();

			addComponent(hSpaceShip);

			// add the same scene node to tank controller
			static int alllowedEventsToPropagate[] = { 0 }; // we will pass empty array as allowed events to propagate so that when we add
															// scene node to the square controller, the square controller doesnt try to handle scene node's events
															// because scene node handles events through scene graph, and is child of space ship just for referencing purposes
			pSpaceShip->addComponent(hSN, &alllowedEventsToPropagate[0]);

			pSpaceShip->activate();
		}


		void ClientGameObjectManagerAddon::do_SERVER_CLIENT_CONNECTION_ACK(PE::Events::Event *pEvt)
		{
			assert(pEvt->isInstanceOf<Event_SERVER_CLIENT_CONNECTION_ACK>());
			//m_pContext->getLuaEnvironment()->runString("LevelLoader.loadLevel('ccontrollvl0.x_level.levela', 'CharacterControl')");
			m_pContext->getLuaEnvironment()->runString("LevelLoader.loadLevel('racetrack.x_level.levela', 'Racetrack')");

			//Event_SERVER_CLIENT_CONNECTION_ACK *pRealEvt = (Event_SERVER_CLIENT_CONNECTION_ACK *)(pEvt);
		}

		void ClientGameObjectManagerAddon::do_LevelLoading_Done(PE::Events::Event *pEvt)
		{
			assert(pEvt->isInstanceOf<Event_LevelLoading_Done_Server>());

			Event_LevelLoading_Done_Server *pRealEvt = (Event_LevelLoading_Done_Server *)(pEvt);

			PE::Handle *pHC = m_components.getFirstPtr();

			int itc = 0;
			for (PrimitiveTypes::UInt32 i = 0; i < m_components.m_size; i++, pHC++) // fast array traversal (increasing ptr)
			{
				Component *pC = (*pHC).getObject<Component>();

				if (pC->isInstanceOf<TankController>())
				{
					TankController *pTK = (TankController *)(pC);

					pTK->m_pTankRep->m_bitmask ^= 0b10000000;

					ClientNetworkManager *pNetworkManager = (ClientNetworkManager *)(m_pContext->getNetworkManager());
					pNetworkManager->getNetworkContext().getGhostManager()->registerToGhostingMap(itc, pTK->m_pTankRep);

					pNetworkManager->getNetworkContext().getGhostManager()->prepareGhost(pTK->m_pTankRep);

					if (itc == pRealEvt->m_clientTankId) //activate tank controller for local client based on local clients id
					{
						if (pRealEvt->m_activate)
							pTK->activate();
						pTK->m_isWaiting = !pRealEvt->m_activate;
					}
					++itc;
				}
			}
		}

		void ClientGameObjectManagerAddon::do_MoveTank(PE::Events::Event *pEvt)
		{
			assert(pEvt->isInstanceOf<Event_MoveTank_S_to_C>());

			Event_MoveTank_S_to_C *pTrueEvent = (Event_MoveTank_S_to_C*)(pEvt);

			PE::Handle *pHC = m_components.getFirstPtr();

			int itc = 0;
			for (PrimitiveTypes::UInt32 i = 0; i < m_components.m_size; i++, pHC++) // fast array traversal (increasing ptr)
			{
				Component *pC = (*pHC).getObject<Component>();

				if (pC->isInstanceOf<TankController>())
				{
					if (itc == pTrueEvent->m_clientTankId) //activate tank controller for local client based on local clients id
					{
						TankController *pTK = (TankController *)(pC);
						pTK->overrideTransform(pTrueEvent->m_transform);
						break;
					}
					++itc;
				}
			}
		}

		void ClientGameObjectManagerAddon::do_SomeoneWon(PE::Events::Event *pEvt)
		{
			assert(pEvt->isInstanceOf<Event_SomeoneWon_S_to_C>());

			Event_SomeoneWon_S_to_C *pTrueEvent = (Event_SomeoneWon_S_to_C*)(pEvt);

			PE::Handle *pHC = m_components.getFirstPtr();

			int itc = 0;
			for (PrimitiveTypes::UInt32 i = 0; i < m_components.m_size; i++, pHC++) // fast array traversal (increasing ptr)
			{
				Component *pC = (*pHC).getObject<Component>();

				if (pC->isInstanceOf<TankController>())
				{
					if (itc != pTrueEvent->m_clientTankId) //reset everyone except the winner (coz he is already resetting on his own)
					{
						TankController *pTK = (TankController *)(pC);
						pTK->m_isResetting = true;
					}
					++itc;
				}
			}
		}

	}
}

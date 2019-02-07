#include "PrimeEngine/APIAbstraction/APIAbstractionDefines.h"

// Inter-Engine includes
#include "PrimeEngine/Lua/LuaEnvironment.h"
#include "PrimeEngine/Events/StandardEvents.h"
#include "PrimeEngine/Scene/Mesh.h"
#include "PrimeEngine/Scene/SceneNode.h"
#include "PrimeEngine/Sound/SoundManager.h"
#include "PrimeEngine/Networking/EventManager.h"
#include "PrimeEngine/Networking/GhostManager.h"
#include "PrimeEngine/Networking/StreamManager.h"
#include "PrimeEngine/Networking/Client/ClientNetworkManager.h"
#include "CharacterControl/Events/Events.h"
#include "PrimeEngine/GameObjectModel/GameObjectManager.h"
#include "PrimeEngine/Events/StandardKeyboardEvents.h"
#include "PrimeEngine/Events/StandardIOSEvents.h"
#include "PrimeEngine/Events/StandardGameEvents.h"
#include "PrimeEngine/Events/EventQueueManager.h"
#include "PrimeEngine/Events/StandardControllerEvents.h"
#include "PrimeEngine/GameObjectModel/DefaultGameControls/DefaultGameControls.h"
#include "CharacterControl/CharacterControlContext.h"

#include "ClientTank.h"
#include "CharacterControl/ClientGameObjectManagerAddon.h"
#include "CharacterControl/Client/ClientSpaceShipControls.h"
#include "CharacterControl/TriggerVolumes/Banana.h"
//dario todo: remove
#include "PrimeEngine/Scene/DebugRenderer.h"

using namespace PE::Components;
using namespace PE::Events;
using namespace CharacterControl::Events;

// Arkane Control Values
#define Analog_To_Digital_Trigger_Distance 0.5f
static float Debug_Fly_Speed = 8.0f; //Units per second
#define Debug_Rotate_Speed 2.0f //Radians per second
#define Player_Keyboard_Rotate_Speed 20.0f //Radians per second

//float vehicleSpeed = 0.0f;

static float minSpeed = -1;
static float acceleration = 0.6;
static float deceleration = 0.5;
static float accelerationBack = 0.25;
static float turnRate = 1.5f;
namespace CharacterControl {
namespace Components {

	


PE_IMPLEMENT_CLASS1(TankGameControls, PE::Components::Component);

void TankGameControls::addDefaultComponents()
{
	Component::addDefaultComponents();

	PE_REGISTER_EVENT_HANDLER(Event_UPDATE, TankGameControls::do_UPDATE);
}

void TankGameControls::do_UPDATE(PE::Events::Event *pEvt)
{
	// Process input events (controller buttons, triggers...)
	PE::Handle iqh = PE::Events::EventQueueManager::Instance()->getEventQueueHandle("input");
	
	// Process input event -> game event conversion
	while (!iqh.getObject<PE::Events::EventQueue>()->empty())
	{
		PE::Events::Event *pInputEvt = iqh.getObject<PE::Events::EventQueue>()->getFront();
		m_frameTime = ((Event_UPDATE*)(pEvt))->m_frameTime;
		// Have DefaultGameControls translate the input event to GameEvents
		handleKeyboardDebugInputEvents(pInputEvt);
		handleControllerDebugInputEvents(pInputEvt);
        handleIOSDebugInputEvents(pInputEvt);
		
		iqh.getObject<PE::Events::EventQueue>()->destroyFront();
	}

	// Events are destoryed by destroyFront() but this is called every frame just in case
	iqh.getObject<PE::Events::EventQueue>()->destroy();
}
    
void TankGameControls::handleIOSDebugInputEvents(Event *pEvt)
{
    #if APIABSTRACTION_IOS
    m_pQueueManager = PE::Events::EventQueueManager::Instance();
    if (Event_IOS_TOUCH_MOVED::GetClassId() == pEvt->getClassId())
    {
        Event_IOS_TOUCH_MOVED *pRealEvent = (Event_IOS_TOUCH_MOVED *)(pEvt);
        
        if(pRealEvent->touchesCount > 1)
        {
            PE::Handle h("EVENT", sizeof(Events::Event_Tank_Throttle));
            Events::Event_Tank_Throttle *flyCameraEvt = new(h) Events::Event_Tank_Throttle ;
                
            Vector3 relativeMovement(0.0f,0.0f,-30.0f * pRealEvent->m_normalized_dy);
            flyCameraEvt->m_relativeMove = relativeMovement * Debug_Fly_Speed * m_frameTime;
            m_pQueueManager->add(h, QT_GENERAL);
        }
        else
        {
            PE::Handle h("EVENT", sizeof(Event_Tank_Turn));
            Event_Tank_Turn *rotateCameraEvt = new(h) Event_Tank_Turn ;
            
            Vector3 relativeRotate(pRealEvent->m_normalized_dx * 10,0.0f,0.0f);
            rotateCameraEvt->m_relativeRotate = relativeRotate * Debug_Rotate_Speed * m_frameTime;
            m_pQueueManager->add(h, QT_GENERAL);
        }
    }
    #endif
}

void TankGameControls::handleKeyboardDebugInputEvents(Event *pEvt)
{
	m_pQueueManager = PE::Events::EventQueueManager::Instance();
	if (PE::Events::Event_KEY_A_HELD::GetClassId() == pEvt->getClassId())
	{
		PE::Handle h("EVENT", sizeof(Event_Tank_Turn));
		Event_Tank_Turn *rotateCameraEvt = new(h) Event_Tank_Turn;

		Vector3 relativeRotate(-1.0f, 0.0f, 0.0f);
		rotateCameraEvt->m_relativeRotate = relativeRotate * m_frameTime;// Debug_Rotate_Speed * m_frameTime;
		m_pQueueManager->add(h, QT_GENERAL);
	}
	else if (Event_KEY_D_HELD::GetClassId() == pEvt->getClassId())
	{
		PE::Handle h("EVENT", sizeof(Event_Tank_Turn));
		Event_Tank_Turn *rotateCameraEvt = new(h) Event_Tank_Turn;

		Vector3 relativeRotate(1.0f, 0.0f, 0.0f);
		rotateCameraEvt->m_relativeRotate = relativeRotate * m_frameTime;// *Debug_Rotate_Speed * m_frameTime;
		m_pQueueManager->add(h, QT_GENERAL);
	}

	if (Event_KEY_S_HELD::GetClassId() == pEvt->getClassId())
	{
		//PE::Handle h("EVENT", sizeof(Events::Event_Tank_Throttle));
		//Events::Event_Tank_Throttle *flyCameraEvt = new(h) Events::Event_Tank_Throttle;

		//Vector3 relativeMovement(0.0f, 0.0f, -1.0f);
		//flyCameraEvt->m_relativeMove = relativeMovement * Debug_Fly_Speed * m_frameTime;
		//m_pQueueManager->add(h, QT_GENERAL);
		//PEINFO("Speed before S event is: %f", vehicleSpeed);
		//if (vehicleSpeed > minSpeed)
		//	vehicleSpeed -= accelerationBack;
		//PEINFO("Speed after S event is: %f", vehicleSpeed);

		PE::Handle h("EVENT", sizeof(Events::Event_Tank_Throttle));
		Events::Event_Tank_Throttle *flyCameraEvt = new(h) Events::Event_Tank_Throttle;

		Vector3 relativeMovement(0.0f, 0.0f, -1.0f);
		flyCameraEvt->m_relativeMove = relativeMovement * m_frameTime;// *Debug_Fly_Speed * m_frameTime;
		m_pQueueManager->add(h, QT_GENERAL);
	}
	else if (Event_KEY_W_HELD::GetClassId() == pEvt->getClassId())
	{
		//PE::Handle h("EVENT", sizeof(Events::Event_Tank_Throttle));
		//Events::Event_Tank_Throttle *flyCameraEvt = new(h) Events::Event_Tank_Throttle ;
		//Vector3 relativeMovement(0.0f,0.0f,vehicleSpeed);
		//flyCameraEvt->m_relativeMove = relativeMovement * vehicleSpeed *  m_frameTime;
		//m_pQueueManager->add(h, QT_GENERAL);

		//PEINFO("Speed before W event is: %f", vehicleSpeed);
		//if (vehicleSpeed < maxSpeed)
		//	vehicleSpeed += acceleration;
		//PEINFO("Speed after W event is: %f", vehicleSpeed);

		PE::Handle h("EVENT", sizeof(Events::Event_Tank_Throttle));
		Events::Event_Tank_Throttle *flyCameraEvt = new(h) Events::Event_Tank_Throttle;

		Vector3 relativeMovement(0.0f, 0.0f, 1.0f);
		flyCameraEvt->m_relativeMove = relativeMovement * m_frameTime;// Debug_Fly_Speed * m_frameTime;
		m_pQueueManager->add(h, QT_GENERAL);
	}

	if (Event_LMOUSE_CLICKED::GetClassId() == pEvt->getClassId()) 
	{
		PE::Handle h("EVENT", sizeof(Events::Event_Tank_Throttle));
		Events::Event_Tank_Throttle *flyCameraEvt = new(h) Events::Event_Tank_Throttle;

		Vector3 relativeMovement(0.0f, 5.0f, 0.0f);
		flyCameraEvt->m_relativeMove = relativeMovement * m_frameTime;// Debug_Fly_Speed * m_frameTime;
		m_pQueueManager->add(h, QT_GENERAL);
	}

	
	/*
	else if (Event_KEY_LEFT_HELD::GetClassId() == pEvt->getClassId())
	{
		PE::Handle h("EVENT", sizeof(Event_Tank_Turn));
		Event_Tank_Turn *rotateCameraEvt = new(h) Event_Tank_Turn ;
		
		Vector3 relativeRotate(-1.0f,0.0f,0.0f);
		rotateCameraEvt->m_relativeRotate = relativeRotate * Debug_Rotate_Speed * m_frameTime;
		m_pQueueManager->add(h, QT_GENERAL);
	}
	else if (Event_KEY_RIGHT_HELD::GetClassId() == pEvt->getClassId())
	{
		PE::Handle h("EVENT", sizeof(Event_Tank_Turn));
		Event_Tank_Turn *rotateCameraEvt = new(h) Event_Tank_Turn ;

		Vector3 relativeRotate(1.0f,0.0f,0.0f);
		rotateCameraEvt->m_relativeRotate = relativeRotate * Debug_Rotate_Speed * m_frameTime;
		m_pQueueManager->add(h, QT_GENERAL);
	}
	*/
	
	/*
	else if (Event_KEY_DOWN_HELD::GetClassId() == pEvt->getClassId())
	{
		PE::Handle h("EVENT", sizeof(Event_ROTATE_CAMERA));
		Event_ROTATE_CAMERA *rotateCameraEvt = new(h) Event_ROTATE_CAMERA ;
		
		Vector3 relativeRotate(0.0f,-1.0f,0.0f);
		rotateCameraEvt->m_relativeRotate = relativeRotate * Debug_Rotate_Speed * m_frameTime;
		m_pQueueManager->add(h, QT_GENERAL);
	}
	else if (Event_KEY_UP_HELD::GetClassId() == pEvt->getClassId())
	{
		PE::Handle h("EVENT", sizeof(Event_ROTATE_CAMERA));
		Event_ROTATE_CAMERA *rotateCameraEvt = new(h) Event_ROTATE_CAMERA ;
		
		Vector3 relativeRotate(0.0f,1.0f,0.0f);
		rotateCameraEvt->m_relativeRotate = relativeRotate * Debug_Rotate_Speed * m_frameTime;
		m_pQueueManager->add(h, QT_GENERAL);
	}
	*/
	else
	{
		Component::handleEvent(pEvt);
	}
}

void TankGameControls::handleControllerDebugInputEvents(Event *pEvt)
{
	
	if (Event_ANALOG_L_THUMB_MOVE::GetClassId() == pEvt->getClassId())
	{
		Event_ANALOG_L_THUMB_MOVE *pRealEvent = (Event_ANALOG_L_THUMB_MOVE*)(pEvt);
		
		//throttle
		{
			PE::Handle h("EVENT", sizeof(Events::Event_Tank_Throttle));
			Events::Event_Tank_Throttle *flyCameraEvt = new(h) Events::Event_Tank_Throttle ;

			Vector3 relativeMovement(0.0f,0.0f, pRealEvent->m_absPosition.getY());
			flyCameraEvt->m_relativeMove = relativeMovement * Debug_Fly_Speed * m_frameTime;
			m_pQueueManager->add(h, QT_GENERAL);
		}

		//turn
		{
			PE::Handle h("EVENT", sizeof(Event_Tank_Turn));
			Event_Tank_Turn *rotateCameraEvt = new(h) Event_Tank_Turn ;

			Vector3 relativeRotate(pRealEvent->m_absPosition.getX(), 0.0f, 0.0f);
			rotateCameraEvt->m_relativeRotate = relativeRotate * Debug_Rotate_Speed * m_frameTime;
			m_pQueueManager->add(h, QT_GENERAL);
		}
	}
	/*
	else if (Event_ANALOG_R_THUMB_MOVE::GetClassId() == pEvt->getClassId())
	{
		Event_ANALOG_R_THUMB_MOVE *pRealEvent = (Event_ANALOG_R_THUMB_MOVE *)(pEvt);
		
		PE::Handle h("EVENT", sizeof(Event_ROTATE_CAMERA));
		Event_ROTATE_CAMERA *rotateCameraEvt = new(h) Event_ROTATE_CAMERA ;
		
		Vector3 relativeRotate(pRealEvent->m_absPosition.getX(), pRealEvent->m_absPosition.getY(), 0.0f);
		rotateCameraEvt->m_relativeRotate = relativeRotate * Debug_Rotate_Speed * m_frameTime;
		m_pQueueManager->add(h, QT_GENERAL);
	}
	else if (Event_PAD_N_DOWN::GetClassId() == pEvt->getClassId())
	{
	}
	else if (Event_PAD_N_HELD::GetClassId() == pEvt->getClassId())
	{
		
	}
	else if (Event_PAD_N_UP::GetClassId() == pEvt->getClassId())
	{
		
	}
	else if (Event_PAD_S_DOWN::GetClassId() == pEvt->getClassId())
	{
		
	}
	else if (Event_PAD_S_HELD::GetClassId() == pEvt->getClassId())
	{
		
	}
	else if (Event_PAD_S_UP::GetClassId() == pEvt->getClassId())
	{
		
	}
	else if (Event_PAD_W_DOWN::GetClassId() == pEvt->getClassId())
	{
		
	}
	else if (Event_PAD_W_HELD::GetClassId() == pEvt->getClassId())
	{
		
	}
	else if (Event_PAD_W_UP::GetClassId() == pEvt->getClassId())
	{
		
	}
	else if (Event_PAD_E_DOWN::GetClassId() == pEvt->getClassId())
	{
		
	}
	else if (Event_PAD_E_HELD::GetClassId() == pEvt->getClassId())
	{
		
	}
	else if (Event_PAD_E_UP::GetClassId() == pEvt->getClassId())
	{
		
	}
	else if (Event_BUTTON_A_HELD::GetClassId() == pEvt->getClassId())
	{
		
	}
	else if (Event_BUTTON_Y_DOWN::GetClassId() == pEvt->getClassId())
	{
		
	}
	else if (Event_BUTTON_A_UP::GetClassId() == pEvt->getClassId())
	{
		
	}
	else if (Event_BUTTON_B_UP::GetClassId() == pEvt->getClassId())
	{
		
	}
	else if (Event_BUTTON_X_UP::GetClassId() == pEvt->getClassId())
	{
		
	}
	else if (Event_BUTTON_Y_UP::GetClassId() == pEvt->getClassId())
	{
		
	}
	else if (Event_ANALOG_L_TRIGGER_MOVE::GetClassId() == pEvt->getClassId())
	{
		
	}
	else if (Event_ANALOG_R_TRIGGER_MOVE::GetClassId() == pEvt->getClassId())
	{
		
	}
	else if (Event_BUTTON_L_SHOULDER_DOWN::GetClassId() == pEvt->getClassId())
	{
		
	}
	else
	*/
	{
		Component::handleEvent(pEvt);
	}
}

PE_IMPLEMENT_CLASS1(TankController, Component);
    
TankController::TankController(PE::GameContext &context, PE::MemoryArena arena,
	PE::Handle myHandle, float speed, Vector3 spawnPos, Quaternion spawnRot, int numCheckpointsToWin,
	float networkPingInterval)
: Component(context, arena, myHandle)
, m_timeSpeed(speed)
, m_time(0)
, m_resetTimer(5.f), m_beginTimer(3.f)
, m_counter(0)
, m_active(0)
, m_networkPingTimer(0)
, m_networkPingInterval(networkPingInterval)
, m_numCheckpointsToWin(numCheckpointsToWin)
, m_numCheckpointsRemaining(numCheckpointsToWin)
, m_overriden(false)
, m_isResetting(false), m_isBeginning(false)
{
	m_spawnPos = spawnPos;

	
	m_currSpeed = 0;
	m_maxSpeed = maxSpeed;
	m_minSpeed = minSpeed;
	m_acceleration = acceleration;
	m_deceleration = deceleration;
	m_accelerationBack = accelerationBack;
	m_turnRate = turnRate;

	PE::Handle hTankRep("TankRep", sizeof(TankRep));
	m_pTankRep = new(hTankRep) TankRep(*m_pContext, m_arena, hTankRep);

	static int numtanks = 0;
	m_pTankRep->m_ghostId = numtanks;

	m_pTankRep->m_position = spawnPos;
	m_pTankRep->m_rotation = spawnRot;

	numtanks++;
}
    
void TankController::addDefaultComponents()
{
    Component::addDefaultComponents();
     
    PE_REGISTER_EVENT_HANDLER(PE::Events::Event_UPDATE, TankController::do_UPDATE);

	//dario todo: remove
	PE_REGISTER_EVENT_HANDLER(Event_PRE_RENDER_needsRC, TankController::do_PRE_RENDER_needsRC);

	// note: these event handlers will be registered only when one tank is activated as client tank (i.e. driven by client input on this machine)
// 	PE_REGISTER_EVENT_HANDLER(Event_Tank_Throttle, TankController::do_Tank_Throttle);
// 	PE_REGISTER_EVENT_HANDLER(Event_Tank_Turn, TankController::do_Tank_Turn);
}

void TankController::do_Tank_Throttle(PE::Events::Event *pEvt)
{
	if (m_isResetting) return;
	if (!m_isPlayingSound) {
		PE::Components::SoundManager::Instance()->PlayMusic("Code/Audio/acc.wav", 3, 128, true);
		m_isPlayingSound = true;
	}
	if (m_rotation > -5) {
		m_rotation -= 0.015;
	}
	

	Event_Tank_Throttle *pRealEvent = (Event_Tank_Throttle *)(pEvt);

	PE::Handle hFisrtSN = getFirstComponentHandle<SceneNode>();
	if (!hFisrtSN.isValid())
	{
		assert(!"wrong setup. must have scene node referenced");
		return;
	}

	SceneNode *pFirstSN = hFisrtSN.getObject<SceneNode>();
	float toadd = pRealEvent->m_relativeMove.getZ();
	if (toadd > 0)
	{
		m_currSpeed += toadd * m_acceleration;
		if (m_currSpeed > m_maxSpeed)
		{
			m_currSpeed = m_maxSpeed;
		}
	}
	else if (toadd < 0)
	{
		m_currSpeed += toadd * m_accelerationBack;
		if (m_currSpeed < m_minSpeed)
		{
			m_currSpeed = m_minSpeed;
		}
	}
	pFirstSN->m_base.moveUp(pRealEvent->m_relativeMove.getY() * 8);
	
	/*pFirstSN->m_base.moveForward(pRealEvent->m_relativeMove.getZ());
	pFirstSN->m_base.moveRight(pRealEvent->m_relativeMove.getX());
	pFirstSN->m_base.moveUp(pRealEvent->m_relativeMove.getY());*/
}

void TankController::do_Tank_Turn(PE::Events::Event *pEvt)
{

	if (m_isResetting) return;
	

	Event_Tank_Turn *pRealEvent = (Event_Tank_Turn *)(pEvt);

	PE::Handle hFisrtSN = getFirstComponentHandle<SceneNode>();
	if (!hFisrtSN.isValid())
	{
		assert(!"wrong setup. must have scene node referenced");
		return;
	}

	SceneNode *pFirstSN = hFisrtSN.getObject<SceneNode>();
	if (m_currSpeed != 0) {
		if (!m_isDrifting) {
			PE::Components::SoundManager::Instance()->PlayMusic("Code/Audio/drift.wav", 4, 80, true);
			m_isDrifting = true;
		}
		int t = maxSpeed / m_currSpeed;
		m_Angle = -pRealEvent->m_relativeRotate.getX() * m_turnRate * m_currSpeed * t;
		pFirstSN->m_base.turnLeft(m_Angle);
	}
	
	m_pTankRep->m_rotation = pFirstSN->m_base.createQuat();
	m_pTankRep->m_bitmask ^= StateMasks::Rotation;
}

void TankController::do_OutOfBounds(PE::Events::Event *pEvt)
{
	Event_OutOfBounds *pRealEvent = (Event_OutOfBounds*)pEvt;

	PE::Handle hFisrtSN = getFirstComponentHandle<SceneNode>();
	if (!hFisrtSN.isValid())
	{
		assert(!"wrong setup. must have scene node referenced");
		return;
	}

	SceneNode *pFirstSN = hFisrtSN.getObject<SceneNode>();
	/*if (dropBanana) {
		dropBanana = false;
		pFirstSN->m_base.setPos(lastPostion);
		return;
	}*/
	ClientGameObjectManagerAddon *pGOMAddon = (ClientGameObjectManagerAddon *)(m_pContext->get<CharacterControlContext>()->getGameObjectManagerAddon());
	pFirstSN->m_base.setPos(pGOMAddon->getLastCheckpointPosition(m_currCheckpointName));

	m_currSpeed = 0;

	pFirstSN->getFirstComponent<PhysicsComponent>()->m_fallspeed = 0;
}

void TankController::do_CheckpointReached(PE::Events::Event *pEvt)
{
	Event_CheckpointReached *pRealEvt = (Event_CheckpointReached *)(pEvt);
	ClientGameObjectManagerAddon *pGOMAddon = (ClientGameObjectManagerAddon *)(m_pContext->get<CharacterControlContext>()->getGameObjectManagerAddon());

	// check if you went to the right checkpoint
	if (StringOps::strcmp(pRealEvt->m_checkpointName, m_nextCheckpointName) == 0)
	{
		StringOps::writeToString(pRealEvt->m_checkpointName, m_currCheckpointName, 32);
		StringOps::writeToString(pRealEvt->m_nextCheckpoint, m_nextCheckpointName, 32);

		if (--m_numCheckpointsRemaining == 0)
		{
			PEINFO("SHOULD SEND AN EVENT TO EVERYONE THAT WE HAVE A WINNER");

			CharacterControl::Events::Event_SomeoneWon_C_to_S evt(*m_pContext);

			ClientNetworkManager *pNetworkManager = (ClientNetworkManager *)(m_pContext->getNetworkManager());
			pNetworkManager->getNetworkContext().getEventManager()->scheduleEvent(&evt, m_pContext->getGameObjectManager(), true);

			m_isResetting = true;

			//dario todo: remove
			m_isWinner = true;
		}
		else {
			PE::Handle *pHC = RootSceneNode::Instance()->getComponents().getFirstPtr();
			for (PrimitiveTypes::UInt32 i = 0; i < RootSceneNode::Instance()->getComponents().m_size; i++, pHC++) // fast array traversal (increasing ptr)
			{
				Component *pC = (*pHC).getObject<Component>();

				if (pC->isInstanceOf<ParticleEmitter>())
				{
					ParticleEmitter *pPE = (ParticleEmitter *)(pC);
					pPE->m_base.setPos(pGOMAddon->getLastCheckpointPosition(m_nextCheckpointName));

				}
			}
		}
	}
}

void TankController::do_PowerupReached(PE::Events::Event *pEvt)
{
	Event_PowerupReached *pRealEvt = (Event_PowerupReached *)(pEvt);
	if (hasPowerUp) { return; }
	hasPowerUp = true;
	powerUpIndex = rand()%2 + 1;
	PEINFO("SHOULD GIVE RANDOM POWERUP TO CLIENT");
}
void TankController::do_BananaReached(PE::Events::Event *pEvt)
{
	Event_BananaReached *pRealEvt = (Event_BananaReached *)(pEvt);
	bananaReached = true;
	PEINFO("SHOULD GIVE RANDOM Banana TO CLIENT");
}

void TankController::do_UPDATE(PE::Events::Event *pEvt)
{
	PE::Events::Event_UPDATE *pRealEvt = (PE::Events::Event_UPDATE *)(pEvt);

	
	if (m_active)
	{
		m_time += pRealEvt->m_frameTime;
		m_networkPingTimer += pRealEvt->m_frameTime;

		// slow down the tank
		//if (vehicleSpeed != 0.0f) {
		//	if (vehicleSpeed > 0.0f)
		//	{
		//		//reduce speed
		//		vehicleSpeed -= deceleration;
		//		if (vehicleSpeed < 0) vehicleSpeed = 0;
		//	}
		//	if (vehicleSpeed < 0.0f)
		//	{
		//		//reduce speed
		//		vehicleSpeed += deceleration;
		//		if (vehicleSpeed > 0) vehicleSpeed = 0;
		//	}

		//	PE::Handle hFisrtSN = getFirstComponentHandle<SceneNode>();
		//	if (!hFisrtSN.isValid())
		//	{
		//		assert(!"wrong setup. must have scene node referenced");
		//	}
		//	SceneNode *pFirstSN = hFisrtSN.getObject<SceneNode>();
		//	pFirstSN->m_base.moveForward(vehicleSpeed);
		//}
		PE::Handle hFirstSN = getFirstComponentHandle<SceneNode>();
		if (!hFirstSN.isValid())
		{
			assert(!"wrong setup. must have scene node referenced");
		}
		SceneNode *pFirstSN = hFirstSN.getObject<SceneNode>();

		SceneNode *pfwl = pFirstSN->getComponentByIndex<SceneNode>(3);
		SceneNode *pfwr = pFirstSN->getComponentByIndex<SceneNode>(4);
		SceneNode *pbwl = pFirstSN->getComponentByIndex<SceneNode>(5);
		SceneNode *pbwr = pFirstSN->getComponentByIndex<SceneNode>(6);
		if (maxSpeed == 2.0) {

			maxSpeedTimmer += pRealEvt->m_frameTime;
			if (maxSpeedTimmer >= 100.0f) {
				maxSpeedTimmer = 0.0f;
				maxSpeed = 1.0f;

			}
		}
		if (bananaReached) {
			m_spinTimer += pRealEvt->m_frameTime;
			pFirstSN->m_base.turnAboutAxis(0.3, Vector3(0, 1, 0));
			m_currSpeed = 0;
			if (m_spinTimer > 1.5f) {
				bananaReached = false;
				m_spinTimer = 0.0f;
			}

		}
		if (carViewPressed) {
			carViewTimmer += pRealEvt->m_frameTime;
			if (carViewTimmer > 1.0f) {
				carViewPressed = false;
				carViewTimmer = 0.0f;
			}
		}
		if (GetAsyncKeyState(VK_RBUTTON) & 0x8000)

		{

			if (hasPowerUp) {

				
				hasPowerUp = false;
				if (powerUpIndex == 1) {

					m_currSpeed = maxSpeed;
					m_rotation = -4;
				}
				else if (powerUpIndex == 2) {
					PE::Handle h("Banana", sizeof(Event_Create_Banana));
					Event_Create_Banana *pEvt = new(h) Event_Create_Banana(*getGameContext());
					pEvt->hasCustomOrientation = true;
					bananaPeuuid.set(0, 0, 0, bananaUid);
					bananaUid += 1;
					pEvt->m_peuuid = bananaPeuuid;

					// place the banana 3 units behind you
					pEvt->m_pos = pFirstSN->m_base.getPos() - pFirstSN->m_base.getN() * 3;

					pEvt->sendToServer(getGameContext());
				}
				powerUpIndex = 0;
				
				
			}
		}
		

		if (GetAsyncKeyState('K') && 0X8000 && !carViewPressed) {

			if (carView == 4) {
				
				cameraReturnAngle = M_PI / 4;
				carView = 1;
				
			}
			else {
				carView++;
				if (carView == 4) {
					cameraAngle = M_PI / 4;
				}
			}
			carViewPressed = true;

		}

		if (!(GetAsyncKeyState('W') && 0X8000)) {
			if (m_isPlayingSound) {
				PE::Components::SoundManager::Instance()->StopMusic(3);
				m_isPlayingSound = false;
			}
			if (m_rotation < -1) {
				m_rotation += 0.08;
			}
			
		}

		if (!(GetAsyncKeyState('A') && 0X8000) && !(GetAsyncKeyState('D') && 0X8000)) {
			if (m_isDrifting) {
				PE::Components::SoundManager::Instance()->StopMusic(4);
				m_isDrifting = false;
			}
		}

		
		if (GetAsyncKeyState('D') && 0X8000 && !(GetAsyncKeyState('A') && 0X8000))
		{
			if (wheelturnRate == 0 || wheelturnRate == 0.3 ) {
				if (wheelturnRate == 0.3) {
					pfwl->m_base.turnAboutAxis(-wheelturnRate, Vector3(0, 1, 0));
					pfwr->m_base.turnAboutAxis(-wheelturnRate, Vector3(0, 1, 0));
				}
				wheelturnRate = -0.3f;
				pfwl->m_base.turnAboutAxis(wheelturnRate, Vector3(0, 1, 0));
				pfwr->m_base.turnAboutAxis(wheelturnRate, Vector3(0, 1, 0));
			}

		}
		else if (GetAsyncKeyState('A') && 0X8000 && !(GetAsyncKeyState('D') && 0X8000))
		{
			if (wheelturnRate == 0 || wheelturnRate == -0.3) {
				
				if (wheelturnRate == -0.3) {
					pfwl->m_base.turnAboutAxis(-wheelturnRate, Vector3(0, 1, 0));
					pfwr->m_base.turnAboutAxis(-wheelturnRate, Vector3(0, 1, 0));
				}
				wheelturnRate = 0.3f;
				pfwl->m_base.turnAboutAxis(wheelturnRate, Vector3(0, 1, 0));
				pfwr->m_base.turnAboutAxis(wheelturnRate, Vector3(0, 1, 0));
			}
		}
		else
		{
			wheelturnRate = -wheelturnRate;
			pfwl->m_base.turnAboutAxis(wheelturnRate, Vector3(0, 1, 0));
			pfwr->m_base.turnAboutAxis(wheelturnRate, Vector3(0, 1, 0));
			wheelturnRate = 0.0f;
		}

		pFirstSN->m_base.moveForward(m_currSpeed);
		pfwl->m_base.turnDown(  m_currSpeed / M_PI);
		pfwr->m_base.turnDown(  m_currSpeed / M_PI);
		pbwl->m_base.turnDown(  m_currSpeed / M_PI);
		pbwr->m_base.turnDown(  m_currSpeed / M_PI);
		
		m_pTankRep->m_position = pFirstSN->m_base.getPos();
		m_pTankRep->m_bitmask ^= StateMasks::Position;

		/*m_pTankRep->m_rotation = pFirstSN->m_base.createQuat();
		m_pTankRep->m_bitmask ^= StateMasks::Rotation;*/


		m_Angle = 0;
		if (m_currSpeed > 0)
		{
			
			m_currSpeed -= m_deceleration * pRealEvt->m_frameTime;
			if (m_currSpeed < 0)
				m_currSpeed = 0;
		}
		else
		{
			
			m_currSpeed += m_deceleration * pRealEvt->m_frameTime;
			if (m_currSpeed > 0)
				m_currSpeed = 0;
		}
	}
	else
	{
		PE::Handle hFisrtSN = getFirstComponentHandle<SceneNode>();
		if (!hFisrtSN.isValid())
		{
			assert(!"wrong setup. must have scene node referenced");
			return;
		}

		SceneNode *pFirstSN = hFisrtSN.getObject<SceneNode>();
		pFirstSN->m_base.setFromQuatAndPos(m_pTankRep->m_rotation, m_pTankRep->m_position);
		m_pTankRep->m_bitmask = 0;
		pFirstSN->m_base.scaleU(.5);
		pFirstSN->m_base.scaleV(.5);
		pFirstSN->m_base.scaleN(.5);
	}

	PE::Handle hFisrtSN = getFirstComponentHandle<SceneNode>();
	if (!hFisrtSN.isValid())
	{
		assert(!"wrong setup. must have scene node referenced");
		return;
	}

	SceneNode *pFirstSN = hFisrtSN.getObject<SceneNode>();

	/*static float x = pFirstSN->m_base.getPos().getX();
	static float y = pFirstSN->m_base.getPos().getY();
	static float z = pFirstSN->m_base.getPos().getZ();*/
	static float x = 0.0f;
	static float y = 3.0f;
	static float z = -4.0f;


	// note we could have stored the camera reference in this object instead of searching for camera scene node
	if (CameraSceneNode *pCamSN = pFirstSN->getFirstComponent<CameraSceneNode>())
	{
		if (carView == 1) {
			pCamSN->m_base.setPos(Vector3(0, 3, -8));
			pCamSN->m_base.turnLeft(cameraReturnAngle);
			cameraReturnAngle = 0.0f;
		}
		else if (carView == 2) {
			pCamSN->m_base.setPos(Vector3(0, 3, -4));
			
		}
		else if (carView == 3) {
			pCamSN->m_base.setPos(Vector3(0, 1.0f, 0.1f));

		}
		else {
			pCamSN->m_base.setPos(Vector3(-5, 3.0f, -4.0f));
			pCamSN->m_base.turnRight(cameraAngle);
			cameraAngle = 0.0f;


		}
	}


	if (!m_overriden)//!m_pTankRep->m_bitmask == 0)
	{
		/*
		if (m_time > 2.0f*PrimitiveTypes::Constants::c_Pi_F32)
		{
			m_time = 0;
			if (m_counter)
			{
				m_counter = 0;
				m_center = Vector2(0,0);
			}
			else
			{
				m_counter = 1;
				m_center = Vector2(10.0f, 0);
			}
		}
	    
		Vector3 pos = Vector3(m_center.m_x, 0, m_center.m_y);
		pos.m_x += (float)cos(m_time) * 5.0f * (m_counter ? -1.0f : 1.0f);
		pos.m_z += (float)sin(m_time) * 5.0f;
		pos.m_y = 0;
	    
		Vector3 fwrd;
		fwrd.m_x = -(float)sin(m_time)  * (m_counter ? -1.0f : 1.0f);
		fwrd.m_z = (float)cos(m_time);
		fwrd.m_y = 0;
	    
		Vector3 right;
		right.m_x = (float)cos(m_time) * (m_counter ? -1.0f : 1.0f) * (m_counter ? -1.0f : 1.0f);
		right.m_z = (float)sin(m_time) * (m_counter ? -1.0f : 1.0f);
		right.m_y = 0;
	   
        
		pFirstSN->m_base.setPos(m_spawnPos + pos);
		pFirstSN->m_base.setN(fwrd);
		pFirstSN->m_base.setU(right);
		*/
	}
	else
	{
		pFirstSN->m_base = m_transformOverride;
		//pFirstSN->m_base.setFromQuatAndPos(m_pTankRep->m_rotation, m_pTankRep->m_position);
	}
    
	if (m_isResetting)
	{
		m_resetTimer -= pRealEvt->m_frameTime;
		if(!m_isWinner)
			m_currSpeed = 0;
		if (m_resetTimer < 0)
		{
			reset();
		}
	}

	if (m_isBeginning)
	{
		m_beginTimer -= pRealEvt->m_frameTime;
		if (m_beginTimer < 0)
		{
			m_pContext->get<CharacterControlContext>()->getTankGameControls()->setEnabled(true);
		}
		if (m_beginTimer < -1)
		{
			// put here because we want one more second of showing green light
			m_isBeginning = false;
			m_beginTimer = 3.f;
		}
	}

	if (m_networkPingTimer > m_networkPingInterval)
	{
		// send client authoritative position event
	/*	CharacterControl::Events::Event_MoveTank_C_to_S evt(*m_pContext);
		evt.m_transform = pFirstSN->m_base;

		ClientNetworkManager *pNetworkManager = (ClientNetworkManager *)(m_pContext->getNetworkManager());
		pNetworkManager->getNetworkContext().getEventManager()->scheduleEvent(&evt, m_pContext->getGameObjectManager(), true);*/

		if (m_pTankRep->m_bitmask != 0)
		{
			ClientNetworkManager *pNetworkManager = (ClientNetworkManager *)(m_pContext->getNetworkManager());
			pNetworkManager->getNetworkContext().getGhostManager()->prepareGhost(m_pTankRep);
		}

		m_networkPingTimer = 0.0f;
	}
}

void TankController::overrideTransform(Matrix4x4 &t)
{
	m_overriden = true;
	m_transformOverride = t;
}

void TankController::reset()
{
	// resets for a new game (doesn't remove components, only resets some of the values)
	PE::Handle hFisrtSN = getFirstComponentHandle<SceneNode>();
	if (!hFisrtSN.isValid())
	{
		assert(!"wrong setup. must have scene node referenced");
		return;
	}

	SceneNode *pFirstSN = hFisrtSN.getObject<SceneNode>();
	pFirstSN->m_base.setPos(m_spawnPos);
	pFirstSN->m_base.setU(Vector3(1, 0, 0));
	pFirstSN->m_base.setV(Vector3(0, 1, 0));
	pFirstSN->m_base.setN(Vector3(0, 0, 1));
	pFirstSN->m_base.turnAboutAxis(3.1415962, Vector3(0, 1, 0));
	pFirstSN->m_base.scaleN(0.5);
	pFirstSN->m_base.scaleU(0.5);
	pFirstSN->m_base.scaleV(0.5);
	StringOps::writeToString("0", m_nextCheckpointName, 32);
	StringOps::writeToString("0", m_currCheckpointName, 32);
	//todo dario: make value changeable
	m_numCheckpointsRemaining = m_numCheckpointsToWin;

	m_currSpeed = 0;
	m_maxSpeed = maxSpeed;
	m_minSpeed = minSpeed;
	m_acceleration = acceleration;
	m_deceleration = deceleration;
	m_accelerationBack = accelerationBack;
	m_turnRate = turnRate;
	pFirstSN->getFirstComponent<PhysicsComponent>()->m_fallspeed = 0;

	m_pTankRep->m_position = m_spawnPos;
	m_pTankRep->m_rotation = pFirstSN->m_base.createQuat();

	hasPowerUp = false;
	powerUpIndex = 0;

	m_resetTimer = 5.f;
	m_isResetting = false;

	m_beginTimer = 3.f;
	m_isBeginning = true;

	//dario todo: remove
	m_isWinner = false;
	ClientGameObjectManagerAddon *pGOMAddon = (ClientGameObjectManagerAddon *)(m_pContext->get<CharacterControlContext>()->getGameObjectManagerAddon());

	PE::Handle *pHC = RootSceneNode::Instance()->getComponents().getFirstPtr();
	for (PrimitiveTypes::UInt32 i = 0; i < RootSceneNode::Instance()->getComponents().m_size; i++, pHC++) // fast array traversal (increasing ptr)
	{
		Component *pC = (*pHC).getObject<Component>();

		if (pC->isInstanceOf<ParticleEmitter>())
		{
			ParticleEmitter *pPE = (ParticleEmitter *)(pC);
			pPE->m_base.setPos(pGOMAddon->getLastCheckpointPosition(m_nextCheckpointName));
		}
	}

	pHC = pGOMAddon->getComponents().getFirstPtr();
	for (int i = 0; i < pGOMAddon->getComponents().m_size; ++i, ++pHC)
	{
		// dario note: by the current implementation, the banana is a scenenode component in the gom
		Component *pC = (*pHC).getObject<Component>();
		if (!pC) continue;
		if (pC->isInstanceOf<Banana>())
		{
			((SceneNode*)pC->getFirstComponent<SceneNode>())->m_base.moveDown(100);
		}
	}
}

void TankController::activate()
{
	m_active = true;

	// this function is called on client tank. since this is client tank and we have client authoritative movement
	// we need to register event handling for movement here.
	// We have 6 tanks total. we activate tank controls controller (in GOM Addon) that will process input events into tank movement events
	// but we want only one tank to process those events. One way to do it is to dynamically add event handlers
	// to only one tank controller. this is what we do here.
	// another way to do this would be to only hae one tank controller, and have it grab one of tank scene nodes when activated
	PE_REGISTER_EVENT_HANDLER(Event_Tank_Throttle, TankController::do_Tank_Throttle);
	PE_REGISTER_EVENT_HANDLER(Event_Tank_Turn, TankController::do_Tank_Turn);
	PE_REGISTER_EVENT_HANDLER(Event_OutOfBounds, TankController::do_OutOfBounds);
	PE_REGISTER_EVENT_HANDLER(Event_CheckpointReached, TankController::do_CheckpointReached);
	PE_REGISTER_EVENT_HANDLER(Event_PowerupReached, TankController::do_PowerupReached);
	PE_REGISTER_EVENT_HANDLER(Event_BananaReached, TankController::do_BananaReached);


	PE::Handle hFisrtSN = getFirstComponentHandle<SceneNode>();
	if (!hFisrtSN.isValid())
	{
		assert(!"wrong setup. must have scene node referenced");
		return;
	}

	//create camera
	PE::Handle hCamera("Camera", sizeof(Camera));
	Camera *pCamera = new(hCamera) Camera(*m_pContext, m_arena, hCamera, hFisrtSN);
	pCamera->addDefaultComponents();
	CameraManager::Instance()->setCamera(CameraManager::VEHICLE, hCamera);

	CameraManager::Instance()->selectActiveCamera(CameraManager::VEHICLE);

	//disable default camera controls

	m_pContext->getDefaultGameControls()->setEnabled(false);
	m_pContext->get<CharacterControlContext>()->getSpaceShipGameControls()->setEnabled(false);
	//enable tank controls

	m_pContext->get<CharacterControlContext>()->getTankGameControls()->setEnabled(false);

	//rotate the camera down initially
	SceneNode *pFirstSN = hFisrtSN.getObject<SceneNode>();
	if (CameraSceneNode *pCamSN = pFirstSN->getFirstComponent<CameraSceneNode>())
	{
		
			pCamSN->m_base.turnDown(3.1415/12.f);
		

	}

	//start allowing physics updates
	pFirstSN->getFirstComponent<PhysicsComponent>()->m_isAffectedByGravity = true;
	pFirstSN->getFirstComponent<PhysicsComponent>()->m_isMovable = true;

	m_isBeginning = true;
}

//Mingjian todo: attach wheels to wheelchair


//dario todo: remove
// this event is executed when thread has RC
void TankController::do_PRE_RENDER_needsRC(PE::Events::Event *pEvt)
{
	//*
	// HUD STARTS HERE
	// dario note: conditional ui is currently bugged possibly due to trailing image
	// (workaround: change positions of stuff to hide on condition)
	if (((ClientNetworkManager *)(m_pContext->getNetworkManager()))->m_clientId == m_pTankRep->m_ghostId)
	{
		static float aspectratio = 16.f / 9.f;

		//else
		{
			{ //countdown
				DebugRenderer::Instance()->createImageMesh("circle_red.dds", "Default", 10, 10, 0,
					Vector3((m_beginTimer < 2) ? .4 : 10, .2 * aspectratio, 0), 1.0f, m_pContext->m_gameThreadThreadOwnershipMask);

				DebugRenderer::Instance()->createImageMesh("circle_yellow.dds", "Default", 10, 10, 0,
					Vector3((m_beginTimer < 1) ? .5 : 10, .2 * aspectratio, 0), 1.0f, m_pContext->m_gameThreadThreadOwnershipMask);

				DebugRenderer::Instance()->createImageMesh("circle_green.dds", "Default", 10, 10, 0,
					Vector3((m_beginTimer < 0) ? .6 : 10, .2 * aspectratio, 0), 1.0f, m_pContext->m_gameThreadThreadOwnershipMask);
			}


			{// spedometer
				static float h = 0.15f, k = 0.85f, radius = 0.08f, baseAngle = 3.1415926 * 4.9f / 4.f;
				float addedAngle = m_currSpeed / m_maxSpeed * (-2.95f / 2.f) * 3.1415926;

				DebugRenderer::Instance()->createImageMesh("speedometer_0.dds", "Default", 10, 10, 0,
					Vector3(h, k, 0), 2.0f, m_pContext->m_gameThreadThreadOwnershipMask);

				DebugRenderer::Instance()->createImageMesh("speedometer_1.dds", "Default", 1.5, 1.5, 0,
					Vector3(h + radius * +cos(baseAngle + addedAngle), k - radius * sin(baseAngle + addedAngle) * aspectratio, 0), 1.0f, m_pContext->m_gameThreadThreadOwnershipMask);
			}

			{// minimap
				static float h = 0.85f, k = 0.7f, mapboundsx = 540, mapboundsy = 550;

				// the minimap
				DebugRenderer::Instance()->createImageMesh("minimap.dds", "Racetrack", 7.5, 7.5 * aspectratio, 0,
					Vector3(h, k, 0), 2.0f, m_pContext->m_gameThreadThreadOwnershipMask);

				// your enemy
				ClientGameObjectManagerAddon *pGOMAddon = (ClientGameObjectManagerAddon *)(m_pContext->get<CharacterControlContext>()->getGameObjectManagerAddon());
				Vector3 foo = pGOMAddon->getEnemyPosition(m_pTankRep->m_ghostId);
				float posx = foo.getX() / mapboundsx;
				float posy = -foo.getZ() / mapboundsy;
				DebugRenderer::Instance()->createImageMesh("racer-enemy.dds", "Default", 1.25, 1.25, 0,
					Vector3(h + posx, k + posy * aspectratio, 0), 1.0f, m_pContext->m_gameThreadThreadOwnershipMask);

				// your next checkpoint
				foo = pGOMAddon->getLastCheckpointPosition(m_nextCheckpointName);
				posx = foo.getX() / mapboundsx;
				posy = -foo.getZ() / mapboundsy;
				DebugRenderer::Instance()->createImageMesh("map-marker.dds", "Default", 1.5, 1.5, 0,
					Vector3(h + posx, k + posy * aspectratio - 0.01, 0), 1.0f, m_pContext->m_gameThreadThreadOwnershipMask);

				// where you are
				posx = m_pTankRep->m_position.getX() / mapboundsx;
				posy = -m_pTankRep->m_position.getZ() / mapboundsy;
				DebugRenderer::Instance()->createImageMesh("racer-you.dds", "Default", 1.25, 1.25, 0,
					Vector3(h + posx, k + posy * aspectratio, 0), 1.0f, m_pContext->m_gameThreadThreadOwnershipMask);
			}

			{ // powerups
				DebugRenderer::Instance()->createImageMesh("powerup-boost.dds", "Default", 10, 10, 0,
					Vector3((powerUpIndex == 1) ? .5 : 10, .1 * aspectratio, 0), 1.0f, m_pContext->m_gameThreadThreadOwnershipMask);

				DebugRenderer::Instance()->createImageMesh("powerup-banana.dds", "Default", 10, 10, 0,
					Vector3((powerUpIndex == 2) ? .5 : 10, .1 * aspectratio, 0), 1.0f, m_pContext->m_gameThreadThreadOwnershipMask);
			}

			{ // win and lose
				DebugRenderer::Instance()->createImageMesh("youwin.dds", "Default", 10 * aspectratio, 5, 0,
					Vector3((m_isResetting && m_isWinner) ? .5 : 10, .3, 0), 1.0f, m_pContext->m_gameThreadThreadOwnershipMask);

				DebugRenderer::Instance()->createImageMesh("youlose.dds", "Default", 10 * aspectratio, 5, 0,
					Vector3((m_isResetting && !m_isWinner) ? .5 : 10, .3, 0), 1.0f, m_pContext->m_gameThreadThreadOwnershipMask);

				DebugRenderer::Instance()->createImageMesh("restarting.dds", "Default", 10 * aspectratio, 5, 0,
					Vector3((m_isResetting) ? .5 : 10, .8, 0), 1.0f, m_pContext->m_gameThreadThreadOwnershipMask);
			}

			//if (!m_active) //setting up, show title screen or something
			// put at the end for proper order
			{
				// title screen
				DebugRenderer::Instance()->createImageMesh("titlescreen.dds", "Default", 60 * aspectratio, 60, 0,
					Vector3((!m_active) ? .5 : 10, .5, 0), 1.0f, m_pContext->m_gameThreadThreadOwnershipMask);

				// level loading
				DebugRenderer::Instance()->createImageMesh("loading.dds", "Default", 10 * aspectratio, 5, 0,
					Vector3((!m_active && !m_isWaiting) ? .5 : 10, .8, 0), 1.0f, m_pContext->m_gameThreadThreadOwnershipMask);

				// other player connecting
				DebugRenderer::Instance()->createImageMesh("waiting.dds", "Default", 10 * aspectratio, 5, 0,
					Vector3((!m_active && m_isWaiting) ? .5 : 10, .8, 0), 1.0f, m_pContext->m_gameThreadThreadOwnershipMask);
			}
		}
	}//*/
}

PE_IMPLEMENT_CLASS1(TankRep, Component);
TankRep::TankRep(PE::GameContext context, PE::MemoryArena arena, PE::Handle hMyself)
: Component(context, arena, hMyself), PE::Networkable(context, this) {}



int TankRep::constructFromStream(char *pDataStream)
{
	int read = 0;
	read += StreamManager::WriteByte(pDataStream[read], &m_ghostId);
	read += StreamManager::WriteByte(pDataStream[read], &m_bitmask);
	//assert(m_bitmask != 0);

	if ((m_bitmask & StateMasks::Position) == StateMasks::Position)
	{
		read += StreamManager::ReadVector3(&pDataStream[read], m_position);
	}
	if ((m_bitmask & StateMasks::Rotation) == StateMasks::Rotation)
	{
		read += StreamManager::ReadQuaternion(&pDataStream[read], m_rotation);
	}
	//m_bitmask = 0;
	return read;
}
int TankRep::packStateData(char *pDataStream)
{
	int size = 0;
	if (m_bitmask != 0)
	{
		size += StreamManager::WriteByte(m_ghostId, &pDataStream[size]);
		size += StreamManager::WriteByte(m_bitmask, &pDataStream[size]);

		if ((m_bitmask & StateMasks::Position) == StateMasks::Position)
		{
			size += StreamManager::WriteVector3(m_position, &pDataStream[size]);
		}
		if ((m_bitmask & StateMasks::Rotation) == StateMasks::Rotation)
		{
			size += StreamManager::WriteQuaternion(m_rotation, &pDataStream[size]);
		}
		m_bitmask = 0;
	}
	return size;
}
void *TankRep::FactoryConstruct(PE::GameContext& context, PE::MemoryArena arena)
{
	PE::Handle hTankRep("TankRep", sizeof(TankRep));
	TankRep *pTR = new (arena) TankRep(context, arena, hTankRep);
	return pTR;
}

}
}

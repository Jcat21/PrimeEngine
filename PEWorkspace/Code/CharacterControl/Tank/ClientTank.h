#ifndef _TANK_H_
#define _TANK_H_

#include "PrimeEngine/Events/Component.h"
#include "PrimeEngine/Math/Vector3.h"
#include "PrimeEngine/PrimeEngineIncludes.h"
#include "PrimeEngine/utils/Networkable.h"

namespace PE {
    namespace Events{
        struct EventQueueManager;
    }
}

namespace CharacterControl {
namespace Components {

	struct TankGameControls : public PE::Components::Component
	{
		PE_DECLARE_CLASS(TankGameControls);
	public:

		TankGameControls(PE::GameContext &context, PE::MemoryArena arena, PE::Handle hMyself)
			: PE::Components::Component(context, arena, hMyself)
		{
		}

		virtual ~TankGameControls(){}
		// Component ------------------------------------------------------------

		PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_UPDATE);
		virtual void do_UPDATE(PE::Events::Event *pEvt);

		virtual void addDefaultComponents() ;

		//Methods----------------
		void handleIOSDebugInputEvents(PE::Events::Event *pEvt);
		void handleKeyboardDebugInputEvents(PE::Events::Event *pEvt);
		void handleControllerDebugInputEvents(PE::Events::Event *pEvt);

		PE::Events::EventQueueManager *m_pQueueManager;

		PrimitiveTypes::Float32 m_frameTime;
	};

	enum StateMasks
	{
		Position = 0b00000001,
		Rotation = 0b00000010,

		//Creation = 0b10000000,
	};

	struct TankRep : public PE::Components::Component, public PE::Networkable
	{
		PE_DECLARE_CLASS(TankRep);
		PE_DECLARE_NETWORKABLE_CLASS

		//TankRep(PE::GameContext &context) : PE::Networkable(context, this) {}
		TankRep(PE::GameContext context, PE::MemoryArena arena, PE::Handle hMyself);
		// Netoworkable:
		//virtual int packCreationData(char *pDataStream);
		
		virtual int constructFromStream(char *pDataStream);
		virtual int packStateData(char *pDataStream);

		// Factory function used by network
		static void *FactoryConstruct(PE::GameContext&, PE::MemoryArena);

		PrimitiveTypes::Byte m_bitmask;
		PrimitiveTypes::Byte m_ghostId;

		Vector3 m_position;
		Quaternion m_rotation;
	};

    struct TankController : public PE::Components::Component
    {
        // component API
        PE_DECLARE_CLASS(TankController);
        
        TankController(PE::GameContext &context, PE::MemoryArena arena,
			PE::Handle myHandle, float speed,
			Vector3 spawnPos, Quaternion spawnRot, int numToWin, float networkPingInterval); // constructor
        
        virtual void addDefaultComponents(); // adds default children and event handlers
        
        
        PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_UPDATE);
        virtual void do_UPDATE(PE::Events::Event *pEvt);
        
		PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_Tank_Throttle);
		virtual void do_Tank_Throttle(PE::Events::Event *pEvt);

		PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_Tank_Turn);
		virtual void do_Tank_Turn(PE::Events::Event *pEvt);

		PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_OutOfBounds);
		virtual void do_OutOfBounds(PE::Events::Event *pEvt);

		PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_CheckpointReached);
		virtual void do_CheckpointReached(PE::Events::Event *pEvt);

		PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_PowerupReached);
		virtual void do_PowerupReached(PE::Events::Event *pEvt);

		PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_BananaReached);
		virtual void do_BananaReached(PE::Events::Event *pEvt);
		
	
		//dario todo: remove
		PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_PRE_RENDER_needsRC)
		void do_PRE_RENDER_needsRC(PE::Events::Event *pEvt);

		void overrideTransform(Matrix4x4 &t);
		void reset();
		void activate();
		//This function will be called when create tank
        float m_timeSpeed;
        float m_time;
		float m_networkPingTimer;
		float m_networkPingInterval;
		float m_resetTimer;
		float m_beginTimer;
        Vector2 m_center;
        PrimitiveTypes::UInt32 m_counter;
		Vector3 m_spawnPos;
		bool m_active;
		bool m_overriden;
		bool m_isResetting;
		bool m_isBeginning;
		bool m_isWaiting;
		Matrix4x4 m_transformOverride;

		float m_Angle;
		float m_currSpeed;
		float m_maxSpeed;
		float m_minSpeed;
		float m_acceleration;
		float m_deceleration;
		float m_accelerationBack;
		float m_turnRate;
		int m_numCheckpointsRemaining;
		int m_numCheckpointsToWin;
		bool m_didPress = false;
		char m_currCheckpointName[32];
		char m_nextCheckpointName[32];
		
		//dario todo: remove
		float m_isWinner;
		bool m_isPlayingSound = false;
		bool m_isDrifting = false;
		float m_rotation = -1;
		int m_spinned = 0; // 0 means none; 1 means left; 2 means right
		float m_spinTimer = 0.0f;
		float wheelturnRate = 0.0f;
		bool hasPowerUp = false;
		int powerUpIndex = 0;
		bool bananaReached = false;
		bool dropBanana = false;
		Vector3 lastPostion;
		PEUUID bananaPeuuid;
		int bananaUid = 0;
		int carView = 1;
		bool carViewPressed = false;
		float carViewTimmer = 0.0;
		float cameraAngle = 0.0f;
		float cameraReturnAngle = 0.0f;
		float maxSpeed = 1.5f;
		float maxSpeedTimmer = 0.0f;

		//dario test
		TankRep *m_pTankRep;
    };
	
}; // namespace Components
}; // namespace CharacterControl

#endif

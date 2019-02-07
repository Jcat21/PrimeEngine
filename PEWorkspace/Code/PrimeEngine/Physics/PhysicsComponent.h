#ifndef __PYENGINE_2_0_PHYSICSCOMPONENT_H__
#define __PYENGINE_2_0_PHYSICSCOMPONENT_H__

// API Abstraction
#include "PrimeEngine/APIAbstraction/APIAbstractionDefines.h"

// Outer-Engine includes
#include <assert.h>

// Inter-Engine includes
#include "PrimeEngine/MemoryManagement/Handle.h"
#include "PrimeEngine/PrimitiveTypes/PrimitiveTypes.h"
#include "../Events/Component.h"
#include "../Utils/Array/Array.h"
#include "PhysicsShape.h"

//#define USE_DRAW_COMPONENT

namespace PE {
namespace Components {
	struct PhysicsComponent : public Component
	{
		PE_DECLARE_CLASS(PhysicsComponent);

		// Constructor -------------------------------------------------------------
		
		PhysicsComponent(PE::GameContext &context, PE::MemoryArena arena, Handle hMyself, bool movable);
		PhysicsComponent(PE::GameContext &context, PE::MemoryArena arena, Handle hMyself, bool movable, bool grav);

		virtual ~PhysicsComponent() {}

		// Component ------------------------------------------------------------

		virtual void addDefaultComponents();

		// Individual events -------------------------------------------------------

		Vector3 intersectSum(PhysicsComponent *pc);

		bool m_isMovable;//true if the physics component moves
		bool m_isAffectedByGravity;//true if yeah

		Array<Handle> m_shapes;
		float m_fallspeed;

		//static SceneNode *s_pRootSceneNode;
	}; // class PhysicsComponent

	struct TriggerVolume : public Component
	{
		PE_DECLARE_CLASS(TriggerVolume);

		// Constructor -------------------------------------------------------------

		TriggerVolume(PE::GameContext &context, PE::MemoryArena arena, Handle hMyself, PE::Events::Event *triggerEvent, int eventSize, int targetClassID);
		TriggerVolume(PE::GameContext &context, PE::MemoryArena arena, Handle hMyself, PE::Events::Event *triggerEvent, int eventSize, int targetClassID, float cooldown);

		virtual ~TriggerVolume() {}

		// Component ------------------------------------------------------------

		virtual void addDefaultComponents();

		// Individual events -------------------------------------------------------
		
		bool hasIntersect(PhysicsComponent *pc);

		Component *m_eventHandler = NULL; // if not set, the object that triggered will handle it instead
		PE::Events::Event *m_triggerEvent;
		int m_triggerEventSize;

		int m_targetClassID = -1; // class ID of the objects that will trigger the volume

		float m_triggerCooldown;
		float m_currentTriggerTime;

		bool m_hasCooldown;
		bool m_isCoolingDown;

		Array<Handle> m_shapes;
	}; // class TriggerVolume

}; // namespace Components
}; // namespace PE
#endif

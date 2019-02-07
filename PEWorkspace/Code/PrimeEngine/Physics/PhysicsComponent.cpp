
#include "PhysicsComponent.h"
#include "PhysicsManager.h"
#include "PrimeEngine/Lua/LuaEnvironment.h"
#include "PrimeEngine/Events/StandardEvents.h"
#include "PrimeEngine/Scene/SceneNode.h"

#include "CharacterControl/Events/Events.h"

namespace PE {
	namespace Components {

		PE_IMPLEMENT_CLASS1(PhysicsComponent, Component);

		// Constructor -------------------------------------------------------------
		PhysicsComponent::PhysicsComponent(PE::GameContext &context, PE::MemoryArena arena, Handle hMyself, bool movable)
			: Component(context, arena, hMyself), m_shapes(context, arena, 8), m_isMovable(movable), m_isAffectedByGravity(true), m_fallspeed(0)
		{
			addDefaultComponents();
		}
		PhysicsComponent::PhysicsComponent(PE::GameContext &context, PE::MemoryArena arena, Handle hMyself, bool movable, bool grav)
			: Component(context, arena, hMyself), m_shapes(context, arena, 8), m_isMovable(movable), m_isAffectedByGravity(grav), m_fallspeed(0)
		{
			addDefaultComponents();
		}

		void PhysicsComponent::addDefaultComponents()
		{
			Component::addDefaultComponents();

			// Data components

		}

		Vector3 PhysicsComponent::intersectSum(PhysicsComponent* pc)
		{
			Vector3 retVal = Vector3();

			if (!m_isMovable) return retVal;

			int numShapesa = m_shapes.m_size;
			int numShapesb = pc->m_shapes.m_size;

			for (int i = 0; i < numShapesa; i++)
			{
				PhysicsShape *shapea = m_shapes[i].getObject<PhysicsShape>();

				for (int j = 0; j < numShapesb; j++)
				{
					PhysicsShape *shapeb = pc->m_shapes[j].getObject<PhysicsShape>();
					retVal += shapea->intersectVector(shapeb);
					if (retVal.m_y > 0)
						m_fallspeed = 0;
				}

			}

			if (m_isAffectedByGravity)
				retVal.m_y -= m_fallspeed;//gravity!
			return retVal;
		}


		PE_IMPLEMENT_CLASS1(TriggerVolume, Component);

		// Constructor -------------------------------------------------------------
		TriggerVolume::TriggerVolume(PE::GameContext &context, PE::MemoryArena arena, Handle hMyself, PE::Events::Event* triggerEvent, int eventSize, int targetClassID)
			: Component(context, arena, hMyself), m_shapes(context, arena, 8), m_isCoolingDown(false), m_triggerEvent(triggerEvent), m_triggerEventSize(eventSize)
			, m_targetClassID(targetClassID), m_hasCooldown(false), m_triggerCooldown(0.f)
		{
			addDefaultComponents();
		}
		TriggerVolume::TriggerVolume(PE::GameContext &context, PE::MemoryArena arena, Handle hMyself, PE::Events::Event* triggerEvent, int eventSize, int targetClassID, float cooldown)
			: Component(context, arena, hMyself), m_shapes(context, arena, 8), m_isCoolingDown(false), m_triggerEvent(triggerEvent), m_triggerEventSize(eventSize)
			, m_targetClassID(targetClassID), m_hasCooldown(true), m_triggerCooldown(cooldown)
		{
			addDefaultComponents();
		}

		void TriggerVolume::addDefaultComponents()
		{
			Component::addDefaultComponents();

			// Data components
		}

		bool TriggerVolume::hasIntersect(PhysicsComponent* pc)
		{
			int numShapesa = m_shapes.m_size;
			int numShapesb = pc->m_shapes.m_size;

			Vector3 intersection = Vector3();
			for (int i = 0; i < numShapesa; i++)
			{
				PhysicsShape *shapea = m_shapes[i].getObject<PhysicsShape>();

				for (int j = 0; j < numShapesb; j++)
				{
					PhysicsShape *shapeb = pc->m_shapes[j].getObject<PhysicsShape>();
					intersection += shapea->intersectVector(shapeb);

					if (intersection.m_x != 0 || intersection.m_y != 0 || intersection.m_z != 0)
						return(true);
				}
			}

			return(false);
		}

	}; // namespace Components
}; // namespace PE

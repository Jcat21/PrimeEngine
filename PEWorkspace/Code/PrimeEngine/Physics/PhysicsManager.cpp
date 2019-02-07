// APIAbstraction
#include "PrimeEngine/APIAbstraction/APIAbstractionDefines.h"

// Outer-Engine includes

// Inter-Engine includes
#include "../Lua/LuaEnvironment.h"

// Sibling/Children includes
#include "PhysicsManager.h"
#include "PhysicsComponent.h"
#include "PrimeEngine/Events/StandardEvents.h"

const bool EnableDebugRendering = true;
namespace PE {
	namespace Components {

		using namespace PE::Events;

		PE_IMPLEMENT_CLASS1(PhysicsManager, Component);

		// Static member variables

		Handle PhysicsManager::s_myHandle;

		// Singleton ------------------------------------------------------------------

		void PhysicsManager::Construct(PE::GameContext &context, PE::MemoryArena arena)
		{
			Handle handle("PhysicsManager", sizeof(PhysicsManager));
			PhysicsManager *pPhysicsManager = new(handle) PhysicsManager(context, arena, handle);
			pPhysicsManager->addDefaultComponents();
			// Singleton
			SetInstanceHandle(handle);
		}

		// Constructor -------------------------------------------------------------

		PhysicsManager::PhysicsManager(PE::GameContext &context, PE::MemoryArena arena, Handle hMyself)
			: Component(context, arena, hMyself), m_physComps(context, arena, 128), m_trigComps(context, arena, 128)
		{
			// IMPORTANT NOTE: the physics implementation assumes that physics components are contained in a scene node
			// that is contained within the object in question
			// i.e. simply adding physics components to waypoint would not work
			// you add a scene node to a waypoint first for it to work
			// possible todo: make it more robust
		}

		// Methods      ------------------------------------------------------------

		void PhysicsManager::addPhysCompToList(Handle h)
		{
			m_physComps.add(h);
		}

		void PhysicsManager::addTrigCompToList(Handle h)
		{
			m_trigComps.add(h);
		}

		void PhysicsManager::addDefaultComponents()
		{
			Component::addDefaultComponents();

			PE_REGISTER_EVENT_HANDLER(PE::Events::Event_PHYSICS_START, PhysicsManager::do_PHYSICS_START);
			PE_REGISTER_EVENT_HANDLER(PE::Events::Event_PHYSICS_END, PhysicsManager::do_PHYSICS_END);
			// event handlers
		}

		void PhysicsManager::do_PHYSICS_START(Event *physEvt)
		{
			// used mostly for reactivating trigger volume (at least for now)
			// it should also be used to tell the manager where the component wants to go, and if we'll allow it (possible todo)
			Event_PHYSICS_START *realEvt = (Event_PHYSICS_START*)physEvt;

			float deltaTime = realEvt->m_frameTime;

			updateTriggerTimers(deltaTime);
			updatePhysicsFalling(deltaTime);
		}

		void PhysicsManager::do_PHYSICS_END(Event *physEvt)
		{
			// currently physics end don't have anything (possible todo)
			Event_PHYSICS_END  *realEvt = (Event_PHYSICS_END*)physEvt;

			doPhysicsVolumes();
			doTriggerVolumes();
		}

		void PhysicsManager::doPhysicsVolumes()
		{
			// update the manager, then sync parent scene nodes?
			int pcnum = m_physComps.m_size;

			for (int i = 0; i < pcnum; i++)
			{
				PhysicsComponent* pca = m_physComps[i].getObject<PhysicsComponent>();
				Vector3 adjustSceneNodeBy = Vector3();
				for (int j = 0; j < pcnum; j++)
				{
					if (i == j) continue;
					PhysicsComponent* pcb = m_physComps[j].getObject<PhysicsComponent>();
					adjustSceneNodeBy += pca->intersectSum(pcb);
				}

				SceneNode *pSN = pca->getFirstParentByTypePtr<SceneNode>();
				if (pSN)
				{
					pSN->m_base.setPos(pSN->m_base.getPos() + adjustSceneNodeBy);
				}
			}
		}

		void PhysicsManager::updateTriggerTimers(float deltaTime)
		{
			int trigCount = m_trigComps.m_size;
			for (int i = 0; i < trigCount; i++)
			{
				TriggerVolume *pTV = m_trigComps[i].getObject<TriggerVolume>();
				if (!pTV->m_hasCooldown) continue;

				if (pTV->m_isCoolingDown)
				{
					pTV->m_currentTriggerTime += deltaTime;

					// activate if it passes the cooldown time
					if (pTV->m_currentTriggerTime > pTV->m_triggerCooldown)
					{
						pTV->m_isCoolingDown = false;
						pTV->m_currentTriggerTime = 0;
					}
				}
			}
		}

		void PhysicsManager::updatePhysicsFalling(float deltaTime)
		{
			int pcnum = m_physComps.m_size;

			for (int i = 0; i < pcnum; i++)
			{
				PhysicsComponent* pca = m_physComps[i].getObject<PhysicsComponent>();
				if (pca->m_isAffectedByGravity)
				{
					pca->m_fallspeed += m_gravity * deltaTime;
				}
			}
		}

		void PhysicsManager::doTriggerVolumes()
		{
			int trigCount = m_trigComps.m_size;
			int physCount = m_physComps.m_size;

			if (trigCount * physCount == 0) return;

			for (int i = 0; i < trigCount; i++)
			{
				TriggerVolume *pTV = m_trigComps[i].getObject<TriggerVolume>();

				if (!pTV->m_isCoolingDown)
				{
					// check all physics components for intersection with trigger volume
					for (int j = 0; j < physCount; j++)
					{
						PhysicsComponent* pPC = m_physComps[j].getObject<PhysicsComponent>();

						// if a trigger volume has a physics component intersecting it
						// note: sometimes if shapes are exact for trigger and physics, it won't register
						// todo: needs better checking
						if (pTV->hasIntersect(pPC))
						{
							// if that physics component is child of a scene node
							// whose parent class is what the trigger wants
							Component *pCom = pPC->getFirstParentByTypePtr<SceneNode>()->getFirstParentByType(pTV->m_targetClassID).getObject<Component>();

							// make sure we're not triggering our own trigger volume
							// for cases we have both physics and trigger volume present in the same object
							Component *triggerSelf = pTV->getFirstParentByTypePtr<SceneNode>()->getFirstParentByType(pTV->m_targetClassID).getObject<Component>();
							if (pCom == triggerSelf) continue;

							if (pCom)
							{
								if (pTV->m_eventHandler)
								{
									pCom = pTV->m_eventHandler;
								}

								pCom->handleEvent(pTV->m_triggerEvent);

								if (pTV->m_hasCooldown)
									pTV->m_isCoolingDown = true;
							}
						}
					}
				}
			}
		}

	}; // namespace Components
}; //namespace PE

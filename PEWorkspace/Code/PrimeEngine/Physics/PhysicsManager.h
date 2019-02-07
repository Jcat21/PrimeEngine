#ifndef __PYENGINE_2_0_PHYSICSMANAGER_H__
#define __PYENGINE_2_0_PHYSICSMANAGER_H__

#define NOMINMAX
// API Abstraction
#include "PrimeEngine/APIAbstraction/APIAbstractionDefines.h"

// Outer-Engine includes
#include <assert.h>

// Inter-Engine includes
#include "PrimeEngine/MemoryManagement/Handle.h"
#include "PrimeEngine/PrimitiveTypes/PrimitiveTypes.h"
#include "../Events/Component.h"
#include "../Utils/Array/Array.h"
#include "../Scene/SceneNode.h"

// Sibling/Children includes
#include "PhysicsComponent.h"

namespace PE {
namespace Components {

	struct PhysicsManager : public Component
	{
		PE_DECLARE_CLASS(PhysicsManager);

		PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_PHYSICS_START);
		virtual void do_PHYSICS_START(PE::Events::Event *pEvt);

		PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_PHYSICS_END);
		virtual void do_PHYSICS_END(PE::Events::Event *pEvt);


		// Singleton ------------------------------------------------------------------

		static void Construct(PE::GameContext &context, PE::MemoryArena arena);

		static PhysicsManager *Instance()
		{
			return s_myHandle.getObject<PhysicsManager>();
		}

		static Handle InstanceHandle()
		{
			return s_myHandle;
		}

		static void SetInstanceHandle(const Handle &handle)
		{
			// Singleton
			PhysicsManager::s_myHandle = handle;
		}

		// Constructor -------------------------------------------------------------
		PhysicsManager(PE::GameContext &context, PE::MemoryArena arena, Handle hMyself);
		virtual ~PhysicsManager() {}

		// Methods      ------------------------------------------------------------

		void addPhysCompToList(Handle hPC);
		void addTrigCompToList(Handle hPC);
		void doPhysicsVolumes();
		void updateTriggerTimers(float deltaTime);
		void updatePhysicsFalling(float deltaTime);
		void doTriggerVolumes();

		// Component ------------------------------------------------------------
		
		virtual void addDefaultComponents();

		// Individual events -------------------------------------------------------

		private:
			float m_gravity = 0.1f; // increase in fall speed per second
			static Handle s_myHandle;
			Array<Handle> m_physComps;
			Array<Handle> m_trigComps;
	};
}; // namespace Components
}; // namespace PE
#endif

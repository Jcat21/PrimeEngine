#ifndef __PYENGINE_2_0_PHYSICSSHAPE_H__
#define __PYENGINE_2_0_PHYSICSSHAPE_H__

// API Abstraction
#include "PrimeEngine/APIAbstraction/APIAbstractionDefines.h"

// Outer-Engine includes
#include <assert.h>

// Inter-Engine includes
#include "PrimeEngine/MemoryManagement/Handle.h"
#include "PrimeEngine/PrimitiveTypes/PrimitiveTypes.h"
#include "../Events/Component.h"
#include "../Utils/Array/Array.h"
#include "../Math/Matrix4x4.h"
#include "../Math/Vector3.h"

namespace PE {
namespace Components {
	struct PhysicsShape : public Component
	{
		PE_DECLARE_CLASS(PhysicsShape);

		// Constructor -------------------------------------------------------------
		PhysicsShape(PE::GameContext &context, PE::MemoryArena arena, Handle hMyself, Vector3 translate);

		virtual ~PhysicsShape() {}

		// Component ------------------------------------------------------------

		virtual void addDefaultComponents();

		// Individual events -------------------------------------------------------

		virtual Vector3 intersectVector(PhysicsShape* shape) = 0;
		// the translate of the physics volume from its parent scene node
		Vector3 m_translate;

	}; 
	
	struct PhysicsSphere : public PhysicsShape
	{
		PE_DECLARE_CLASS(PhysicsSphere);
		PhysicsSphere(PE::GameContext &context, PE::MemoryArena arena, Handle hMyself, Vector3 translate, float radius) : PhysicsShape(context, arena, hMyself, translate), m_radius(radius)
		{}

		virtual ~PhysicsSphere() {}

		Vector3 intersectVector(PhysicsShape* shape);
		float m_radius;
	};

	struct PhysicsBox : public PhysicsShape
	{
		PE_DECLARE_CLASS(PhysicsBox);
		PhysicsBox(PE::GameContext &context, PE::MemoryArena arena, Handle hMyself, Vector3 translate, Vector3 scale) : PhysicsShape(context, arena, hMyself, translate), m_scale(scale)
		{}

		virtual ~PhysicsBox() {}

		Vector3 intersectVector(PhysicsShape* shape);
		Vector3 m_scale;
	};
}; // namespace Components
}; // namespace PE
#endif

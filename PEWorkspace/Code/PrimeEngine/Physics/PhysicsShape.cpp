#include "PhysicsShape.h"
#include "PrimeEngine/Lua/LuaEnvironment.h"
#include "PrimeEngine/Events/StandardEvents.h"
#include "PrimeEngine/Physics/PhysicsComponent.h"
#include "PrimeEngine/Scene/SceneNode.h"

namespace PE {
namespace Components {

	PE_IMPLEMENT_CLASS1(PhysicsShape, Component);

	// Constructor -------------------------------------------------------------
	PhysicsShape::PhysicsShape(PE::GameContext &context, PE::MemoryArena arena, Handle hMyself, Vector3 translate) 
		: Component(context, arena, hMyself), m_translate(translate)
	{
		addDefaultComponents();
	}

	void PhysicsShape::addDefaultComponents()
	{
		Component::addDefaultComponents();

	}

	PE_IMPLEMENT_CLASS1(PhysicsSphere, PhysicsShape);

	Vector3 PhysicsSphere::intersectVector(PhysicsShape* shape)
	{
		PhysicsComponent *pPC = getFirstParentByTypePtr<PhysicsComponent>();
		TriggerVolume *pTV = getFirstParentByTypePtr<TriggerVolume>();

		Vector3 spherePos;
		// the physics component and the trigger volume should be under the same scenenode(?)
		if (pPC)
		{
			spherePos = pPC->getFirstParentByTypePtr<SceneNode>()->m_worldTransform.getPos();
		}
		else if (pTV)
		{
			spherePos = pTV->getFirstParentByTypePtr<SceneNode>()->m_worldTransform.getPos();
		}

		spherePos += m_translate;
		float radius = m_radius;

		if (shape->isInstanceOf<PhysicsBox>())
		{
			PhysicsBox* box = (PhysicsBox*)shape;

			// move to the center of the physics volume
			Matrix4x4 boxM;
			
			PhysicsComponent *pPC2 = shape->getFirstParentByTypePtr<PhysicsComponent>();
			TriggerVolume *pTV2 = shape->getFirstParentByTypePtr<TriggerVolume>();
			
			if (pPC2)
			{
				boxM = pPC2->getFirstParentByTypePtr<SceneNode>()->m_worldTransform;
			}
			else if (pTV2)
			{
				boxM = pTV2->getFirstParentByTypePtr<SceneNode>()->m_worldTransform;
			}
			
			Matrix4x4 move = Matrix4x4(box->m_translate);
			boxM.getTransformedByOther(move);
			boxM = boxM.inverse();

			// generate box plane equations
			float boxPlane[6][4];
			for (int i = 0; i < 3; i++)
			{
				for (int j = 0; j < 4; j++)
				{
					boxPlane[i * 2][j] = boxM.m[3][j] - boxM.m[i][j];
					boxPlane[i * 2 + 1][j] = boxM.m[3][j] + boxM.m[i][j];
				}
			}
			// scale the box properly
			for (int i = 0; i < 6; i++) boxPlane[i][3] -= 1;
			for (int i = 0; i < 2; i++) boxPlane[i][3] += box->m_scale.getX() / 2;
			for (int i = 2; i < 4; i++) boxPlane[i][3] += box->m_scale.getY() / 2;
			for (int i = 4; i < 6; i++) boxPlane[i][3] += box->m_scale.getZ() / 2;

			for (int i = 0; i < 6; i++)
			{
				// these should be normalized, but it could be wrong? O:
				Vector3 pEQ = Vector3(boxPlane[i][0], boxPlane[i][1], boxPlane[i][2]);

				float depth = radius - fabs(spherePos.dotProduct(pEQ) + boxPlane[i][3]);
				if (depth > 0)
				{
					// we have an intersection with a plane, now we check if sphere is inside all other planes
					bool in = true;

					for (int j = 0; j < 6; j++)
					{
						if (i == j/2*2 || i == j/2*2+1) continue;

						//there should be a better way
						float signedDist = boxPlane[j][0] * spherePos.getX() + boxPlane[j][1] * spherePos.getY() + boxPlane[j][2] * spherePos.getZ() + boxPlane[j][3];
						if (signedDist < 0) in = false;
						if (!in) break;
					}

					if (in)
					{
						return -depth*pEQ;
					}
				}
			}
			return Vector3();
		}
		else if (shape->isInstanceOf<PhysicsSphere>())
		{
			PhysicsSphere* sphere = (PhysicsSphere*)shape;
			Vector3 shapePos= sphere->getFirstParentByTypePtr<PhysicsComponent>()->getFirstParentByTypePtr<SceneNode>()->m_worldTransform.getPos();
			shapePos += sphere->m_translate;
			float shapeRadius = sphere->m_radius;

			Vector3 normal = spherePos - shapePos;
			float intersectiondepth = (radius + shapeRadius) - normal.length();

			if (intersectiondepth > 0)
			{
				normal.normalize();
				normal *= intersectiondepth;

				return normal;
			}
		}
		return Vector3();
	}

	PE_IMPLEMENT_CLASS1(PhysicsBox, PhysicsShape);

	Vector3 PhysicsBox::intersectVector(PhysicsShape* shape)
	{
		// for trigger volumes to work
		if (getFirstParentByTypePtr<TriggerVolume>())
		{
			if (shape->isInstanceOf<PhysicsSphere>()) return shape->intersectVector(this);
		}


		// This should be implemented in the future (once we know how)
		/*if (shape->isInstanceOf<PhysicsBox>())
		{
			return Vector3();
		}
		else if (shape->isInstanceOf<PhysicsSphere>())
		{
			return Vector3(0.005,0,0);
		}*/
		return Vector3();
	}

}; // namespace Components
}; // namespace PE

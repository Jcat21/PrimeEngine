#ifndef __PYENGINE_2_0_IMAGESCENENODE_H__
#define __PYENGINE_2_0_IMAGESCENENODE_H__

// API Abstraction
#include "PrimeEngine/APIAbstraction/APIAbstractionDefines.h"

// Outer-Engine includes
#include <assert.h>

// Inter-Engine includes
#include "PrimeEngine/MemoryManagement/Handle.h"
#include "PrimeEngine/PrimitiveTypes/PrimitiveTypes.h"
#include "../Events/Component.h"
#include "../Utils/Array/Array.h"
#include "SceneNode.h"

//#define USE_DRAW_COMPONENT

namespace PE {
	namespace Components {
		struct ImageSceneNode : public SceneNode
		{
			PE_DECLARE_CLASS(ImageSceneNode);

			// Constructor -------------------------------------------------------------
			ImageSceneNode(PE::GameContext &context, PE::MemoryArena arena, Handle hMyself);

			virtual ~ImageSceneNode() {}

			void setSelfAndMeshAssetEnabled(bool enabled);

			// Component ------------------------------------------------------------

			virtual void addDefaultComponents();

			// Individual events -------------------------------------------------------

			PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_PRE_GATHER_DRAWCALLS);
			virtual void do_PRE_GATHER_DRAWCALLS(Events::Event *pEvt);

			void loadFromString_needsRC(char* imageName, char* imagePackage, float width, float height, int &threadOwnershipMask);

			float m_scale;
			Handle m_hMyImageMesh;
			Handle m_hMyImageMeshInstance;
			float m_cachedAspectRatio;
			float m_width;
			float m_height;
			bool m_canBeRecreated;

		}; // class TextSceneNode

	}; // namespace Components
}; // namespace PE
#endif

#ifndef __PYENGINE_2_0_IMAGEMESH_H__
#define __PYENGINE_2_0_IMAGEMESH_H__

#define NOMINMAX
// API Abstraction
#include "PrimeEngine/APIAbstraction/APIAbstractionDefines.h"

// Outer-Engine includes
#include <assert.h>

// Inter-Engine includes
#include "PrimeEngine/APIAbstraction/Effect/Effect.h"

// Sibling/Children includes
#include "Mesh.h"

namespace PE {
namespace Components {

struct ImageMesh : public Mesh
{
	PE_DECLARE_CLASS(ImageMesh);

	// Constructor -------------------------------------------------------------
	ImageMesh(PE::GameContext &context, PE::MemoryArena arena, Handle hMyself) : Mesh(context, arena, hMyself)
	{
		m_loaded = false;
	}

	virtual ~ImageMesh(){}

	virtual void addDefaultComponents();

	PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_GATHER_DRAWCALLS);
	virtual void do_GATHER_DRAWCALLS(Events::Event *pEvt);

	void loadFromString_needsRC(char* imageName, char* imagePackage, float width, float height, int &threadOwnershipMask);

	PrimitiveTypes::Bool m_loaded;
	Handle m_meshCPU;
};

}; // namespace Components
}; // namespace PE
#endif

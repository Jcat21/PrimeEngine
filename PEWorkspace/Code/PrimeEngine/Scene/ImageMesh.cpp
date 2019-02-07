#define NOMINMAX
// API Abstraction
#include "PrimeEngine/APIAbstraction/APIAbstractionDefines.h"

// Outer-Engine includes

// Inter-Engine includes
#include "PrimeEngine/FileSystem/FileReader.h"
#include "PrimeEngine/APIAbstraction/GPUMaterial/GPUMaterialSet.h"
#include "PrimeEngine/PrimitiveTypes/PrimitiveTypes.h"
#include "PrimeEngine/APIAbstraction/Texture/Texture.h"
#include "PrimeEngine/APIAbstraction/Effect/EffectManager.h"
#include "PrimeEngine/APIAbstraction/GPUBuffers/VertexBufferGPUManager.h"
#include "Light.h"
#include "PrimeEngine/GameObjectModel/Camera.h"

// Sibling/Children includes
#include "ImageMesh.h"
#include "SceneNode.h"
#include "CameraManager.h"
#include "../Lua/LuaEnvironment.h"
#include "PrimeEngine/Events/StandardEvents.h"
namespace PE {
namespace Components {

PE_IMPLEMENT_CLASS1(ImageMesh, Mesh);

void ImageMesh::addDefaultComponents()
{
	//add this handler before Mesh's handlers so we can intercept draw and modify transform
	PE_REGISTER_EVENT_HANDLER(Events::Event_GATHER_DRAWCALLS, ImageMesh::do_GATHER_DRAWCALLS);
	Mesh::addDefaultComponents();
}

void ImageMesh::loadFromString_needsRC(char* imageName, char* imagePackage, float width, float height, int &threadOwnershipMask)
{
	if (!m_meshCPU.isValid())
	{
		m_meshCPU = Handle("MeshCPU ImageMesh", sizeof(MeshCPU));
		new (m_meshCPU) MeshCPU(*m_pContext, m_arena);
	}
	MeshCPU &mcpu = *m_meshCPU.getObject<MeshCPU>();

	if (!m_loaded)
		mcpu.createBillboardMeshWithColorTexture(imageName, imagePackage, width, height, SamplerState_NoMips_NoMinTexelLerp_NoMagTexelLerp_Clamp);
	
	// this will cause not using the vertex buffer manager
	//so that engine always creates a new vertex buffer gpu and doesn't try to find and
	//existing one
	mcpu.m_manualBufferManagement = true;

	PositionBufferCPU *pVB = mcpu.m_hPositionBufferCPU.getObject<PositionBufferCPU>();
	TexCoordBufferCPU *pTCB = mcpu.m_hTexCoordBufferCPU.getObject<TexCoordBufferCPU>();
	NormalBufferCPU *pNB = mcpu.m_hNormalBufferCPU.getObject<NormalBufferCPU>();
	IndexBufferCPU *pIB = mcpu.m_hIndexBufferCPU.getObject<IndexBufferCPU>();
	pVB->m_values.reset(4 * 3); // 4 verts * (x,y,z)
	pTCB->m_values.reset(4 * 2);
	pNB->m_values.reset(4 * 3);
	pIB->m_values.reset(6); // 2 tris

	pIB->m_indexRanges[0].m_start = 0;
	pIB->m_indexRanges[0].m_end = 5;
	pIB->m_indexRanges[0].m_minVertIndex = 0;
	pIB->m_indexRanges[0].m_maxVertIndex = 3;

	pIB->m_minVertexIndex = pIB->m_indexRanges[0].m_minVertIndex;
	pIB->m_maxVertexIndex = pIB->m_indexRanges[0].m_maxVertIndex;

	float w = width;// 32.f / 2.0f;
	float h = height;// 32.f;

	pVB->m_values.add(-w/2.f, h/2.f, 0); // top left
	pVB->m_values.add(w/2.f, h/2.f, 0); // top right
	pVB->m_values.add(w/2.f, -h/2.f, 0); //bottom right
	pVB->m_values.add(-w/2.f, -h/2.f, 0); //bottom left

	pIB->m_values.add(0,1,2);
	pIB->m_values.add(2,3,0);

	pTCB->m_values.add(0, 0); // top left 10
	pTCB->m_values.add(1, 0); //bottom right01
	pTCB->m_values.add(1, 1); // top right 00
	pTCB->m_values.add(0, 1); //bottom left 11

	pNB->m_values.add(0, 0, 0);
	pNB->m_values.add(0, 0, 0);
	pNB->m_values.add(0, 0, 0);
	pNB->m_values.add(0, 0, 0);

	if (!m_loaded)
	{
		// first time creating gpu mesh
		loadFromMeshCPU_needsRC(mcpu, threadOwnershipMask);

		// dario note: image technique is hardcoded to ui type
		Handle hEffect = EffectManager::Instance()->getEffectHandle("StdMesh_2D_Diffuse_A_RGB_Tech");

		for (unsigned int imat = 0; imat < m_effects.m_size; imat++)
		{
			if (m_effects[imat].m_size)
				m_effects[imat][0] = hEffect;
		}
	
		m_loaded = true;
	}
	else
	{
		updateGeoFromMeshCPU_needsRC(mcpu, threadOwnershipMask);
	}
}

void ImageMesh::do_GATHER_DRAWCALLS(Events::Event *pEvt)
{

}


}; // namespace Components
}; // namespace PE


#include "ImageSceneNode.h"
#include "../Lua/LuaEnvironment.h"
#include "ImageMesh.h"
#include "PrimeEngine/Events/StandardEvents.h"
#include "MeshManager.h"
#include "MeshInstance.h"

namespace PE {
namespace Components {

PE_IMPLEMENT_CLASS1(ImageSceneNode, SceneNode);


// Constructor -------------------------------------------------------------
ImageSceneNode::ImageSceneNode(PE::GameContext &context, PE::MemoryArena arena, Handle hMyself)
: SceneNode(context, arena, hMyself)
{
	m_cachedAspectRatio = 1.0f;
	m_scale = 1.0f;
	if (IRenderer* pS = context.getGPUScreen())
		m_cachedAspectRatio = float(pS->getWidth()) / float(pS->getHeight());
}

void ImageSceneNode::addDefaultComponents()
{
	SceneNode::addDefaultComponents();


	// event handlers
	PE_REGISTER_EVENT_HANDLER(Events::Event_PRE_GATHER_DRAWCALLS, ImageSceneNode::do_PRE_GATHER_DRAWCALLS);
}

void ImageSceneNode::setSelfAndMeshAssetEnabled(bool enabled)
{
	setEnabled(enabled);

	if (m_hMyImageMesh.isValid())
	{
		m_hMyImageMesh.getObject<Component>()->setEnabled(enabled);
	}
}


void ImageSceneNode::loadFromString_needsRC(char* imageName, char* imagePackage, float width, float height, int &threadOwnershipMask)
{
	ImageMesh *pImageMesh = NULL;
	if (m_hMyImageMesh.isValid())
	{
		pImageMesh = m_hMyImageMesh.getObject<ImageMesh>();
	}
	else
	{
		m_hMyImageMesh = PE::Handle("IMAGEMESH", sizeof(ImageMesh));
		pImageMesh = new(m_hMyImageMesh) ImageMesh(*m_pContext, m_arena, m_hMyImageMesh);
		pImageMesh->addDefaultComponents();

		m_pContext->getMeshManager()->registerAsset(m_hMyImageMesh);

		m_hMyImageMeshInstance = PE::Handle("MeshInstance", sizeof(MeshInstance));
		MeshInstance *pInstance = new(m_hMyImageMeshInstance) MeshInstance(*m_pContext, m_arena, m_hMyImageMeshInstance);
		pInstance->addDefaultComponents();
		pInstance->initFromRegisteredAsset(m_hMyImageMesh);


		addComponent(m_hMyImageMeshInstance);
	}

	PE::IRenderer::checkForErrors("");

	pImageMesh->loadFromString_needsRC(imageName, imagePackage, width, height, threadOwnershipMask);
}

void ImageSceneNode::do_PRE_GATHER_DRAWCALLS(Events::Event *pEvt)
{
	Events::Event_PRE_GATHER_DRAWCALLS *pDrawEvent = NULL;
	pDrawEvent = (Events::Event_PRE_GATHER_DRAWCALLS *)(pEvt);

	Matrix4x4 projectionViewWorldMatrix = pDrawEvent->m_projectionViewTransform;
	Matrix4x4 worldMatrix;

	if (!m_hMyImageMeshInstance.isValid())
		return;

	ImageMesh *pImageMesh = m_hMyImageMesh.getObject<ImageMesh>();

	float numCharsInFullLine = 100.0f;
	numCharsInFullLine *= .5; // need to divide by 2.0 since screen goes from -1 to 1, not 0..1

	worldMatrix = m_worldTransform;

	float factor = 1.0f / (numCharsInFullLine)* m_scale;

	Matrix4x4 scale;
	scale.importScale(factor, factor*m_cachedAspectRatio, 1.f);
	m_worldTransform = worldMatrix * scale;

}

}; // namespace Components
}; // namespace PE

// APIAbstraction
#include "PrimeEngine/APIAbstraction/APIAbstractionDefines.h"

// Outer-Engine includes

// Inter-Engine includes
#include "PrimeEngine/APIAbstraction/GPUBuffers/VertexBufferGPUManager.h"
#include "PrimeEngine/APIAbstraction/GPUBuffers/ResourceBufferGPU.h"
#include "PrimeEngine/APIAbstraction/Effect/EffectManager.h"
#include "PrimeEngine/Geometry/MaterialCPU/MaterialSetCPU.h"
#include "../Lua/LuaEnvironment.h"
#include "PrimeEngine/Scene/SH_DRAW.h"

#include "PrimeEngine/Render/ShaderActions/SetPerEmitterConstantsShaderAction.h"

// Sibling/Children includes
#include "ParticleEmitter.h"


namespace PE {
namespace Components {

	using namespace PE::Events;

	PE_IMPLEMENT_CLASS1(ParticleEmitter, SceneNode);

	// Constructor -------------------------------------------------------------
	ParticleEmitter::ParticleEmitter(PE::GameContext &context, PE::MemoryArena arena, Handle hMyself)
		: SceneNode(context, arena, hMyself)
	{}

	// Methods      ------------------------------------------------------------
	void ParticleEmitter::initializeEmitter(unsigned int limit, unsigned int ptic, const char *texture, const char *package, const char* effect, EmitterParams ep)
	{
		// set some particle variables from the emitter initialization parameters
		m_particleLimit = limit;
		m_particlesPerTick = ptic;
		m_params = ep;

		// shader techniques
		m_effect = EffectManager::Instance()->getEffectHandle(effect);

		// material set
		Handle hMSCPU("MATERIAL_SET_CPU", sizeof(MaterialSetCPU));
		MaterialSetCPU *pmscpu = new(hMSCPU) MaterialSetCPU(*m_pContext, m_arena);
		pmscpu->createSetWithOneTexturedMaterial(texture, package);//, customSamplerState);
		m_hMaterialSetGPU = VertexBufferGPUManager::Instance()->createMatSetGPUFromMatSetCPU(hMSCPU);

		// create gpu buffers we need

		m_hVertexBufferGPU = VertexBufferGPUManager::Instance()->createGPUBufferForEmitter(m_FloatsPerParticle, limit);

		m_hParticlePoolBufferGPU = Handle("PARTICLEPOOL_BUFFER_GPU", sizeof(ResourceBufferGPU));
		ResourceBufferGPU *pppbgpu = new(m_hParticlePoolBufferGPU) ResourceBufferGPU(*m_pContext, m_arena);
		pppbgpu->createGPUBufferFromVertexBufferGPU(m_hVertexBufferGPU.getObject<VertexBufferGPU>(), true);

		m_hParticleOutputBufferGPU = Handle("PARTICLEOUTPUT_BUFFER_GPU", sizeof(ResourceBufferGPU));
		ResourceBufferGPU *ppobgpu = new(m_hParticleOutputBufferGPU) ResourceBufferGPU(*m_pContext, m_arena);
		ppobgpu->createGPUBufferFromVertexBufferGPU(m_hVertexBufferGPU.getObject<VertexBufferGPU>(), true);
		
	}

	void ParticleEmitter::gracefulDisable()
	{
		m_hParticleOutputBufferGPU.release();
		m_hParticlePoolBufferGPU.release();
		m_hVertexBufferGPU.release();
		m_hMaterialSetGPU.release();
		m_effect.release();

		m_isActive = false;
		m_isSkipped = true;
	}

	void ParticleEmitter::setEmitterShaderConstants(DrawList *pDrawList)
	{
		// set constant buffer
		Handle &hSV = pDrawList->nextShaderValue(sizeof(SetPerEmitterConstantsShaderAction));
		// create object referenced by Handle in DrawList
		// this handle will be released on end of draw call
		SetPerEmitterConstantsShaderAction *pSV = new(hSV) SetPerEmitterConstantsShaderAction(*m_pContext, m_arena);

		Vector3 basepos = m_base.getPos();
		Vector3 baseup = m_base.getV();

		pSV->m_data.gEmitPosition = Vector4(basepos.m_x, basepos.m_y, basepos.m_z, m_params.lifetime); //w = target lifetime
		pSV->m_data.gEmitPosVar = Vector4(m_params.posVariance.m_x, m_params.posVariance.m_y, m_params.posVariance.m_z, m_params.lifeVariance); //w = lifetime variance
		pSV->m_data.gEmitColorInitial = m_params.colorinitial;//alphas(alphae?) of colors are important;
		pSV->m_data.gEmitColorInitialVar = m_params.colorinitialvar;
		pSV->m_data.gEmitColorFinal = (m_params.colorfinal.m_w < 0)? m_params.colorinitial : m_params.colorfinal;
		pSV->m_data.gEmitColorFinalVar = m_params.colorfinalvar;
		pSV->m_data.gEmitSizes = Vector4(m_params.sizeinit, m_params.sizeinitvar, (m_params.sizefinal < 0)? m_params.sizeinit : m_params.sizefinal, m_params.sizefinalvar); //x = initial size, y = init size var, z =  final size, w = final size var
		pSV->m_data.gEmitRotates = Vector4(m_params.rotateinit, m_params.rotateinitvar, (m_params.rotatefinal < FLT_MAX) ? m_params.rotatefinal : m_params.rotateinit, m_params.rotatefinalvar); //kind of like sizes
		pSV->m_data.gEmitVelocity = Vector4(baseup.m_x, baseup.m_y, baseup.m_z, m_params.velocityMagnitude); //target direction is the up vector of the scene node, w = magnitude
		pSV->m_data.gEmitVelVar = Vector4(m_params.velVariance.m_x, m_params.velVariance.m_y, m_params.velVariance.m_z, m_params.velocityMagnitudeVar);
		pSV->m_data.gEmitAccel = Vector4(m_params.acceleration.m_x, m_params.acceleration.m_y, m_params.acceleration.m_z, m_isActive? 0 : 1); //if w == 0 we emit
		//because it's hard to randomize in gpu //we pass this everytime, so might as well //pretty sure it's bad practice?
		pSV->m_data.gEmitRandFloats = Vector4(
			static_cast <float> (rand()) / static_cast <float> (RAND_MAX),
			static_cast <float> (rand()) / static_cast <float> (RAND_MAX),
			static_cast <float> (rand()) / static_cast <float> (RAND_MAX), 
			static_cast <float> (rand()) / static_cast <float> (RAND_MAX)
		);		
	}
		
	void ParticleEmitter::addSA_Emit(DrawList *pDrawList)
	{
		#if PE_API_IS_D3D11
		Handle &hSV = pDrawList->nextShaderValue(sizeof(SA_Bind_Resource));
		SA_Bind_Resource *pSetTextureAction = new(hSV) SA_Bind_Resource(*m_pContext, m_arena);

		Handle buffa = m_isFirstAlternatePass ? m_hParticlePoolBufferGPU : m_hParticleOutputBufferGPU;

		PEASSERT(buffa.getObject<ResourceBufferGPU>()->m_resourceBufferLowLevel.m_pShaderResourceUAV != NULL, "shader resource not set");
		pSetTextureAction->set(
			GpuResourceSlot_ParticlePoolCSUAV,
			buffa.getObject<ResourceBufferGPU>()->m_resourceBufferLowLevel.m_pShaderResourceUAV,
			NULL, NULL, 0
		);
		#endif
	}

	void ParticleEmitter::addSA_Update(DrawList *pDrawList)
	{
		#if PE_API_IS_D3D11
		Handle &hSVa = pDrawList->nextShaderValue(sizeof(SA_Bind_Resource));
		SA_Bind_Resource *pSetTextureActiona = new(hSVa) SA_Bind_Resource(*m_pContext, m_arena);

		Handle buffa = m_isFirstAlternatePass ? m_hParticlePoolBufferGPU : m_hParticleOutputBufferGPU;

		PEASSERT(buffa.getObject<ResourceBufferGPU>()->m_resourceBufferLowLevel.m_pShaderResourceUAV != NULL, "shader resource not set");
		pSetTextureActiona->set(
			GpuResourceSlot_ParticlePoolCSUAV,
			buffa.getObject<ResourceBufferGPU>()->m_resourceBufferLowLevel.m_pShaderResourceUAV,
			NULL, NULL, 0
		);

		Handle &hSVb = pDrawList->nextShaderValue(sizeof(SA_Bind_Resource));
		SA_Bind_Resource *pSetTextureActionb = new(hSVb) SA_Bind_Resource(*m_pContext, m_arena);

		Handle buffb = !m_isFirstAlternatePass ? m_hParticlePoolBufferGPU : m_hParticleOutputBufferGPU;

		PEASSERT(buffb.getObject<ResourceBufferGPU>()->m_resourceBufferLowLevel.m_pShaderResourceUAV != NULL, "shader resource not set");
		pSetTextureActionb->set(
			GpuResourceSlot_ParticleOutputCSUAV,
			buffb.getObject<ResourceBufferGPU>()->m_resourceBufferLowLevel.m_pShaderResourceUAV,
			NULL, NULL, 0
		);
		#endif
	}

	void ParticleEmitter::addSA_VSView(DrawList *pDrawList)
	{
		#if PE_API_IS_D3D11
		Handle &hSV = pDrawList->nextShaderValue(sizeof(SA_Bind_Resource));
		SA_Bind_Resource *pSetTextureAction = new(hSV) SA_Bind_Resource(*m_pContext, m_arena);

		Handle buffb = !m_isFirstAlternatePass ? m_hParticlePoolBufferGPU : m_hParticleOutputBufferGPU;

		PEASSERT(buffb.getObject<ResourceBufferGPU>()->m_resourceBufferLowLevel.m_pShaderResourceView != NULL, "shader uav not set");
		pSetTextureAction->set(
			GpuResourceSlot_ParticleVertices,
			SamplerState_NotNeeded,
			buffb.getObject<ResourceBufferGPU>()->m_resourceBufferLowLevel.m_pShaderResourceView);
		#endif
	}

	void ParticleEmitter::addDefaultComponents()
	{
		Component::addDefaultComponents();

		addComponent(SingleHandler_DRAW::GetInstanceHandle());
		addComponent(PESSEH_CHANGE_TO_DEBUG_SHADER::GetInstanceHandle());
		addComponent(PESSEH_POP_SHADERS::GetInstanceHandle());
	}

	
}; // namespace Components
}; //namespace PE

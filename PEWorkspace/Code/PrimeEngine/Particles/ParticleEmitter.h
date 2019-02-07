
#ifndef __PARTICLE_EMITTER_H__
#define __PARTICLE_EMITTER_H__

#define NOMINMAX
// API Abstraction
#include "PrimeEngine/APIAbstraction/APIAbstractionDefines.h"

// Outer-Engine includes
#include <assert.h>

// Inter-Engine includes
#include "PrimeEngine/MemoryManagement/Handle.h"
#include "PrimeEngine/PrimitiveTypes/PrimitiveTypes.h"
#include "PrimeEngine/Scene/SceneNode.h"
#include "PrimeEngine/Scene/DrawList.h"
#include "../Events/Component.h"
#include "../Math/Vector3.h"
#include "../Math/Matrix4x4.h"

// Sibling/Children includes

namespace PE {
namespace Components {
	
	// there's a whole bunch of parameters related to this guy, so I store them here :3
	struct EmitterParams
	{
		Vector4 colorinitial = Vector4();
		Vector4 colorinitialvar = Vector4();
		Vector4 colorfinal = Vector4(-1,-1,-1,-1);
		Vector4 colorfinalvar = Vector4();
		Vector3 posVariance = Vector3(); //initialposition + [-variance/2,variance/2]
		Vector3 velVariance = Vector3();
		Vector3 acceleration = Vector3();
		float lifetime = 0;
		float lifeVariance = 0;
		float sizeinit = 0;
		float sizeinitvar = 0;
		float sizefinal = -1;
		float sizefinalvar = 0;
		float rotateinit = 0;
		float rotateinitvar = 0;
		float rotatefinal = FLT_MAX;
		float rotatefinalvar = 0;
		float velocityMagnitude = 0;
		float velocityMagnitudeVar = 0;

		/*
		Vector4 color = Vector4();
		Vector3 posVariance = Vector3(); //initialposition + [-variance/2,variance/2]
		float lifetime = 0;
		float lifeVariance = 0;
		*/
	};

	struct ParticleEmitter : public SceneNode
	{
		PE_DECLARE_CLASS(ParticleEmitter);

		// Constructor -------------------------------------------------------------
		ParticleEmitter(PE::GameContext &context, PE::MemoryArena arena, Handle hMyself);
		virtual ~ParticleEmitter() {}
		// Methods      ------------------------------------------------------------

		virtual void addDefaultComponents();

		void initializeEmitter(unsigned int limit, unsigned int ptic, const char *texture, const char *package, const char* effect, EmitterParams ep);
		void setEmitterShaderConstants(DrawList *pDrawList);

		void addSA_Emit(DrawList *pDrawList);
		void addSA_Update(DrawList *pDrawList);
		void addSA_VSView(DrawList *pDrawList);

		void gracefulDisable();

		// Individual events -------------------------------------------------------

		// check ParticlesStructsandConstants.fx if the same; is better if multiple of 4?
		int m_FloatsPerParticle = 20;

		bool m_isSkipped = false;
		bool m_isActive = true;
		bool m_isFirstAlternatePass = true;
		EmitterParams m_params;
		unsigned int m_particleLimit;
		unsigned int m_particlesPerTick;

		Handle m_hVertexBufferGPU;
		Handle m_hParticlePoolBufferGPU;
		Handle m_hParticleOutputBufferGPU;
		Handle m_hMaterialSetGPU;
		Handle m_effect;
	};

}; // namespace Components
}; // namespace PE
#endif
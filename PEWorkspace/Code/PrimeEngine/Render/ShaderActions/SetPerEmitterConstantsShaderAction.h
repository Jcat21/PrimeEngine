#ifndef __PYENGINE_2_0_SetPerEmitterConstants_SHADER_ACTION_H__
#define __PYENGINE_2_0_SetPerEmitterConstants_SHADER_ACTION_H__

// API Abstraction
#include "PrimeEngine/APIAbstraction/APIAbstractionDefines.h"

// Outer-Engine includes

// Inter-Engine includes
#include "PrimeEngine/Render/IRenderer.h"


#include "PrimeEngine/Render/D3D11Renderer.h"
#include "PrimeEngine/Render/D3D9Renderer.h"
#include "PrimeEngine/Render/GLRenderer.h"
#include "PrimeEngine/Math/Matrix4x4.h"
// Sibling/Children includes
#include "ShaderAction.h"

namespace PE {

namespace Components{
struct Effect;
}

struct SetPerEmitterConstantsShaderAction : ShaderAction
{
	SetPerEmitterConstantsShaderAction(PE::GameContext &context, PE::MemoryArena arena)
	{
		m_arena = arena; m_pContext = &context;
	}

	virtual ~SetPerEmitterConstantsShaderAction() {}

	virtual void bindToPipeline(Components::Effect *pCurEffect = NULL) ;
	virtual void unbindFromPipeline(Components::Effect *pCurEffect = NULL) ;
	virtual void releaseData() ;
#if PE_PLAT_IS_PSVITA
	static void * s_pBuffer;
#	elif APIABSTRACTION_D3D11
	static ID3D11Buffer * s_pBuffer; // the buffer is first filled with data and then bound to pipeline
	// unlike DX9 where we just set registers
#	endif
	PE::MemoryArena m_arena; PE::GameContext *m_pContext;

	// the actual data that is transferred to video memory
	struct Data 
	{
		Vector4 gEmitPosition; //w = target lifetime
		Vector4 gEmitPosVar; //w = lifetime variance
		Vector4 gEmitColorInitial;
		Vector4 gEmitColorInitialVar;
		Vector4 gEmitColorFinal;
		Vector4 gEmitColorFinalVar;
		Vector4 gEmitSizes; //x = initial size, y = init size var, z =  final size, w = final size var
		Vector4 gEmitRotates; //kind of like sizes
		Vector4 gEmitVelocity; //w =
		Vector4 gEmitVelVar; //w =
		Vector4 gEmitAccel; //if w == 0 we don't emit
		Vector4 gEmitRandFloats;
	} m_data;

	NameToData m_nameToData[1];

#	if APIABSTRACTION_OGL
	// we need this struct for OGL implementation with cg
	// because we need to store a list of cgParameters in each effect (vs setting register values in DX)
	struct PerEffectBindIds
	{
#       if APIABSTRACTION_IOS
		GLuint v_gViewProj, f_gViewProj;
		GLuint v_gPreviousViewProjMatrix, f_gPreviousViewProjMatrix;
		GLuint v_gViewProjInverseMatrix, f_gViewProjInverseMatrix;
		GLuint v_gViewInv, f_gViewInv;
		
		GLuint v_gLightWVP, f_gLightWVP;
		GLuint v_gEyePosW, f_gEyePosW;
		GLuint v_xyzgEyePosW_wDoMotionBlur, f_xyzgEyePosW_wDoMotionBlur;
        
        struct LightCGParams{
			GLuint pos;
			GLuint dir;
            
			GLuint ambient;
			GLuint diffuse;
			GLuint specular;
            
			GLuint atten_spot;
			GLuint range_type;
		};

#       else
		
		CGparameter v_gViewProj, f_gViewProj;
		CGparameter v_gPreviousViewProjMatrix, f_gPreviousViewProjMatrix;
		CGparameter v_gViewProjInverseMatrix, f_gViewProjInverseMatrix;
		CGparameter v_gViewInv, f_gViewInv;

		CGparameter v_gLightWVP, f_gLightWVP;
		CGparameter v_gEyePosW, f_gEyePosW;
		CGparameter v_xyzgEyePosW_wDoMotionBlur, f_xyzgEyePosW_wDoMotionBlur;

		struct LightCGParams{
			CGparameter pos;
			CGparameter dir;

			CGparameter ambient;
			CGparameter diffuse;
			CGparameter specular;

			CGparameter atten_spot;
			CGparameter range_type;
		};
#       endif
        LightCGParams v_gLight[NUM_LIGHT_SOURCES_DATAS], f_gLight[NUM_LIGHT_SOURCES_DATAS];
		void initialize(Components::Effect *pEffect);
        void initializeLightCGParams(unsigned int index, LightCGParams &out_v, LightCGParams &out_f, Components::Effect *pEffect);
	};
#endif
};


}; // namespace PE
#endif

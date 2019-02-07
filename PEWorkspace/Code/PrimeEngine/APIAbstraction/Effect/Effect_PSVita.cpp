#define NOMINMAX
#include "PrimeEngine/APIAbstraction/APIAbstractionDefines.h"
#include "Effect.h"

#include "EffectManager.h"

#include "PrimeEngine/FileSystem/FileWriter.h"
#include "../../Lua/LuaEnvironment.h"
#include "../../Lua/EventGlue/EventDataCreators.h"
#include "PrimeEngine/Utils/ErrorHandling.h"
#include "PrimeEngine/APIAbstraction/GPUBuffers/VertexBufferGPUManager.h"

#include "PrimeEngine/Game/Common/GameContext.h"

namespace PE {

namespace Components {

#if PE_PLAT_IS_PSVITA

	
/*	Define the MSAA mode.  This can be changed to 4X on ES1 hardware to use 4X
	multi-sample anti-aliasing, and can be changed to 4X or 2X on ES2 hardware.
*/
#define MSAA_MODE					SCE_GXM_MULTISAMPLE_NONE
void checkErrCode(SceGxmErrorCode err)
{
	switch (err)
	{
	case SCE_OK: break;
	case SCE_GXM_ERROR_UNSUPPORTED: PEASSERT(false, "SCE_GXM_ERROR_UNSUPPORTED");
		break;
	case SCE_GXM_ERROR_INVALID_POINTER:  PEASSERT(false, "SCE_GXM_ERROR_INVALID_POINTER");
		break;
	case SCE_GXM_ERROR_INVALID_VALUE: PEASSERT(false, "SCE_GXM_ERROR_INVALID_VALUE");
		break;
	case SCE_GXM_ERROR_INVALID_ALIGNMENT: PEASSERT(false, "SCE_GXM_ERROR_INVALID_ALIGNMENT");
		break;
	case SCE_GXM_ERROR_OUT_OF_HOST_MEMORY: PEASSERT(false, "SCE_GXM_ERROR_OUT_OF_HOST_MEMORY"); 
		break;
	case SCE_GXM_ERROR_OUT_OF_FRAGMENT_USSE_MEMORY: PEASSERT(false, "SCE_GXM_ERROR_OUT_OF_FRAGMENT_USSE_MEMORY");
		break;
	}
}

static bool loadFragmentShader_PSVita(PE::GameContext &ctx, const char *filename, const char *name,
	PEAlphaBlendState *pBlendState,
	const SceGxmProgram *gxmProgram,
	const SceGxmProgram *gxmVertexProgram,
	SceGxmShaderPatcherId &out_programId,
	SceGxmFragmentProgram * &out_program
	)
{
	PEString::generatePathname(ctx, filename, "Default", "GPUPrograms", PEString::s_buf, PEString::BUF_SIZE);

	PEINFO("PE: PROGRESS: loading shader: %s from %s\n", name, PEString::s_buf);

	if (strcmp("main", name))
	{
		assert(!"Only shaders programs with name \"main()\" are supported");
	}

	PSVitaRenderer *pPSVitaRenderer = static_cast<PSVitaRenderer *>(ctx.getGPUScreen());

	SceGxmErrorCode err = sceGxmShaderPatcherRegisterProgram(pPSVitaRenderer->m_shaderPatcher, gxmProgram, &out_programId);
	PEASSERT(err == SCE_OK, "Error creating shader patcher id");
	SceGxmFragmentProgram *clearFragmentProgram = NULL;
	
	err = sceGxmShaderPatcherCreateFragmentProgram(
		pPSVitaRenderer->m_shaderPatcher,
		out_programId,
		SCE_GXM_OUTPUT_REGISTER_FORMAT_UCHAR4,
		MSAA_MODE,
		pBlendState->m_blendEnabled ? &pBlendState->m_blendInfo : NULL,
		gxmVertexProgram,
		&out_program);

	checkErrCode(err);

	PEASSERT(err == SCE_OK, "Error creating shader");

	return true;
}

static bool loadVertexShader_PSVita(PE::GameContext &ctx, const char *filename, const char *name,
	EPEVertexFormat format,
	Effect *pEffect,
	const SceGxmProgram *gxmProgram,
	SceGxmShaderPatcherId &out_programId,
	SceGxmVertexProgram *out_programs[]
	)
{
	PEString::generatePathname(ctx, filename, "Default", "GPUPrograms", PEString::s_buf, PEString::BUF_SIZE);

	PEINFO("PE: PROGRESS: loading shader: %s from %s\n", name, PEString::s_buf);

	if (strcmp("main", name))
	{
		assert(!"Only shaders programs with name \"main()\" are supported");
	}

	PSVitaRenderer *pPSVitaRenderer = static_cast<PSVitaRenderer *>(ctx.getGPUScreen());

	SceGxmErrorCode err = sceGxmShaderPatcherRegisterProgram(pPSVitaRenderer->m_shaderPatcher, gxmProgram, &out_programId);
	PEASSERT(err == SCE_OK, "Error creating shader patcher id");
	
	pEffect->m_externalPerTechniqueData.initVertexAttributeBindings(pEffect); // need these to assign to vertex buffer infos

	for (int iBufferLayout = 0; iBufferLayout < PEVertexFormatLayout_Count; ++iBufferLayout)
	{
		PEVertexBufferInfo &bufferLayoutInfo = VertexBufferGPUManager::Instance()->m_vertexBufferInfos[iBufferLayout];
		EPEVertexFormat iFormat = VertexBufferGPUManager::Instance()->m_layoutToFormatMap[iBufferLayout];
		if (format == iFormat)
		{
			for (int iAttr = 0; iAttr < bufferLayoutInfo.m_apiVertexAttributes.m_size; ++iAttr)
			{
				bufferLayoutInfo.m_apiVertexAttributes[iAttr].regIndex = -1;
			}

			// set bindings in buffers infos, by going through raw api-abstract data of buffer infos
			// and figuring out which binding to use for destination api info
			int iApiAttrIndex = 0;
			for (int iBuf = 0; iBuf < bufferLayoutInfo.m_bufferInfos.m_size; ++iBuf)
			{
				PEVertexAttributeBufferInfo &bufInfo = bufferLayoutInfo.m_bufferInfos[iBuf];
				for (int iSem = 0; iSem < bufInfo.m_numAttributes; ++iSem)
				{
					PEVertexAttributeInfo &attrInfo = bufInfo.m_attributeInfos[iSem];
					// this does something like
					// for detailed_mesh's vertex attribute position, in this shader position is bound result of to sceGxmProgramParameterGetResourceIndex
					
					GLSLAttributeLocations::ApiBindingType resBinding = sceGxmProgramFindParameterBySemantic(gxmProgram, (SceGxmParameterSemantic)(attrInfo.m_apiSemantic), attrInfo.m_apiSemanticOrder);
					PEASSERT(resBinding && (sceGxmProgramParameterGetCategory(resBinding) == SCE_GXM_PARAMETER_CATEGORY_ATTRIBUTE), "Problem finding vertex attribute");

					uint32_t regIndex = sceGxmProgramParameterGetResourceIndex(resBinding);
					PEASSERT(regIndex != -1, "Invalid Index\n");

					bufferLayoutInfo.m_apiVertexAttributes[iApiAttrIndex].regIndex = regIndex;
					

					++iApiAttrIndex;
				}
			}
			
			SceGxmVertexAttribute *pVertexAttribute = bufferLayoutInfo.m_apiVertexAttributes.getFirstPtr();
			int numVertexAttrs = bufferLayoutInfo.m_apiVertexAttributes.m_size;
			SceGxmVertexStream *pVertexStream = bufferLayoutInfo.m_apiVertexStreams.getFirstPtr();
			int numStreams = bufferLayoutInfo.m_apiVertexStreams.m_size;

			err = sceGxmShaderPatcherCreateVertexProgram(
				pPSVitaRenderer->m_shaderPatcher,
				out_programId,
				pVertexAttribute,
				numVertexAttrs,
				pVertexStream,
				numStreams,
				&out_programs[iBufferLayout]);
			checkErrCode(err);
			PEASSERT(err == SCE_OK, "Error creating shader");
		}
	}

	return true;
}


void Effect::loadTechnique_PSVita(const char *vsFilename, const char *vsName, 
    const char *psFilename, const char *psName,
    const char *techniqueName,
    bool reload)
{
	lock();

	m_isReady = false;

	StringOps::writeToString(techniqueName, m_techName, 256);

	StringOps::writeToString(vsName, m_vsName, 256);
	StringOps::writeToString(vsFilename, m_vsFilename, 256);

	StringOps::writeToString(psName, m_psName, 256);
	StringOps::writeToString(psFilename, m_psFilename, 256);

	StringOps::writeToString("", m_gsName, 256);
	StringOps::writeToString("", m_gsFilename, 256);

	StringOps::writeToString("", m_csName, 256);
	StringOps::writeToString("", m_csFilename, 256);

	StringOps::writeToString("", m_spesFilename, 256);
	StringOps::writeToString("", m_spesName, 256);

	unlock();

	loadTechniqueAsync(); // calls loadTechniqueSync either within function or from different thread
}

void Effect::loadTechniqueSync_PSVita()
{
	lock();
    
    PSVitaRenderer *pPSVitaRenderer = static_cast<PSVitaRenderer *>(m_pContext->getGPUScreen());
    
	if (StringOps::length(m_spesFilename)){return;}
	if (StringOps::length(m_gsFilename)){return;}
	if (StringOps::length(m_csFilename)){return;}

	//D3DXMACRO Shader_Macros[3] = { {"HLSL_SEPARATE_LOAD", "1"} , {"APIABSTRACTION_D3D9", "1"} , {0, 0}};
	if (StringOps::length(m_vsFilename))
	{
		PEString::generatePathname(*m_pContext, m_vsFilename, "Default", "GPUPrograms", PEString::s_buf, PEString::BUF_SIZE);
		FileReader f(PEString::s_buf);
		char *data = NULL;
		PrimitiveTypes::UInt32 size;
		f.readIntoBuffer(data, size);
		m_pBasicVertexProgramGxp = (SceGxmProgram*)data;
	}

	if (StringOps::length(m_psFilename))
	{
		/* todo: don't compile pixel shaders
        int existingIndex = EffectManager::Instance()->m_pixelShaders.findIndex(m_psName);
         
        if (existingIndex != -1)
		{
			pPixelShader = EffectManager::Instance()->m_pixelShaders.m_pairs[existingIndex];
		}
		else
		*/
		{
			PEString::generatePathname(*m_pContext, m_psFilename, "Default", "GPUPrograms", PEString::s_buf, PEString::BUF_SIZE);
			FileReader f(PEString::s_buf);
			char *data = NULL;
			PrimitiveTypes::UInt32 size;
			f.readIntoBuffer(data, size);
			m_pBasicFragmentProgramGxp = (SceGxmProgram*)data;
			SceGxmErrorCode gxmErrorCode = sceGxmProgramCheck(m_pBasicFragmentProgramGxp);
			switch(gxmErrorCode)
			{
			case SCE_OK: PEINFO("sceGxmProgramCheck() : OK\n"); break;
			case SCE_GXM_ERROR_INVALID_POINTER: PEINFO("sceGxmProgramCheck() : SCE_GXM_ERROR_INVALID_POINTER\n"); break;
			case SCE_GXM_ERROR_INVALID_VALUE: PEINFO("sceGxmProgramCheck() : SCE_GXM_ERROR_INVALID_VALUE\n"); break;
			}
			PEASSERT(gxmErrorCode == SCE_OK, "check failed\n");

			gxmErrorCode = sceGxmProgramCheck(m_pBasicVertexProgramGxp);
			switch(gxmErrorCode)
			{
			case SCE_OK: PEINFO("sceGxmProgramCheck() : OK\n"); break;
			case SCE_GXM_ERROR_INVALID_POINTER: PEINFO("sceGxmProgramCheck() : SCE_GXM_ERROR_INVALID_POINTER\n");break;
			case SCE_GXM_ERROR_INVALID_VALUE: PEINFO("sceGxmProgramCheck() : SCE_GXM_ERROR_INVALID_VALUE\n");break;
			}
			PEASSERT(gxmErrorCode == SCE_OK, "check failed\n");

			if (!loadFragmentShader_PSVita(*m_pContext, m_psFilename, m_psName,
				m_pBlendState,
				m_pBasicFragmentProgramGxp,
				m_pBasicVertexProgramGxp,
				m_basicFragmentProgramId,
				m_basicFragmentProgram
				)) 
			{
				assert(!"Could not compile fragment program");
				unlock();
				return;
			}
		}
	}

	if (m_pBasicVertexProgramGxp)
	{
		if (!loadVertexShader_PSVita(*m_pContext, m_vsFilename, m_vsName,
			m_vsVertexFormat,
			this,
			m_pBasicVertexProgramGxp,
			m_basicVertexProgramId,
			m_basicVertexProgram
			))
		{
			assert(!"Could not compile vertex program");
			unlock();
			return;
		}
	}

	m_externalPerTechniqueData.init(this);

	m_isReady = true;
	unlock();
}
#endif
}; // namespace Components
}; // namespace PE

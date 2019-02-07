
#ifndef SampleWorkspace_GLSLAttributes_h
#define SampleWorkspace_GLSLAttributes_h


#include "PrimeEngine/Render/IRenderer.h"
#include "PrimeEngine/Render/GLRenderer.h"
#include "PrimeEngine/Render/PSVitaRenderer.h"

#include "PrimeEngine/APIAbstraction/GPUBuffers/BufferInfo.h"

namespace PE{
    namespace Components{
        struct Effect;
    };

struct GLSLAttributeLocations
{
#if APIABSTRACTION_IOS
	typedef GLuint ApiBindingType;
    GLuint vIn_iPosL_Attrib;
    GLuint vIn_iTexCoord_Attrib;
    GLuint vIn_iNormal_Attrib;
    GLuint vIn_iTangent_Attrib;
    GLuint vIn_iColor_Attrib;
    
    GLuint vIn_jointWeights_Attrib;
    GLuint vIn_jointWeights1_Attrib;
    GLuint vIn_jointIndices_Attrib;
    GLuint vIn_jointIndices1_Attrib;
#elif PE_PLAT_IS_PSVITA
	typedef const SceGxmProgramParameter * ApiBindingType;

	const SceGxmProgramParameter * vIn_iPosL_Attrib;
	const SceGxmProgramParameter * vIn_iTexCoord_Attrib;
	const SceGxmProgramParameter * vIn_iNormal_Attrib;
	const SceGxmProgramParameter * vIn_iTangent_Attrib;
	const SceGxmProgramParameter * vIn_iColor_Attrib;

	const SceGxmProgramParameter * vIn_jointWeights_Attrib;
	const SceGxmProgramParameter * vIn_jointWeights1_Attrib;
	const SceGxmProgramParameter * vIn_jointIndices_Attrib;
	const SceGxmProgramParameter * vIn_jointIndices1_Attrib;
#else
	typedef void * ApiBindingType;

#endif

    void initialize(Components::Effect *pEffect);
private:
	void findAttrBinding(Components::Effect *pEffect, ApiBindingType &resBinding, const char *name);
};

}; //namespace PE
#endif

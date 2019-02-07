#ifndef __PYENGINE_2_0_PSVita_Renderer_H___
#define __PYENGINE_2_0_PSVita_Renderer_H___
#if PE_PLAT_IS_PSVITA
#include "PrimeEngine/APIAbstraction/APIAbstractionDefines.h"	

// Inter-Engine includes
#include "PrimeEngine/MemoryManagement/Handle.h"
#include "PrimeEngine/Utils/PEClassDecl.h"

#include "PrimeEngine/Math/Vector4.h"
#include "PrimeEngine/Render/IRenderer.h"


#include <gxm.h>
#include <kernel.h>
#include <stdlib.h>
#include <libsysmodule.h>

#include <string.h>
#include <stdlib.h>
#include <sceconst.h>
#include <libdbg.h>
#include <kernel.h>
#include <display.h>
#include <ctrl.h>
#include <gxm.h>
#include <math.h>
#include <stdio.h>

/*	Define the number of back buffers to use with this sample.  Most applications
	should use a value of 2 (double buffering) or 3 (triple buffering).
*/
#define DISPLAY_BUFFER_COUNT		3

namespace PE {
    
    // forward declaration of texture class
    struct TextureGPU;
    
    class PSVitaRenderer : public IRenderer
    {
    public:
        
        void initialiseContext();
        void uninitialiseContext();
       
        virtual void setRenderTargetsAndViewportWithDepth(TextureGPU *pDestColorTex = 0, TextureGPU *pDestDepthTex = 0, bool clearRenderTargte = false, bool clearDepth = false);
        
        virtual void setDepthStencilOnlyRenderTargetAndViewport(TextureGPU *pDestDepthTex, bool clear = false);
        
        virtual void setRenderTargetsAndViewportWithNoDepth(TextureGPU *pDestColorTex = 0, bool clear = false);

		virtual PrimitiveTypes::UInt32 getWidth(){return m_width;}
		virtual PrimitiveTypes::UInt32 getHeight(){return m_height;}
		virtual void setClearColor(Vector4 color){m_clearColor = color;}
		virtual void setVSync(bool useVsync);
		
		virtual void swap(bool vsync = 0);
		virtual void clear();
		virtual void endRenderTarget(TextureGPU *pTex);
		virtual void endFrame();

		bool checkForErrors(const char *situation);

        static char s_dbgStr[80];
        static bool s_debugGfx;
    private:
 
        PSVitaRenderer(PE::GameContext &context, unsigned int width, unsigned int height);

	public:
              
        void clearDepthAndStencil()
        {

        }
        
        void processOSEventsIntoGlobalEventQueue()
        {

        }

	public:
        Vector4 m_clearColor;
       
        PrimitiveTypes::UInt32 m_width, m_height;

		PE::GameContext *m_pContext;
		friend class IRenderer;

		uint32_t m_backBufferIndex;
		uint32_t m_frontBufferIndex;
		SceGxmContext *m_context;
		SceGxmRenderTarget *m_renderTarget;
		SceGxmDepthStencilSurface m_depthSurface;

		void *m_displayBufferData[DISPLAY_BUFFER_COUNT];
		SceUID m_displayBufferUid[DISPLAY_BUFFER_COUNT];

		SceGxmColorSurface m_displaySurface[DISPLAY_BUFFER_COUNT];
		SceGxmSyncObject *m_displayBufferSync[DISPLAY_BUFFER_COUNT];

		SceGxmShaderPatcher *m_shaderPatcher;

    };

	void *graphicsAlloc(SceKernelMemBlockType type, uint32_t size, uint32_t alignment, uint32_t attribs, SceUID *uid);

	void graphicsFree(SceUID uid);
}; // namespace PE
#endif // API guard
#endif // File guard

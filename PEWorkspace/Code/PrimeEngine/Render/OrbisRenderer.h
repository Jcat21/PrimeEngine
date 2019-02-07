#ifndef __PYENGINE_2_0_Orbis_Renderer_H___
#define __PYENGINE_2_0_Orbis_Renderer_H___
#if PE_PLAT_IS_ORBIS
#include "PrimeEngine/APIAbstraction/APIAbstractionDefines.h"	

// Inter-Engine includes
#include "PrimeEngine/MemoryManagement/Handle.h"
#include "PrimeEngine/Utils/PEClassDecl.h"

#include "PrimeEngine/Math/Vector4.h"
#include "PrimeEngine/Render/IRenderer.h"


#include <gnm.h>
#include <kernel.h>
#include <stdlib.h>
#include <libsysmodule.h>

#include <string.h>
#include <stdlib.h>
#include <sceconst.h>
#include <libdbg.h>
#include <kernel.h>
#include <math.h>
#include <stdio.h>

/*	Define the number of back buffers to use with this sample.  Most applications
	should use a value of 2 (double buffering) or 3 (triple buffering).
*/
#define DISPLAY_BUFFER_COUNT		3


namespace sce
{
	namespace Gnmx
	{
		namespace Toolkit
		{
			struct IAllocator
			{
				void* m_instance;
				void *(*m_allocate)(void *instance, uint32_t size, sce::Gnm::AlignmentType alignment);
				void(*m_release)(void *instance, void *pointer);

				void *allocate(uint32_t size, sce::Gnm::AlignmentType alignment)
				{
					return m_allocate(m_instance, size, alignment);
				}
				void *allocate(sce::Gnm::SizeAlign sizeAlign)
				{
					return m_allocate(m_instance, sizeAlign.m_size, sizeAlign.m_align);
				}

				void release(void *pointer)
				{
					if (pointer != NULL)
						m_release(m_instance, pointer);
				}
			};
		}
	}
}

namespace sce
{
	namespace Gnmx
	{
		namespace Toolkit
		{
			struct StackAllocator
			{
				bool m_isInitialized;
				StackAllocator();
				~StackAllocator();
				enum { kMaximumAllocations = 8192 };
				uint8_t *m_allocation[kMaximumAllocations];
				uint32_t m_allocations;
				uint8_t *m_base;
				uint32_t m_alignment;
				off_t m_offset;
				size_t m_size;
				off_t m_top;
				SceKernelMemoryType m_type;
				void init(SceKernelMemoryType type, uint32_t size);
				void *allocate(uint32_t size, uint32_t alignment);
				void *allocate(Gnm::SizeAlign sizeAlign)
				{
					return allocate(sizeAlign.m_size, sizeAlign.m_align);
				}
				void release(void* pointer);
				void deinit();
			};

			IAllocator GetInterface(StackAllocator *stackAllocator);
		}
	}
}


namespace PE {
    
    // forward declaration of texture class
    struct TextureGPU;
    
    class OrbisRenderer : public IRenderer
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
 
        OrbisRenderer(PE::GameContext &context, unsigned int width, unsigned int height);

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

		sce::Gnm::RenderTarget m_fbTarget;
		sce::Gnm::DrawCommandBuffer m_dcb;

// 		SceGxmContext *m_context;
// 		SceGxmRenderTarget *m_renderTarget;
// 		SceGxmDepthStencilSurface m_depthSurface;
// 
// 		void *m_displayBufferData[DISPLAY_BUFFER_COUNT];
// 		SceUID m_displayBufferUid[DISPLAY_BUFFER_COUNT];
// 
// 		SceGxmColorSurface m_displaySurface[DISPLAY_BUFFER_COUNT];
// 		SceGxmSyncObject *m_displayBufferSync[DISPLAY_BUFFER_COUNT];
// 
// 		SceGxmShaderPatcher *m_shaderPatcher;

    };

// 	void *graphicsAlloc(SceKernelMemBlockType type, uint32_t size, uint32_t alignment, uint32_t attribs, SceUID *uid);
// 
// 	void graphicsFree(SceUID uid);
}; // namespace PE
#endif // API guard
#endif // File guard


#include "PrimeEngine/APIAbstraction/APIAbstractionDefines.h"

#include "OrbisRenderer.h"

#include "PrimeEngine/Events/EventQueueManager.h"
#include "PrimeEngine/Events/StandardEvents.h"
#include "PrimeEngine/MainFunction/MainFunctionArgs.h"
#include "PrimeEngine/Game/Client/ClientGame.h"
#include "PrimeEngine/Utils/ErrorHandling.h"
#include "PrimeEngine/APIAbstraction/Texture/Texture.h"


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


// Helper macro to align a value
#define ALIGN(x, a)					(((x) + ((a) - 1)) & ~((a) - 1))


Gnmx::Toolkit::StackAllocator::StackAllocator()
	: m_isInitialized(false)
{
}

Gnmx::Toolkit::StackAllocator::~StackAllocator()
{
	if (m_isInitialized)
	{
		deinit();
	}
}

void Gnmx::Toolkit::StackAllocator::init(SceKernelMemoryType type, uint32_t size)
{
	SCE_GNM_ASSERT(false == m_isInitialized);
	m_allocations = 0;
	m_top = 0;
	m_type = type;
	m_size = size;
	m_alignment = 2 * 1024 * 1024;
	m_base = 0;
	int retSys = sceKernelAllocateDirectMemory(0,
		SCE_KERNEL_MAIN_DMEM_SIZE,
		m_size,
		m_alignment, // alignment
		m_type,
		&m_offset);
	SCE_GNM_ASSERT(retSys == 0);
	retSys = sceKernelMapDirectMemory(&reinterpret_cast<void*&>(m_base),
		m_size,
		SCE_KERNEL_PROT_CPU_READ | SCE_KERNEL_PROT_CPU_WRITE | SCE_KERNEL_PROT_GPU_ALL,
		0,						//flags
		m_offset,
		m_alignment);
	SCE_GNM_ASSERT(retSys == 0);
	m_isInitialized = true;
}

void Gnmx::Toolkit::StackAllocator::deinit()
{
	SCE_GNM_ASSERT(true == m_isInitialized);
	int ret = sceKernelReleaseDirectMemory(m_offset, m_size);
	SCE_GNM_ASSERT(ret == 0);
	m_isInitialized = false;
}

void *Gnmx::Toolkit::StackAllocator::allocate(uint32_t size, uint32_t alignment)
{
	SCE_GNM_ASSERT(m_allocations < kMaximumAllocations);
	const uint32_t mask = alignment - 1;
	m_top = (m_top + mask) & ~mask;
	void* result = m_allocation[m_allocations++] = m_base + m_top;
	m_top += size;
	SCE_GNM_ASSERT(m_top <= static_cast<off_t>(m_size));
	return result;
}

void Gnmx::Toolkit::StackAllocator::release(void* pointer)
{
	SCE_GNM_ASSERT(m_allocations > 0);
	uint8_t* lastPointer = m_allocation[--m_allocations];
	SCE_GNM_ASSERT(lastPointer == pointer);
	m_top = lastPointer - m_base; // this may not rewind far enough if subsequent allocation has looser alignment than previous one
}

namespace
{
	void *allocate(void *instance, uint32_t size, sce::Gnm::AlignmentType alignment)
	{
		return static_cast<Gnmx::Toolkit::StackAllocator*>(instance)->allocate(size, alignment);
	}
	void release(void *instance, void *pointer)
	{
		static_cast<Gnmx::Toolkit::StackAllocator*>(instance)->release(pointer);
	}
};

Gnmx::Toolkit::IAllocator Gnmx::Toolkit::GetInterface(Toolkit::StackAllocator *stackAllocator)
{
	Toolkit::IAllocator allocator;
	allocator.m_instance = stackAllocator;
	allocator.m_allocate = allocate;
	allocator.m_release = release;
	return allocator;
}

Gnmx::Toolkit::StackAllocator s_garlicAllocator;
Gnmx::Toolkit::StackAllocator s_onionAllocator;

namespace PE {
    char OrbisRenderer::s_dbgStr[80];
    bool OrbisRenderer::s_debugGfx = true;
    
    void OrbisRenderer::setRenderTargetsAndViewportWithDepth(TextureGPU *pDestColorTex, TextureGPU *pDestDepthTex, bool clearRenderTarget, bool clearDepth)
    {
        static float xadd = 0;
#if 0
        xadd += 0.01f;
        if (xadd > 1.0f)
            xadd = 0;
#endif
        if (pDestColorTex != 0)
		{
			PEASSERT(false, "Not implememtned yet!");
		}
		else
		{
		
		}
        IRenderer::checkForErrors("setRenderTargetsAndViewportWithDepth");
        
		IRenderer::checkRenderBufferComplete();

        static float addDefault = 1.0;
        static float addCustom = 0;
        if (clearRenderTarget)
        {
			 if (clearDepth) // color and depth
            {
                float clearDepth = 1.0f;
            }
            else
            {

            }
        }
        else
        {
            // depth only
            float clearDepth = 1.0f;
        }
        
		// Unless using MRT, the pixel shader will output to render target 0.
		m_dcb.setRenderTarget(0, &m_fbTarget);

		// Enable RGBA write to Render Target 0
		// MRT color mask is a bit mask to control which color components are written into which render target
		// starting from the low bits to high bits per render targets (up to 8 render targets).
		m_dcb.setRenderTargetMask(0xF);

		PEASSERT(err == SCE_OK, "Error beginning scene");
    }
    
    void OrbisRenderer::endRenderTarget(TextureGPU *pTex)
    {
		// end the scene on the main render target, submitting rendering work to the GPU
		if (pTex == NULL)
		{
			// default render target
			sceGxmEndScene(m_context, NULL, NULL);
		}
		else
		{
			PEASSERT(false, "Not supported yet..");
		}
    }

	void OrbisRenderer::endFrame()
	{
		// end the scene on the main render target, submitting rendering work to the GPU
		sceGxmEndScene(m_context, NULL, NULL);

		// PA heartbeat to notify end of frame
		sceGxmPadHeartbeat(&m_displaySurface[m_backBufferIndex], m_displayBufferSync[m_backBufferIndex]);
	}
	
    void OrbisRenderer::setRenderTargetsAndViewportWithNoDepth(TextureGPU *pDestColorTex, bool clear)
    {
		PEASSERT(false, "Not supported yet..");
    }
    
    void OrbisRenderer::setDepthStencilOnlyRenderTargetAndViewport(TextureGPU *pDestDepthTex, bool clear)
    {
		PEASSERT(false, "Not supported yet..");
    }

	OrbisRenderer::OrbisRenderer(PE::GameContext &ctx, unsigned int width, unsigned int height)
		: IRenderer(ctx, width, height)
		, m_pContext(&ctx)
		#if PE_PLAT_IS_PSVITA
		, m_context(NULL)
		#endif
    {
        m_width = 1920;
        m_height = 1080;


        initialiseContext();
    }
    
    void OrbisRenderer::initialiseContext()
    {
		int err = SCE_OK;
		UNUSED(err);

		m_backBufferIndex = 0;
		m_frontBufferIndex = 0;

		s_garlicAllocator.init(SCE_KERNEL_WC_GARLIC, garlicSize);
		s_onionAllocator.init(SCE_KERNEL_WB_ONION, onionSize);

		//
		// Setup the render target:
		//

		const Gnm::DataFormat format = Gnm::kDataFormatB8G8R8A8UnormSrgb; // render target pixel format

																		  // Creating render target descriptor and initializing it.
		
		Gnm::TileMode tileMode;
		GpuAddress::computeSurfaceTileMode(&tileMode, GpuAddress::kSurfaceTypeColorTargetDisplayable, format, 1);
		Gnm::SizeAlign fbSize = m_fbTarget.init(m_width, m_height, 1, format, tileMode, Gnm::kNumSamples1, Gnm::kNumFragments1, NULL, NULL);

		// Allocate render target buffer in video memory
		void *fbBaseAddr = s_garlicAllocator.allocate(fbSize);

		// In order to simplify the code, use a memset to clear the render target.
		// This method should NOT be used once the GPU start using the memory.
		memset(fbBaseAddr, 0xFF, fbSize.m_size);

		// Set render target memory base address (gpu address)
		m_fbTarget.setAddresses(fbBaseAddr, 0, 0);


		//
		// Create a synchronization point:
		//

		// Allocate a buffer in video shared memory for synchronization
		// Note: the pointer is "volatile" to make sure the compiler doesn't optimized out the read to that memory address.
		volatile uint64_t *label = (volatile uint64_t*)s_onionAllocator.allocate(sizeof(uint64_t), sizeof(uint64_t));



		//
		// Setup the Command Buffer:
		//

		// Create and initialize a draw command buffer
		// Once created (and after each resetBuffer call), it is highly recommended to call: initializeDefaultHardwareState()
		
		m_dcb.init(s_garlicAllocator.allocate(Gnm::kIndirectBufferMaximumSizeInBytes, Gnm::kAlignmentOfBufferInBytes), Gnm::kIndirectBufferMaximumSizeInBytes, NULL, NULL);
		m_dcb.initializeDefaultHardwareState();

		// Unless using MRT, the pixel shader will output to render target 0.
		m_dcb.setRenderTarget(0, &m_fbTarget);

		// Enable RGBA write to Render Target 0
		// MRT color mask is a bit mask to control which color components are written into which render target
		// starting from the low bits to high bits per render targets (up to 8 render targets).
		m_dcb.setRenderTargetMask(0xF);




    }
    
    void OrbisRenderer::uninitialiseContext()
    {

    }

	void OrbisRenderer::setVSync(bool useVsync)
	{
        #if PE_PLAT_IS_WIN32
            wglSwapIntervalEXT((int)(useVsync));
        #elif PE_PLAT_IS_PS3
            glDisable(GL_VSYNC_SCE);
        #endif
	}
    
    void OrbisRenderer::swap(bool vsync /* = 0*/) {
		// queue the display swap for this frame
		DisplayData displayData;
		displayData.address = m_displayBufferData[m_backBufferIndex];
		SceGxmErrorCode err = sceGxmDisplayQueueAddEntry(
			m_displayBufferSync[m_frontBufferIndex],	// front buffer is OLD buffer
			m_displayBufferSync[m_backBufferIndex],		// back buffer is NEW buffer
			&displayData);
		
		PEASSERT(err == SCE_OK, "Error during sceGxmDisplayQueueAddEntry");

		// update buffer indices
		m_frontBufferIndex = m_backBufferIndex;
		m_backBufferIndex = (m_backBufferIndex + 1) % DISPLAY_BUFFER_COUNT;
    }
    
    void OrbisRenderer::clear(){
        PEINFO("Need to implement clear()");
        //glClear(;
    }
    
// IRenderer static method implementation

void IRenderer::Construct(PE::GameContext &context, unsigned int width, unsigned int height)
{
	PE::Handle h("OrbisRenderer", sizeof(OrbisRenderer));
	OrbisRenderer *pScreen = new(h) OrbisRenderer(context, width, height);
	context.m_pGPUScreen = pScreen;
}

bool IRenderer::checkForErrors(const char *situation)
{
#if APIABSTRACTION_OGL
	GLenum glErr;

	glErr = glGetError();
	if (glErr != GL_NO_ERROR)
	{
		PEWARN("%s: glError: %s \n", situation, (const char*)(gluErrorString(glErr)));
	}

#if !APIABSTRACTION_IOS
	//OGL_GPUScreen *pGLRenderer = static_cast<OGL_GPUScreen *>(this);
	CGerror error;
	const char *string = cgGetLastErrorString(&error);

	if (error != CG_NO_ERROR) {
		PEINFO("%s in situatuon: %s\n", string, situation);
		if (error == CG_COMPILER_ERROR) {
			//PEINFO("%s\n", cgGetLastListing(pGLRenderer->m_cgContext));
		}
		return false;
	}
#endif        
#endif
	return true;
}

void IRenderer::checkRenderBufferComplete()
{
	#if PE_PLAT_IS_IOS
		if (glCheckFramebufferStatus(GL_FRAMEBUFFER) != GL_FRAMEBUFFER_COMPLETE)
			NSLog(@"Failed to make complete framebuffer object %x", glCheckFramebufferStatus(GL_FRAMEBUFFER));
	#endif
}

void IRenderer::AcquireRenderContextOwnership(int &threadOwnershipMask)
{
	bool needAssert = (threadOwnershipMask & Threading::RenderContext) > 0;

	if (needAssert)
	{
		assert(!needAssert);
	}

	m_renderLock.lock();

#if APIABSTRACTION_GLPC
	GLRenderer *pGLRenderer = static_cast<GLRenderer *>(this);
	
	while (1)
	{
		bool noError = wglMakeCurrent(pGLRenderer->m_hdc, pGLRenderer->m_hglrc);
		//assert(noError);
		checkForErrors("Acquire ownership");
		if (noError)
			break;
	}
#endif

	threadOwnershipMask = threadOwnershipMask | Threading::RenderContext;
}

void IRenderer::ReleaseRenderContextOwnership(int &threadOwnershipMask)
{
	assert((threadOwnershipMask & Threading::RenderContext));

	m_renderLock.unlock();

#if APIABSTRACTION_GLPC
	bool noError = wglMakeCurrent(0, 0);
	assert(noError);
#endif

	threadOwnershipMask = threadOwnershipMask & ~Threading::RenderContext;
}

}; // namespace PE



#include "PrimeEngine/APIAbstraction/APIAbstractionDefines.h"

#include "PSVitaRenderer.h"

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

// Enable the following define to allow Razor HUD.
//#define ENABLE_RAZOR_HUD

// Enable the following define to create a Razor capture file.
//#define ENABLE_RAZOR_GPU_CAPTURE

#if defined(ENABLE_RAZOR_GPU_CAPTURE) || defined(ENABLE_RAZOR_HUD)
#include <libsysmodule.h>
#endif
#ifdef ENABLE_RAZOR_GPU_CAPTURE
#include <razor_capture.h>
#endif

/*	Define the width and height to render at the native resolution on ES2
	hardware.
*/
#define DISPLAY_WIDTH				960
#define DISPLAY_HEIGHT				544
#define DISPLAY_STRIDE_IN_PIXELS	1024

/*	Define the libgxm color format to render to.  This should be kept in sync
	with the display format to use with the SceDisplay library.
*/
#define DISPLAY_COLOR_FORMAT		SCE_GXM_COLOR_FORMAT_A8B8G8R8
#define DISPLAY_PIXEL_FORMAT		SCE_DISPLAY_PIXELFORMAT_A8B8G8R8


/*	Define the maximum number of queued swaps that the display queue will allow.
	This limits the number of frames that the CPU can get ahead of the GPU,
	and is independent of the actual number of back buffers.  The display
	queue will block during sceGxmDisplayQueueAddEntry if this number of swaps
	have already been queued.
*/
#define DISPLAY_MAX_PENDING_SWAPS	2

/*	Define the MSAA mode.  This can be changed to 4X on ES1 hardware to use 4X
	multi-sample anti-aliasing, and can be changed to 4X or 2X on ES2 hardware.
*/
#define MSAA_MODE					SCE_GXM_MULTISAMPLE_NONE

/*	Set this macro to 1 to manually allocate the memblock for the render target.
*/
#define MANUALLY_ALLOCATE_RT_MEMBLOCK		0

// Helper macro to align a value
#define ALIGN(x, a)					(((x) + ((a) - 1)) & ~((a) - 1))

// Mark variable as used
#define	UNUSED(a)					(void)(a)

static void *patcherHostAlloc(void *userData, uint32_t size)
{
	UNUSED(userData);
	return malloc(size);
}

static void patcherHostFree(void *userData, void *mem)
{
	UNUSED(userData);
	free(mem);
}

namespace PE
{

void *graphicsAlloc(SceKernelMemBlockType type, uint32_t size, uint32_t alignment, uint32_t attribs, SceUID *uid)
{
	int err = SCE_OK;
	UNUSED(err);

	/*	Since we are using sceKernelAllocMemBlock directly, we cannot directly
		use the alignment parameter.  Instead, we must allocate the size to the
		minimum for this memblock type, and just assert that this will cover
		our desired alignment.

		Developers using their own heaps should be able to use the alignment
		parameter directly for more minimal padding.
	*/
	if (type == SCE_KERNEL_MEMBLOCK_TYPE_USER_CDRAM_RWDATA) {
		// CDRAM memblocks must be 256KiB aligned
		SCE_DBG_ASSERT(alignment <= 256*1024);
		size = ALIGN(size, 256*1024);
	} else {
		// LPDDR memblocks must be 4KiB aligned
		SCE_DBG_ASSERT(alignment <= 4*1024);
		size = ALIGN(size, 4*1024);
	}
	UNUSED(alignment);

	// allocate some memory
	*uid = sceKernelAllocMemBlock("basic", type, size, NULL);
	SCE_DBG_ASSERT(*uid >= SCE_OK);

	// grab the base address
	void *mem = NULL;
	err = sceKernelGetMemBlockBase(*uid, &mem);
	SCE_DBG_ASSERT(err == SCE_OK);

	// map for the GPU
	err = sceGxmMapMemory(mem, size, attribs);
	SCE_DBG_ASSERT(err == SCE_OK);

	// done
	return mem;
}

void graphicsFree(SceUID uid)
{
	int err = SCE_OK;
	UNUSED(err);

	// grab the base address
	void *mem = NULL;
	err = sceKernelGetMemBlockBase(uid, &mem);
	SCE_DBG_ASSERT(err == SCE_OK);

	// unmap memory
	err = sceGxmUnmapMemory(mem);
	SCE_DBG_ASSERT(err == SCE_OK);

	// free the memory block
	err = sceKernelFreeMemBlock(uid);
	SCE_DBG_ASSERT(err == SCE_OK);
}

}
static void *vertexUsseAlloc(uint32_t size, SceUID *uid, uint32_t *usseOffset)
{
	int err = SCE_OK;
	UNUSED(err);

	// align to memblock alignment for LPDDR
	size = ALIGN(size, 4096);

	// allocate some memory
	*uid = sceKernelAllocMemBlock("basic", SCE_KERNEL_MEMBLOCK_TYPE_USER_RWDATA_UNCACHE, size, NULL);
	SCE_DBG_ASSERT(*uid >= SCE_OK);

	// grab the base address
	void *mem = NULL;
	err = sceKernelGetMemBlockBase(*uid, &mem);
	SCE_DBG_ASSERT(err == SCE_OK);

	// map as vertex USSE code for the GPU
	err = sceGxmMapVertexUsseMemory(mem, size, usseOffset);
	SCE_DBG_ASSERT(err == SCE_OK);

	// done
	return mem;
}

static void vertexUsseFree(SceUID uid)
{
	int err = SCE_OK;
	UNUSED(err);

	// grab the base address
	void *mem = NULL;
	err = sceKernelGetMemBlockBase(uid, &mem);
	SCE_DBG_ASSERT(err == SCE_OK);

	// unmap memory
	err = sceGxmUnmapVertexUsseMemory(mem);
	SCE_DBG_ASSERT(err == SCE_OK);

	// free the memory block
	err = sceKernelFreeMemBlock(uid);
	SCE_DBG_ASSERT(err == SCE_OK);
}

static void *fragmentUsseAlloc(uint32_t size, SceUID *uid, uint32_t *usseOffset)
{
	int err = SCE_OK;
	UNUSED(err);

	// align to memblock alignment for LPDDR
	size = ALIGN(size, 4096);

	// allocate some memory
	*uid = sceKernelAllocMemBlock("basic", SCE_KERNEL_MEMBLOCK_TYPE_USER_RWDATA_UNCACHE, size, NULL);
	SCE_DBG_ASSERT(*uid >= SCE_OK);

	// grab the base address
	void *mem = NULL;
	err = sceKernelGetMemBlockBase(*uid, &mem);
	SCE_DBG_ASSERT(err == SCE_OK);

	// map as fragment USSE code for the GPU
	err = sceGxmMapFragmentUsseMemory(mem, size, usseOffset);
	SCE_DBG_ASSERT(err == SCE_OK);

	// done
	return mem;
}

static void fragmentUsseFree(SceUID uid)
{
	int err = SCE_OK;
	UNUSED(err);

	// grab the base address
	void *mem = NULL;
	err = sceKernelGetMemBlockBase(uid, &mem);
	SCE_DBG_ASSERT(err == SCE_OK);

	// unmap memory
	err = sceGxmUnmapFragmentUsseMemory(mem);
	SCE_DBG_ASSERT(err == SCE_OK);

	// free the memory block
	err = sceKernelFreeMemBlock(uid);
	SCE_DBG_ASSERT(err == SCE_OK);
}




/*	Data structure to pass through the display queue.  This structure is
	serialized during sceGxmDisplayQueueAddEntry, and is used to pass
	arbitrary data to the display callback function, called from an internal
	thread once the back buffer is ready to be displayed.

	In this example, we only need to pass the base address of the buffer.
*/
typedef struct DisplayData
{
	void *address;
} DisplayData;


void displayCallback(const void *callbackData)
{
	SceDisplayFrameBuf framebuf;
	int err = SCE_OK;
	UNUSED(err);

	// Cast the parameters back
	const DisplayData *displayData = (const DisplayData *)callbackData;

	// Swap to the new buffer on the next VSYNC
	memset(&framebuf, 0x00, sizeof(SceDisplayFrameBuf));
	framebuf.size        = sizeof(SceDisplayFrameBuf);
	framebuf.base        = displayData->address;
	framebuf.pitch       = DISPLAY_STRIDE_IN_PIXELS;
	framebuf.pixelformat = DISPLAY_PIXEL_FORMAT;
	framebuf.width       = DISPLAY_WIDTH;
	framebuf.height      = DISPLAY_HEIGHT;
	err = sceDisplaySetFrameBuf(&framebuf, SCE_DISPLAY_UPDATETIMING_NEXTVSYNC);
	SCE_DBG_ASSERT(err == SCE_OK);

	// Block this callback until the swap has occurred and the old buffer
	// is no longer displayed
	err = sceDisplayWaitVblankStart();
	SCE_DBG_ASSERT(err == SCE_OK);
}


namespace PE {
    char PSVitaRenderer::s_dbgStr[80];
    bool PSVitaRenderer::s_debugGfx = true;
    
    void PSVitaRenderer::setRenderTargetsAndViewportWithDepth(TextureGPU *pDestColorTex, TextureGPU *pDestDepthTex, bool clearRenderTarget, bool clearDepth)
    {
		// in DX9 hardware the depth texture is part of the same surface
		// so we need to make sure we are using the same texture
		assert(pDestColorTex == pDestDepthTex);

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
        
		// start rendering to the main render target
		SceGxmErrorCode err = sceGxmBeginScene(
			m_context,
			0,
			m_renderTarget,
			NULL,
			NULL,
			m_displayBufferSync[m_backBufferIndex],
			&m_displaySurface[m_backBufferIndex],
			&m_depthSurface);

		PEASSERT(err == SCE_OK, "Error beginning scene");
    }
    
    void PSVitaRenderer::endRenderTarget(TextureGPU *pTex)
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

	void PSVitaRenderer::endFrame()
	{
		// end the scene on the main render target, submitting rendering work to the GPU
		sceGxmEndScene(m_context, NULL, NULL);

		// PA heartbeat to notify end of frame
		sceGxmPadHeartbeat(&m_displaySurface[m_backBufferIndex], m_displayBufferSync[m_backBufferIndex]);
	}
	
    void PSVitaRenderer::setRenderTargetsAndViewportWithNoDepth(TextureGPU *pDestColorTex, bool clear)
    {
		PEASSERT(false, "Not supported yet..");
		#if 0
		static float xadd = 0;
		#if 1
			xadd += 0.01f;
			if (xadd > 1.0f)
				xadd = 0;
		#endif
		if (pDestColorTex != 0)
		{
			#if APIABSTRACTION_PS3
				glBindFramebufferOES(GL_FRAMEBUFFER_OES, pDestColorTex->m_frameBufferObject); //set framebuffer for reading and writing. could also use GL_READ_FRAMEBUFFER to set a buffer for reading vs writing.
			#else
				glBindFramebuffer(GL_FRAMEBUFFER, pDestColorTex->m_frameBufferObject); //set framebuffer for reading and writing. could also use GL_READ_FRAMEBUFFER to set a buffer for reading vs writing.
			#endif
			glViewport(pDestColorTex->m_viewport.x, pDestColorTex->m_viewport.y, pDestColorTex->m_viewport.w, pDestColorTex->m_viewport.h);
		}
		else
		{
			// use default render target only for now
			#if APIABSTRACTION_IOS
			[s_pIOSMainRenderView_objs setFramebuffer]; // bind default frame buffer, not sure if set to 0 would work.
			#else
			#if APIABSTRACTION_PS3
				glBindFramebufferOES(GL_FRAMEBUFFER_OES, 0);
			#else
				glBindFramebuffer(GL_FRAMEBUFFER, 0);
			#endif
			glViewport(0, 0, m_width, m_height);
			#endif
		}
        IRenderer::checkForErrors("setRenderTargetsAndViewportWithNoDepth");
		IRenderer::checkRenderBufferComplete();

		static float add = 0;

		if (clear)
		{
			glClearColor(m_clearColor.m_x + xadd * add, m_clearColor.m_y, m_clearColor.m_z, m_clearColor.m_w);
			glClear(GL_COLOR_BUFFER_BIT);//color only
		}
		#endif
    }
    
    void PSVitaRenderer::setDepthStencilOnlyRenderTargetAndViewport(TextureGPU *pDestDepthTex, bool clear)
    {
		PEASSERT(false, "Not supported yet..");
		#if 0

		// the render-to-depth texture is just a color texture
		// it also has the zbuffer attached

		if (pDestDepthTex != 0)
		{

			#if APIABSTRACTION_PS3
				glBindFramebufferOES(GL_FRAMEBUFFER_OES, pDestDepthTex->m_frameBufferObject); //set framebuffer for reading and writing. could also use GL_READ_FRAMEBUFFER to set a buffer for reading vs writing. 
			#else
				glBindFramebuffer(GL_FRAMEBUFFER, pDestDepthTex->m_frameBufferObject); //set framebuffer for reading and writing. could also use GL_READ_FRAMEBUFFER to set a buffer for reading vs writing. 
			#endif
			glViewport(pDestDepthTex->m_viewport.x, pDestDepthTex->m_viewport.y, pDestDepthTex->m_viewport.w, pDestDepthTex->m_viewport.h);	
		}
		else
		{
			// use the default device
			assert(!"Cant render to default device as depth only render");
		}

        IRenderer::checkForErrors("setRenderTargetsAndViewportWithNoDepth");
        IRenderer::checkRenderBufferComplete();
		
		if (clear)
		{
			glClearColor(0, 1.0f, 0, 1.0f);
			float clearDepth = 1.0f;
			#if APIABSTRACTION_PS3 || APIABSTRACTION_IOS
				glClearDepthf(clearDepth);
			#else
				glClearDepth(clearDepth);
			#endif
			glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
		}
		#endif
    }

    PSVitaRenderer::PSVitaRenderer(PE::GameContext &ctx, unsigned int width, unsigned int height)
		: IRenderer(ctx, width, height)
		, m_pContext(&ctx)
		#if APIABSTRACTION_IOS
		, context(NULL)
		#endif
		#if PE_PLAT_IS_PSVITA
		, m_context(NULL)
		#endif
    {
        m_width = DISPLAY_WIDTH;
        m_height = DISPLAY_HEIGHT;
		//
		m_width = DISPLAY_WIDTH;
		m_height = DISPLAY_HEIGHT;

        initialiseContext();
    }
    
    void PSVitaRenderer::initialiseContext()
    {
		int err = SCE_OK;
		UNUSED(err);

		m_backBufferIndex = 0;
		m_frontBufferIndex = 0;

		/* ---------------------------------------------------------------------
			1. Load optional Razor modules.

			These modules must be loaded before libgxm is initialized.
		   --------------------------------------------------------------------- */

		#ifdef ENABLE_RAZOR_HUD
			// Initialize the Razor HUD system.
			// This should be done before the call to sceGxmInitialize().
			err = sceSysmoduleLoadModule( SCE_SYSMODULE_RAZOR_HUD );
			SCE_DBG_ASSERT(err == SCE_OK);
		#endif

		#ifdef ENABLE_RAZOR_GPU_CAPTURE
			// Initialize the Razor capture system.
			// This should be done before the call to sceGxmInitialize().
			err = sceSysmoduleLoadModule( SCE_SYSMODULE_RAZOR_CAPTURE );
			SCE_DBG_ASSERT(err == SCE_OK);

			// Trigger a capture after 100 frames.
			sceRazorGpuCaptureSetTrigger( 100, "app0:basic.sgx" );
		#endif

		/* ---------------------------------------------------------------------
			2. Initialize libgxm

			We specify the default parameter buffer size of 16MiB.

		   --------------------------------------------------------------------- */

		// set up parameters
		SceGxmInitializeParams initializeParams;
		memset(&initializeParams, 0, sizeof(SceGxmInitializeParams));
		initializeParams.flags							= 0;
		initializeParams.displayQueueMaxPendingCount	= DISPLAY_MAX_PENDING_SWAPS;
		initializeParams.displayQueueCallback			= displayCallback;
		initializeParams.displayQueueCallbackDataSize	= sizeof(DisplayData);
		initializeParams.parameterBufferSize			= SCE_GXM_DEFAULT_PARAMETER_BUFFER_SIZE;

		// initialize
		err = sceGxmInitialize(&initializeParams);
		SCE_DBG_ASSERT(err == SCE_OK);

		/* ---------------------------------------------------------------------
			3. Create a libgxm context

			Once initialized, we need to create a rendering context to allow to us
			to render scenes on the GPU.  We use the default initialization
			parameters here to set the sizes of the various context ring buffers.
		   --------------------------------------------------------------------- */

		// allocate ring buffer memory using default sizes
		SceUID vdmRingBufferUid;
		void *vdmRingBuffer = graphicsAlloc(
			SCE_KERNEL_MEMBLOCK_TYPE_USER_RWDATA_UNCACHE,
			SCE_GXM_DEFAULT_VDM_RING_BUFFER_SIZE,
			4,
			SCE_GXM_MEMORY_ATTRIB_READ,
			&vdmRingBufferUid);
		SceUID vertexRingBufferUid;
		void *vertexRingBuffer = graphicsAlloc(
			SCE_KERNEL_MEMBLOCK_TYPE_USER_RWDATA_UNCACHE,
			SCE_GXM_DEFAULT_VERTEX_RING_BUFFER_SIZE,
			4,
			SCE_GXM_MEMORY_ATTRIB_READ,
			&vertexRingBufferUid);
		SceUID fragmentRingBufferUid;
		void *fragmentRingBuffer = graphicsAlloc(
			SCE_KERNEL_MEMBLOCK_TYPE_USER_RWDATA_UNCACHE,
			SCE_GXM_DEFAULT_FRAGMENT_RING_BUFFER_SIZE,
			4,
			SCE_GXM_MEMORY_ATTRIB_READ,
			&fragmentRingBufferUid);
		SceUID fragmentUsseRingBufferUid;
		uint32_t fragmentUsseRingBufferOffset;
		void *fragmentUsseRingBuffer = fragmentUsseAlloc(
			SCE_GXM_DEFAULT_FRAGMENT_USSE_RING_BUFFER_SIZE,
			&fragmentUsseRingBufferUid,
			&fragmentUsseRingBufferOffset);

		SceGxmContextParams contextParams;
		memset(&contextParams, 0, sizeof(SceGxmContextParams));
		contextParams.hostMem						= malloc(SCE_GXM_MINIMUM_CONTEXT_HOST_MEM_SIZE);
		contextParams.hostMemSize					= SCE_GXM_MINIMUM_CONTEXT_HOST_MEM_SIZE;
		contextParams.vdmRingBufferMem				= vdmRingBuffer;
		contextParams.vdmRingBufferMemSize			= SCE_GXM_DEFAULT_VDM_RING_BUFFER_SIZE;
		contextParams.vertexRingBufferMem			= vertexRingBuffer;
		contextParams.vertexRingBufferMemSize		= SCE_GXM_DEFAULT_VERTEX_RING_BUFFER_SIZE;
		contextParams.fragmentRingBufferMem			= fragmentRingBuffer;
		contextParams.fragmentRingBufferMemSize		= SCE_GXM_DEFAULT_FRAGMENT_RING_BUFFER_SIZE;
		contextParams.fragmentUsseRingBufferMem		= fragmentUsseRingBuffer;
		contextParams.fragmentUsseRingBufferMemSize	= SCE_GXM_DEFAULT_FRAGMENT_USSE_RING_BUFFER_SIZE;
		contextParams.fragmentUsseRingBufferOffset	= fragmentUsseRingBufferOffset;

		m_context = NULL;
		err = sceGxmCreateContext(&contextParams, &m_context);
		SCE_DBG_ASSERT(err == SCE_OK);

		/* ---------------------------------------------------------------------
			4. Create a render target

			Finally we create a render target to describe the geometry of the back
			buffers we will render to.  This object is used purely to schedule
			rendering jobs for the given dimensions, the color surface and
			depth/stencil surface must be allocated separately.
		   --------------------------------------------------------------------- */

		// set up parameters
		SceGxmRenderTargetParams renderTargetParams;
		memset(&renderTargetParams, 0, sizeof(SceGxmRenderTargetParams));
		renderTargetParams.flags				= 0;
		renderTargetParams.width				= DISPLAY_WIDTH;
		renderTargetParams.height				= DISPLAY_HEIGHT;
		renderTargetParams.scenesPerFrame		= 1;
		renderTargetParams.multisampleMode		= MSAA_MODE;
		renderTargetParams.multisampleLocations	= 0;
		renderTargetParams.driverMemBlock		= SCE_UID_INVALID_UID;

		/*	If you would like to allocate the memblock manually, then this code can
			be used.  Change the MANUALLY_ALLOCATE_RT_MEMBLOCK to 1 at the top of
			this file to use this mode in the sample.
		*/
		#if MANUALLY_ALLOCATE_RT_MEMBLOCK
		{
				// compute memblock size
				uint32_t driverMemSize;
				sceGxmGetRenderTargetMemSize(&renderTargetParams, &driverMemSize);

				// allocate driver memory
				renderTargetParams.driverMemBlock = sceKernelAllocMemBlock(
					"SampleRT",
					SCE_KERNEL_MEMBLOCK_TYPE_USER_RWDATA_UNCACHE,
					driverMemSize,
					NULL);
		}
		#endif

		// create the render target
		m_renderTarget = NULL;
		err = sceGxmCreateRenderTarget(&renderTargetParams, &m_renderTarget);
		SCE_DBG_ASSERT(err == SCE_OK);

		/* ---------------------------------------------------------------------
			5. Allocate display buffers and sync objects

			We will allocate our back buffers in CDRAM, and create a color
			surface for each of them.

			To allow display operations done by the CPU to be synchronized with
			rendering done by the GPU, we also create a SceGxmSyncObject for each
			display buffer.  This sync object will be used with each scene that
			renders to that buffer and when queueing display flips that involve
			that buffer (either flipping from or to).
		   --------------------------------------------------------------------- */

		// allocate memory and sync objects for display buffers
		for (uint32_t i = 0; i < DISPLAY_BUFFER_COUNT; ++i) {
			// allocate memory for display
			m_displayBufferData[i] = graphicsAlloc(
				SCE_KERNEL_MEMBLOCK_TYPE_USER_CDRAM_RWDATA,
				4*DISPLAY_STRIDE_IN_PIXELS*DISPLAY_HEIGHT,
				SCE_GXM_COLOR_SURFACE_ALIGNMENT,
				SCE_GXM_MEMORY_ATTRIB_READ | SCE_GXM_MEMORY_ATTRIB_WRITE,
				&m_displayBufferUid[i]);

			// memset the buffer to black
			for (uint32_t y = 0; y < DISPLAY_HEIGHT; ++y) {
				uint32_t *row = (uint32_t *)m_displayBufferData[i] + y*DISPLAY_STRIDE_IN_PIXELS;
				for (uint32_t x = 0; x < DISPLAY_WIDTH; ++x) {
					row[x] = 0xff000000;
				}
			}

			// initialize a color surface for this display buffer
			err = sceGxmColorSurfaceInit(
				&m_displaySurface[i],
				DISPLAY_COLOR_FORMAT,
				SCE_GXM_COLOR_SURFACE_LINEAR,
				(MSAA_MODE == SCE_GXM_MULTISAMPLE_NONE) ? SCE_GXM_COLOR_SURFACE_SCALE_NONE : SCE_GXM_COLOR_SURFACE_SCALE_MSAA_DOWNSCALE,
				SCE_GXM_OUTPUT_REGISTER_SIZE_32BIT,
				DISPLAY_WIDTH,
				DISPLAY_HEIGHT,
				DISPLAY_STRIDE_IN_PIXELS,
				m_displayBufferData[i]);
			SCE_DBG_ASSERT(err == SCE_OK);

			// create a sync object that we will associate with this buffer
			err = sceGxmSyncObjectCreate(&m_displayBufferSync[i]);
			SCE_DBG_ASSERT(err == SCE_OK);
		}

		/* ---------------------------------------------------------------------
			6. Allocate a depth buffer

			Note that since this sample renders in a strictly back-to-front order,
			a depth buffer is not strictly required.  However, since it is usually
			necessary to create one to handle partial renders, we will create one
			now.  Note that we do not enable force load or store, so this depth
			buffer will not actually be read or written by the GPU when this
			sample is executed, so will have zero performance impact.
		   --------------------------------------------------------------------- */

		// compute the memory footprint of the depth buffer
		const uint32_t alignedWidth = ALIGN(DISPLAY_WIDTH, SCE_GXM_TILE_SIZEX);
		const uint32_t alignedHeight = ALIGN(DISPLAY_HEIGHT, SCE_GXM_TILE_SIZEY);
		uint32_t sampleCount = alignedWidth*alignedHeight;
		uint32_t depthStrideInSamples = alignedWidth;
		if (MSAA_MODE == SCE_GXM_MULTISAMPLE_4X) {
			// samples increase in X and Y
			sampleCount *= 4;
			depthStrideInSamples *= 2;
		} else if (MSAA_MODE == SCE_GXM_MULTISAMPLE_2X) {
			// samples increase in Y only
			sampleCount *= 2;
		}

		// allocate it
		SceUID depthBufferUid;
		void *depthBufferData = graphicsAlloc(
			SCE_KERNEL_MEMBLOCK_TYPE_USER_RWDATA_UNCACHE,
			4*sampleCount,
			SCE_GXM_DEPTHSTENCIL_SURFACE_ALIGNMENT,
			SCE_GXM_MEMORY_ATTRIB_READ | SCE_GXM_MEMORY_ATTRIB_WRITE,
			&depthBufferUid);

		// create the SceGxmDepthStencilSurface structure
		err = sceGxmDepthStencilSurfaceInit(
			&m_depthSurface,
			SCE_GXM_DEPTH_STENCIL_FORMAT_S8D24,
			SCE_GXM_DEPTH_STENCIL_SURFACE_TILED,
			depthStrideInSamples,
			depthBufferData,
			NULL);
		SCE_DBG_ASSERT(err == SCE_OK);

		/* ---------------------------------------------------------------------
			7. Create a shader patcher and register programs

			A shader patcher object is required to produce vertex and fragment
			programs from the shader compiler output.  First we create a shader
			patcher instance, using callback functions to allow it to allocate
			and free host memory for internal state.

			We will use the shader patcher's internal heap to handle buffer
			memory and USSE memory for the final programs.  To do this, we
			leave the callback functions as NULL, but provide static memory
			blocks.

			In order to create vertex and fragment programs for a particular
			shader, the compiler output must first be registered to obtain an ID
			for that shader.  Within a single ID, vertex and fragment programs
			are reference counted and could be shared if created with identical
			parameters.  To maximise this sharing, programs should only be
			registered with the shader patcher once if possible, so we will do
			this now.
		   --------------------------------------------------------------------- */

		// set buffer sizes for this sample
		const uint32_t patcherBufferSize		= 64*1024 * 10;
		const uint32_t patcherVertexUsseSize	= 64*1024 * 10;
		const uint32_t patcherFragmentUsseSize	= 64*1024 * 10;

		// allocate memory for buffers and USSE code
		SceUID patcherBufferUid;
		void *patcherBuffer = graphicsAlloc(
			SCE_KERNEL_MEMBLOCK_TYPE_USER_RWDATA_UNCACHE,
			patcherBufferSize,
			4,
			SCE_GXM_MEMORY_ATTRIB_READ | SCE_GXM_MEMORY_ATTRIB_WRITE,
			&patcherBufferUid);
		SceUID patcherVertexUsseUid;
		uint32_t patcherVertexUsseOffset;
		void *patcherVertexUsse = vertexUsseAlloc(
			patcherVertexUsseSize,
			&patcherVertexUsseUid,
			&patcherVertexUsseOffset);
		SceUID patcherFragmentUsseUid;
		uint32_t patcherFragmentUsseOffset;
		void *patcherFragmentUsse = fragmentUsseAlloc(
			patcherFragmentUsseSize,
			&patcherFragmentUsseUid,
			&patcherFragmentUsseOffset);

		// create a shader patcher
		SceGxmShaderPatcherParams patcherParams;
		memset(&patcherParams, 0, sizeof(SceGxmShaderPatcherParams));
		patcherParams.userData					= NULL;
		patcherParams.hostAllocCallback			= &patcherHostAlloc;
		patcherParams.hostFreeCallback			= &patcherHostFree;
		patcherParams.bufferAllocCallback		= NULL;
		patcherParams.bufferFreeCallback		= NULL;
		patcherParams.bufferMem					= patcherBuffer;
		patcherParams.bufferMemSize				= patcherBufferSize;
		patcherParams.vertexUsseAllocCallback	= NULL;
		patcherParams.vertexUsseFreeCallback	= NULL;
		patcherParams.vertexUsseMem				= patcherVertexUsse;
		patcherParams.vertexUsseMemSize			= patcherVertexUsseSize;
		patcherParams.vertexUsseOffset			= patcherVertexUsseOffset;
		patcherParams.fragmentUsseAllocCallback	= NULL;
		patcherParams.fragmentUsseFreeCallback	= NULL;
		patcherParams.fragmentUsseMem			= patcherFragmentUsse;
		patcherParams.fragmentUsseMemSize		= patcherFragmentUsseSize;
		patcherParams.fragmentUsseOffset		= patcherFragmentUsseOffset;

		err = sceGxmShaderPatcherCreate(&patcherParams, &m_shaderPatcher);
		SCE_DBG_ASSERT(err == SCE_OK);

    }
    
    void PSVitaRenderer::uninitialiseContext()
    {

    }

	void PSVitaRenderer::setVSync(bool useVsync)
	{
        #if PE_PLAT_IS_WIN32
            wglSwapIntervalEXT((int)(useVsync));
        #elif PE_PLAT_IS_PS3
            glDisable(GL_VSYNC_SCE);
        #endif
	}
    
    void PSVitaRenderer::swap(bool vsync /* = 0*/) {
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
    
    void PSVitaRenderer::clear(){
        PEINFO("Need to implement clear()");
        //glClear(;
    }
    
// IRenderer static method implementation

void IRenderer::Construct(PE::GameContext &context, unsigned int width, unsigned int height)
{
	PE::Handle h("PSVitaRenderer", sizeof(PSVitaRenderer));
	PSVitaRenderer *pScreen = new(h) PSVitaRenderer(context, width, height);
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


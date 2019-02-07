
// API Abstraction
#include "PrimeEngine/APIAbstraction/APIAbstractionDefines.h"

// ghetto file guard until premake supports per-file configuration
#if PE_PLAT_IS_PSVITA

// Outer-Engine includes
// Sibling includes
#include "Texture_DDS_Loader_GL.h"
#include "Texture.h"
#include "PrimeEngine/Render/IRenderer.h"

// Inter-Engine includes
#include "../../Utils/ErrorHandling.h"
#include "PrimeEngine/FileSystem/FileReader.h"

namespace PE {

SceGxmTexture TextureGPU::gfxLoadDDSTexture(char *filename, bool genMips /*= true*/)
{
	SceGxmTexture texture;

	DDS::DDSTextureInSystemMemory dds;
	uint32_t test =  loadDDSIntoSystemMemory(filename,&dds);
	if(test==false) 
	{
		printf("failed to load\n");
		exit(0);
	}

	int32_t w = dds.width;
	int32_t h = dds.height;

	printf("file %s dds surfaces %d mips %d w %d h %d \n",filename,dds.surfaces,dds.mips,w,h);
	if(dds.surfaces!=1)	//its a cube map 
	{
		printf("ERROR: this is a cubemap\n");
		exit(0);
	}

	


	SceGxmTextureFormat sourceCpuFormatEnum = SCE_GXM_TEXTURE_FORMAT_U8U8U8U8_ARGB; // tells gxm how the texels are stored in memory
	if (dds.compressedFormat)
	{
		assert(!"Dont support compressed textures yet!");
	}
	else
	{
		if (dds.components == 1)
		{
			if (dds.uncompressedFormat == DDSF_L)
			{
					sourceCpuFormatEnum = SCE_GXM_TEXTURE_FORMAT_U8_R;
			}
			else
				assert(!"Unknown format!");
		}
		else if (dds.components == 3)
		{
			assert(!"Need to add support for this format!");
			sourceCpuFormatEnum = SCE_GXM_TEXTURE_FORMAT_U8U8U8_RGB;
				printf("getSourceCPUFormatFromComponents() : formatEnum = GL_RGB\n");
		}
		else if (dds.components == 4)
		{
			if (dds.uncompressedFormat == DDSF_RGBA)
				sourceCpuFormatEnum = SCE_GXM_TEXTURE_FORMAT_U8U8U8U8_ARGB;
			else if  (dds.uncompressedFormat == DDSF_RGB)
				sourceCpuFormatEnum = SCE_GXM_TEXTURE_FORMAT_U8U8U8U8_ARGB;
		}
		else
		{
			assert(!"Unknown texture format!");
		}
	}

#if 0
	//load a compressed texture
	if( (dds.apiFormat == GL_COMPRESSED_RGB_S3TC_DXT1_EXT) ||
		(dds.apiFormat == GL_COMPRESSED_RGBA_S3TC_DXT1_EXT) ||
		(dds.apiFormat == GL_COMPRESSED_RGBA_S3TC_DXT3_EXT) ||
		(dds.apiFormat == GL_COMPRESSED_RGBA_S3TC_DXT5_EXT))
	{
		for (uint32_t i = 0; i < dds.mips; i++)
		{
			uint32_t size = DDS::getImageSize(w,h,dds.components,dds.apiFormat);
			//printf("compressed texture %d %d %d %d 0x%x\n",i,w,h,size,dds.image[0].pixels[i]);
			glCompressedTexImage2D(GL_TEXTURE_2D, i, dds.apiFormat, w, h, 0, size, dds.image[0].pixels[i]);
			w/=2; h/=2;
			if (w == 0) w = 1;
			if (h == 0) h = 1;
		}
	}
	else // load a non compressed texture
#endif
	{
		int mipOffset = 0;
        
        
        int tw = w;
        int th = h;
        for (uint32_t i = 0; i < dds.mips; i++)
        {
            if (tw > MAX_TEXTURE_LOAD_WIDTH || th > MAX_TEXTURE_LOAD_WIDTH)
            {
                --mipOffset;
            }
            else
                break;
            
            tw /= 2;
            th /= 2;
        }

		for (uint32_t i = 0; i < dds.mips; i++)
		{
		
			SceUID memId;
			// todo: optimize memory allocation
			uint8_t * pAlignedData = (uint8_t *)graphicsAlloc(
				SCE_KERNEL_MEMBLOCK_TYPE_USER_RWDATA_UNCACHE,
				dds.components * w * h,
				SCE_GXM_TEXTURE_ALIGNMENT,
				SCE_GXM_MEMORY_ATTRIB_READ, // how to map to gpu
				&memId);

			memcpy(pAlignedData, dds.image[0].pixels[i], dds.components * w * h);
			// set up the texture control words
			SceGxmErrorCode err = sceGxmTextureInitLinear(
				&texture,
				pAlignedData,
				sourceCpuFormatEnum,
				w,
				h,
				0);
			SCE_DBG_ASSERT(err == SCE_OK);

			// for now, just one mip
			break;
#if 0
        if (w <= MAX_TEXTURE_LOAD_WIDTH && h <= MAX_TEXTURE_LOAD_WIDTH)    
			// see "Loading a Texture Image" in PSGL-Programming_Guide_e.pdf [94]
			glTexImage2D(
				// for OpenGL ES must be GL_TEXTURE_2D; in Gneeral OpenGL is GL_TEXTURE_2D, GL_PROXY_TEXTURE_2D, GL_TEXTURE_CUBE_MAP_POSITIVE_X, GL_TEXTURE_CUBE_MAP_NEGATIVE_X, GL_TEXTURE_CUBE_MAP_POSITIVE_Y, GL_TEXTURE_CUBE_MAP_NEGATIVE_Y, GL_TEXTURE_CUBE_MAP_POSITIVE_Z, GL_TEXTURE_CUBE_MAP_NEGATIVE_Z, or GL_PROXY_TEXTURE_CUBE_MAP.

				//PSGL also allows cube maps
				GL_TEXTURE_2D, 

				i + mipOffset, // mip level >= 0; 0 - highest

				// how texels are stored in
				//in OpenGL ES: Specifies the color components in the texture. Must be same as format. 
				//how texels stored internally on GPU
				//GL ES: The following symbolic values are accepted: GL_ALPHA, GL_RGB, GL_RGBA, GL_LUMINANCE, or GL_LUMINANCE_ALPHA.
				//PSGL offers A LOT more. the notable ones are the ones storing floats and depth
				// we still want to store on gpu in the conventional format like GL_RGBA GL_RGB GL_LUMINANCE
				destApiFormat, 
				w,
				h,
				0, //in PSGL texture borders are not supported
				
				//how texels stored in input cpu data
				// in GL ES: GL_ALPHA GL_LUMINANCE_ALPHA GL_LUMINANCE GL_RGB GL_RGBA
				// + in PSGL: GL_DEPTH_COMPONENT GL_ABGR GL_ARGB_SCE GL_BGR GL_BGRA GL_RED GL_GREEN GL_BLUE 
				
				sourceCpuFormatEnum, 
				
				//how texels stored in input cpu data
				#if APIABSTRACTION_PS3
					//PS GL offers additional choices including GL_UNSIGNED_INT_8_8_8_8
					// artem: i always get slow performance warning when using GL_UNSIGNED_BYTE with 24 or 32 bit textures
					// I did not see color difference when using GL_UNSIGNED_BYTE vs GL_UNSIGNED_INT_8_8_8_8
					// first i thought slow performance was because of automatic endiannes swap but that does not seem to be the case (colors are the same)
					// so i use GL_UNSIGNED_INT_8_8_8_8 since doesnt give warning and is definitely faster
					dds.components == 4 ? GL_UNSIGNED_INT_8_8_8_8 : GL_UNSIGNED_BYTE,
				#else
					// GL ES offers this as only choice for this case. choices: GL_UNSIGNED_BYTE, GL_UNSIGNED_SHORT_4_4_4_4, GL_UNSIGNED_SHORT_5_6_5, GL_UNSIGNED_SHORT_5_5_5_1, 
					GL_UNSIGNED_BYTE,
				#endif
					
				/*data */dds.image[0].pixels[i]);
#endif
			w/=2; h/=2;
			if (w == 0) w = 1;
			if (h == 0) h = 1;
		} 

	}

	assert(m_samplerState != SamplerState_INVALID);

	SamplerState &ss = SamplerStateManager::getInstance()->getSamplerState(m_samplerState);

	// todo: enable mip loading
	bool haveMips = false; // dds.mips > 1;
	// Basic OpenGL texture state setup
	if(dds.mips==1)
	{
        if (dds.width > MAX_TEXTURE_LOAD_WIDTH && dds.height > MAX_TEXTURE_LOAD_WIDTH)
        {
            assert(!"Have only one mip that is bigger than max allowed size. so it was not created thus we can't make mipmaps on it. Change source of the image to be smaller or build mipmaps offline (in which case the higher mips will be just skipped)");
            genMips = false;
        }
       
        if (genMips)
		{
#if 0
			// build our texture mipmaps
			GLenum res = gluBuild2DMipmaps(
				GL_TEXTURE_2D, 
				destApiFormat,
				dds.width, dds.height,
				sourceCpuFormatEnum,
				GL_UNSIGNED_BYTE, //both IOS GL ES and PS GL require this to be GL_UNSIGNED_BYTE
				dds.image[0].pixels[0] );
			printf("gluBuild2DMipmaps result: %d\n", res);
			#if !APIABSTRACTION_IOS
				if (res)
				{
					PEINFO("%s\n", (const char*)gluErrorString(res));
				}
			#endif
			haveMips = res == 0;
#endif
		}
	}
	else
	{
		// mip maps exist
	}

	if (haveMips)
	{
		//check that we want t use existing mips
		if (ss.needsMipMaps())
		{
			PEINFO("Warning: Mipmap filtering is disabled while mipams exist and are loaded. Texture: %s\n", filename);
		}
	}
	else
	{
		//check that we dont want a value that assumes mip map existance
		if (!ss.needsMipMaps())
		{
			PEINFO("Warning: Trying to enable mip map filtering when no mipmaps exist. Texture: %s\n", filename);
		}
	}
	
	SceGxmErrorCode err = sceGxmTextureSetMagFilter(&texture, ss.m_magFilter); // SCE_GXM_TEXTURE_FILTER_LINEAR
	PEASSERT(err == SCE_OK, "Error Setting Mode\n");
	
	err = sceGxmTextureSetMinFilter(&texture, ss.m_minFilter);// SCE_GXM_TEXTURE_FILTER_LINEAR
	PEASSERT(err == SCE_OK, "Error Setting Mode\n");

	err = sceGxmTextureSetMipFilter(&texture, ss.m_mipFilter);
	PEASSERT(err == SCE_OK, "Error Setting Mode\n");

	err = sceGxmTextureSetUAddrMode(&texture, ss.m_addrModeU);
	PEASSERT(err == SCE_OK, "Error Setting Mode\n");

	err = sceGxmTextureSetVAddrMode(&texture, ss.m_addrModeV);
	PEASSERT(err == SCE_OK, "Error Setting Mode\n");


	free(dds.buffer); // at this point the file buffer is no longer needed

	return texture;	// return the texture name
}

}; // namespace PE
#endif

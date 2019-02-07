newoption {
	trigger     = "platformapi",
	value       = "PlatformAPI",
	description = "Choose a particular platform and api",
	allowed = {
		{ "win32d3d9",    "Win 32 D3D 9" },
		{ "win32d3d11",   "Win 32 D3D 11" },
		{ "win32gl",      "Win32 OpenGL" },
		{ "ps3",          "PS3" },
		{ "psvita",       "PSVita" },
		{ "orbis",        "ORBIS" },
		{ "ios",          "iOS" },
	}
}
_OPTIONS["platformapi"] = tostring(_OPTIONS["platformapi"])
solution("PEWorkspace-".._OPTIONS["platformapi"])
	configurations { "Debug", "Release" }
	
	objdir "../build-intermediate"
	targetdir "../build"
	
    --reference for orbis:
    -- compile line:
    -- -I"C:\SCE\ORBIS SDKs\2.000\target\samples\sample_code\graphics\api_gnm\." -I"C:\SCE\ORBIS SDKs\2.000\target\include_common" -D"SCE_GNM_DEBUG" -D"_DEBUG" -g -Wall -o "C:\SCE\ORBIS SDKs\2.000\target\samples\sample_code\graphics\api_gnm\\Obj\Debug_ORBIS_basic-sample\%(FileName).o" -O0 
    -- link line:
    -- -o "C:\SCE\ORBIS SDKs\2.000\target\samples\sample_code\graphics\api_gnm\basic-sample\basic-sample_debug.elf" "-lSceGnmDriver_stub_weak" "-lScePm4Dump" "-lSceGnf" "-lSceShaderBinary" "-lSceGpuAddress" "-lSceGnmx_debug" "-lSceGnm_debug" "-lScePosix_stub_weak" "-lScePad_stub_weak" "-lSceVideoOut_stub_weak" "-lSceDbgEnC" -L"C:\SCE\ORBIS SDKs\2.000\target\lib" 
    
    
	--defines { "PE_API_BIT_D3D9=0x0001", "PE_API_BIT_D3D11=0x0002", "PE_API_BIT_GL=0x0004", "PE_API_BIT_PSVITA=0x0004", "PE_API_BIT_ORBIS=0x0008" }
	--defines { "PE_PLAT_BIT_WIN32=0x0100", "PE_PLAT_BIT_XBOX360=0x0200", "PE_PLAT_BIT_PS3=0x0400", "PE_PLAT_BIT_IOS=0x0800", "PE_PLAT_BIT_PSVITA=0x1000", "PE_PLAT_BIT_PSVITA=0x2000" }
	
	
	local _platforms = {}
	if _OPTIONS["platformapi"] == "win32d3d9"   then _platforms = { "x32" };       defines { "APIABSTRACTION_D3D9=1", "PE_PLAT_API=0x0101", "PE_PLAT_IS_WIN32=1", "PE_API_IS_D3D9=1" } end
	if _OPTIONS["platformapi"] == "win32d3d11"  then _platforms = { "x32" };       defines { "APIABSTRACTION_D3D11=1", "PE_PLAT_API=0x0102", "PE_PLAT_IS_WIN32=1", "PE_API_IS_D3D11=1" } end
	if _OPTIONS["platformapi"] == "win32gl"     then _platforms = { "x32" };       defines { "APIABSTRACTION_OGL=1", "APIABSTRACTION_GLPC=1", "PE_PLAT_API=0x0104", "PE_PLAT_IS_WIN32=1", "PE_API_IS_GL=1" } end
	if _OPTIONS["platformapi"] == "ps3"         then _platforms = { "ps3" };       defines { "APIABSTRACTION_OGL=1", "PE_PLAT_API=0x0404", "PE_PLAT_IS_PS3=1", "PE_API_IS_GL=1", "SN_TARGET_PS3", "__GCC__" } end
	if _OPTIONS["platformapi"] == "psvita"      then _platforms = { "psvita" };    defines { "APIABSTRACTION_PSVITA=1", "PE_PLAT_API=0x1004", "PE_PLAT_IS_PSVITA=1", "PE_API_IS_PSVITA=1", "SN_TARGET_PSP2", "__GCC__" } end
    
    --SCE_GNM_DEBUG
	if _OPTIONS["platformapi"] == "orbis"      then _platforms = { "orbis" };    defines { "APIABSTRACTION_ORBIS=1", "PE_PLAT_API=0x2008", "PE_PLAT_IS_ORBIS=1", "PE_API_IS_ORBIS=1", "PE_64_BIT=1", "SCE_GNM_DEBUG" } end 
	if _OPTIONS["platformapi"] == "ios"         then _platforms = { "iPhone" };    defines { "APIABSTRACTION_IOS=1", "PE_PLAT_API=0x0804", "PE_PLAT_IS_IOS=1", "PE_API_IS_GL=1" } end
	
	platforms(_platforms)
	
	
	if _OPTIONS["platformapi"] == "ios" then
	
		xcodebuildsettings
		{
		"INFOPLIST_FILE = info.plist",
		'CODE_SIGN_IDENTITY = "iPhone Developer"',
		'OTHER_LDFLAGS = ("-framework",Foundation,"-framework",UIKit)',
		'SDKROOT = iphoneos6.0',
		"ONLY_ACTIVE_ARCH = NO", --setting to yes will build only one. setting to no build architectures defined by ARCHS and creates a fat binary
		'VALID_ARCHS = "$(ARCHS_STANDARD_32_BIT)"', -- sets valid architectures
		'ARCHS = "$(ARCHS_STANDARD_32_BIT)"',
		--'CURRENT_ARCH = "$(ARCHS_STANDARD_32_BIT)"',
		'TARGETED_DEVICE_FAMILY = 2',
		'IPHONEOS_DEPLOYMENT_TARGET = 8.1'
		}
		
		defines { "__USE_IOS_GLES__" }
	end
	
	flags { "EnableSSE", "EnableSSE2" }
	
	flags { "NoIncrementalLink" }
	--configuration "Debug"
	--defines { "MY_SYMBOL" }
	
	includedirs {"lua_dist/src", "."}
	
	--windows stuff
	if (_OPTIONS["platformapi"] == "win32gl" or _OPTIONS["platformapi"] == "win32d3d9" or _OPTIONS["platformapi"] == "win32d3d11") then
	
		gWinProgramFiles = "C:/Program Files (x86)"
		gWinDevKit = gWinProgramFiles.."/Windows Kits/8.0"
		gWinD3DIncludeDirs = { gWinDevKit.."/Include/um", gWinDevKit.."/Include/shared" } 
		--"$(ProgramFiles)\Windows Kits\8.0\Include\um;$(ProgramFiles)\Windows Kits\8.0\Include\shared;$(VCInstallDir)include;$(VCInstallDir)atlmfc\include;$(FrameworkSDKDir)\include;
	
	
		includedirs {gWinDevKit.."/Include/um", gWinDevKit.."/Include/shared"}
	
		if(_OPTIONS["platformapi"] == "win32gl") then
			gWinGLIncludeDirs = {"../External/DownloadedLibraries/glew-1.9.0/include/GL", "../External/DownloadedLibraries/", "../External/DownloadedLibraries/Cg/include" }
			includedirs { gWinGLIncludeDirs }
		
			gWinGLLibDirs = {"../External/DownloadedLibraries/glew-1.9.0/lib", "../External/DownloadedLibraries/Cg/lib/"}
			libdirs { gWinGLLibDirs }
		end
		
		includedirs { "../AssetsIn/SDL2-2.0.8/include", "../AssetsIn/SDL2_mixer-2.0.2/include", "C:/Program Files (x86)/Windows Kits/10/Include/10.0.14393.0/ucrt/" }
		libdirs { "../AssetsIn/SDL2-2.0.8/lib/x86", "../AssetsIn/SDL2_mixer-2.0.2/lib/x86" }

		

		gWinD3DLibDirs = { gWinDevKit.."/lib/win8/um/x86" } 
		libdirs { gWinD3DLibDirs }
		
		flags { "NoMinimalRebuild" } -- need to not compete with /MP
		buildoptions { "/MP" } -- add directly to cl.exe command line. note, in future premake releases, this is done with MultiProcessorCompile premake flag
		
		
	elseif _OPTIONS["platformapi"] == "ps3" then
		includedirs { '$(SCE_PS3_ROOT)\\target\\ppu\\include', '$(SCE_PS3_ROOT)\\target\\common\\include', '$(SCE_PS3_ROOT)\\host-win32\\sn\\ppu\\include' }
		libdirs { '$(SCE_PS3_ROOT)\\target\\ppu\\lib' }
		flags "SEH"
	elseif _OPTIONS["platformapi"] == "psvita" then
		includedirs { '$(SCE_PSP2_SDK_DIR)\\target\\ppu\\include', '$(SCE_PSP2_SDK_DIR)\\target\\include_common', '$(SCE_PS3_ROOT)\\host-win32\\sn\\ppu\\include' }
		libdirs { '$(SCE_PSP2_SDK_DIR)\\target\\lib' }
		flags "SEH"
    elseif _OPTIONS["platformapi"] == "orbis" then
        --pathdir { '$(SCE_ORBIS_SDK_DIR)\\host_tools\\bin;$(VCTargetsPath)\\Platforms\\ORBIS;$(PATH);' }
		includedirs { '$(SCE_ORBIS_SDK_DIR)\\host_tools\\lib\\clang\\include;$(SCE_ORBIS_SDK_DIR)\\target\\include;$(SCE_ORBIS_SDK_DIR)\\target\\include_common;' }
		libdirs { '$(SCE_ORBIS_SDK_DIR)\\target\lib' } 
		flags "SEH"
	end
    
    
    
	debugdir "$(SolutionDir)../"

	configuration "Debug"
		defines { "DEBUG", "_DEBUG" }
		flags { "Symbols" }

	configuration "Release"
		defines { "NDEBUG" }
		flags { "Optimize" }
	
	dofile("CharacterControl/premake4-charactercontrol.lua")

	dofile("lua_dist/premake4-lua_dist.lua")
	dofile("luasocket_dist/premake4-luasocket_dist.lua")
	dofile("PrimeEngine/premake4-primeengine.lua")
	if (_OPTIONS["platformapi"] == "ios") then
        dofile("glues/premake4-glues.lua")
    end


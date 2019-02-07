-- A project defines one build target
project("PrimeEngine-".._OPTIONS["platformapi"])
	kind "StaticLib"
	language "C++"
	files { "**.h", "**.cpp", "**.lua" }
	files { "../../AssetsOut/**.*"}
	excludes { "../../AssetsOut/Default/GPUPrograms/*.sdb", "../../AssetsOut/Default/GPUPrograms/*.cg", "../../AssetsOut/Default/GPUPrograms/*.gxp", "../../AssetsOut/Default/GPUPrograms/*.sb" }
	excludes { "**_Master0.cpp" }
    if _OPTIONS["platformapi"] == "ps3" or _OPTIONS["platformapi"] == "psvita" or _OPTIONS["platformapi"] == "orbis" then
		-- SCE Platforms PS3, PSVita
	
		-- on ps3, psvita the shader files (cgvs, cgps) actually are build during compilation (unlike other platforms compile them at runtime)
		-- so we need to exclude ones that are not built
		excludes { "../../AssetsOut/Default/GPUPrograms/*Instanced*.*" }
		
	else
		-- Non-SCE Platforms
		
		-- Pad input used by both PS3, PSVita; TODO: rename it to SCE_Input
		excludes { "APIAbstraction/PS3/PS3_PadInput/*.*" }
	end
	
    
	
	
	if _OPTIONS["platformapi"] ~= "ps3" and _OPTIONS["platformapi"] ~= "psvita" and _OPTIONS["platformapi"] ~= "orbis" and _OPTIONS["platformapi"] ~= "ios" then
		-- MSFT based platfroms: PC DX9, PC DX11, PC GL
		
		--excludes { "src/usocket.c", "src/unix.c"}
	else
		-- Non-MSFT based platforms = PS3, PSVita, iOS
	
		excludes { "APIAbstraction/DirectX*/**.*", "Application/WinApplication.*"}
	end
	
	if _OPTIONS["platformapi"] == "win32d3d9" or _OPTIONS["platformapi"] == "win32d3d11" then
		-- DX based platforms: PC DX9, PC DX11
		
	else
		-- Non-DX based platforms: PC GL, PS3, iOS GL, PSVita
		excludes { "APIAbstraction/Texture/Texture_DDS_Loader_D3D.cpp" }
		excludes { "Render/D3D*.*" }
	end
	
	if _OPTIONS["platformapi"] == "win32d3d9" then
		-- DX9 based platforms
	else
		-- Non-DX9 platfroms
		
		excludes { "Render/D3D9*.*" }
	end
	
	
	if _OPTIONS["platformapi"] == "ps3" or _OPTIONS["platformapi"] == "ios" or _OPTIONS["platformapi"] == "win32gl" then
		-- GL based platforms
	else
		-- Non-GL based platforms
		
		excludes { "APIAbstraction/Texture/Texture_DDS_Loader_GL.cpp" }
		
		excludes { "Render/GL*.*" }
	end
	
	
	if _OPTIONS["platformapi"] == "win32d3d11" then
		-- DX11
	else
		-- Non-DX11
		excludes { "Render/D3D11*.*" }
	end
	
	
	if _OPTIONS["platformapi"] == "ios" then
		-- iOS
		files { "GameIOSInput.mm"}
    else
		-- Non-iOS
        excludes { "Application/IOS*.*", "Render/IOS*.*", "Game/Client/IOS*.*", "Events/StandardIOS*.*" }
	end
	
	
	if _OPTIONS["platformapi"] == "ps3" then
		-- PS3 platform
    else
		-- Non-PS3 platforms
        excludes { "Application/PS3*.*" }
	end
	
	
	if _OPTIONS["platformapi"] == "psvita" then
		-- PSVita platform
    else
		-- Non-PSVita platforms
        excludes { "Application/PSVita*.*" }
		
		excludes { "Render/PSVita*.*" }
	end
    
    
	if _OPTIONS["platformapi"] == "orbis" then
		-- ORBIS
	else
		-- Non-ORBIS
		excludes { "Render/Orbis*.*" }
	end
	
	
    --shader build step
    --PSVITA
    
    if _OPTIONS["platformapi"] == "psvita" then
	
        filter 'files:**.cgps'
            -- A message to display while this build step is running (optional)
            buildmessage 'Compiling "%{file.relpath}" fragment shader to "%{file.directory}%{file.basename}.gxp"'
            buildcommands {
                '"$(SCE_PSP2_SDK_DIR)/host_tools/bin/psp2cgc.exe" --cache -DAPIABSTRACTION_PSVITA=1  --profile sce_fp_psp2 "%{file.relpath}" -o "%{file.directory}%{file.basename}.gxp"'
            }
            
            --"$(SCE_PSP2_SDK_DIR)\host_tools\bin\psp2cgc.exe" --cache -DAPIABSTRACTION_PSVITA=1  --profile sce_fp_psp2 "%{file.relpath}" -o "%(RootDir)%(Directory)%(Filename).gxp"
            
            -- One or more commands to run (required)
            --buildcommands {
            --	'luac -o "%{cfg.objdir}/%{file.basename}.out" "%{file.relpath}"'
            --}
        
            -- One or more outputs resulting from the build (required)
            buildoutputs { '%{file.directory}%{file.basename}.gxp' }
        
        filter 'files:**.cgvs'
            -- A message to display while this build step is running (optional)
            buildmessage 'Compiling "%{file.relpath}" vertex shader to "%{file.directory}%{file.basename}.gxp"'
            buildcommands {
                '"$(SCE_PSP2_SDK_DIR)/host_tools/bin/psp2cgc.exe" --cache -DAPIABSTRACTION_PSVITA=1  --profile sce_vp_psp2 "%{file.relpath}" -o "%{file.directory}%{file.basename}.gxp"'
            }
            -- One or more outputs resulting from the build (required)
            buildoutputs { '%{file.directory}%{file.basename}.gxp' }
	end
    
    if _OPTIONS["platformapi"] == "orbis" then
	
        filter 'files:**.cgps'
            -- A message to display while this build step is running (optional)
            buildmessage 'Compiling "%{file.relpath}" fragment shader to "%{file.directory}%{file.basename}.sb"'
            buildcommands {
                --note: for some reason -cachedir "%{file.directory}"  does not work, causes compilation command line format error
                '"$(SCE_ORBIS_SDK_DIR)/host_tools/bin/orbis-psslc.exe" -DAPIABSTRACTION_ORBIS=1 -o "%{file.directory}%{file.basename}.sb" -cache -profile sce_ps_orbis "%{file.relpath}"'
            }
            
            --"$(SCE_PSP2_SDK_DIR)\host_tools\bin\psp2cgc.exe" --cache -DAPIABSTRACTION_PSVITA=1  --profile sce_fp_psp2 "%{file.relpath}" -o "%(RootDir)%(Directory)%(Filename).gxp"
            
            -- One or more commands to run (required)
            --buildcommands {
            --	'luac -o "%{cfg.objdir}/%{file.basename}.out" "%{file.relpath}"'
            --}
        
            -- One or more outputs resulting from the build (required)
            buildoutputs { '%{file.directory}%{file.basename}.sb' }
        
        filter 'files:**.cgvs'
            -- A message to display while this build step is running (optional)
            buildmessage 'Compiling "%{file.relpath}" vertex shader to "%{file.directory}%{file.basename}.sb"'
            buildcommands {
                --note: for some reason -cachedir "%{file.directory}"  does not work, causes compilation command line format error
                '"$(SCE_ORBIS_SDK_DIR)/host_tools/bin/orbis-psslc.exe" -DAPIABSTRACTION_ORBIS=1 -o "%{file.directory}%{file.basename}.sb" -cache -profile sce_vs_vs_orbis "%{file.relpath}"'
            }
            -- One or more outputs resulting from the build (required)
            buildoutputs { '%{file.directory}%{file.basename}.sb' }
	end
    
    -- ORBIS
    --reference:
    --vertex shader:
    --"C:\SCE\ORBIS SDKs\2.000\host_tools\bin\orbis-psslc.exe" -I"C:\SCE\ORBIS SDKs\2.000\target\samples\sample_code\graphics\api_gnm\."  -o "C:\SCE\ORBIS SDKs\2.000\target\samples\sample_code\graphics\api_gnm\basic-sample\shader_vv.sb"  "C:\SCE\ORBIS SDKs\2.000\target\samples\sample_code\graphics\api_gnm\basic-sample\shader_vv.pssl" -cache -cachedir "C:\SCE\ORBIS SDKs\2.000\target\samples\sample_code\graphics\api_gnm\\Obj\Debug_ORBIS_basic-sample\\."

    --ours:
    --'"$(SCE_ORBIS_SDK_DIR)\\host_tools\\bin\\orbis-psslc.exe" -I"$(SCE_ORBIS_SDK_DIR)\\target\\samples\sample_code\graphics\api_gnm\."  -o "C:\SCE\ORBIS SDKs\2.000\target\samples\sample_code\graphics\api_gnm\basic-sample\shader_vv.sb"  "C:\SCE\ORBIS SDKs\2.000\target\samples\sample_code\graphics\api_gnm\basic-sample\shader_vv.pssl" -cache -cachedir "C:\SCE\ORBIS SDKs\2.000\target\samples\sample_code\graphics\api_gnm\\Obj\Debug_ORBIS_basic-sample\\."'

    
    --pixel shader:
    --"C:\SCE\ORBIS SDKs\2.000\host_tools\bin\orbis-psslc.exe" -I"C:\SCE\ORBIS SDKs\2.000\target\samples\sample_code\graphics\api_gnm\."  -o "C:\SCE\ORBIS SDKs\2.000\target\samples\sample_code\graphics\api_gnm\basic-sample\shader_p.sb"  "C:\SCE\ORBIS SDKs\2.000\target\samples\sample_code\graphics\api_gnm\basic-sample\shader_p.pssl" -cache -cachedir "C:\SCE\ORBIS SDKs\2.000\target\samples\sample_code\graphics\api_gnm\\Obj\Debug_ORBIS_basic-sample\\."
	
function TableConcat(t1,t2)
    for i=1,#t2 do
        t1[#t1+1] = t2[i]
    end
    return t1
end

	--includedirs(TableConcat({"../", "."}, gWinD3DIncludeDirs))
	configuration "Debug"
		defines { "DEBUG" }
		flags { "Symbols" }

	configuration "Release"
		defines { "NDEBUG" }
		flags { "Optimize" }

		
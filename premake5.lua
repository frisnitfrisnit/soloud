project "SoLoud"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"
    
    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "src/audiosource/wav/**.cpp",
        "src/audiosource/wav/**.c",
        "src/audiosource/wav/**.h",
        "src/backend/coreaudio/**.cpp",
        "src/core/**.cpp",
        "src/filter/**.cpp",
        
        "include/**.h",
    }

    filter "system:macosx"
    defines
    {
        "WITH_COREAUDIO"
    }
    
    links
    {
        "AudioToolbox.framework"
    }
    filter {}

    filter "system:windows"
        systemversion "latest"
    filter {}
 
    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"

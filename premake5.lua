workspace "VaddozEngine"
    architecture "x64"
    startproject "Sandbox"

    configurations{
        "Debug",
        "Release",
        "Dist"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "VaddozEngine"
    location "VaddozEngine"
    kind "SharedLib"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files{
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs{
        "%{prj.name}/src"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

        defines{
            "Va2_PLATFORM_WINDOWS",
            "Va2_BUILD_DLL"
        }

        postbuildcommands{
            ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
        }

    filter "configurations:Debug"
        defines "Va2_DEBUG"
        symbols "On"

    filter "configurations:Release"
        defines "Va2_RELEASE"
        optimize "On"

    filter "configurations:Dist"
        defines "Va2_DIST"
        optimize "On"


project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files{
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs{
        "VaddozEngine/src"
    }

    links {
        "VaddozEngine"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

        defines{
            "Va2_PLATFORM_WINDOWS"
        }

    filter "configurations:Debug"
        defines "Va2_DEBUG" 
        symbols "On"

    filter "configurations:Release"
        defines "Va2_RELEASE"
        optimize "On"

    filter "configurations:Dist"
        defines "Va2_DIST"
        optimize "On"
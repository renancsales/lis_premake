project "Lis"
	kind "StaticLib"
	language "C"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
	
	includedirs
	{
		"include",
		"src",
	}
	
	files
	{
		"include/lis.h",
		--"include/lis_config.h",
		"include/lis_config_win.h",
		--"include/lisf.h",
	     "include/**.h",
		"src/**/**.c",
	}

	filter "system:windows"
		systemversion "latest"
		defines 
		{ 
			"_CRT_SECURE_NO_WARNINGS", "HAVE_CONFIG_WIN_H", "WIN32",
			"_OPENMP", 
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"
		defines {"_DEBUG"}

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
		


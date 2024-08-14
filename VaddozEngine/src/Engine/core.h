#pragma once

#ifdef Va2_PLATFORM_WINDOWS
    #ifdef Va2_BUILD_DLL
        #define Va2_API __declspec(dllexport)
    #else
        #define Va2_API __declspec(dllexport)
#endif
#else
#error Only support windows
#endif
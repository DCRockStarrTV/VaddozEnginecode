#pragma once
#ifdef Va2_PLATFORM_WINDOWS
extern Vaddoz::Applications* Vaddoz::CreateApplication();

int main(int arc, char** arcv) {
	auto app = Vaddoz::CreateApplication();
	app->Run();
	delete app;
}
#else
#error Only support windows
#endif


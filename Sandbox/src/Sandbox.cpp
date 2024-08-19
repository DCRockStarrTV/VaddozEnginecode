#pragma once
#include <Vaddoz.h>

class Sandbox : public Vaddoz::Applications {
public:
	Sandbox(){

	}

	~Sandbox(){

	}
};

Vaddoz::Applications* CreateApplication() {
	return new Sandbox();
}
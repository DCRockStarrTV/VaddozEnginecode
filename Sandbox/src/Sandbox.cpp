#pragma once
#include <Vaddoz.h>

class Sandbox : public Vaddoz::Applications {
public:
	Sandbox(){

	}

	~Sandbox(){

	}
};

Vaddoz::Applications* Vaddoz::CreateApplication() {
	return new Sandbox();
}
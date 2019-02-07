
#define NOMINMAX

// API Abstraction
#include "PrimeEngine/APIAbstraction/APIAbstractionDefines.h"

// Outer-Engine includes

// Inter-Engine includes

// Sibling/Children includes
#include "PSVitaApplication.h"

namespace PE {
PSVitaApplication::PSVitaApplication(PE::GameContext &context, unsigned int width, unsigned int height, const char *caption)
{
	
}

void PSVitaApplication::exit()
{

}
Application* Application::Construct(PE::GameContext &context, unsigned int width, unsigned int height, const char *caption)
{
	Handle h("PSVitaApplication", sizeof(PSVitaApplication));
	PSVitaApplication *pApp = new (h) PSVitaApplication(context, width, height, caption);
	context.m_pApplication = pApp;
	return pApp;
}

}; // namespace PE

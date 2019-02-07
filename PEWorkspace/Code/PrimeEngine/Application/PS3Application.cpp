
#define NOMINMAX

// API Abstraction
#include "PrimeEngine/APIAbstraction/APIAbstractionDefines.h"

// Outer-Engine includes

// Inter-Engine includes

// Sibling/Children includes
#include "PS3Application.h"

namespace PE {
PS3Application::PS3Application(PE::GameContext &context, unsigned int width, unsigned int height, const char *caption)
{
	
}

void PS3Application::exit()
{

}
Application* Application::Construct(PE::GameContext &context, unsigned int width, unsigned int height, const char *caption)
{
	Handle h("PS3Application", sizeof(PS3Application));
	PS3Application *pApp = new (h) PS3Application(context, width, height, caption);
	context.m_pApplication = pApp;
	return pApp;
}

}; // namespace PE

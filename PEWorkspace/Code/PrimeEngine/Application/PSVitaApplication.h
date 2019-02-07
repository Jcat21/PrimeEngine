#ifndef __pe_ps3application_h__
#define __pe_ps3application_h__

#define NOMINMAX
// API Abstraction
#include "PrimeEngine/APIAbstraction/APIAbstractionDefines.h"

#if PE_PLAT_IS_PSVITA

// Inter-Engine includes
#include "PrimeEngine/MainFunction/MainFunctionArgs.h"
#include "PrimeEngine/MemoryManagement/Handle.h"
#include "PrimeEngine/Events/EventQueueManager.h"
#include "PrimeEngine/Events/StandardEvents.h"
#include "Application.h"

// Sibling/Children includes

// This class is implementation of IRenderer for D3D10

namespace PE {

// forward declaration of texture class

class PSVitaApplication : public Application
{
public:
	PSVitaApplication(PE::GameContext &context, unsigned int width, unsigned int height, const char *caption);
	virtual void processOSEventsIntoGlobalEventQueue() {}
	virtual void exit();

public:
	
};

}; // namespace PE
#endif // APIAbstraction
#endif // File guard

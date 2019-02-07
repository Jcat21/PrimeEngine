#ifndef __PRIMEENGINE_PS3_PAD_INPUT_H___
#define __PRIMEENGINE_PS3_PAD_INPUT_H___

// API Abstraction
#include "PrimeEngine/APIAbstraction/APIAbstractionDefines.h"

// Outer-Engine includes
#if PE_PLAT_IS_PSVITA
#include <ctrl.h>
#else
#include <cell/pad.h>
#endif
#include <assert.h>

// Inter-Engine includes
#include "PrimeEngine/MemoryManagement/Handle.h"
#include "PrimeEngine/Events/StandardEvents.h"
#include "PrimeEngine/Events/Component.h"
#include "PrimeEngine/Events/EventQueueManager.h"

// Sibling/Children includes

namespace PE {
// File specific #define's

namespace Components {
// This struct polls for controller input and fires off events accordingly
struct PS3_PadInput : public Component
{
	PE_DECLARE_CLASS(PS3_PadInput);

	PS3_PadInput(PE::GameContext &context, PE::MemoryArena arena, Handle hMyself);
	
	// Component ------------------------------------------------------------
	virtual void addDefaultComponents() ;

	// Individual events -------------------------------------------------------
	PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_UPDATE);
	virtual void do_UPDATE(Events::Event *pEvt);

	void generateButtonEvents();

	void generateAxisEvents();
#if PE_PLAT_IS_PSVITA
	SceCtrlData state;
	SceCtrlData lastState;
#else
	CellPadData state;
	CellPadData lastState;
#endif
	PE::Events::EventQueueManager *m_pQueueManager;
};
}; // namespace Components
}; // namespace PE


#endif//File guard

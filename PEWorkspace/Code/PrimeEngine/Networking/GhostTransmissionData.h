#ifndef __PrimeEngineGhostTransmissionData_H__
#define __PrimeEngineGhostTransmissionData_H__

// API Abstraction
#include "PrimeEngine/APIAbstraction/APIAbstractionDefines.h"

// Outer-Engine includes
#include <assert.h>
#include <vector>
#include <deque>

// Inter-Engine includes

#include "../Events/Component.h"

extern "C"
{
#include "../../luasocket_dist/src/socket.h"
};

#include "PrimeEngine/Networking/NetworkContext.h"
#include "PrimeEngine/Utils/Networkable.h"

// Sibling/Children includes


namespace PE {
	namespace Components
	{
		struct Component;
	};
	namespace Events
	{
		struct Ghost;
	};

struct GhostTransmissionData
{
	int m_size;
	char m_payload[PE_MAX_EVENT_PAYLOAD];
};

struct GhostReceptionData
{
	Components::Component *m_pTargetComponent;
	PE::Events::Ghost *m_pEvent;
};

}; // namespace PE
#endif

#ifndef __PrimeEngineGhostManager_H__
#define __PrimeEngineGhostManager_H__

// API Abstraction
#include "PrimeEngine/APIAbstraction/APIAbstractionDefines.h"

// Outer-Engine includes
#include <assert.h>
#include <map>
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
#include "Packet.h"

namespace PE {
namespace Components {

struct GhostManager : public Component
{
	static const int PE_EVENT_SLIDING_WINDOW = 64;

	PE_DECLARE_CLASS(GhostManager);

	// Constructor -------------------------------------------------------------
	GhostManager(PE::GameContext &context, PE::MemoryArena arena, PE::NetworkContext &netContext, Handle hMyself);

	virtual ~GhostManager();

	// Methods -----------------------------------------------------------------
	virtual void initialize();

	/// called by gameplay code to
	void registerToGhostingMap(PrimitiveTypes::Byte ghostid, PE::Networkable *pGhost) { m_targetObjects->insert(std::pair<PrimitiveTypes::Byte, PE::Networkable *>(ghostid, pGhost)); }

	int haveGhostsToSend();

	/// called by gameplay code to schedule event transmission to client(s)
	void prepareGhost(PE::Networkable *pGhost);

	void tryPrepareAll();

	/// called by StreamManager to put ghosts in packet
	int fillInNextPacket(char *pDataStream, TransmissionRecord *pRecord, int packetSizeAllocated, bool &out_usefulDataSent, bool &out_wantToSendMore);

	/// called by StreamManager to process transmission record deliver notification
	void processNotification(TransmissionRecord *pTransmittionRecord, bool delivered);

	void debugRender(int &threadOwnershipMask, float xoffset = 0, float yoffset = 0);

	int receiveNextPacket(char *pDataStream);
	
	// Component ------------------------------------------------------------
	virtual void addDefaultComponents();

	// Individual events -------------------------------------------------------

	// Loading -----------------------------------------------------------------

#if 0 // template
	//////////////////////////////////////////////////////////////////////////
	// Skin Lua Interface
	//////////////////////////////////////////////////////////////////////////
	//
	static void SetLuaFunctions(PE::Components::LuaEnvironment *pLuaEnv, lua_State *luaVM);
	//
	static int l_clientConnectToTCPServer(lua_State *luaVM);
	//
	//////////////////////////////////////////////////////////////////////////
#endif
	//////////////////////////////////////////////////////////////////////////
	// Member variables 
	//////////////////////////////////////////////////////////////////////////

	std::deque<GhostTransmissionData> m_ghostsToSend;
	std::map<PrimitiveTypes::Byte, Networkable*> *m_targetObjects;

	PE::NetworkContext *m_pNetContext;
};
}; // namespace Components
}; // namespace PE
#endif

#ifndef __PrimeEngineServerNetworkManager_H__
#define __PrimeEngineServerNetworkManager_H__

// API Abstraction
#include "PrimeEngine/APIAbstraction/APIAbstractionDefines.h"

// Outer-Engine includes
#include <assert.h>

// Inter-Engine includes

#include "PrimeEngine/Events/Component.h"

// Sibling/Children includes

#include "PrimeEngine/Networking/NetworkManager.h"

namespace PE {

namespace Components {


struct ServerNetworkManager : public NetworkManager
{
	PE_DECLARE_CLASS(ServerNetworkManager);

	// Constructor -------------------------------------------------------------
	ServerNetworkManager(PE::GameContext &context, PE::MemoryArena arena, Handle hMyself);

	virtual ~ServerNetworkManager();

	enum EServerState
	{
		ServerState_Uninitialized,
		ServerState_ConnectionListening,
		ServerState_Count
	};
	// Methods -----------------------------------------------------------------
	virtual void initNetwork();

	void serverOpenSocket();

	virtual void createNetworkConnectionContext(t_socket sock, int clientId, PE::NetworkContext *pNetContext);

	void debugRender(int &threadOwnershipMask, float xoffset = 0, float yoffset = 0);

	// forward to event manager
	void scheduleEventTo(PE::Networkable *pNetworkable, PE::Networkable *pNetworkableTarget, int client);
	void scheduleEventToAll(PE::Networkable *pNetworkable, PE::Networkable *pNetworkableTarget);
	void scheduleEventToAllExcept(PE::Networkable *pNetworkable, PE::Networkable *pNetworkableTarget, int exceptClient);


	// Component ------------------------------------------------------------
	virtual void addDefaultComponents();

	// Individual events -------------------------------------------------------
	PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_UPDATE);
	virtual void do_UPDATE(Events::Event *pEvt);

	PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_CLIENT_JOIN);
	virtual void do_CLIENT_JOIN(Events::Event *pEvt);

	// Loading -----------------------------------------------------------------

	//////////////////////////////////////////////////////////////////////////
	// Skin Lua Interface
	//////////////////////////////////////////////////////////////////////////
	//
	//static void SetLuaFunctions(PE::Components::LuaEnvironment *pLuaEnv, lua_State *luaVM);
	//
	//static int l_clientConnectToTCPServer(lua_State *luaVM);
	//
	//////////////////////////////////////////////////////////////////////////

	//////////////////////////////////////////////////////////////////////////
	// Member variables 
	//////////////////////////////////////////////////////////////////////////
	unsigned short m_serverPort; // for server only

	/*luasocket::*/t_socket m_sock;
	EServerState m_state;

	NetworkContext m_netContext; // the server context used mostly for udp

	std::map<PrimitiveTypes::Byte, Networkable*> m_ghostTargets;

	Array<NetworkContext> m_clientConnections;
	Threading::Mutex m_connectionsMutex;
};
}; // namespace Components
}; // namespace PE
#endif

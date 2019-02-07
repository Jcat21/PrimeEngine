#include "PrimeEngine/PrimeEngineIncludes.h"
#include "PrimeEngine/Lua/LuaEnvironment.h"
#include "ServerGameObjectRep.h"

using namespace PE::Components;
using namespace PE::Events;
using namespace CharacterControl::Components;

namespace CharacterControl
{
namespace Components
{

	PE_IMPLEMENT_CLASS1(ServerGameObject, Component);
	PE_IMPLEMENT_CLASS1(ServerLight, ServerGameObject);
	PE_IMPLEMENT_CLASS1(ServerMesh, ServerGameObject);
	PE_IMPLEMENT_CLASS1(ServerSkel, ServerGameObject);
	PE_IMPLEMENT_CLASS1(ServerAnimSet, ServerGameObject);
	PE_IMPLEMENT_CLASS1(ServerPowerUpBlock, ServerMesh)
	PE_IMPLEMENT_CLASS1(ServerBanana, ServerMesh);
	PE_IMPLEMENT_CLASS1(ServerCheckpoint, ServerMesh);
	PE_IMPLEMENT_CLASS1(ServerInvisiWall, ServerMesh);

}
}
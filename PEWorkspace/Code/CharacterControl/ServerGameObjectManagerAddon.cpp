#include "ServerGameObjectManagerAddon.h"

#include "PrimeEngine/Lua/Server/ServerLuaEnvironment.h"
#include "PrimeEngine/Networking/Server/ServerNetworkManager.h"
#include "PrimeEngine/GameObjectModel/GameObjectManager.h"

#include "Characters/SoldierNPC.h"
#include "WayPoint.h"
#include "Tank/ClientTank.h"

#include "TriggerVolumes/PowerUpBlock.h"
#include "TriggerVolumes/Banana.h"
#include "TriggerVolumes/Checkpoint.h"
#include "InvisiWall.h"

using namespace PE::Components;
using namespace PE::Events;
using namespace CharacterControl::Events;
using namespace CharacterControl::Components;

namespace CharacterControl{
namespace Components
{
PE_IMPLEMENT_CLASS1(ServerGameObjectManagerAddon, GameObjectManagerAddon); // creates a static handle and GteInstance*() methods. still need to create construct

void ServerGameObjectManagerAddon::addDefaultComponents()
{
	GameObjectManagerAddon::addDefaultComponents();

	PE_REGISTER_EVENT_HANDLER(Event_MoveTank_C_to_S, ServerGameObjectManagerAddon::do_MoveTank);
	PE_REGISTER_EVENT_HANDLER(Event_SomeoneWon_C_to_S, ServerGameObjectManagerAddon::do_SomeoneWon);

	PE_REGISTER_EVENT_HANDLER(Event_CREATE_LIGHT, ServerGameObjectManagerAddon::do_Create_Light);
	PE_REGISTER_EVENT_HANDLER(Event_CREATE_MESH, ServerGameObjectManagerAddon::do_Create_Mesh);
	PE_REGISTER_EVENT_HANDLER(Event_CREATE_SKELETON, ServerGameObjectManagerAddon::do_Create_Skel);
	PE_REGISTER_EVENT_HANDLER(Event_CREATE_ANIM_SET, ServerGameObjectManagerAddon::do_Create_AnimSet);

	PE_REGISTER_EVENT_HANDLER(Event_Create_PowerUpBlock, ServerGameObjectManagerAddon::do_Create_PowerUpBlock);
	PE_REGISTER_EVENT_HANDLER(Event_Create_Banana, ServerGameObjectManagerAddon::do_Create_Banana);
	PE_REGISTER_EVENT_HANDLER(Event_Create_Checkpoint, ServerGameObjectManagerAddon::do_Create_Checkpoint);
	PE_REGISTER_EVENT_HANDLER(Event_Create_InvisiWall, ServerGameObjectManagerAddon::do_Create_InvisiWall);

	PE_REGISTER_EVENT_HANDLER(Event_LevelLoading_Done, ServerGameObjectManagerAddon::do_LevelLoading_Done);
}

void ServerGameObjectManagerAddon::do_MoveTank(PE::Events::Event *pEvt)
{
	assert(pEvt->isInstanceOf<Event_MoveTank_C_to_S>());

	Event_MoveTank_C_to_S *pTrueEvent = (Event_MoveTank_C_to_S*)(pEvt);

	// need to send this event to all clients except the client it came from

	Event_MoveTank_S_to_C fwdEvent(*m_pContext);
	fwdEvent.m_transform = pTrueEvent->m_transform;
	fwdEvent.m_clientTankId = pTrueEvent->m_networkClientId; // need to tell cleints which tank to move

	ServerNetworkManager *pNM = (ServerNetworkManager *)(m_pContext->getNetworkManager());
	pNM->scheduleEventToAllExcept(&fwdEvent, m_pContext->getGameObjectManager(), pTrueEvent->m_networkClientId);

}

void ServerGameObjectManagerAddon::do_SomeoneWon(PE::Events::Event *pEvt)
{
	assert(pEvt->isInstanceOf<Event_SomeoneWon_C_to_S>());

	Event_SomeoneWon_C_to_S *pTrueEvent = (Event_SomeoneWon_C_to_S*)(pEvt);

	// need to send this event to all clients except the client it came from

	Event_SomeoneWon_S_to_C fwdEvent(*m_pContext);
	fwdEvent.m_clientTankId = pTrueEvent->m_networkClientId; // need to tell cleints which tank to move

	ServerNetworkManager *pNM = (ServerNetworkManager *)(m_pContext->getNetworkManager());
	pNM->scheduleEventToAllExcept(&fwdEvent, m_pContext->getGameObjectManager(), pTrueEvent->m_networkClientId);

}

void ServerGameObjectManagerAddon::do_Create_Light(PE::Events::Event *pEvt)
{
	assert(pEvt->isInstanceOf<Event_CREATE_LIGHT>());

	Event_CREATE_LIGHT *pTrueEvent = (Event_CREATE_LIGHT*)pEvt;

	ServerNetworkManager *pNM = (ServerNetworkManager *)(m_pContext->getNetworkManager());

	Event_CREATE_LIGHT_Server fwdEvent(*m_pContext);
	fwdEvent.m_clientTankId = pTrueEvent->m_networkClientId;

	//if we have the object here it has been sent to others previously
	if (ServerGameObject *sgo = getFromServerGameObjectList(pTrueEvent->m_peuuid, ServerLight::GetClassId()))
	{
		//so we only send the current state of it to the the guy who's just creating it on his client
		fillFwdEvent(&fwdEvent, sgo);
		pNM->scheduleEventTo(&fwdEvent, m_pContext->getGameObjectManager(), pTrueEvent->m_networkClientId);

		return;
	}

	//if we don't have the object, we store it, and then send it everywhere
	fillFwdEvent(&fwdEvent, addToListFromEvent(pTrueEvent));
	pNM->scheduleEventToAll(&fwdEvent, m_pContext->getGameObjectManager());
}

void ServerGameObjectManagerAddon::do_Create_Mesh(PE::Events::Event *pEvt)
{
	assert(pEvt->isInstanceOf<Event_CREATE_MESH>());

	Event_CREATE_MESH *pTrueEvent = (Event_CREATE_MESH*)pEvt;

	ServerNetworkManager *pNM = (ServerNetworkManager *)(m_pContext->getNetworkManager());

	Event_CREATE_MESH_Server fwdEvent(*m_pContext);
	fwdEvent.m_clientTankId = pTrueEvent->m_networkClientId;

	//if we have the object here it has been sent to others previously
	if (ServerGameObject *sgo = getFromServerGameObjectList(pTrueEvent->m_peuuid, ServerMesh::GetClassId()))
	{
		//so we only send the current state of it to the the guy who's just creating it on his client
		fillFwdEvent(&fwdEvent, sgo);
		pNM->scheduleEventTo(&fwdEvent, m_pContext->getGameObjectManager(), pTrueEvent->m_networkClientId);

		return;
	}

	//if we don't have the object, we store it, and then send it everywhere
	fillFwdEvent(&fwdEvent, addToListFromEvent(pTrueEvent));
	pNM->scheduleEventToAll(&fwdEvent, m_pContext->getGameObjectManager());
}

void ServerGameObjectManagerAddon::do_Create_Skel(PE::Events::Event *pEvt)
{
	assert(pEvt->isInstanceOf<Event_CREATE_SKELETON>());

	Event_CREATE_SKELETON *pTrueEvent = (Event_CREATE_SKELETON*)pEvt;

	ServerNetworkManager *pNM = (ServerNetworkManager *)(m_pContext->getNetworkManager());

	Event_CREATE_SKELETON_Server fwdEvent(*m_pContext);
	fwdEvent.m_clientTankId = pTrueEvent->m_networkClientId;

	//if we have the object here it has been sent to others previously
	if (ServerGameObject *sgo = getFromServerGameObjectList(pTrueEvent->m_peuuid, ServerSkel::GetClassId()))
	{
		//so we only send the current state of it to the the guy who's just creating it on his client
		fillFwdEvent(&fwdEvent, sgo);
		pNM->scheduleEventTo(&fwdEvent, m_pContext->getGameObjectManager(), pTrueEvent->m_networkClientId);

		return;
	}

	//if we don't have the object, we store it, and then send it everywhere
	fillFwdEvent(&fwdEvent, addToListFromEvent(pTrueEvent));
	pNM->scheduleEventToAll(&fwdEvent, m_pContext->getGameObjectManager());
}

void ServerGameObjectManagerAddon::do_Create_AnimSet(PE::Events::Event *pEvt)
{
	assert(pEvt->isInstanceOf<Event_CREATE_ANIM_SET>());

	Event_CREATE_ANIM_SET *pTrueEvent = (Event_CREATE_ANIM_SET*)pEvt;

	ServerNetworkManager *pNM = (ServerNetworkManager *)(m_pContext->getNetworkManager());

	Event_CREATE_ANIM_SET_Server fwdEvent(*m_pContext);
	fwdEvent.m_clientTankId = pTrueEvent->m_networkClientId;

	//if we have the object here it has been sent to others previously
	if (ServerGameObject *sgo = getFromServerGameObjectList(pTrueEvent->m_peuuid, ServerSkel::GetClassId()))
	{
		//so we only send the current state of it to the the guy who's just creating it on his client
		fillFwdEvent(&fwdEvent, sgo);
		pNM->scheduleEventTo(&fwdEvent, m_pContext->getGameObjectManager(), pTrueEvent->m_networkClientId);

		return;
	}

	//if we don't have the object, we store it, and then send it everywhere
	fillFwdEvent(&fwdEvent, addToListFromEvent(pTrueEvent));
	pNM->scheduleEventToAll(&fwdEvent, m_pContext->getGameObjectManager());
}

void ServerGameObjectManagerAddon::do_Create_PowerUpBlock(PE::Events::Event *pEvt)
{
	assert(pEvt->isInstanceOf<Event_Create_PowerUpBlock>());

	Event_Create_PowerUpBlock *pTrueEvent = (Event_Create_PowerUpBlock *)pEvt;

	ServerNetworkManager *pNM = (ServerNetworkManager *)(m_pContext->getNetworkManager());

	Event_Create_Server_PowerUpBlock fwdEvent(*m_pContext);	
	fwdEvent.m_clientTankId = pTrueEvent->m_networkClientId; // need to tell cleints which tank to move

	//if we have the object here it has been sent to others previously
	if (ServerGameObject *sgo = getFromServerGameObjectList(pTrueEvent->m_peuuid, ServerPowerUpBlock::GetClassId()))
	{
		//so we only send the current state of it to the the guy who's just creating it on his client
		fillFwdEvent(&fwdEvent, sgo);
		pNM->scheduleEventTo(&fwdEvent, m_pContext->getGameObjectManager(), pTrueEvent->m_networkClientId);

		return;
	}

	//if we don't have the object, we store it, and then send it everywhere
	fillFwdEvent(&fwdEvent, addToListFromEvent(pTrueEvent));
	pNM->scheduleEventToAll(&fwdEvent, m_pContext->getGameObjectManager());
}

void ServerGameObjectManagerAddon::do_Create_Banana(PE::Events::Event *pEvt)
{
	assert(pEvt->isInstanceOf<Event_Create_Banana>());

	Event_Create_Banana *pTrueEvent = (Event_Create_Banana *)pEvt;

	ServerNetworkManager *pNM = (ServerNetworkManager *)(m_pContext->getNetworkManager());

	Event_Create_Server_Banana fwdEvent(*m_pContext);
	fwdEvent.m_clientTankId = pTrueEvent->m_networkClientId; // need to tell cleints which tank to move

															 //if we have the object here it has been sent to others previously
	if (ServerGameObject *sgo = getFromServerGameObjectList(pTrueEvent->m_peuuid, ServerBanana::GetClassId()))
	{
		//so we only send the current state of it to the the guy who's just creating it on his client
		fillFwdEvent(&fwdEvent, sgo);
		pNM->scheduleEventTo(&fwdEvent, m_pContext->getGameObjectManager(), pTrueEvent->m_networkClientId);

		return;
	}

	//if we don't have the object, we store it, and then send it everywhere
	fillFwdEvent(&fwdEvent, addToListFromEvent(pTrueEvent));
	pNM->scheduleEventToAll(&fwdEvent, m_pContext->getGameObjectManager());
}
void ServerGameObjectManagerAddon::do_Create_Checkpoint(PE::Events::Event *pEvt)
{
	assert(pEvt->isInstanceOf<Event_Create_Checkpoint>());

	Event_Create_Checkpoint *pTrueEvent = (Event_Create_Checkpoint *)pEvt;

	ServerNetworkManager *pNM = (ServerNetworkManager *)(m_pContext->getNetworkManager());

	Event_Create_Server_Checkpoint fwdEvent(*m_pContext);
	fwdEvent.m_clientTankId = pTrueEvent->m_networkClientId; // need to tell cleints which tank to move

	//if we have the object here it has been sent to others previously
	if (ServerGameObject *sgo = getFromServerGameObjectList(pTrueEvent->m_peuuid, ServerCheckpoint::GetClassId()))
	{
		//so we only send the current state of it to the the guy who's just creating it on his client
		fillFwdEvent(&fwdEvent, sgo);
		pNM->scheduleEventTo(&fwdEvent, m_pContext->getGameObjectManager(), pTrueEvent->m_networkClientId);

		return;
	}

	//if we don't have the object, we store it, and then send it everywhere
	fillFwdEvent(&fwdEvent, addToListFromEvent(pTrueEvent));
	pNM->scheduleEventToAll(&fwdEvent, m_pContext->getGameObjectManager());
}

void ServerGameObjectManagerAddon::do_Create_InvisiWall(PE::Events::Event *pEvt)
{
	assert(pEvt->isInstanceOf<Event_Create_InvisiWall>());

	Event_Create_InvisiWall *pTrueEvent = (Event_Create_InvisiWall *)pEvt;

	ServerNetworkManager *pNM = (ServerNetworkManager *)(m_pContext->getNetworkManager());

	Event_Create_Server_InvisiWall fwdEvent(*m_pContext);
	fwdEvent.m_clientTankId = pTrueEvent->m_networkClientId; // need to tell cleints which tank to move

	//if we have the object here it has been sent to others previously
	if (ServerGameObject *sgo = getFromServerGameObjectList(pTrueEvent->m_peuuid, ServerInvisiWall::GetClassId()))
	{
		//so we only send the current state of it to the the guy who's just creating it on his client
		fillFwdEvent(&fwdEvent, sgo);
		pNM->scheduleEventTo(&fwdEvent, m_pContext->getGameObjectManager(), pTrueEvent->m_networkClientId);

		return;
	}

	//if we don't have the object, we store it, and then send it everywhere
	fillFwdEvent(&fwdEvent, addToListFromEvent(pTrueEvent));
	pNM->scheduleEventToAll(&fwdEvent, m_pContext->getGameObjectManager());
}

/////////////////////////////
//Other Utils
/////////////////////////////

ServerGameObject* ServerGameObjectManagerAddon::addToListFromEvent(PE::Events::Event *pEvt)
{
	if (pEvt->isInstanceOf<Event_CREATE_LIGHT>())
	{
		Event_CREATE_LIGHT *c2s = (Event_CREATE_LIGHT *)pEvt;

		PE::Handle hslight("Server PowerUpBlock", sizeof(ServerLight));
		ServerLight *slight = new(hslight) ServerLight(*m_pContext, m_arena, hslight);
		slight->m_peuuid = c2s->m_peuuid;

		slight->m_u = c2s->m_u;
		slight->m_v = c2s->m_v;
		slight->m_n = c2s->m_n;
		slight->m_pos = c2s->m_pos;
		slight->m_ambient = c2s->m_ambient;
		slight->m_diffuse = c2s->m_diffuse;
		slight->m_spec = c2s->m_spec;
		slight->m_att = c2s->m_att;
		slight->m_spotPower = c2s->m_spotPower;
		slight->m_range = c2s->m_range;
		slight->m_isShadowCaster = c2s->m_isShadowCaster;
		slight->m_type = c2s->m_type;
		m_serverGameObjects.add(hslight);

		return slight;
	}
	else if (pEvt->isInstanceOf<Event_CREATE_SKELETON>())
	{
		Event_CREATE_SKELETON *c2s = (Event_CREATE_SKELETON *)pEvt;

		PE::Handle hsskel("Server PowerUpBlock", sizeof(ServerSkel));
		ServerSkel *sskel = new(hsskel) ServerSkel(*m_pContext, m_arena, hsskel);
		sskel->m_peuuid = c2s->m_peuuid;

		StringOps::writeToString(c2s->m_skelFilename, sskel->m_skelFilename, sizeof(sskel->m_skelFilename));
		StringOps::writeToString(c2s->m_package, sskel->m_package, sizeof(sskel->m_package));
		sskel->m_u = c2s->m_u;
		sskel->m_v = c2s->m_v;
		sskel->m_n = c2s->m_n;
		sskel->m_pos = c2s->m_pos;
		m_serverGameObjects.add(hsskel);

		return sskel;
	}
	else if (pEvt->isInstanceOf<Event_CREATE_ANIM_SET>())
	{

	}
	else if (pEvt->isInstanceOf<Event_CREATE_MESH>())
	{
		if (pEvt->isInstanceOf<Event_Create_PowerUpBlock>())
		{
			Event_Create_PowerUpBlock *c2s = (Event_Create_PowerUpBlock *)pEvt;

			PE::Handle hspub("Server PowerUpBlock", sizeof(ServerPowerUpBlock));
			ServerPowerUpBlock *spub = new(hspub) ServerPowerUpBlock(*m_pContext, m_arena, hspub);
			spub->m_peuuid = c2s->m_peuuid;

			StringOps::writeToString(c2s->m_meshFilename, spub->m_meshFilename, sizeof(spub->m_meshFilename));
			StringOps::writeToString(c2s->m_package, spub->m_package, sizeof(spub->m_package));
			spub->m_u = c2s->m_u;
			spub->m_v = c2s->m_v;
			spub->m_n = c2s->m_n;
			spub->m_pos = c2s->m_pos;
			m_serverGameObjects.add(hspub);

			return spub;
		}
		else if (pEvt->isInstanceOf<Event_Create_Banana>())
		{
			Event_Create_Banana *c2s = (Event_Create_Banana *)pEvt;

			PE::Handle hsb("Server Banana", sizeof(ServerBanana));
			ServerBanana *sb = new(hsb) ServerBanana(*m_pContext, m_arena, hsb);
			sb->m_peuuid = c2s->m_peuuid;

			sb->m_u = c2s->m_u;
			sb->m_v = c2s->m_v;
			sb->m_n = c2s->m_n;
			sb->m_pos = c2s->m_pos;
			m_serverGameObjects.add(hsb);

			return sb;
		}
		else if (pEvt->isInstanceOf<Event_Create_InvisiWall>())
		{
			Event_Create_InvisiWall *c2s = (Event_Create_InvisiWall *)pEvt;

			PE::Handle hsiw("Server InvisiWall", sizeof(ServerInvisiWall));
			ServerInvisiWall *siw = new(hsiw) ServerInvisiWall(*m_pContext, m_arena, hsiw);
			siw->m_peuuid = c2s->m_peuuid;

			siw->m_u = c2s->m_u;
			siw->m_v = c2s->m_v;
			siw->m_n = c2s->m_n;
			siw->m_pos = c2s->m_pos;
			m_serverGameObjects.add(hsiw);

			return siw;
		}
		else if (pEvt->isInstanceOf<Event_Create_Checkpoint>())
		{
			Event_Create_Checkpoint *c2s = (Event_Create_Checkpoint *)pEvt;

			PE::Handle hcp("Server Checkpoint", sizeof(ServerCheckpoint));
			ServerCheckpoint *scp = new(hcp) ServerCheckpoint(*m_pContext, m_arena, hcp);
			scp->m_peuuid = c2s->m_peuuid;

			StringOps::writeToString(c2s->m_name, scp->m_name, sizeof(scp->m_name));
			StringOps::writeToString(c2s->m_next, scp->m_next, sizeof(scp->m_next));
			scp->m_u = c2s->m_u;
			scp->m_v = c2s->m_v;
			scp->m_n = c2s->m_n;
			scp->m_pos = c2s->m_pos;
			m_serverGameObjects.add(hcp);

			return scp;
		}
		else
		{
			// normal mesh
			Event_CREATE_MESH *c2s = (Event_CREATE_MESH *)pEvt;

			PE::Handle hsmesh("Server PowerUpBlock", sizeof(ServerMesh));
			ServerMesh *smesh = new(hsmesh) ServerMesh(*m_pContext, m_arena, hsmesh);
			smesh->m_peuuid = c2s->m_peuuid;

			StringOps::writeToString(c2s->m_meshFilename, smesh->m_meshFilename, sizeof(smesh->m_meshFilename));
			StringOps::writeToString(c2s->m_package, smesh->m_package, sizeof(smesh->m_package));
			smesh->m_u = c2s->m_u;
			smesh->m_v = c2s->m_v;
			smesh->m_n = c2s->m_n;
			smesh->m_pos = c2s->m_pos;
			smesh->hasCustomOrientation = c2s->hasCustomOrientation;

			smesh->m_numShapes = c2s->m_numShapes;
			for (int i = 0; i < smesh->m_numShapes; i++)
			{
				smesh->m_physShapeType[i] = c2s->m_physShapeType[i];
				smesh->m_physShapeTranslate[i] = c2s->m_physShapeTranslate[i];
				smesh->m_physShapeScale[i] = c2s->m_physShapeScale[i];
				smesh->m_physShapeRadius[i] = c2s->m_physShapeRadius[i];
			}

			m_serverGameObjects.add(hsmesh);

			return smesh;
		}
	}
}

// dario note: does not include client id
// also: server creation events aren't in a heirarchy unlike client stuff (e.g. meshes)
void ServerGameObjectManagerAddon::fillFwdEvent(PE::Events::Event *pEvt, ServerGameObject* sgo)
{
	if (pEvt->isInstanceOf<Event_CREATE_LIGHT_Server>())
	{
		Event_CREATE_LIGHT_Server *s2c = (Event_CREATE_LIGHT_Server *)pEvt;
		ServerLight *slight = (ServerLight*)sgo;

		s2c->m_u = slight->m_u;
		s2c->m_v = slight->m_v;
		s2c->m_n = slight->m_n;
		s2c->m_pos = slight->m_pos;
		s2c->m_ambient = slight->m_ambient;
		s2c->m_diffuse = slight->m_diffuse;
		s2c->m_spec = slight->m_spec;
		s2c->m_att = slight->m_att;
		s2c->m_spotPower = slight->m_spotPower;
		s2c->m_range = slight->m_range;
		s2c->m_isShadowCaster = slight->m_isShadowCaster;
		s2c->m_type = slight->m_type;
		s2c->m_peuuid = slight->m_peuuid;
	}
	else if (pEvt->isInstanceOf<Event_CREATE_MESH_Server>())
	{

		Event_CREATE_MESH_Server *s2c = (Event_CREATE_MESH_Server *)pEvt;
		ServerMesh *smesh = (ServerMesh*)sgo;

		StringOps::writeToString(smesh->m_meshFilename, s2c->m_meshFilename, sizeof(s2c->m_meshFilename));
		StringOps::writeToString(smesh->m_package, s2c->m_package, sizeof(s2c->m_package));
		s2c->m_u = smesh->m_u;
		s2c->m_v = smesh->m_v;
		s2c->m_n = smesh->m_n;
		s2c->m_pos = smesh->m_pos;
		s2c->hasCustomOrientation = smesh->hasCustomOrientation;

		s2c->m_numShapes = smesh->m_numShapes;
		for (int i = 0; i < s2c->m_numShapes; i++)
		{
			s2c->m_physShapeType[i] = smesh->m_physShapeType[i];
			s2c->m_physShapeTranslate[i] = smesh->m_physShapeTranslate[i];
			s2c->m_physShapeScale[i] = smesh->m_physShapeScale[i];
			s2c->m_physShapeRadius[i] = smesh->m_physShapeRadius[i];
		}

		s2c->m_peuuid = smesh->m_peuuid;
	}
	else if (pEvt->isInstanceOf<Event_CREATE_SKELETON_Server>())
	{
		Event_CREATE_SKELETON_Server *s2c = (Event_CREATE_SKELETON_Server *)pEvt;
		ServerSkel *sskel = (ServerSkel*)sgo;

		StringOps::writeToString(sskel->m_skelFilename, s2c->m_skelFilename, sizeof(s2c->m_skelFilename));
		StringOps::writeToString(sskel->m_package, s2c->m_package, sizeof(s2c->m_package));
		s2c->m_u = sskel->m_u;
		s2c->m_v = sskel->m_v;
		s2c->m_n = sskel->m_n;
		s2c->m_pos = sskel->m_pos;
		s2c->hasCustomOrientation = sskel->hasCustomOrientation;

		s2c->m_peuuid = sskel->m_peuuid;
	}
	else if (pEvt->isInstanceOf<Event_CREATE_ANIM_SET_Server>())
	{
		Event_CREATE_ANIM_SET_Server *s2c = (Event_CREATE_ANIM_SET_Server *)pEvt;
		ServerAnimSet *sas = (ServerAnimSet*)sgo;

		StringOps::writeToString(sas->animSetFilename, s2c->animSetFilename, sizeof(s2c->animSetFilename));
		StringOps::writeToString(sas->m_package, s2c->m_package, sizeof(s2c->m_package));
		s2c->m_peuuid = sas->m_peuuid;
	}
	else if (pEvt->isInstanceOf<Event_Create_Server_PowerUpBlock>())
	{
		Event_Create_Server_PowerUpBlock *s2c = (Event_Create_Server_PowerUpBlock *)pEvt;
		ServerPowerUpBlock *spub = (ServerPowerUpBlock*)sgo;

		StringOps::writeToString(spub->m_meshFilename, s2c->m_meshFilename, sizeof(s2c->m_meshFilename));
		StringOps::writeToString(spub->m_package, s2c->m_package, sizeof(s2c->m_package));
		s2c->m_u = spub->m_u;
		s2c->m_v = spub->m_v;
		s2c->m_n = spub->m_n;
		s2c->m_pos = spub->m_pos;
	}
	else if (pEvt->isInstanceOf<Event_Create_Server_Banana>())
	{
		Event_Create_Server_Banana *s2c = (Event_Create_Server_Banana *)pEvt;
		ServerBanana *sb = (ServerBanana*)sgo;

		StringOps::writeToString(sb->m_meshFilename, s2c->m_meshFilename, sizeof(s2c->m_meshFilename));
		StringOps::writeToString(sb->m_package, s2c->m_package, sizeof(s2c->m_package));
		s2c->m_u = sb->m_u;
		s2c->m_v = sb->m_v;
		s2c->m_n = sb->m_n;
		s2c->m_pos = sb->m_pos;
	}
	
	
	
	else if (pEvt->isInstanceOf<Event_Create_Server_InvisiWall>())
	{
		Event_Create_Server_InvisiWall *s2c = (Event_Create_Server_InvisiWall *)pEvt;
		ServerInvisiWall *siw = (ServerInvisiWall*)sgo;

		s2c->m_u = siw->m_u;
		s2c->m_v = siw->m_v;
		s2c->m_n = siw->m_n;
		s2c->m_pos = siw->m_pos;
	}
	else if (pEvt->isInstanceOf<Event_Create_Server_Checkpoint>())
	{
		Event_Create_Server_Checkpoint *s2c = (Event_Create_Server_Checkpoint *)pEvt;
		ServerCheckpoint *scp = (ServerCheckpoint*)sgo;

		StringOps::writeToString(scp->m_name, s2c->m_name, sizeof(s2c->m_name));
		StringOps::writeToString(scp->m_next, s2c->m_next, sizeof(s2c->m_next));
		s2c->m_u = scp->m_u;
		s2c->m_v = scp->m_v;
		s2c->m_n = scp->m_n;
		s2c->m_pos = scp->m_pos;
	}
}

ServerGameObject* ServerGameObjectManagerAddon::getFromServerGameObjectList(PEUUID peuuid, int classid)
{
	if (m_serverGameObjects.m_size == 0) return NULL;
	
	PE::Handle *phsgo = m_serverGameObjects.getFirstPtr();
	for (PrimitiveTypes::UInt32 i = 0; i < m_serverGameObjects.m_size; i++, phsgo++)
	{
		ServerGameObject *sgo = (*phsgo).getObject<ServerGameObject>();
		
		//if we have the object here it has been sent to others previously
		if (sgo->m_peuuid.isEqualTo(peuuid) && sgo->isInstanceOf(classid))
		{
			return sgo;
		}
	}

	return NULL;
}

void ServerGameObjectManagerAddon::do_LevelLoading_Done(PE::Events::Event *pEvt)
{
	assert(pEvt->isInstanceOf<Event_LevelLoading_Done>());

	Event_LevelLoading_Done *pTrueEvent = (Event_LevelLoading_Done *)pEvt;
	Event_LevelLoading_Done_Server fwdEvent(*m_pContext);
	fwdEvent.m_clientTankId = pTrueEvent->m_networkClientId; // need to tell cleints which tank to move
	fwdEvent.m_activate = false;

	ServerNetworkManager *pNM = (ServerNetworkManager *)(m_pContext->getNetworkManager());
	pNM->scheduleEventTo(&fwdEvent, m_pContext->getGameObjectManager(), pTrueEvent->m_networkClientId);
	
	if (pNM->m_clientConnections.m_size == 2) //dario note: hardcoded number of players to begin game
	{
		for (int i = 0; i < pNM->m_clientConnections.m_size; ++i)
		{
			fwdEvent.m_clientTankId = i;
			fwdEvent.m_activate = true;
			pNM->scheduleEventTo(&fwdEvent, m_pContext->getGameObjectManager(), i);
		}
	}
}

}
}

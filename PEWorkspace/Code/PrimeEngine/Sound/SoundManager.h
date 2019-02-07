#ifndef __PYENGINE_2_0_SOUND_MANAGER__
#define __PYENGINE_2_0_SOUND_MANAGER__

#define NOMINMAX
// API Abstraction
#include "PrimeEngine/APIAbstraction/APIAbstractionDefines.h"


// Outer-Engine includes

// Inter-Engine includes
#include "PrimeEngine/MemoryManagement/Handle.h"
#include "../Events/Component.h"
#include "../Events/Event.h"
#include "../Events/StandardEvents.h"
#include <SDL.h>
#undef main
#include <SDL_mixer.h>
#include <fstream>
#include <ostream>
#include <iostream>

#include <string>
#include <map>

// Sibling/Children includes
namespace PE {
namespace Components {

struct SoundManager : public Component
{
	PE_DECLARE_CLASS(SoundManager);

	SoundManager(PE::GameContext &context, PE::MemoryArena arena, Handle hMyself, bool isActive = true): Component(context, arena, hMyself)
	{

		
		#if APIABSTRACTION_D3D9 || APIABSTRACTION_D3D11
		#endif
	}

	virtual ~SoundManager() {
		/*for(auto music : mMusics)
		{
			Mix_FreeMusic(music.second);
		}
		for (auto chunk : mChunks)
		{
			Mix_FreeChunk(chunk.second);
		}*/
		Mix_Quit();
	}
	
	// Component ------------------------------------------------------------

	virtual void addDefaultComponents()
	{
		Component::addDefaultComponents();
		
		PE_REGISTER_EVENT_HANDLER(Events::Event_UPDATE, SoundManager::do_UPDATE);
	}

	PE_DECLARE_IMPLEMENT_EVENT_HANDLER_WRAPPER(do_UPDATE);
	virtual void do_UPDATE(Events::Event *pEvt)
	{
#		if APIABSTRACTION_D3D9 || APIABSTRACTION_D3D11
#		endif
	}

	static void Construct(PE::GameContext &context, PE::MemoryArena arena, bool isActive = true)
	{
		Handle h("SOUND_MANAGER", sizeof(SoundManager));
		SoundManager *pSoundManager = new(h) SoundManager(context, arena, h, isActive);
		pSoundManager->addDefaultComponents();
		int flags = MIX_INIT_OGG| MIX_INIT_MOD | MIX_INIT_MID;
		int initted = Mix_Init(flags);
		if (initted&flags != flags) {
			printf("Mix_Init: Failed to init required ogg and mod support!\n");
			printf("Mix_Init: %s\n", Mix_GetError());
			// handle error
			exit(1);
		}
		if (SDL_Init(SDL_INIT_AUDIO) == -1) {
			printf("SDL_Init: %s\n", SDL_GetError());
			exit(1);
		}

		if (Mix_OpenAudio(44100, MIX_DEFAULT_FORMAT, 2, 1024) == -1) {
			printf("Mix_OpenAudio: %s\n", Mix_GetError());
			exit(2);
		}
		// open 44.1KHz, signed 16bit, system byte order,
		//      stereo audio, using 1024 byte chunks
		
		SetInstance(h);
		s_isActive = isActive;
	}
	static void LoadSounds();

	static void PlayMusic(std::string Filename, int channel, float volume, bool loop);

	static void StopMusic(int channel);

	static void LoadSFX(std::string Filename, std::string Key);

	static void SetInstance(Handle h){s_hInstance = h;}



	static SoundManager *Instance() {return s_hInstance.getObject<SoundManager>();}
	static Handle InstanceHandle() {return s_hInstance;}
	static Handle s_hInstance;
	static bool s_isActive;

	

	#if APIABSTRACTION_D3D9 || APIABSTRACTION_D3D11
	Handle m_hXACT;
	
	#endif
};
}; // namespace Components
}; // namespace PE
#endif

#include "SoundManager.h"
#include <SDL.h>
#undef main
#include <SDL_mixer.h>
#include <ostream>



#include "PrimeEngine/Lua/LuaEnvironment.h"
namespace PE {
namespace Components {
Handle SoundManager::s_hInstance;
bool SoundManager::s_isActive;

PE_IMPLEMENT_CLASS1(SoundManager, Component);

void SoundManager::LoadSounds() {
	PlayMusic("Code/Audio/Background16.wav", 0, 12, true);
	PlayMusic("Code/Audio/idle.wav", 2, 24, true);
}

void SoundManager::PlayMusic(std::string Filename, int channel, float volume, bool loop)
{

	Mix_Chunk* mEffect = Mix_LoadWAV(Filename.c_str());
	float loopTime = 0;
	if (loop == true) {
		loopTime = -1;
	}
	else {
		loopTime = 1;
	}
	if (mEffect) {
		if (Mix_PlayChannel(channel, mEffect, loopTime) == -1) {
			printf("Mix_PlayChannel: %s\n", Mix_GetError());
		}
	}
	else {
		printf("Music not found", Mix_GetError());
	}
	Mix_Volume(channel, volume);
}





void SoundManager::StopMusic(int channel)
{
	Mix_HaltChannel(channel);
}

void SoundManager::LoadSFX(std::string Filename, std::string Key)
{
	Mix_Chunk* effect = Mix_LoadWAV(Filename.c_str());
	if (effect) {
		//mChunks.insert(std::make_pair(Key, effect));
	}
}

}; // namespace Components
}; // namespace PE
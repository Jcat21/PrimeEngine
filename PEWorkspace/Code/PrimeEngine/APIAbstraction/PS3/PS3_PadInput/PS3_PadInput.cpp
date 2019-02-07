// API Abstraction
#include "PrimeEngine/APIAbstraction/APIAbstractionDefines.h"


#include "PS3_PadInput.h"

// Outer-Engine includes

// Inter-Engine includes
#include "PrimeEngine/Events/StandardControllerEvents.h"
#include "PrimeEngine/Events/EventQueueManager.h"
#include "PrimeEngine/Lua/LuaEnvironment.h"

using namespace PE::Events;
namespace PE {
namespace Components {

PE_IMPLEMENT_CLASS1(PS3_PadInput, Component);

PS3_PadInput::PS3_PadInput(PE::GameContext &context, PE::MemoryArena arena, Handle hMyself): Component(context, arena, hMyself)
{
	memset( &lastState, 0, sizeof(lastState) );
	memset( &state, 0, sizeof(state) );
}
// Component ------------------------------------------------------------

void PS3_PadInput::addDefaultComponents()
{
	Component::addDefaultComponents();

	PE_REGISTER_EVENT_HANDLER(Events::Event_UPDATE, PS3_PadInput::do_UPDATE);
#if PE_PLAT_IS_PSVITA
	sceCtrlSetSamplingMode(SCE_CTRL_MODE_DIGITALANALOG);
#else
	cellPadInit(4);
	cellPadClearBuf(0);
	cellPadClearBuf(1);
	cellPadClearBuf(2);
	cellPadClearBuf(3);
#endif
}

// Individual events -------------------------------------------------------
void PS3_PadInput::do_UPDATE(Events::Event *pEvt)
{
	//poll for input

	memset( &state, 0, sizeof(state) );

	// Simply get the state of the controller from XInput.
#if PE_PLAT_IS_PSVITA
	int32_t result = sceCtrlPeekBufferPositive(0, &state, 1);
#else
	int32_t result = cellPadGetData( 0, &state );
#endif

#if !PE_PLAT_IS_PSVITA
	if (result == CELL_PAD_OK)
#else
	if (result >= 0)
#endif
	{
		m_pQueueManager = Events::EventQueueManager::Instance();

		generateButtonEvents();
		
		generateAxisEvents();//Regardless if they are the same or not
	}
}

void PS3_PadInput::generateButtonEvents()
{ 
	// since on ps3 the OS actually tells us onl change, we can generate digital events
	// straight from parsing the struct (on d3d we store state and then look at differences)
	bool aDown = false; // ps3 cross
	bool bDown = false; // ps3 circle
	bool xDown = false; // ps3 square
	bool yDown = false; // ps3 triangle

	bool aUp = false; // ps3 cross
	bool bUp = false; // ps3 circle
	bool xUp = false; // ps3 square
	bool yUp = false; // ps3 triangle

	bool aHeld = false; // ps3 cross
	bool bHeld = false; // ps3 circle
	bool xHeld = false; // ps3 square
	bool yHeld = false; // ps3 triangle

#if APIABSTRACTION_PS3
	// the current state stores only differences from previous state. we are going to go through
	// all the differences and generate events from them
	for (int i = 0; i < state.len; ++i)
	{

		if (i == CELL_PAD_BTN_OFFSET_DIGITAL1)
		{
			// check for buttons here

		}
		else if (i == CELL_PAD_BTN_OFFSET_DIGITAL2)
		{
			// check for more buttons here
			bool crossPressed = state.button[i] & CELL_PAD_CTRL_CROSS > 0;
			bool crossWasPressed = lastState.button[i] & CELL_PAD_CTRL_CROSS > 0;
		}
		
		lastState.button[i] = state.button[i];
		
	}
#endif
	//Check for Button Down events
	/*
	WORD newlyDownButtons = (state.Gamepad.wButtons ^ lastState.Gamepad.wButtons) & state.Gamepad.wButtons;
	if(newlyDownButtons & XINPUT_GAMEPAD_Y)
	{
		Handle h("EVENT", sizeof(Event_BUTTON_Y_DOWN));
		new (h) Event_BUTTON_Y_DOWN;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(aDown)
	{
		Handle h("EVENT", sizeof(Event_BUTTON_A_DOWN));
		new (h) Event_BUTTON_A_DOWN;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(newlyDownButtons & XINPUT_GAMEPAD_B)
	{
		Handle h("EVENT", sizeof(Event_BUTTON_B_DOWN));
		new (h) Event_BUTTON_B_DOWN;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(newlyDownButtons & XINPUT_GAMEPAD_X)
	{
		Handle h("EVENT", sizeof(Event_BUTTON_X_DOWN));
		new (h) Event_BUTTON_X_DOWN;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(newlyDownButtons & XINPUT_GAMEPAD_LEFT_THUMB)
	{
		Handle h("EVENT", sizeof(Event_BUTTON_L_THUMB_DOWN));
		new (h) Event_BUTTON_L_THUMB_DOWN;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(newlyDownButtons & XINPUT_GAMEPAD_RIGHT_THUMB)
	{
		Handle h("EVENT", sizeof(Event_BUTTON_R_THUMB_DOWN));
		new (h) Event_BUTTON_R_THUMB_DOWN;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(newlyDownButtons & XINPUT_GAMEPAD_LEFT_SHOULDER)
	{
		Handle h("EVENT", sizeof(Event_BUTTON_L_SHOULDER_DOWN));
		new (h) Event_BUTTON_L_SHOULDER_DOWN;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(newlyDownButtons & XINPUT_GAMEPAD_RIGHT_SHOULDER)
	{
		Handle h("EVENT", sizeof(Event_BUTTON_R_SHOULDER_DOWN));
		new (h) Event_BUTTON_R_SHOULDER_DOWN;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(newlyDownButtons & XINPUT_GAMEPAD_START)
	{
		Handle h("EVENT", sizeof(Event_BUTTON_START_DOWN));
		new (h) Event_BUTTON_START_DOWN;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(newlyDownButtons & XINPUT_GAMEPAD_BACK)
	{
		Handle h("EVENT", sizeof(Event_BUTTON_BACK_DOWN));
		new (h) Event_BUTTON_BACK_DOWN;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(newlyDownButtons & XINPUT_GAMEPAD_DPAD_UP)
	{
		Handle h("EVENT", sizeof(Event_PAD_N_DOWN));
		new (h) Event_PAD_N_DOWN;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(newlyDownButtons & XINPUT_GAMEPAD_DPAD_DOWN)
	{
		Handle h("EVENT", sizeof(Event_PAD_S_DOWN));
		new (h) Event_PAD_S_DOWN;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(newlyDownButtons & XINPUT_GAMEPAD_DPAD_LEFT)
	{
		Handle h("EVENT", sizeof(Event_PAD_W_DOWN));
		new (h) Event_PAD_W_DOWN;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(newlyDownButtons & XINPUT_GAMEPAD_DPAD_RIGHT)
	{
		Handle h("EVENT", sizeof(Event_PAD_E_DOWN));
		new (h) Event_PAD_E_DOWN;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}

	//Check for Button Up events
	WORD newlyUpButtons = (state.Gamepad.wButtons ^ lastState.Gamepad.wButtons) & lastState.Gamepad.wButtons;
	if(newlyUpButtons & XINPUT_GAMEPAD_Y)
	{
		Handle h("EVENT", sizeof(Event_BUTTON_Y_UP));
		new (h) Event_BUTTON_Y_UP;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(newlyUpButtons & XINPUT_GAMEPAD_A)
	{
		Handle h("EVENT", sizeof(Event_BUTTON_A_UP));
		new (h) Event_BUTTON_A_UP;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(newlyUpButtons & XINPUT_GAMEPAD_B)
	{
		Handle h("EVENT", sizeof(Event_BUTTON_B_UP));
		new (h) Event_BUTTON_B_UP;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(newlyUpButtons & XINPUT_GAMEPAD_X)
	{
		Handle h("EVENT", sizeof(Event_BUTTON_X_UP));
		new (h) Event_BUTTON_X_UP;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(newlyUpButtons & XINPUT_GAMEPAD_LEFT_THUMB)
	{
		Handle h("EVENT", sizeof(Event_BUTTON_L_THUMB_UP));
		new (h) Event_BUTTON_L_THUMB_UP;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(newlyUpButtons & XINPUT_GAMEPAD_RIGHT_THUMB)
	{
		Handle h("EVENT", sizeof(Event_BUTTON_R_THUMB_UP));
		new (h) Event_BUTTON_R_THUMB_UP;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(newlyUpButtons & XINPUT_GAMEPAD_LEFT_SHOULDER)
	{
		Handle h("EVENT", sizeof(Event_BUTTON_L_SHOULDER_UP));
		new (h) Event_BUTTON_L_SHOULDER_UP;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(newlyUpButtons & XINPUT_GAMEPAD_RIGHT_SHOULDER)
	{
		Handle h("EVENT", sizeof(Event_BUTTON_R_SHOULDER_UP));
		new (h) Event_BUTTON_R_SHOULDER_UP;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(newlyUpButtons & XINPUT_GAMEPAD_START)
	{
		Handle h("EVENT", sizeof(Event_BUTTON_START_UP));
		new (h) Event_BUTTON_START_UP;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(newlyUpButtons & XINPUT_GAMEPAD_BACK)
	{
		Handle h("EVENT", sizeof(Event_BUTTON_BACK_UP));
		new (h) Event_BUTTON_BACK_UP;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(newlyUpButtons & XINPUT_GAMEPAD_DPAD_UP)
	{
		Handle h("EVENT", sizeof(Event_PAD_N_UP));
		new (h) Event_PAD_N_UP;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(newlyUpButtons & XINPUT_GAMEPAD_DPAD_DOWN)
	{
		Handle h("EVENT", sizeof(Event_PAD_S_UP));
		new (h) Event_PAD_S_UP;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(newlyUpButtons & XINPUT_GAMEPAD_DPAD_LEFT)
	{
		Handle h("EVENT", sizeof(Event_PAD_W_UP));
		new (h) Event_PAD_W_UP;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(newlyUpButtons & XINPUT_GAMEPAD_DPAD_RIGHT)
	{
		Handle h("EVENT", sizeof(Event_PAD_E_UP));
		new (h) Event_PAD_E_UP;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}

	//Check for Button Held events
	WORD heldButtons = (state.Gamepad.wButtons & lastState.Gamepad.wButtons);
	if(heldButtons & XINPUT_GAMEPAD_Y)
	{
		Handle h("EVENT", sizeof(Event_BUTTON_Y_HELD));
		new (h) Event_BUTTON_Y_HELD;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(heldButtons & XINPUT_GAMEPAD_A)
	{
		Handle h("EVENT", sizeof(Event_BUTTON_A_HELD));
		new (h) Event_BUTTON_A_HELD;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(heldButtons & XINPUT_GAMEPAD_B)
	{
		Handle h("EVENT", sizeof(Event_BUTTON_B_HELD));
		new (h) Event_BUTTON_B_HELD;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(heldButtons & XINPUT_GAMEPAD_X)
	{
		Handle h("EVENT", sizeof(Event_BUTTON_X_HELD));
		new (h) Event_BUTTON_X_HELD;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(heldButtons & XINPUT_GAMEPAD_LEFT_THUMB)
	{
		Handle h("EVENT", sizeof(Event_BUTTON_L_THUMB_HELD));
		new (h) Event_BUTTON_L_THUMB_HELD;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(heldButtons & XINPUT_GAMEPAD_RIGHT_THUMB)
	{
		Handle h("EVENT", sizeof(Event_BUTTON_R_THUMB_HELD));
		new (h) Event_BUTTON_R_THUMB_HELD;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(heldButtons & XINPUT_GAMEPAD_LEFT_SHOULDER)
	{
		Handle h("EVENT", sizeof(Event_BUTTON_L_SHOULDER_HELD));
		new (h) Event_BUTTON_L_SHOULDER_HELD;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(heldButtons & XINPUT_GAMEPAD_RIGHT_SHOULDER)
	{
		Handle h("EVENT", sizeof(Event_BUTTON_R_SHOULDER_HELD));
		new (h) Event_BUTTON_R_SHOULDER_HELD;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(heldButtons & XINPUT_GAMEPAD_START)
	{
		Handle h("EVENT", sizeof(Event_BUTTON_START_HELD));
		new (h) Event_BUTTON_START_HELD;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(heldButtons & XINPUT_GAMEPAD_BACK)
	{
		Handle h("EVENT", sizeof(Event_BUTTON_BACK_HELD));
		new (h) Event_BUTTON_BACK_HELD;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(heldButtons & XINPUT_GAMEPAD_DPAD_UP)
	{
		Handle h("EVENT", sizeof(Event_PAD_N_HELD));
		new (h) Event_PAD_N_HELD;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(heldButtons & XINPUT_GAMEPAD_DPAD_DOWN)
	{
		Handle h("EVENT", sizeof(Event_PAD_S_HELD));
		new (h) Event_PAD_S_HELD;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(heldButtons & XINPUT_GAMEPAD_DPAD_LEFT)
	{
		Handle h("EVENT", sizeof(Event_PAD_W_HELD));
		new (h) Event_PAD_W_HELD;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	if(heldButtons & XINPUT_GAMEPAD_DPAD_RIGHT)
	{
		Handle h("EVENT", sizeof(Event_PAD_E_HELD));
		new (h) Event_PAD_E_HELD;
		m_pQueueManager->add(h, Events::QT_INPUT);
	}
	*/
}

void PS3_PadInput::generateAxisEvents(){
	
	//here are the if statements for every axis
	float LX = 0;
	float LY = 0;
#if PE_PLAT_IS_PSVITA
	LX = state.lx;
	LX = LX > 127 ? (LX - 128) / 127.0f : -(127 - LX) / 127.0f;
	LY = state.ly;
	LY = LY > 127 ? -(LY - 128) / 127.0f : (127 - LY) / 127.0f;
#else
	int i;
	i = CELL_PAD_BTN_OFFSET_ANALOG_LEFT_X;
	{
		// right analog stick
		uint16_t val = lastState.button[i]; // [0, 255]
		// normalize to [-1,1]
		LX = val > 127 ? (val - 128) / 127.0f : -(127 - val) / 127.0f;
	}

	i = CELL_PAD_BTN_OFFSET_ANALOG_LEFT_Y;
	{
		// right analog stick
		uint16_t val = lastState.button[i]; // [0, 255]
		// normalize to [-1,1]
		LY = val > 127 ? -(val - 128) / 127.0f : (127 - val) / 127.0f;
	}
#endif

	//determine how far the controller is pushed
	float LMagnitude = sqrt(LX*LX + LY*LY);
	//determine the direction the controller is pushed
	float normalizedLX = LX;// / LMagnitude;
	float normalizedLY = LY;// / LMagnitude;
	float LNormalizedMagnitude = 1.0f;
	if (LMagnitude < .1)
		LNormalizedMagnitude = 0;
	
	//repeat for right thumb stick
	float RX = 0;
	float RY = 0;
#if PE_PLAT_IS_PSVITA
	RX = state.rx;
	RX = RX > 127 ? (RX - 128) / 127.0f : -(127 - RX) / 127.0f;
	RY = state.ry;
	RY = RY > 127 ? -(RY - 128) / 127.0f : (127 - RY) / 127.0f;
#else
	i = CELL_PAD_BTN_OFFSET_ANALOG_RIGHT_X;
	{
		// right analog stick
		uint16_t val = lastState.button[i]; // [0, 255]
		// normalize to [-1,1]
		RX = val > 127 ? (val - 128) / 127.0f : -(127 - val) / 127.0f;
	}

	i = CELL_PAD_BTN_OFFSET_ANALOG_RIGHT_Y;
	{
		// right analog stick
		uint16_t val = lastState.button[i]; // [0, 255]
		// normalize to [-1,1]
		RY = val > 127 ? -(val - 128) / 127.0f : (127 - val) / 127.0f;
	}
#endif

	//determine how far the controller is pushed
	float RMagnitude = sqrt(RX*RX + RY*RY);
	//determine the direction the controller is pushed
	float normalizedRX = RX;// / RMagnitude;
	float normalizedRY = RY;// / RMagnitude;
	float RNormalizedMagnitude = 1.0f;
	if (RMagnitude < .1)
		RNormalizedMagnitude = 0;
	
	//Creating the thubmstick events
	Vector3 thumbLVector(normalizedLX,normalizedLY,0);
	thumbLVector *= LNormalizedMagnitude;
	Vector3 thumbRVector(normalizedRX,normalizedRY,0);
	thumbRVector *= RNormalizedMagnitude;
	

	Handle hThumbLEvt("EVENT", sizeof(Event_ANALOG_L_THUMB_MOVE));
	Event_ANALOG_L_THUMB_MOVE *thumbLEvt = new (hThumbLEvt) Event_ANALOG_L_THUMB_MOVE;
	
	thumbLEvt->m_absPosition = thumbLVector;
	
	Handle hThumbREvt("EVENT", sizeof(Event_ANALOG_R_THUMB_MOVE));
	Event_ANALOG_R_THUMB_MOVE *thumbREvt = new (hThumbREvt) Event_ANALOG_R_THUMB_MOVE;
		
	thumbREvt->m_absPosition = thumbRVector;
	
	m_pQueueManager->add(hThumbLEvt, Events::QT_INPUT);
	m_pQueueManager->add(hThumbREvt, Events::QT_INPUT);
}
}; // namespace Components
}; // namespace PE


#ifndef HLSL_PARTICLESTRUCTSANDCONSTANTS
#define HLSL_PARTICLESTRUCTSANDCONSTANTS

#include "APIAbstraction.gpu"

//-------------SHADER PROGRAM INPUTS-----------------
struct PARTICLES_VS_IN
{
	float3 iPosition        API_SEMANTIC(VSIN_POSITION);
	float  iAlpha       	  API_SEMANTIC(VSIN_NORMAL);
	float4 iColor						API_SEMANTIC(VSIN_BONEINDICES0); //todo Dario: make proper semantic wrap
	float2 iSizeRotate			API_SEMANTIC(TEXCOORD1);
};

struct PARTICLES_GS_IN
{
  float3 iPosition        API_SEMANTIC(VSIN_POSITION);
	float  iAlpha           API_SEMANTIC(TEXCOORD);
	float4 iColor						API_SEMANTIC(VSIN_BONEINDICES0); //todo Dario: make proper semantic wrap
	float4 iColorend				API_SEMANTIC(VSIN_BONEINDICES1);
	float2 iSizeRotate			API_SEMANTIC(TEXCOORD1);
};

struct PARTICLES_PS_IN
{
  float4 iColor						API_SEMANTIC(VSIN_BONEINDICES1);
  float4 iPosition        API_SEMANTIC(PIPELINE_POSITION);
	float2 iTexCoord				API_SEMANTIC(TEXCOORD);
};
//--------------:3 = nekoface-------------------------

//------------function wrappers-------------------------------
#define VS_wrapper_PARTICLES(func) \
        PARTICLES_GS_IN main(uint id : SV_VertexID) { \
						PARTICLES_VS_IN vIn; \
						Particle p = OutputVSView[id]; \
            PARTICLES_GS_IN gIn; \
            gIn = func(p); \
            return gIn; \
        }	

#define PS_wrapper_PARTICLES(func) \
        float4 main(PARTICLES_PS_IN pIn) : PSOUT_COLOR \
        { \
            return func(pIn); \
        }
//------------chance the wrapper------------------------------


// some functions

float LERP(float a, float b, float alpha) { return (a*(1-alpha) + b*(alpha)); }
float rerand(float a) { return ((a+a)%1); }

//////////////////////////////////
// Per emitter constants
//////////////////////////////////
#undef API_BUFFER_INDEX
#define API_BUFFER_INDEX 4
BEGIN_BUFFER  // total registers: 12 absoulte: [163-174]
	API_UNIFORM_CONSTANT float4 gEmitPosition									API_UNIFORM_CONSTANT_REGISTER_REG(0, 163); //w = target lifetime
	API_UNIFORM_CONSTANT float4 gEmitPosVar										API_UNIFORM_CONSTANT_REGISTER_REG(1, 164); //w = lifetime variance
	API_UNIFORM_CONSTANT float4 gEmitColorInitial							API_UNIFORM_CONSTANT_REGISTER_REG(2, 165);
	API_UNIFORM_CONSTANT float4 gEmitColorInitialVar					API_UNIFORM_CONSTANT_REGISTER_REG(3, 166);
	API_UNIFORM_CONSTANT float4 gEmitColorFinal								API_UNIFORM_CONSTANT_REGISTER_REG(4, 167);
	API_UNIFORM_CONSTANT float4 gEmitColorFinalVar						API_UNIFORM_CONSTANT_REGISTER_REG(5, 168);
	API_UNIFORM_CONSTANT float4 gEmitSizes										API_UNIFORM_CONSTANT_REGISTER_REG(6, 169); //x = initial size, y = init size var, z =  final size, w = final size var
	API_UNIFORM_CONSTANT float4 gEmitRotates									API_UNIFORM_CONSTANT_REGISTER_REG(7, 170); //kind of like sizes
	API_UNIFORM_CONSTANT float4 gEmitVelocity									API_UNIFORM_CONSTANT_REGISTER_REG(8, 171); //w = initial magnitude
	API_UNIFORM_CONSTANT float4 gEmitVelVar										API_UNIFORM_CONSTANT_REGISTER_REG(9, 172); //w = initial magnitude variance
	API_UNIFORM_CONSTANT float4 gEmitAccel										API_UNIFORM_CONSTANT_REGISTER_REG(10, 173); //if w == 0 we emit
	API_UNIFORM_CONSTANT float4 gEmitRandFloats								API_UNIFORM_CONSTANT_REGISTER_REG(11, 174);							 
END_BUFFER
//////////////////////////////////

#if APIABSTRACTION_D3D11

struct Particle
{
	float3 m_position;
	float3 m_velocity;
	float4 m_iniColor;
	float4 m_endColor;
	float m_sizeini;
	float m_sizeend;
	float m_rotini;
	float m_rotend;
	float m_currtime;
	float m_lifetime;
};

#endif

#endif // file guard

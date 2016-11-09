// GLSL shader autogenerated by cg2glsl.py.
#if defined(VERTEX)

#if __VERSION__ >= 130
#define COMPAT_VARYING out
#define COMPAT_ATTRIBUTE in
#define COMPAT_TEXTURE texture
#else
#define COMPAT_VARYING varying
#define COMPAT_ATTRIBUTE attribute
#define COMPAT_TEXTURE texture2D
#endif

#ifdef GL_ES
#define COMPAT_PRECISION mediump
#else
#define COMPAT_PRECISION
#endif
COMPAT_VARYING     vec2 _loc;
COMPAT_VARYING     vec4 _t1;
COMPAT_VARYING     vec2 _texCoord2;
COMPAT_VARYING     vec4 _position1;
COMPAT_VARYING     float _frame_rotation;
struct input_dummy {
    vec2 _video_size;
    vec2 _texture_size;
    vec2 _output_dummy_size;
    float _frame_count;
    float _frame_direction;
    float _frame_rotation;
};
struct out_vertex {
    vec4 _position1;
    vec2 _texCoord2;
    vec4 _t1;
    vec2 _loc;
};
out_vertex _ret_0;
input_dummy _IN1;
vec4 _r0006;
COMPAT_ATTRIBUTE vec4 gl_Vertex;
COMPAT_ATTRIBUTE vec4 gl_MultiTexCoord0;
COMPAT_VARYING vec4 TEX0;
COMPAT_VARYING vec4 TEX1;
COMPAT_VARYING vec4 TEX2;
 
uniform int FrameDirection;
uniform int FrameCount;
uniform COMPAT_PRECISION vec2 OutputSize;
uniform COMPAT_PRECISION vec2 TextureSize;
uniform COMPAT_PRECISION vec2 InputSize;
void main()
{
    out_vertex _OUT;
    vec2 _ps;
    vec2 _texCoord;
    _r0006 = gl_Vertex.x*gl_ModelViewProjectionMatrix[0];
    _r0006 = _r0006 + gl_Vertex.y*gl_ModelViewProjectionMatrix[1];
    _r0006 = _r0006 + gl_Vertex.z*gl_ModelViewProjectionMatrix[2];
    _r0006 = _r0006 + gl_Vertex.w*gl_ModelViewProjectionMatrix[3];
    _ps = vec2(1.00000000E+00/TextureSize.x, 1.00000000E+00/TextureSize.y);
    _texCoord = gl_MultiTexCoord0.xy + vec2( 1.00000001E-07, 1.00000001E-07);
    _OUT._t1.xy = vec2(_ps.x, 0.00000000E+00);
    _OUT._t1.zw = vec2(0.00000000E+00, _ps.y);
    _OUT._loc = _texCoord*TextureSize;
    _ret_0._position1 = _r0006;
    _ret_0._texCoord2 = _texCoord;
    _ret_0._t1 = _OUT._t1;
    _ret_0._loc = _OUT._loc;
    gl_Position = _r0006;
    TEX0.xy = _texCoord;
    TEX1 = _OUT._t1;
    TEX2.xy = _OUT._loc;
    return;
    TEX0.xy = _ret_0._texCoord2;
    TEX1 = _ret_0._t1;
    TEX2.xy = _ret_0._loc;
} 
#elif defined(FRAGMENT)

#if __VERSION__ >= 130
#define COMPAT_VARYING in
#define COMPAT_TEXTURE texture
out vec4 FragColor;
#else
#define COMPAT_VARYING varying
#define FragColor gl_FragColor
#define COMPAT_TEXTURE texture2D
#endif

#ifdef GL_ES
#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
#define COMPAT_PRECISION mediump
#else
#define COMPAT_PRECISION
#endif
COMPAT_VARYING     vec2 _loc;
COMPAT_VARYING     vec4 _t1;
COMPAT_VARYING     vec2 _texCoord;
COMPAT_VARYING     float _frame_rotation;
struct input_dummy {
    vec2 _video_size;
    vec2 _texture_size;
    vec2 _output_dummy_size;
    float _frame_count;
    float _frame_direction;
    float _frame_rotation;
};
struct out_vertex {
    vec2 _texCoord;
    vec4 _t1;
    vec2 _loc;
};
vec4 _ret_0;
vec3 _TMP24;
vec3 _TMP23;
float _TMP22;
float _TMP21;
float _TMP20;
float _TMP19;
float _TMP18;
vec4 _TMP17;
vec4 _TMP16;
vec4 _TMP15;
vec4 _TMP14;
vec4 _TMP12;
vec4 _TMP11;
vec4 _TMP10;
vec4 _TMP9;
float _TMP8;
float _TMP7;
float _TMP6;
float _TMP5;
float _TMP25;
float _TMP26;
vec4 _TMP4;
vec4 _TMP3;
vec4 _TMP2;
vec4 _TMP1;
vec2 _TMP0;
uniform sampler2D Texture;
input_dummy _IN1;
vec2 _val0034;
vec2 _c0038;
vec2 _c0040;
vec2 _c0042;
float _TMP43;
float _TMP47;
float _TMP51;
float _TMP55;
float _TMP63;
vec2 _v0064;
float _TMP71;
vec2 _v0072;
float _a0080;
float _a0082;
float _a0084;
float _a0086;
vec2 _c0090;
vec2 _c0092;
vec2 _c0094;
vec2 _c0096;
vec2 _c0100;
vec2 _c0102;
vec2 _c0104;
vec2 _c0106;
float _x0108;
float _x0112;
float _x0116;
float _x0120;
float _x0124;
vec3 _a0130;
COMPAT_VARYING vec4 TEX0;
COMPAT_VARYING vec4 TEX1;
COMPAT_VARYING vec4 TEX2;
 
uniform int FrameDirection;
uniform int FrameCount;
uniform COMPAT_PRECISION vec2 OutputSize;
uniform COMPAT_PRECISION vec2 TextureSize;
uniform COMPAT_PRECISION vec2 InputSize;
void main()
{
    vec2 _pos;
    vec2 _dir;
    vec2 _g1;
    vec2 _g2;
    vec3 _B1;
    vec3 _C1;
    vec3 _D1;
    float _p1;
    float _q1;
    vec3 _color_old;
    vec2 _delta;
    vec3 _first;
    vec3 _second;
    vec3 _mid_horiz;
    vec3 _mid_vert;
    vec3 _res;
    float _color1;
    vec3 _TMP30;
    _TMP0 = fract(TEX2.xy);
    _pos = _TMP0 - vec2( 5.00000000E-01, 5.00000000E-01);
    _val0034 = vec2(float((_pos.x > 0.00000000E+00)), float((_pos.y > 0.00000000E+00)));
    _dir = _val0034 - vec2(float((_pos.x < 0.00000000E+00)), float((_pos.y < 0.00000000E+00)));
    _g1 = _dir*TEX1.xy;
    _g2 = _dir*TEX1.zw;
    _TMP1 = COMPAT_TEXTURE(Texture, TEX0.xy);
    _c0038 = TEX0.xy + _g1;
    _TMP2 = COMPAT_TEXTURE(Texture, _c0038);
    _B1 = _TMP2.xyz;
    _c0040 = TEX0.xy + _g2;
    _TMP3 = COMPAT_TEXTURE(Texture, _c0040);
    _C1 = _TMP3.xyz;
    _c0042 = TEX0.xy + _g1 + _g2;
    _TMP4 = COMPAT_TEXTURE(Texture, _c0042);
    _D1 = _TMP4.xyz;
    _TMP43 = dot(_TMP1.xyz, vec3( 6.55360000E+04, 2.55000000E+02, 1.00000000E+00));
    _TMP47 = dot(_TMP2.xyz, vec3( 6.55360000E+04, 2.55000000E+02, 1.00000000E+00));
    _TMP51 = dot(_TMP3.xyz, vec3( 6.55360000E+04, 2.55000000E+02, 1.00000000E+00));
    _TMP55 = dot(_TMP4.xyz, vec3( 6.55360000E+04, 2.55000000E+02, 1.00000000E+00));
    _p1 = abs(_pos.x);
    _q1 = abs(_pos.y);
    _v0064 = _g1 - _pos;
    _TMP25 = dot(_v0064, _v0064);
    _TMP26 = inversesqrt(_TMP25);
    _TMP63 = 1.00000000E+00/_TMP26;
    _v0072 = _g2 - _pos;
    _TMP25 = dot(_v0072, _v0072);
    _TMP26 = inversesqrt(_TMP25);
    _TMP71 = 1.00000000E+00/_TMP26;
    _a0080 = _TMP43 - _TMP55;
    _TMP5 = abs(_a0080);
    _a0082 = _TMP47 - _TMP51;
    _TMP6 = abs(_a0082);
    if (_TMP5 < _TMP6) { 
        if (_TMP63 < _TMP71) { 
            _C1 = (_TMP1.xyz + _TMP4.xyz) - _TMP2.xyz;
        } else {
            if (_TMP63 > _TMP71) { 
                _B1 = (_TMP1.xyz + _TMP4.xyz) - _TMP3.xyz;
            } 
        } 
    } else {
        _a0084 = _TMP43 - _TMP55;
        _TMP7 = abs(_a0084);
        _a0086 = _TMP47 - _TMP51;
        _TMP8 = abs(_a0086);
        if (_TMP7 > _TMP8) { 
            _D1 = (_TMP2.xyz + _TMP3.xyz) - _TMP1.xyz;
        } 
    } 
    _color_old = ((1.00000000E+00 - _p1)*(1.00000000E+00 - _q1))*_TMP1.xyz + (_p1*(1.00000000E+00 - _q1))*_B1 + ((1.00000000E+00 - _p1)*_q1)*_C1 + (_p1*_q1)*_D1;
    _delta = 5.00000000E-01/TextureSize;
    _c0090 = TEX0.xy + vec2(-_delta.x, -_delta.y);
    _TMP9 = COMPAT_TEXTURE(Texture, _c0090);
    _c0092 = TEX0.xy + vec2(-_delta.x, 0.00000000E+00);
    _TMP10 = COMPAT_TEXTURE(Texture, _c0092);
    _c0094 = TEX0.xy + vec2(-_delta.x, _delta.y);
    _TMP11 = COMPAT_TEXTURE(Texture, _c0094);
    _c0096 = TEX0.xy + vec2(0.00000000E+00, -_delta.y);
    _TMP12 = COMPAT_TEXTURE(Texture, _c0096);
    _c0100 = TEX0.xy + vec2(0.00000000E+00, _delta.y);
    _TMP14 = COMPAT_TEXTURE(Texture, _c0100);
    _c0102 = TEX0.xy + vec2(_delta.x, -_delta.y);
    _TMP15 = COMPAT_TEXTURE(Texture, _c0102);
    _c0104 = TEX0.xy + vec2(_delta.x, 0.00000000E+00);
    _TMP16 = COMPAT_TEXTURE(Texture, _c0104);
    _c0106 = TEX0.xy + vec2(_delta.x, _delta.y);
    _TMP17 = COMPAT_TEXTURE(Texture, _c0106);
    _x0108 = TEX0.x*TextureSize.x + 5.00000000E-01;
    _TMP18 = fract(_x0108);
    _first = _TMP9.xyz + _TMP18*(_TMP15.xyz - _TMP9.xyz);
    _x0112 = TEX0.x*TextureSize.x + 5.00000000E-01;
    _TMP19 = fract(_x0112);
    _second = _TMP11.xyz + _TMP19*(_TMP17.xyz - _TMP11.xyz);
    _x0116 = TEX0.x*TextureSize.x + 5.00000000E-01;
    _TMP20 = fract(_x0116);
    _mid_horiz = _TMP10.xyz + _TMP20*(_TMP16.xyz - _TMP10.xyz);
    _x0120 = TEX0.y*TextureSize.y + 5.00000000E-01;
    _TMP21 = fract(_x0120);
    _mid_vert = _TMP12.xyz + _TMP21*(_TMP14.xyz - _TMP12.xyz);
    _x0124 = TEX0.y*TextureSize.y + 5.00000000E-01;
    _TMP22 = fract(_x0124);
    _res = _first + _TMP22*(_second - _first);
    _TMP23 = _mid_horiz + 5.00000000E-01*(_mid_vert - _mid_horiz);
    _a0130 = _res - _TMP23;
    _TMP24 = abs(_a0130);
    _color1 = (2.80000001E-01*(_res + _mid_horiz + _mid_vert) + 4.69999981E+00*_TMP24).x;
    _TMP30 = (_color1 + _color_old)/2.00000000E+00;
    _ret_0 = vec4(_TMP30.x, _TMP30.y, _TMP30.z, 1.00000000E+00);
    FragColor = _ret_0;
    return;
} 
#endif
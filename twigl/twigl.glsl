// こちらがオリジナルです。
// 【作者】Kamoshikaさん
// 【作品名】午前0:19 2022年4月20日のツイート
// https://twitter.com/kamoshika_vrc/status/1516436446579609601
//
// ※つぶやきGLSLの詳細はこちら
// 「GLSL最短チャレンジ #つぶやきGLSL」
// https://zenn.dev/yuji_ap/articles/7f7f0cfd589bad

precision highp float;

uniform vec2 resolution;
uniform float time;
uniform vec2 mouse;
uniform sampler2D backbuffer;

#define t time
#define r resolution
#define FC gl_FragCoord
#define o gl_FragColor
#define b backbuffer
#define texture texture2D

const float PI = acos(-1.);
const float PI2 = acos(-1.)*2.;

vec3 hsv(float h, float s, float v){
    vec4 t = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(vec3(h) + t.xyz) * 6.0 - vec3(t.w));
    return v * mix(vec3(t.x), clamp(p - vec3(t.x), 0.0, 1.0), s);
}
// fract sin noise
float fsnoise(vec2 c){
    return fract(sin(dot(c, vec2(12.9898, 78.233))) * 43758.5453);
}

#define F fsnoise(I+=I)

void main(void) {
vec3 P,R=normalize(vec3((FC.xy*2.-r)/r.y,2))*rotate3D(t*.2,vec3(1,9,1));P.z=.1;float i,d=1.;for(;i++<2e2&&d>1e-4;P+=R*d){vec2 v=R.xz,c=ceil(P.xz+v*1e-3)-.5;v=(c-P.xz+.5*sign(v))/v;d=min(min(v.x,v.y),P.y-snoise2D((c+t)*.1)*abs(c.x)+9.);}o+=1.-25./i;
}

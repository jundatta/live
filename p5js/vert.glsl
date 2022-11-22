attribute vec4 position;
// attribute vec3 aPosition;

#define aTexCoord texCoord
attribute vec2 aTexCoord;

#define aNormal normal
attribute vec3 aNormal;

// Built in p5.js uniforms
//uniform mat4 uModelViewMatrix;
//uniform mat4 uProjectionMatrix;
uniform float uFrameCount;

// [processing java]
//uniform mat4 modelviewMatrix;
//uniform mat4 projectionMatrix;

uniform mat4 transform;

varying vec2 vTexCoord;
varying vec3 vNormal;
varying vec3 vPosition;

void main() {
	// ((transform * position) + 1.0) * 0.5 ⇒ aPosition？？？
//	vec4 positionVec4 = ((transform * position) + 1.0) * 0.5;
	vec4 positionVec4 = transform * position;
//	vec3 aPosition = positionVec4.xyz;
	vec3 aPosition = positionVec4.xyz / positionVec4.w;

#if 0
//  vec3 delta = 0.1 *  aNormal * sin(aPosition * 30. + uFrameCount * 0.1);
  vec3 delta = 0.1 *  aNormal * sin(aPosition * 30.);
  vPosition = aPosition + delta ;
  vNormal = normalize(aNormal + delta);
  vTexCoord = aTexCoord;
//  gl_Position = uProjectionMatrix * uModelViewMatrix * vec4(vPosition, 1.);
#else
  vPosition = position.xyz;
  vNormal = aNormal;
  vTexCoord = aTexCoord;
  gl_Position = transform * vec4(vPosition, 1.);
#endif
}

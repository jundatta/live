// p5.jsのaPosition
//  ⇒uResolution（画面幅高さ）で正規化された0.0～1.0の範囲の値。
// processing javaのposition
//  ⇒0.0～uResolution（画面幅高さ）の範囲の値。
// のように見える。
// （z座標の扱いがよくわからないが）
// このためaPositionを以下のように置くことにした。
// aPosition = vec3(position.xy / uResolution, 0.0);

uniform vec2 uResolution;
attribute vec4 position;
// attribute vec3 aPosition;

#define aNormal normal
attribute vec3 aNormal;

// Built in p5.js uniforms
//uniform mat4 uModelViewMatrix;
//uniform mat4 uProjectionMatrix;
uniform float uFrameCount;

// p5.jsのgl_Position
//  ⇒uProjectionMatrix * uModelViewMatrix * vec4(aPosition, 1.);
// processing javaのgl_Position
//  ⇒transform * position;

//uniform mat4 modelviewMatrix;
//uniform mat4 projectionMatrix;
uniform mat4 transform;

varying vec3 vNormal;
varying vec3 vPosition;

void main() {
#if 1
  vec3 aPosition = vec3(position.xy / uResolution, 0.0);
  vec3 delta = 0.1 * aNormal * sin(aPosition * 30. + uFrameCount * 0.1);
  vPosition = aPosition + delta ;
  vNormal = normalize(aNormal + delta);
	gl_Position = transform * position;
#else
	vec3 aPosition = vec3(position.xy / uResolution, 0.0);
	vPosition = aPosition;
	vNormal = aNormal;
	gl_Position = transform * position;
#endif
}

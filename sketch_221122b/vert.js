let vert = `
  precision mediump float;

attribute vec3 aPosition;
attribute vec2 aTexCoord;
attribute vec3 aNormal;

uniform mat4 uProjectionMatrix;
uniform mat4 uModelViewMatrix;
uniform float uFrameCount;

varying vec2 vTexCoord;
varying vec3 vNormal;
varying vec3 vPosition;

void main() {
  #if 0
    //vec3 delta = 0.1 *  aNormal * sin(aPosition * 30. + uFrameCount * 0.1);
    vec3 delta = 0.1 *  aNormal * sin(aPosition * 30.);
  vPosition = aPosition + delta ;
  vNormal = normalize(aNormal + delta);
  vTexCoord = aTexCoord;
  gl_Position = uProjectionMatrix * uModelViewMatrix * vec4(vPosition, 1.);
#else
  vPosition = aPosition ;
  vNormal = aNormal;
  vTexCoord = aTexCoord;
  gl_Position = uProjectionMatrix * uModelViewMatrix * vec4(vPosition, 1.);
#endif
}


`;

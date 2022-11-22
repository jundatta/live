let vert = `
  precision mediump float;

attribute vec3 aPosition;
attribute vec2 aTexCoord;
attribute vec3 aNormal;

uniform mat4 uProjectionMatrix;
uniform mat4 uModelViewMatrix;
uniform float uFrameCount;

varying vec3 vNormal;
varying vec3 vPosition;

void main() {
  #if 0
    //vec3 delta = 0.1 *  aNormal * sin(aPosition * 30. + uFrameCount * 0.1);
    vec3 delta = 0.1 *  aNormal * sin(aPosition * 30.);
  vPosition = aPosition + delta ;
  vNormal = normalize(aNormal + delta);
  gl_Position = uProjectionMatrix * uModelViewMatrix * vec4(vPosition, 1.);
#else
  //vPosition = aPosition;
  vPosition = aPosition;
//vNormal = aNormal;
vNormal = vec3(0.0, 0.0, 1.0);
gl_Position = uProjectionMatrix * uModelViewMatrix * vec4(aPosition, 1.);
#endif
}


`;

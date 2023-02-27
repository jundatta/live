// こちらがオリジナルです。
// 【作者】Richard Bourneさん
// 【作品名】Flat Faces Shader with p5.Graphics
// https://openprocessing.org/sketch/1711940

PShader sh;

void setup() {
  size(1112, 834, P3D);
  noStroke();

  // 球の分割数をp5.jsに合わせて30から24に変えとく♪
  sphereDetail(8);

  sh = loadShader("frag.glsl", "vert.glsl");
}

void draw() {
  translate(width * 0.5f, height * 0.5f);

  background(0);

  ambientLight(80, 80, 80);
  rotateY((millis() / 1000.0f) * (PI / 4.0f));

  shader(sh);

  sphere(320);

  resetShader();
}

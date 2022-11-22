// こちらがオリジナルです。
// 【作者】Richard Bourneさん
// 【作品名】Ice Planet
// https://openprocessing.org/sketch/1417946

PShader theShader;

void preload() {
  theShader = loadShader("frag.glsl", "vert.glsl");
}
void setup() {
  preload();
  size(1112, 834, P3D);
  noStroke();
}

void draw() {
  translate(width/2, height/2);

  background(0);
  shader(theShader);

  // ※frameCountが(int)で落ちるので(float)のキャストをつける
  theShader.set("uFrameCount", (float)frameCount);

  //rotateX(frameCount * 0.002);
  //rotateY(frameCount * 0.001);

  sphere(height / 2.8);
  //resetShader();
}

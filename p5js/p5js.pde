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

  //theShader.set("uResolution", (float)width, (float)height);
}

void draw() {
  background(0);
  shader(theShader);

  theShader.set("uFrameCount", frameCount);


  rotateX(frameCount * 0.002);
  rotateY(frameCount * 0.001);

//  sphere(height / 2.8, 800, 500);
  sphere(height / 2.8);
}

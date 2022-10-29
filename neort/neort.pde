// こちらがオリジナルです。
// 【作者】yasai-gyaboさん
// 【作品名】Y Metal
// https://neort.io/art/bivecbs3p9f9psc9oo8g

PShader s;
int startMillis;

void setup() {
  size(787, 442, P3D);
  //size(500, 800, P3D);
  noStroke();
  s = loadShader("neort.glsl");
  s.set("resolution", width, height);
  // 最初のミリ秒を取り込んでおく
  startMillis = millis();
}

void draw() {
  s.set("backbuffer", getGraphics());
  s.set("time", (millis() - startMillis) / 1000.0f);
  s.set("mouse", (float)mouseX / (float)width, (float)mouseY / (float)height);
  shader(s);
  rect(0, 0, width, height);
  resetShader();
}

// オリジナルはこちらです。
// 【作者】panna_pudiさん
// 【作品名】Power (Chainsaw Man)
// https://www.shadertoy.com/view/cljGR3
// ※ただし、持ってきたソースはこちら（GLSL SANDBOX）です
// https://glslsandbox.com/e#102455.0

PShader s;
int startMillis;

void setup() {
  size(787, 442, P3D);
  //size(500, 800, P3D);
  noStroke();
  s = loadShader("glslSandbox.glsl");
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

// こちらがオリジナルです。
// 【作者】panna_pudiさん
// 【作品名】Desert Bloom
// https://www.shadertoy.com/view/7ld3DX

PShader sd;
int startMillis;
int startCount;

void setup() {
  size(787, 442, P3D);
  noStroke();
  textureWrap(REPEAT);

  sd = loadShader("Shadertoy.glsl");
  sd.set("iResolution", (float)width, (float)height, 0.0f);

  startMillis = millis();
  startCount = frameCount;
}

void draw() {
  sd.set("iTime", (millis() - startMillis) / 1000.0f);
  shader(sd);
  rect(0, 0, width, height);
  resetShader();
}

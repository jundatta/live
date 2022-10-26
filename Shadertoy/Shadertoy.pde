// こちらがオリジナルです。
// 【作者】Yusef28さん
// 【作品名】Tunnel Experiment #2
// https://www.shadertoy.com/view/stG3W1

PShader sd, sdA;
int startMillis;
int startCount;

void setup() {
  size(787, 442, P3D);
  noStroke();
  textureWrap(REPEAT);

  sd = loadShader("Shadertoy.glsl");
  sd.set("iResolution", (float)width, (float)height, 0.0f);
  // 最初のミリ秒を取り込んでおく
  startMillis = millis();
  startCount = frameCount;
  sd.set("iChannel0", getGraphics());

  sdA = loadShader("bufferA.glsl");
  sdA.set("iResolution", (float)width, (float)height, 0.0f);
  // 最初のミリ秒を取り込んでおく
  sdA.set("iChannel0", loadImage("iChannel0.jpg"));
  sdA.set("iChannel1", loadImage("iChannel1.jpg"));
  sdA.set("iChannel2", loadImage("iChannel2.jpg"));
}

void draw() {
  sdA.set("iTime", (millis() - startMillis) / 1000.0f);
  shader(sdA);
  rect(0, 0, width, height);
  resetShader();

  // なんか効いてない（かえってよろしくない）がするのであえて取り除いた。
  // （うまく持ってこれてないだけかもしれないがｗ）
  //sd.set("iTime", (millis() - startMillis) / 1000.0f);
  //shader(sd);
  //rect(0, 0, width, height);
  //resetShader();
}

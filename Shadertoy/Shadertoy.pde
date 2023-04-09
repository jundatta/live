// こちらがオリジナルです。
// 【作者】panna_pudiさん
// 【作品名】Tatami Walk
// https://www.shadertoy.com/view/ctXGRS

PShader bfA;
PShader sd;
int startMillis;
int startCount;

void setup() {
  size(787, 442, P3D);
  noStroke();
  textureWrap(REPEAT);

  bfA = loadShader("BufferA.glsl");
  bfA.set("iResolution", (float)width, (float)height, 0.0f);

  sd = loadShader("Shadertoy.glsl");
  sd.set("iResolution", (float)width, (float)height, 0.0f);

  startMillis = millis();
  startCount = frameCount;
}

void draw() {
  bfA.set("iTime", (millis() - startMillis) / 1000.0f);
  bfA.set("iChannel0", getGraphics());
  shader(bfA);
  rect(0, 0, width, height);
  resetShader();

// よくわかりゃん＼(^_^)／がまぁいいか♪
// ⇒やっぱよくわかってにゃい＼(^_^)／

// 　⇒「かんせーい♪」（でいいのか？！）

  //sd.set("iChannel0", getGraphics());
  //shader(sd);
  //rect(0, 0, width, height);
  //resetShader();
}

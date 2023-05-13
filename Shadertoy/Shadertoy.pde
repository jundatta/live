// こちらがオリジナルです。
// 【作者】Fewesさん
// 【作品名】Terrain Erosion Noise
// https://www.shadertoy.com/view/7ljcRW

PShader sd, bfA, bfB;
PGraphics ch0, ch1, ch2;
int startMillis;
int startCount;

void setup() {
  size(787, 442, P3D);
  noStroke();
  textureWrap(REPEAT);

  //sd.set("iChannel0", loadImage("iChannel0.png"));
  //sd.set("iChannel1", loadImage("iChannel1.png"));
  //sd.set("iChannel2", loadImage("iChannel2.png"));

  ch0 = createGraphics(width, height, P3D);
  ch0.beginDraw();
  ch0.noStroke();
  ch0.textureWrap(REPEAT);
  ch0.endDraw();
  bfA = loadShader("bufferA.glsl");
  bfA.set("iResolution", (float)width, (float)height, 0.0f);

  // 最初のミリ秒を取り込んでおく
  startMillis = millis();
  startCount = frameCount;
}

void draw() {
  bfA.set("iTime", (millis() - startMillis) / 1000.0f);
  bfA.set("iMouse", (float)mouseX, (float)mouseY, 0.0f, 0.0f);
  ch0.shader(bfA);
  ch0.beginDraw();
  ch0.rect(0, 0, width, height);
  ch0.endDraw();
  ch0.resetShader();
  image(ch0, 0, 0);
}

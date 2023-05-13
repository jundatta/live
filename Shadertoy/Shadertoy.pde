// こちらがオリジナルです。
// 【作者】Fewesさん
// 【作品名】Terrain Erosion Noise
// https://www.shadertoy.com/view/7ljcRW

PShader sd, bfA, bfB;
PGraphics ch0, ch1, ch2;
PImage iChannel2;
int startMillis;
int startCount;

void setup() {
  size(787, 442, P3D);
  noStroke();
  textureWrap(REPEAT);

  ch0 = createGraphics(width, height, P3D);
  ch0.beginDraw();
  ch0.noStroke();
  ch0.textureWrap(REPEAT);
  ch0.endDraw();
  bfA = loadShader("bufferA.glsl");
  bfA.set("iResolution", (float)width, (float)height, 0.0f);

  ch1 = createGraphics(width, height, P3D);
  ch1.beginDraw();
  ch1.noStroke();
  ch1.textureWrap(REPEAT);
  ch1.endDraw();
  bfB = loadShader("bufferB.glsl");
  bfB.set("iResolution", (float)width, (float)height, 0.0f);

  sd = loadShader("Shadertoy.glsl");
  sd.set("iResolution", (float)width, (float)height, 0.0f);

  sd.set("iChannel0", ch0);
  sd.set("iChannel1", ch1);
  iChannel2 = loadImage("iChannel2.png");
  sd.set("iChannel2", iChannel2);

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
  //image(ch0, 0, 0);

  bfB.set("iTime", (millis() - startMillis) / 1000.0f);
  bfB.set("iMouse", (float)mouseX, (float)mouseY, 0.0f, 0.0f);
  ch1.shader(bfB);
  ch1.beginDraw();
  ch1.rect(0, 0, width, height);
  ch1.endDraw();
  ch1.resetShader();
  //image(ch1, 0, 0);

  // iChannel0～2までの幅、高さを渡す
  PVector[] iChannelResolution = new PVector[3];
  iChannelResolution[0] = new PVector(ch0.width, ch0.height, 0.0f);
  iChannelResolution[1] = new PVector(ch1.width, ch1.height, 0.0f);
  iChannelResolution[2] = new PVector(iChannel2.width, iChannel2.height, 0.0f);
  sd.set("iChannelResolution", iChannelResolution, iChannelResolution.length);

  sd.set("iTime", (millis() - startMillis) / 1000.0f);
  sd.set("iMouse", (float)mouseX, (float)mouseY, 0.0f, 0.0f);
  shader(sd);
  rect(0, 0, width, height);
  resetShader();
}

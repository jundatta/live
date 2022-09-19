// オリジナルはこちらです。
// https://www.shadertoy.com/view/4ttSWf

PShader sd;
PGraphics iChannel0;
PShader bufferA;
int startMillis;
int startFrame;

void setup() {
  size(787, 442, P3D);
  noStroke();

  sd = loadShader("Shadertoy.glsl");
  sd.set("iResolution", (float)width, (float)height, 0.0f);
  iChannel0 = createGraphics(width, height, P3D);
  iChannel0.textureWrap(REPEAT);
  iChannel0.beginDraw();
  iChannel0.blendMode(REPLACE);
  iChannel0.background(0);
  iChannel0.endDraw();
  sd.set("iChannel0", iChannel0);

  bufferA = loadShader("BufferA.glsl");
  bufferA.set("iResolution", (float)width, (float)height, 0.0f);
  // オリジナルでは描画前の絵と平均を取ってぼかしている？が
  // うまく作り込めなかったのでギブアップした＼(^_^)／
  //bufferA.set("iChannel0", iChannel0);

  // 最初のミリ秒を取り込んでおく
  startMillis = millis();
  startFrame = frameCount;
}

void draw() {
  bufferA.set("iTime", (millis() - startMillis) / 1000.0f);
  bufferA.set("iFrame", frameCount - startFrame);
  iChannel0.beginDraw();
  iChannel0.noStroke();
  iChannel0.shader(bufferA);
  iChannel0.rect(0, 0, width, height);
  iChannel0.resetShader();
  iChannel0.endDraw();

  shader(sd);
  rect(0, 0, width, height);
  resetShader();
}

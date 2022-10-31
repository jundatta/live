// こちらがオリジナルです。
// 【作者】phi16さん
// 【作品名】NeonCube
// https://www.shadertoy.com/view/XtdGRs

PShader sd, bfA;
int startMillis;
int startCount;

void setup() {
  size(787, 442, P3D);
  noStroke();
  textureWrap(REPEAT);

  bfA = loadShader("bufferA.glsl");
  bfA.set("iResolution", (float)width, (float)height, 0.0f);

  sd = loadShader("Shadertoy.glsl");
  sd.set("iResolution", (float)width, (float)height, 0.0f);
  // 最初のミリ秒を取り込んでおく
  startMillis = millis();
  startCount = frameCount;
}

void draw() {
  float iTime = (millis() - startMillis) / 1000.0f;

  bfA.set("iTime", iTime);
  shader(sd);
  rect(0, 0, width, height);
  resetShader();

  // loadPixels()を呼ぶと
  // "The pixels array is null."
  // は表示されなくなる。
  // （ただし描かれる絵が変わる様子はない。。。）
  //loadPixels();
  sd.set("iTime", iTime);
  sd.set("iChannel0", getGraphics());
  shader(sd);
  rect(0, 0, width, height);
  resetShader();
  //updatePixels();
}

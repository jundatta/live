// オリジナルはこちらです。
// https://www.shadertoy.com/view/4ttSWf

PShader sd;
PGraphics iChannel0;
PShader bufferA;
int startMillis;

void setup() {
  size(787, 442, P3D);
  noStroke();

  sd = loadShader("Shadertoy.glsl");
  sd.set("iResolution", (float)width, (float)height);
  iChannel0 = createGraphics(width, height, P3D);
  iChannel0.textureWrap(REPEAT);
  iChannel0.beginDraw();
  iChannel0.blendMode(REPLACE);
  iChannel0.endDraw();
  sd.set("iChannel0", iChannel0);

  bufferA = loadShader("BufferA.glsl");
  bufferA.set("iResolution", (float)width, (float)height);

  // 最初のミリ秒を取り込んでおく
  startMillis = millis();
}

void draw() {
  // ※Shadertoyの場合、透明度は指定しても反映されない
  // void mainImage( out vec4 fragColor, in vec2 fragCoord )の
  // fragCoordの透明度の指定は反映されない
  // なのでfragCoordの透明度は1.0（不透明）固定で返すように注意する
  //  background(0);
  // 最初からのミリ秒として渡したいのでstartMillisをmillis()から引く
  bufferA.set("iTime", (millis() - startMillis) / 1000.0f);
  bufferA.set("iFrame", frameCount);
  iChannel0.beginDraw();
  iChannel0.background(0);
  iChannel0.shader(bufferA);
  iChannel0.rect(0, 0, width, height);
  iChannel0.resetShader();
  iChannel0.endDraw();

  shader(sd);
  rect(0, 0, width, height);
  resetShader();
}

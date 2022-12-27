// こちらがオリジナルです。
// 【作者】はぅ君さん
// 【作品名】（午前11:39 · 2021年1月1日のツイート）
// https://haukun.projectroom.jp/archives/1661
// （Processingとの2021年の歩み）

float t=0;
void setup() {
  size(720, 720, P3D);
  colorMode(HSB, 360);
}
void draw() {
  t+=.005;
  blendMode(BLEND);
  //background(0, 9);
  noStroke();
  fill(0, 9);
  rect(0, 0, width, height);
  blendMode(ADD);
  float T, N;
  for (float r=0; r<TAU; r+=.03) {
    fill(r*57, 180, T=300-(sq(tan(t+r*4))*99)%360, 360-T);
    circle(cos(r+(N=noise(r, t)-.5))*T+360, sin(r+N)*T+360, 999/T);
  }
}

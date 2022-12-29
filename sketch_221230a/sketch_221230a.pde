// こちらがオリジナルです。
// 【作者】はぅ君さん
// 【作品名】trophy
// https://twitter.com/Hau_kun/status/1420362864888475653

float t=0;
void setup() {
  size(720, 720);
}
void draw() {
  t+=.01;
  colorMode(HSB, 360, 100, 100, 1.0f);
  blendMode(BLEND);
  background(0);
  blendMode(ADD);
  strokeWeight(5);
  for (float r = 0; r<TAU; r+=.01) {
    stroke((r*60+t*99)%360, 100, 100, .1);
    line(cos(r*6-t)*360+360, atan(9)*360+360, atan(cos(r+t))*360+360, atan(sin(r+t))*360+360);
  }
}

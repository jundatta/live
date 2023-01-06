// こちらがオリジナルです。
// 【作者】はぅ君さん
// 【作品名】Sparkler
// https://twitter.com/Hau_kun/status/1164181159783223296

float r, d, a, b;
void draw() {
  fill(0, 64);
  square(0, 0, 102);
  stroke(-1);
  line(50, 0, 50, 50);
  r=random(360);
  d=random(30);
  for (int j=0; j<15; j++) {
    a=random(360);
    b=random(20);
    line(cos(r)*d+50, sin(r)*d+50, cos(r)*d+cos(a)*b+50, sin(r)*d+sin(a)*b+50);
  }
}

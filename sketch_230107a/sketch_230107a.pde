// こちらがオリジナルです。
// 【作者】はぅ君さん
// 【作品名】Sparkler
// https://twitter.com/Hau_kun/status/1164181159783223296

float r, d, a, b;

final int OrgWH = 102;
PGraphics pg;
void setup() {
  size(500, 800, P3D);

  pg = createGraphics(OrgWH, OrgWH);
}
void draw() {
  pg.beginDraw();
  //pg.fill(0, 64);
  //pg.rect(0, 0, width, height);
  pg.background(0, 64);  // なぜかいけるｗ => イケてなかった＼(^_^)／
  pg.stroke(-1);
  pg.line(50, 0, 50, 50);
  r=random(360);
  d=random(30);
  for (int j=0; j<15; j++) {
    a=random(360);
    b=random(20);
    pg.line(cos(r)*d+50, sin(r)*d+50, cos(r)*d+cos(a)*b+50, sin(r)*d+sin(a)*b+50);
  }
  pg.endDraw();
  image(pg, 0, 0, width, height);
}

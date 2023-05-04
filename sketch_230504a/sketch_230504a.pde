// こちらがオリジナルです。
// 【作者】Richard Bourneさん
// 【作品名】Railstation Clock
// https://openprocessing.org/sketch/1842126

final int windowWidth = 1112;
final int windowHeight = 834;

int hu;
int shorterSide;

void setup() {
  size(1482, 834, P3D);  // 4*windowWidth/3⇒1482
  // きっちり指定しないとHSB,255,255,255になってしまいます（processing javaの仕様）
  //colorMode(HSB);
  colorMode(HSB, 360, 100, 100);
  hu = (int)random(360);
  //angleMode(DEGREES);
  background(255);
  shorterSide = (windowWidth < windowHeight) ? windowWidth : windowHeight;
}

void draw() {
  translate(width * 0.5f, height * 0.5f);

  background(hu, 20, 100);
  stroke(0);
  fill(0);
  strokeWeight(1);
  circle(0, 0, shorterSide/24.0f);
  var r = shorterSide/2.1;

  strokeWeight(shorterSide/24.0f);
  for (var i = 0; i < 12; i++) {
    var x1 = r * -cos(radians(i*360/12.0f));
    var y1 = r * -sin(radians(i*360/12.0f));
    var x2 = r * 0.7 * -cos(radians(i*360/12.0f));
    var y2 = r * 0.7 * -sin(radians(i*360/12.0f));
    line(x1, y1, x2, y2);
  }
  strokeWeight(5);
  for (var i = 0; i < 60; i++) {
    var x1 = r * -cos(radians(i*360/60.0f));
    var y1 = r * -sin(radians(i*360/60.0f));
    var x2 = r * 0.85 * -cos(radians(i*360/60.0f));
    var y2 = r * 0.85 * -sin(radians(i*360/60.0f));
    line(x1, y1, x2, y2);
  }

  strokeWeight(shorterSide/24.0f);
  var h = radians((hour() + minute()/60.0f + second()/3600.0f) * 360 / 12.0f + 90);
  var xh = r * 0.6 * -cos(h);
  var yh = r * 0.6 * -sin(h);
  line(0, 0, xh, yh);

  strokeWeight(shorterSide/40.0f);
  var m = radians((minute() + second()/60.0f) * 360 / 60.0f + 90);
  var xm = r * 0.95 * -cos(m);
  var ym = r * 0.95 * -sin(m);
  line(0, 0, xm, ym);

  // （あえて「RGB」で「赤」にする。「そう決めた！！」＼(^_^)／）
  push();
  colorMode(RGB, 255, 255, 255);
  stroke(255, 0, 0);
  strokeWeight(shorterSide/80.0f);
  var s = radians(second() * 360 / 60.0f + 90);
  var xs = r * 0.9 * -cos(s);
  var ys = r * 0.9 * -sin(s);
  line(0, 0, xs, ys);
  pop();
}

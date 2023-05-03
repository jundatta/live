// こちらがオリジナルです。
// 【作者】Richard Bourneさん
// 【作品名】Railstation Clock
// https://openprocessing.org/sketch/1842126

let hu;

function setup() {
  createCanvas(4*windowHeight/3, windowHeight, WEBGL);
  colorMode(HSB);
  hu = random(360);
  angleMode(DEGREES);
  background(255);
  tt = -1
    shorterSide = (windowWidth < windowHeight) ? windowWidth : windowHeight;
}

function draw() {
  background(hu, 20, 100);
  stroke(0)
    fill(0)
    strokeWeight(1)
    circle(0, 0, shorterSide/24)
    r = shorterSide/2.1

    strokeWeight(shorterSide/24)
    for (let i = 0; i < 12; i++) {
    x1 = r * -cos(i*360/12)
      y1 = r * -sin(i*360/12)
      x2 = r * 0.7 * -cos(i*360/12)
      y2 = r * 0.7 * -sin(i*360/12)
      line(x1, y1, x2, y2)
  }
  strokeWeight(5)
    for (let i = 0; i < 60; i++) {
    x1 = r * -cos(i*360/60)
      y1 = r * -sin(i*360/60)
      x2 = r * 0.85 * -cos(i*360/60)
      y2 = r * 0.85 * -sin(i*360/60)
      line(x1, y1, x2, y2)
  }

  strokeWeight(shorterSide/24)
    h = (hour() + minute()/60 + second()/3600) * 360 / 12 + 90
    xh = r * 0.6 * -cos(h)
    yh = r * 0.6 * -sin(h)
    line(0, 0, xh, yh)

    strokeWeight(shorterSide/40)
    m = (minute() + second()/60) * 360 / 60 + 90
    xm = r * 0.95 * -cos(m)
    ym = r * 0.95 * -sin(m)
    line(0, 0, xm, ym)

    stroke(255, 0, 0)
    strokeWeight(shorterSide/80)
    s = second() * 360 / 60 + 90
    xs = r * 0.9 * -cos(s)
    ys = r * 0.9 * -sin(s)
    line(0, 0, xs, ys)

  /*fill(255, 0, 0)
   strokeWeight(1)
   xs = r * 0.6 * -cos(s)
   ys = r * 0.6 * -sin(s)
   circle(xs, ys, 80)*/
}

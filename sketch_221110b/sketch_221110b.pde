// こちらがオリジナルです。
// 【作者】Soothing Circlesさん
// 【作品名】Richard Bourne
// https://openprocessing.org/sketch/1483539

let n, s, f1, f2, f3;

function setup() {
  createCanvas(1112, 834);
  colorMode(HSB, 255);
  background(20);
  smooth();
  noStroke();
  fill(255);
}

n = 120;      // number of ellipse per circle
m = 100;      // magnitude of waves
f1 = 1000;    // f general
f2 = 2;       // f of rotation
f3 = 5;       // f of waves

function draw() {
  background(0);
  let t = millis()/f1;

  paintCircle(t, 0);
  paintCircle(t, PI);
}

function paintCircle(t, o) {
  for (let i = 0; i < n; i++) {
    let p = (i/n)*TWO_PI;
    let x = (width/2) + sin(p+t) * (200+sin((t*f2+p)*f3+o)*m*(1-sin(p)));
    let y = (height/2) + cos(p+t) * (200+sin((t*f2+p)*f3+o)*m*(1-sin(p)));
    fill(i/n * 255, 200, 255);
    ellipse(x, y, 8, 8);
  }
}

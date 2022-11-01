// こちらがオリジナルです。
// 【作者】独楽回しeddyさん
// 【作品名】PartialVisibleClock
// https://neort.io/art/c8cefic3p9fffhuguh30

const ColorPalette = Object.freeze( {
"colorT":
  "#50d0d0",
  "colorM":
  "#be1e3e",
  "colorK":
  "#7967c3",
  "colorH":
  "#ffc639",
  "colorN":
  "#255699",
  "colorS":
  "#aeb49c"
}
);

let m;
let h;
let s;
let clockR;
let centerPos;
let mask;

function setup() {
  createCanvas(windowWidth, windowHeight);
  background(color(ColorPalette.colorN));

  clockR = height * 0.4;
  centerPos = createVector(width/2, height/2);

  mask = createGraphics(width, height);
}

function draw() {
  background(color(ColorPalette.colorN));
  m = minute();  // 分
  h = hour();    // 時間
  s = second();  // 秒

  push();
  translate(centerPos.x, centerPos.y);
  textSize(50);
  fill(color(ColorPalette.colorH));
  stroke(color(ColorPalette.colorH));
  textAlign(CENTER, CENTER);

  // 文字盤
  for (let i = 0; i < 12; i++) {
    let theta = TWO_PI / 12 * i;
    let x = clockR * cos(theta - HALF_PI + HALF_PI / 3);
    let y = clockR * sin(theta - HALF_PI + HALF_PI / 3);
    text(i+1, x, y);
  }

  // 秒間隔
  for (let i = 0; i < 60; i++) {
    let theta = TWO_PI / 60 * i;
    let x = (clockR + 60) * cos(theta - HALF_PI + HALF_PI / 3);
    let y = (clockR + 60) * sin(theta - HALF_PI + HALF_PI / 3);
    ellipse(x, y, 10, 10);
  }

  // 5秒間隔
  for (let i = 0; i < 12; i++) {
    let theta = TWO_PI / 12 * i;
    let x = (clockR + 60) * cos(theta - HALF_PI + HALF_PI / 3);
    let y = (clockR + 60) * sin(theta - HALF_PI + HALF_PI / 3);
    let dir = p5.Vector.sub(centerPos, createVector(x, y));
    push();
    translate(x, y);
    rectMode(CENTER);
    rect(0, 0, 20, 20);
    pop();
  }

  // 秒針
  let sTheta = map(s, 0, 60, 0, TWO_PI);
  let sx = (clockR + 60) * cos(sTheta - HALF_PI);
  let sy = (clockR + 60) * sin(sTheta - HALF_PI);
  strokeWeight(1);
  stroke(color(ColorPalette.colorK));
  fill(color(ColorPalette.colorK));
  ellipse(0, 0, 10, 10);
  strokeWeight(3);
  line(0, 0, sx, sy);

  // 分針
  let mTheta = map(m, 0, 60, 0, TWO_PI);
  let offsetMTheta = map(s, 0, 60, 0, TWO_PI/60);
  let mx = (clockR + 20) * cos(mTheta + offsetMTheta - HALF_PI);
  let my = (clockR + 20) * sin(mTheta + offsetMTheta - HALF_PI);
  strokeWeight(1);
  stroke(color(ColorPalette.colorT));
  fill(color(ColorPalette.colorT));
  ellipse(0, 0, 15, 15);
  strokeWeight(5);
  line(0, 0, mx, my);

  // 時間の針
  let hTheta = map(h%12, 0, 12, 0, TWO_PI);
  let offsetHThetaM = map(m, 0, 60, 0, TWO_PI/12);
  let hx = (clockR + 20) * cos(hTheta + offsetHThetaM - HALF_PI);
  let hy = (clockR + 20) * sin(hTheta + offsetHThetaM - HALF_PI);
  strokeWeight(1);
  stroke(color(ColorPalette.colorM));
  fill(color(ColorPalette.colorM));
  ellipse(0, 0, 20, 20);
  strokeWeight(10);
  line(0, 0, hx, hy);

  pop();

  let maskBg = color(ColorPalette.colorH);
  mask.clear();
  mask.background(red(maskBg), green(maskBg), blue(maskBg), 200);
  mask.push();
  mask.translate(centerPos.x, centerPos.y);

  // 秒針
  mask.strokeWeight(1);
  mask.stroke(color(ColorPalette.colorK));
  mask.fill(color(ColorPalette.colorK));
  mask.ellipse(0, 0, 10, 10);
  mask.strokeWeight(3);
  mask.line(0, 0, sx, sy);
  mask.erase();
  mask.ellipse(sx/1.2, sy/1.2, 200, 200);
  mask.noErase();

  // 分針
  mask.strokeWeight(1);
  mask.stroke(color(ColorPalette.colorT));
  mask.fill(color(ColorPalette.colorT));
  mask.ellipse(0, 0, 15, 15);
  mask.strokeWeight(5);
  mask.line(0, 0, mx, my);
  mask.erase();
  mask.ellipse(mx/1.1, my/1.1, 250, 250);
  mask.noErase();

  // 時間の針
  mask.strokeWeight(1);
  mask.stroke(color(ColorPalette.colorM));
  mask.fill(color(ColorPalette.colorM));
  mask.ellipse(0, 0, 20, 20);
  mask.strokeWeight(10);
  mask.line(0, 0, hx, hy);
  mask.erase();
  mask.ellipse(hx/1.3, hy/1.3, 300, 300);
  mask.noErase();

  mask.pop();

  image(mask, 0, 0);
}

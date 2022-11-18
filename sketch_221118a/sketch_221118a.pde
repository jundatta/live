// こちらがオリジナルです。
// 【作者】SamuelYANさん
// 【作品名】MovingArc_3
// https://openprocessing.org/sketch/1471274

// by SamuelYAN
// more works //
// https://twitter.com/SamuelAnn0924
// https://www.instagram.com/samuel_yan_1990/


let seed;
let angle_c;
let colors = [];
let colors0 = "4596c7-6d8370-e45240-21d3a4-3303f9".split("-").map((a) => "#" + a);
let colors1 = "cd2220-173df6-244ca8-a00360-b31016".split("-").map((a) => "#" + a);
let colors2 = "7382ce-9fb7f4-12177d-9bb5e9-7486af".split("-").map((a) => "#" + a);
let colors3 = "82d362-5c5190-6c6dd1-3d6966-5967ca".split("-").map((a) => "#" + a);
let colors4 = "8c75ff-c553d2-2dfd60-2788f5-23054f".split("-").map((a) => "#" + a);
let colors5 = "f21252-8834f1-c4dd92-184fd3-f9fee2".split("-").map((a) => "#" + a);
let colors6 = "2E294E-541388-F1E9DA-FFD400-D90368".split("-").map((a) => "#" + a);
let colors7 = "1b1b1b-292929-f3f3f3-222222-ff0000".split("-").map((a) => "#" + a);
var color_setup;

function setup() {
  // pixelDensity(5);
  createCanvas(windowWidth, windowHeight);
  seed = int(random(1000));
  colorMode(HSB, 360, 100, 100, 100);
  background(0, 0, 95, 100);
  color_setup = random([colors0, colors1, colors2, colors3, colors4, colors5, colors6, colors7]);
  angle_c = 0;
}

function draw() {
  randomSeed(seed);
  background(0, 0, 95, 1);
  translate(width / 2, height / 2);
  rotate(angle_c);
  for (let i = 0; i < 4; i++) {
    colors[0] = random(color_setup);
    colors[1] = random(color_setup);
    colors[2] = random(color_setup);
    colors[3] = random(color_setup);
    colors[4] = random(color_setup);
    circleForm(0, 0, width * 0.1 * (i+1));
  }
  angle_c += TAU/3600/0.5;
}

function circleForm(x, y, d) {

  let branch = int(random(30, 15));
  let ang = TAU / branch;
  let angles = [];
  for (let i = 0; i < branch; i++) {
    angles.push(ang * (i + iteration(0.1, 0.25)));
  }
  for (let i = 0; i < branch; i++) {
    let ang1 = angles[i];
    let ang2 = angles[(i + int(random(6))) % angles.length];
    let dd = d * iteration(0.1, 1);
    noFill();
    // drawingContext.shadowColor = random(colors);
    // drawingContext.shadowOffsetX = 2;
    // drawingContext.shadowOffsetY = 2;
    // drawingContext.shadowBlur = 0;
    stroke(random(colors));

    strokeCap(SQUARE);
    strokeWeight(random(5));
    arc(x, y, dd, dd, ang1, ang2);
  }
}

function iteration(s, e) {
  let t = random(10, 100);
  let v = random(0.001, 0.01);
  return map(cos(t + frameCount * v), -1, 1, s, e);
}

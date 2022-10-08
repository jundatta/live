// こちらがオリジナルです。
// 【作者】MGさん
// 【作品名】第12回課題
// https://openprocessing.org/sketch/1047844

let x = [];
let y = [];
let z = [];
let c = [];
let num = 80;

let img;

function preload() {
  img = loadImage('jura-face.png');
  img2 = loadImage('sida-face.png');
  img3 = loadImage('back_1.png');
}

function setup() {
  createCanvas(windowWidth, windowHeight, WEBGL);
  angleMode(DEGREES);
  colorMode(HSB, 360, 100, 100, 100);

  for (let i = 0; i < num; i = i + 1) {
    x[i] = random(-width / 2, width / 2);
    y[i] = random(-height / 2, height / 2);
    z[i] = random(-500, 500);
    c[i] = color(random(360), 80, 100);
  }
}

function draw() {
  background(220, 80, 20);

  // orbitControl();

  push();
  　//背景
    noStroke();
  texture(img3);
  cylinder(750, 1500);
  pop();

  push();
  　//箱１
    for (let i = 0; i < num; i = i + 1) {
    push();
    translate(x[i], y[i], z[i]);
    rotateX((x[i] + frameCount) / 3);
    rotateY((y[i] + frameCount) / 4);
    rotateZ((z[i] + frameCount) / 5);
    fill(c[i]);
    stroke(0, 0, 100);
    texture(img);
    box(60);
    pop();

    y[i] = y[i] + 3
      if (y[i] > 500) {
      y[i] = -500;
    }
  }

  push();
  　//箱２
    for (let i = 0; i < num; i = i + 1) {
    push();
    translate(x[i], y[i], z[i]);
    rotateX((x[i] + frameCount) / 3);
    rotateY((y[i] + frameCount) / 4);
    rotateZ((z[i] + frameCount) / 5);
    fill(c[i]);
    stroke(0, 0, 100);
    texture(img2);
    box(60);
    pop();

    y[i] = y[i] + 3
      if (y[i] > 500) {
      y[i] = -500;
    }
  }
}

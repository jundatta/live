// こちらがオリジナルです。
// 【作者】Richard Bourneさん
// 【作品名】Cube of Squares
// https://openprocessing.org/sketch/1900603

let hu = 0;
let inc = 0;

function setup() {
  createCanvas(920, 690, WEBGL);
  colorMode(HSB, 255);
}

function draw() {
  background(255)
    orbitControl();
  rotateX(frameCount*.01);
  rotateY(frameCount*.01);
  scale(1.2)
    stroke(0);
  rectMode(CENTER);

  push();
  translate(0, -150, 0);
  rotateX(PI/2);
  hu = inc;
  for (let i = -1; i <= 1; i++) {
    for (let j = -1; j <= 1; j++) {
      fill(hu%255, 255, 255);
      square(i*100, j*100, 75);
      hu+=255/9;
    }
  }
  pop();

  push();
  translate(-150, 0, 0);
  rotateY(-PI/2);
  hu = inc;
  for (let i = -1; i <= 1; i++) {
    for (let j = -1; j <= 1; j++) {
      fill(hu%255, 255, 255);
      square(i*100, j*100, 75);
      hu+=255/9;
    }
  }
  pop();

  push();
  translate(0, 0, 150);
  hu = inc;
  for (let i = -1; i <= 1; i++) {
    for (let j = -1; j <= 1; j++) {
      fill(hu%255, 255, 255);
      square(i*100, j*100, 75);
      hu+=255/9;
    }
  }
  pop();

  push();
  translate(150, 0, 0);
  rotateY(PI/2);
  hu = inc
    for (let i = -1; i <= 1; i++) {
    for (let j = -1; j <= 1; j++) {
      fill(hu%255, 255, 255);
      square(i*100, j*100, 75);
      hu+=255/9;
    }
  }
  pop();

  push();
  translate(0, 0, -150);
  rotateY(PI);
  hu = inc;
  for (let i = -1; i <= 1; i++) {
    for (let j = -1; j <= 1; j++) {
      fill(hu%255, 255, 255);
      square(i*100, j*100, 75);
      hu+=255/9;
    }
  }
  pop();

  push();
  translate(0, 150, 0);
  rotateX(-PI/2);
  hu = inc;
  for (let i = -1; i <= 1; i++) {
    for (let j = -1; j <= 1; j++) {
      fill(hu%255, 255, 255);
      square(i*100, j*100, 75);
      hu+=255/9;
      square(i*100, j*100, 75);
    }
  }
  pop();
  inc+=.5;
}

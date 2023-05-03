// こちらがオリジナルです。
// 【作者】Richard Bourneさん
// 【作品名】Cube of Squares
// https://openprocessing.org/sketch/1900603

int hu = 0;
int inc = 0;

void setup() {
  size(920, 690, P3D);
  colorMode(HSB, 255);
}

void draw() {
  translate(width * 0.5f, height * 0.5f);
  
  background(255);
  //orbitControl();
  rotateX(frameCount*.01);
  rotateY(frameCount*.01);
  scale(1.2);
  stroke(0);
  rectMode(CENTER);

  push();
  translate(0, -150, 0);
  rotateX(PI/2.0f);
  hu = inc;
  for (var i = -1; i <= 1; i++) {
    for (var j = -1; j <= 1; j++) {
      fill(hu%255, 255, 255);
      square(i*100, j*100, 75);
      hu+=255/9.0f;
    }
  }
  pop();

  push();
  translate(-150, 0, 0);
  rotateY(-PI/2.0f);
  hu = inc;
  for (var i = -1; i <= 1; i++) {
    for (var j = -1; j <= 1; j++) {
      fill(hu%255, 255, 255);
      square(i*100, j*100, 75);
      hu+=255/9.0f;
    }
  }
  pop();

  push();
  translate(0, 0, 150);
  hu = inc;
  for (var i = -1; i <= 1; i++) {
    for (var j = -1; j <= 1; j++) {
      fill(hu%255, 255, 255);
      square(i*100, j*100, 75);
      hu+=255/9.0f;
    }
  }
  pop();

  push();
  translate(150, 0, 0);
  rotateY(PI/2.0f);
  hu = inc;
  for (var i = -1; i <= 1; i++) {
    for (var j = -1; j <= 1; j++) {
      fill(hu%255, 255, 255);
      square(i*100, j*100, 75);
      hu+=255/9.0f;
    }
  }
  pop();

  push();
  translate(0, 0, -150);
  rotateY(PI);
  hu = inc;
  for (var i = -1; i <= 1; i++) {
    for (var j = -1; j <= 1; j++) {
      fill(hu%255, 255, 255);
      square(i*100, j*100, 75);
      hu+=255/9.0f;
    }
  }
  pop();

  push();
  translate(0, 150, 0);
  rotateX(-PI/2.0f);
  hu = inc;
  for (var i = -1; i <= 1; i++) {
    for (var j = -1; j <= 1; j++) {
      fill(hu%255, 255, 255);
      square(i*100, j*100, 75);
      hu+=255/9.0f;
      square(i*100, j*100, 75);
    }
  }
  pop();
  inc+=.5;
}

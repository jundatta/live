// こちらがオリジナルです。
// 【作者】Richard Bourneさん
// 【作品名】Another Analog Clock
// https://openprocessing.org/sketch/1912884

int i, j, ms;
float h, m, s, r, x0, x1, y0, y1;

void setup() {
  size(680, 680);
  smooth();
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  if (width > height) {
    r = height / 2;
  } else {
    r = width / 2;
  }
  r -= r / 8;
  s = second();
  while (s == second());
  ms = millis();
  frameRate(8);
}

void draw() {
  background(0);
  noStroke();
  fill(0, 0, 64);
  ellipse(width / 2, height / 2, 2 * r, 2 * r);
  for (j = 0; j < height; j += height / 32) {
    for (i = 0; i < width - width / 64; i += width / 64) {
      x0 = float(i);
      y0 = float(j) + height / 64 * sin(i * TWO_PI / width * 8);
      x1 = float(i + width / 64);
      y1 = float(j) + height / 64 * sin((i + width / 64) * TWO_PI / width * 8);
      stroke(0, 0, 128, 128);
      strokeWeight(r / 256);
      line(x0 - 2, y0 - 2, x1 - 2, y1 - 2);
      stroke(0, 0, 96, 128);
      strokeWeight(r / 128);
      line(x0, y0, x1, y1);
    }
  }
  loadPixels();
  for (j = -height / 2; j < height / 2; j++) {
    for (i = -width / 2; i < width / 2; i++) {
      if (i * i + j * j > r * r) {
        pixels[(height / 2 + j) * width + (width / 2) + i] = color(0);
      }
    }
  }
  updatePixels();
  stroke(255);
  strokeWeight(r / 64);
  noFill();
  ellipse(width / 2, height / 2, 2 * r, 2 * r);
  fill(255);
  for (i = 0; i < 60; i++) {
    if (i % 5 == 0) {
      x0 = width / 2 + (r - r / 8) * cos(i * TWO_PI / 60);
      x1 = width / 2 + r * cos(i * TWO_PI / 60);
      y0 = height / 2 + (r - r / 8) * sin(i * TWO_PI / 60);
      y1 = height / 2 + r * sin(i * TWO_PI / 60);
      strokeWeight(r / 128);
    } else {
      x0 = width / 2 + (r - r / 16) * cos(i * TWO_PI / 60);
      x1 = width / 2 + r * cos(i * TWO_PI / 60);
      y0 = height / 2 + (r - r / 16) * sin(i * TWO_PI / 60);
      y1 = height / 2 + r * sin(i * TWO_PI / 60);
      strokeWeight(r / 256);
    }
    line(x0, y0, x1, y1);
    if (i % 5 == 0) {
      x0 = width / 2 + (r - r / 5) * cos(i * TWO_PI / 60);
      y0 = height / 2 + (r - r / 5) * sin(i * TWO_PI / 60);
      textSize(r / 8);
      text((i / 5 + 2) % 12 + 1, x0, y0);
      x0 = width / 2 + (r - 2 * r / 5) * cos(i * TWO_PI / 60);
      y0 = height / 2 + (r - 2 * r / 5) * sin(i * TWO_PI / 60);
      textSize(r / 12);
      text((i / 5 + 2) % 12 + 13, x0, y0);
      x0 = width / 2 + (r + r / 12) * cos(i * TWO_PI / 60);
      y0 = height / 2 + (r + r / 12) * sin(i * TWO_PI / 60);
      text((i + 15) % 60, x0, y0);
    }
  }
  //x0 = width / 2 + (r - r / 5) * cos(TWO_PI / 12 + TWO_PI / 24);
  //y0 = height / 2 + (r - r / 5) * sin(TWO_PI / 12 + TWO_PI / 24);
  stroke(0);
  strokeWeight(r / 128);
  fill(255);
  x0 = width / 2;
  y0 = height * 2 /3.2;
  ellipse(x0, y0, r / 7, r / 7);
  fill(0);
  textSize(r / 12);
  text(day(), x0, y0 - r / 160);
  noStroke();
  fill(255);
  ellipse(width / 2, height / 2, r / 16, r / 16);
  textSize(r / 9);
  //text("HOROLOGIUM", width / 2, 9 * height / 25);
  text("R", width / 2 - r / 20 - 1, 9 * height / 25);
  text("J", width / 2, 9 * height / 25);
  text("B", width / 2 + r / 20 + 1, 9 * height / 25);
  textSize(r / 4);
  //text("C", width / 2, 9 * height / 25);
  h = float(hour());
  m = float(minute());
  s = float(second()) + float((millis() - ms) % 1000) / 1000.0;
  m += s / 60.0;
  h += m / 60.0;
  x0 = width / 2 + (r - r / 2) * cos((h - 3) * TWO_PI / 12);
  y0 = height / 2 + (r - r / 2) * sin((h - 3) * TWO_PI / 12);
  stroke(255);
  strokeWeight(r / 32);
  line(width / 2, height / 2, x0, y0);
  x0 = width / 2 + (r - r / 4) * cos((m - 15) * TWO_PI / 60);
  y0 = height / 2 + (r - r / 4) * sin((m - 15) * TWO_PI / 60);
  stroke(255);
  strokeWeight(r / 64);
  line(width / 2, height / 2, x0, y0);
  noStroke();
  fill(255, 0, 0);
  ellipse(width / 2, height / 2, r / 32, r / 32);
  x0 = width / 2 + (r - r / 6) * cos((s - 15) * TWO_PI / 60);
  y0 = height / 2 + (r - r / 6) * sin((s - 15) * TWO_PI / 60);
  x1 = width / 2 + (r - 2 * r / 9) * cos((s - 15) * TWO_PI / 60);
  y1 = height / 2 + (r - 2 * r / 9) * sin((s - 15) * TWO_PI / 60);
  stroke(255, 0, 0);
  strokeWeight(r / 128);
  line(width / 2, height / 2, x0, y0);
  strokeWeight(r / 256);
  fill(255);
  ellipse(x1, y1, r / 24, r / 24);
  //println(frameRate);
}

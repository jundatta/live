// こちらがオリジナルです。
// 【作者】Neill Bogieさん
// 【作品名】Hue clock (example)
// https://openprocessing.org/sketch/1161526

void setup() {
  size(1112, 834);
  //angleMode(DEGREES);
  strokeCap(SQUARE);
}

final color lightgray = #D3D3D3;
final color skyblue = #87CEEB;
final color white = #FFFFFF;
final color orange = #FFA500;
final color gray = #808080;

void draw() {
  setBackgroundHue();

  float hrAngle = map(hour(), 0, 24, 0, 720) - 90;
  float minAngle = map(minute(), 0, 60, 0, 360) - 90;
  float secAngle = map(second(), 0, 60, 0, 360) - 90;
  float radius = min(width, height) * 0.4;

  //make everything relative to centre of canvas, a new (0,0)
  translate(width / 2, height / 2);
  noStroke();
  fill(lightgray);
  circle(0, 0, radius * 2);

  drawNumbers(radius * 0.75);
  drawHand(skyblue, hrAngle, 120, 20);
  drawHand(white, minAngle, 150, 15);
  drawHand(orange, secAngle, 170, 10);

  fill(gray);
  circle(0, 0, 50);
}

void drawHand(color colour, float angle, float len, float thickness) {
  push();
  stroke(colour);
  strokeWeight(thickness);
  rotate(radians(angle));
  line(0, 0, len, 0);
  pop();
}

void drawNumbers(float radius) {
  fill(60);
  textSize(50 * 2);
  textAlign(CENTER, CENTER);
  float angle = -60;
  String[] nums = {"1", "2", "3", "4", "etc."};
  for (String word : nums) {
    float x = radius * cos(radians(angle));
    float y = radius * sin(radians(angle));
    text(word, x, y);
    angle += 30;
  }
}

void setBackgroundHue() {
  push();
  colorMode(HSB, 360, 100, 100, 1.0f);
  int myHue = second() * 6;
  background(myHue, 50, 100);
  pop();
}

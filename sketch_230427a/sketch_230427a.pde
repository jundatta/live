// こちらがオリジナルです。
// 【作者】Richard Bourneさん
// 【作品名】3D Clock
// https://openprocessing.org/sketch/1226951

PFont myFont;

PShape cylinder;
PShape torus;

void preload() {
  myFont = createFont("TitilliumWeb-Bold.ttf", 50, true);
}

void setup() {
  preload();
  size(1112, 834, P3D);
  colorMode(HSB, 360, 100, 100, 100);
  textFont(myFont);
  textSize(80);
  textAlign(CENTER, CENTER);

  //cylinder(height/2.3, 20);
  cylinder = createCan(height/2.3, 20, 24, true, true);
  cylinder.setStroke(false);
  cylinder.setFill(color(160, 100, 100));
  //torus(height/2.2, 15);
  torus = createTorus(height/2.2, 15);
  torus.setStroke(false);
  torus.setFill(color(20, 20, 20));
}

void draw() {
  translate(width * 0.5f, height * 0.5f);

  //  orbitControl();
  background(0.0, 0.0, 90.0);
  push();
  lights();
  ambientLight(80, 80, 80);
  noStroke();
  fill(255);
  rotateX(PI/2.0f);
  translate(0, -20, 0);
  //  ambientMaterial(80);
  ambient(80);
  //cylinder(height/2.3, 20);
  shape(cylinder);
  pop();
  push();
  fill(20);
  translate(0, 0, -20);
  //torus(height/2.2, 15);
  shape(torus);
  pop();
  noLights();
  fill(0.0, 0.0, 20.0, 100.0);
  noStroke();
  ellipse(0.0, 0.0, 40.0, 40.0);
  final float dialRadius = width * 0.27;
  for (float dial = 0; dial < 12; dial++) {
    float dialRadian = TWO_PI * dial / 12.0 - PI / 3.0;
    text((int)dial + 1, dialRadius * cos(dialRadian), dialRadius * sin(dialRadian) - 15.0);
  }

  // draw clock hands
  int h = hour() % 12;
  int m = minute();
  int s = second();

  fill(0.0, 0.0, 20.0, 100.0);
  drawHand(h / 12.0 + m / (60.0 * 12.0), 0.22, 1.0);
  drawHand(m / 60.0, 0.26, 0.7);

  fill(0.0, 70.0, 70.0, 100.0);
  drawHand(s / 60.0, 0.3, 0.4);
}

void drawHand(float _rotation, float _length, float _width) {
  push();  //translate(0,0,2);
  rotate(TWO_PI * _rotation);
  beginShape();
  translate(0, 0, -5);

  vertex(-20.0 * _width, 0.0, 0.0);
  translate(0, 0, 2);

  vertex(20.0 * _width, 0.0, 0.0);
  translate(0, 0, 2);

  vertex(0.0, -width * _length, 0.0);
  endShape(CLOSE);
  pop();
}

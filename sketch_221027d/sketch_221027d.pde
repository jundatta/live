// こちらがオリジナルです。
// 【作者】Roni Kaufmanさん
// 【作品名】Luna
// https://openprocessing.org/sketch/870087

// By Roni Kaufman
// Inspired by https://www.openprocessing.org/sketch/180401
// as well as by the Pixar short film "La Luna" (2011), written and directed by Enrico Casarosa

int fixedFrameCount;
void setup() {
  size(600, 600);
  //noLoop();
  noFill();
  fixedFrameCount = frameCount;
}

void draw() {
  randomSeed(0);
  noiseSeed(0);

  background(6, 22, 65);

  drawClouds();
  filter(BLUR, 10);

  //drawingContext.shadowBlur = 10;
  //drawingContext.shadowColor = color(248, 238, 240, 255);

  drawStars();

  var radius = 180;
  var points = pointsInCircle(500, radius);

  strokeWeight(2);
  fill(247, 231, 146);
  stroke(216, 241, 218);
  //drawingContext.shadowColor = color(90, 217, 197);
  //drawingContext.shadowBlur = 500;
  circle(width/2, height/2, 2 * radius);
  //drawingContext.shadowColor = color(90, 217, 197, 100);
  //drawingContext.shadowBlur = 80;
  circle(width/2, height/2, 2 * radius);

  strokeWeight(0.5);
  stroke(252, 179, 112, 40);
  //drawingContext.shadowBlur = 0;
  for (var i = 0; i < 1500; i++) {
    var p1 = points[floor(random(points.length))];
    var p2 = points[floor(random(points.length))];
    strokeWeight(random(1));
    line(p1.x, p1.y, p2.x, p2.y);
  }
}

PVector[] pointsInCircle(int nPoints, float radius) {
  PVector[] points = new PVector[nPoints];
  for (var i = 0; i < nPoints; i++) {
    var theta = map(i, 0, nPoints, -PI, PI);
    var x = width/2 + radius*cos(theta);
    var y = height/2 + radius*sin(theta);
    points[i] = new PVector(x, y);
  }
  return points;
}

void drawClouds() {
  noStroke();
  for (var x = 0; x < width; x += 3) {
    for (var y = 0; y < height; y += 3) {
      //fill(40, 61, 72, noise(x/200.0f, y/150.0f, frameCount)*150);
      fill(40, 61, 72, noise(x/200.0f, y/150.0f, fixedFrameCount)*150);
      circle(x, y, 5);
    }
  }
}

void drawStars() {
  fill(248, 238, 240, 255);
  for (var i = 0; i < 200; i++) {
    circle(random(width), random(height), random(1));
  }
}

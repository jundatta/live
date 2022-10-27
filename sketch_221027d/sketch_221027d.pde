// こちらがオリジナルです。
// 【作者】Roni Kaufmanさん
// 【作品名】Luna
// https://openprocessing.org/sketch/870087

// By Roni Kaufman
// Inspired by https://www.openprocessing.org/sketch/180401
// as well as by the Pixar short film "La Luna" (2011), written and directed by Enrico Casarosa

function setup() {
  createCanvas(600, 600);
  noLoop();
  noFill();
}

function draw() {
  background(6, 22, 65);

  drawClouds();
  filter(BLUR, 10);

  drawingContext.shadowBlur = 10;
  drawingContext.shadowColor = color(248, 238, 240, 255);

  drawStars();

  let radius = 180;
  let points = pointsInCircle(500, radius);

  strokeWeight(2);
  fill(247, 231, 146);
  stroke(216, 241, 218);
  drawingContext.shadowColor = color(90, 217, 197);
  drawingContext.shadowBlur = 500;
  circle(width/2, height/2, 2 * radius);
  drawingContext.shadowColor = color(90, 217, 197, 100);
  drawingContext.shadowBlur = 80;
  circle(width/2, height/2, 2 * radius);

  strokeWeight(0.5);
  stroke(252, 179, 112, 40);
  drawingContext.shadowBlur = 0;
  for (let i = 0; i < 1500; i++) {
    let p1 = points[floor(random(points.length))];
    let p2 = points[floor(random(points.length))];
    strokeWeight(random(1));
    line(p1.x, p1.y, p2.x, p2.y);
  }
}

function pointsInCircle(nPoints, radius) {
  let points = [];
  for (let i = 0; i < nPoints; i++) {
    let theta = map(i, 0, nPoints, -PI, PI);
    let x = width/2 + radius*cos(theta);
    let y = height/2 + radius*sin(theta);
    points.push(createVector(x, y));
  }
  return points;
}

function drawClouds() {
  noStroke();
  for (let x = 0; x < width; x += 3) {
    for (let y = 0; y < height; y += 3) {
      fill(40, 61, 72, noise(x/200, y/150, frameCount)*150);
      circle(x, y, 5);
    }
  }
}

function drawStars() {
  fill(248, 238, 240, 255);
  for (let i = 0; i < 200; i++) {
    circle(random(width), random(height), random(1));
  }
}

function mouseClicked() {
  redraw();
}

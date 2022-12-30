// こちらがオリジナルです。
// 【作者】Neill Bogieさん
// 【作品名】Hue clock (example)
// https://openprocessing.org/sketch/1161526

function setup() {
  createCanvas(windowWidth, windowHeight);
  angleMode(DEGREES);
  strokeCap(SQUARE)
}


function draw() {
  setBackgroundHue();

  const hrAngle = map(hour(), 0, 24, 0, 720) - 90;
  const minAngle = map(minute(), 0, 60, 0, 360) - 90;
  const secAngle = map(second(), 0, 60, 0, 360) - 90;
  let radius = min(width, height) * 0.4;

  //make everything relative to centre of canvas, a new (0,0)
  translate(width / 2, height / 2);
  noStroke();
  fill('lightgray');
  circle(0, 0, radius * 2)

    drawNumbers(radius * 0.75);
  drawHand('skyblue', hrAngle, 120, 20);
  drawHand('white', minAngle, 150, 15);
  drawHand('orange', secAngle, 170, 10);

  fill('gray');
  circle(0, 0, 50)
}

function drawHand(colour, angle, len, thickness) {
  push();
  stroke(colour);
  strokeWeight(thickness)
    rotate(angle);
  line(0, 0, len, 0);
  pop();
}

function drawNumbers(radius) {
  fill(60);
  textSize(50)
    textAlign(CENTER, CENTER)
    let angle = -60;
  for (let word of ["1", "2", "3", "4", "etc."]) {
    const x = radius * cos(angle);
    const y = radius * sin(angle);
    text(word, x, y);
    angle += 30;
  }
}

function setBackgroundHue() {
  push();
  colorMode(HSB);
  const myHue = second() * 6;
  background(myHue, 50, 100);
  pop()
}

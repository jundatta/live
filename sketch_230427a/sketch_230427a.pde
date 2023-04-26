// こちらがオリジナルです。
// 【作者】Richard Bourneさん
// 【作品名】3D Clock
// https://openprocessing.org/sketch/1226951

flip = 0;
let myFont;

function preload() {
  myFont = loadFont('TitilliumWeb-Bold.ttf');
}

function setup() {
  createCanvas(1112, 834, WEBGL);
  colorMode(HSB, 360, 100, 100, 100);
  textFont(myFont);
  textSize(80);
  textAlign(CENTER, CENTER);
  frameRate(3);
}

function draw() {
  if (flip == 1) {
    translate(-80, 0);
    scale(1, -1);
  }
  orbitControl();
  background(0.0, 0.0, 90.0, 100.0);
  push();
  lights();
  ambientLight(80);
  noStroke();
  fill(255);
  rotateX(PI/2);
  translate(0, -20, 0);
  ambientMaterial(80);
  cylinder(height/2.3, 20);
  pop();
  push();
  fill(20);
  translate(0, 0, -20);
  torus(height/2.2, 15);
  pop()
    fill(0.0, 0.0, 20.0, 100.0);
  noStroke();
  ellipse(0.0, 0.0, 40.0, 40.0)
    const dialRadius = width * 0.27;
  for (let dial = 0; dial < 12; dial++) {
    let dialRadian = TWO_PI * dial / 12.0 - PI / 3.0;
    text(dial + 1, dialRadius * cos(dialRadian), dialRadius * sin(dialRadian) - 15.0);
  }

  // draw clock hands
  let h = hour() % 12;
  let m = minute();
  let s = second();

  fill(0.0, 0.0, 20.0, 100.0);
  drawHand(h / 12.0 + m / (60.0 * 12.0), 0.22, 1.0);
  drawHand(m / 60.0, 0.26, 0.7);

  fill(0.0, 70.0, 70.0, 100.0);
  drawHand(s / 60.0, 0.3, 0.4);

  // camera position
  const minutsRadius = width * 0.4;
  let minutsRadian = TWO_PI * m / 60.0 - PI / 2.0;
  /* camera(minutsRadius * cos(minutsRadian), minutsRadius * sin(minutsRadian), 120.0,
   0.0, 0.0, 0.0,
   0, 1, 0);*/
  //  camera(0.0, 0.0, 1000.0, 0.0, 0.0, 0.0, 0, 1, 0);
}

function drawHand(_rotation, _length, _width) {
  push();
  //translate(0,0,2);
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

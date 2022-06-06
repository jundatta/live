// 【作者】Ivan Rudnickiさん
// 【作品名】Whirlygig Blossom
// https://openprocessing.org/sketch/1327994

int numcars = 36;
Car[] cars = new Car[numcars];
float size;
float av = 0;
float swing = 5;
float starget = 0;
float zoom = 1;
float ztarget = 1;

function setup() {
  createCanvas(windowWidth, windowHeight);
  size = height / 5;
  rectMode(CENTER);
  colorMode(HSB, 360);

  for (let i = 0; i < numcars; i += 1) {
    a = i * TWO_PI / numcars;
    let c = i*(360/numcars);
    cars[i] = new Car(a, size, i, c);
  }
}

function draw() {
  background(0);
  translate(width / 2, height / 2);
  scale(zoom);
  av = map(mouseX, 0, width, -0.01, 0.01);
  ztarget = map(mouseY, height, 0, 0.5, 2);
  swing = lerp(swing, 1 + starget, 0.05);
  zoom = lerp(zoom, ztarget, 0.05);
  for (let c of cars) {
    c.show();
    c.move();
  }
}

function mousePressed() {
  starget = (starget + 1) % 13;
}

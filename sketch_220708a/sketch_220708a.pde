// 【作者】midorigokeさん
// 【作品名】360
// https://openprocessing.org/sketch/947901

let h = -125, v = 20
  let tex;

function setup() {
  createCanvas(windowWidth, windowHeight, WEBGL);
  tex = loadImage('360.png');
}

function draw() {
  background(0);
  noStroke();
  camera(0, 0, 0, 0, 0, 1, 0, 1, 0);
  scale(-1, 1, 1)
    rotateX(radians(v));
  rotateY(radians(h));

  texture(tex);
  sphere(1000);

  if (keyIsDown(39)) h--;
  if (keyIsDown(37)) h++;
  if (keyIsDown(38) && v > -90) v--;
  if (keyIsDown(40) && v < 90) v++;

  if (mouseIsPressed) {
    h -= (mouseX - width / 2) / width;
    v = min(90, max(-90, v + (mouseY - height / 2) / height));
  }
}

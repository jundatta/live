// https://openprocessing.org/sketch/1332672

PImage img;
PGraphics txt;
PVector mouse, laggymouse;
boolean tipping = true;
float tip = 0;
PVector orient;
float zoom = 1;
float ztarget = 1;

void preload() {
  img = loadImage("seurat.jp");
}

void setup() {
  size(1112, 834, P3D);
  img.resize(0, height);
  txt = createGraphics(img.width, img.height);
  background(0);
  mouse = new PVector(mouseX, mouseY);
  laggymouse = new PVector(width, height);
  orient = new PVector(0, 0, 0);
}

function draw() {
  scale(zoom);
  zoom = lerp(zoom, ztarget, 0.1);
  push();
  translate(width / 2 - img.width / 2, 0);
  mouse.x = mouseX;
  mouse.y = mouseY;
  mouse.x = constrain(mouse.x, width / 2 - (img.width / 2) + 50, width / 2 + (img.width / 2) - 50);
  mouse.y = constrain(mouse.y, 50, height-50);

  laggymouse.lerp(mouse, 0.1);
  let r = 15 + abs(p5.Vector.dist(laggymouse, mouse)) / 5;
  for (let i = 0; i < 150; i++) {
    let v1 = p5.Vector.random2D();
    let x = laggymouse.x - (width / 2 - img.width / 2) + random(-r, r) * v1.x;
    let y = laggymouse.y + random(-r, r) * v1.y;
    let c = img.get(x, y);
    txt.noStroke();
    if (i % 50 == 0) txt.fill(255);
    else txt.fill(c);
    txt.ellipse(x, y, 2, 2);
  }

  pop();
  background(0);
  ambientLight(155);
  pointLight(100, 100, 100, 0, -height, height);
  specularMaterial(20);
  orient.x = PI / 8 + PI / 8 * sin(tip);
  rotateX(orient.x);
  box(img.width, img.height, 10);
    translate(0, 0, 5.1);
  texture(txt);
  if (tipping) tip += 0.01;

  noStroke();
  plane(img.width, img.height);
}

function mousePressed() {
  tipping = !tipping;
}

function keyPressed() {
  if (keyCode == UP_ARROW) ztarget += 0.1;
  if (keyCode == DOWN_ARROW) ztarget -= 0.1;
}

function mouseDragged() {
  ztarget += (pmouseY - mouseY) / 1000;
}

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
  img = loadImage("seurat.jpg");
}

void setup() {
  preload();
  size(1112, 834, P3D);
  img.resize(0, height);
  txt = createGraphics(img.width, img.height);
  background(0);
  mouse = new PVector(mouseX, mouseY);
  laggymouse = new PVector(width, height);
  orient = new PVector(0, 0, 0);
}

void draw() {
  translate(width/2, height/2);
  
  scale(zoom);
  zoom = lerp(zoom, ztarget, 0.1);
  push();
  translate(width / 2 - img.width / 2, 0);
  mouse.x = mouseX;
  mouse.y = mouseY;
  mouse.x = constrain(mouse.x, width / 2 - (img.width / 2) + 50, width / 2 + (img.width / 2) - 50);
  mouse.y = constrain(mouse.y, 50, height-50);

  laggymouse.lerp(mouse, 0.1);
  var r = 15 + abs(PVector.dist(laggymouse, mouse)) / 5.0f;
  txt.beginDraw();
  for (int i = 0; i < 150; i++) {
    var v1 = PVector.random2D();
    var x = laggymouse.x - (width / 2 - img.width / 2) + random(-r, r) * v1.x;
    var y = laggymouse.y + random(-r, r) * v1.y;
    var c = img.get((int)x, (int)y);
    txt.noStroke();
    if (i % 50 == 0) txt.fill(255);
    else txt.fill(c);
    txt.ellipse(x, y, 2, 2);
  }
  txt.endDraw();

  pop();
  background(0);
  ambient(155);
  pointLight(100, 100, 100, 0, -height, height);
  specular(20);
  orient.x = PI / 8 + PI / 8 * sin(tip);
  rotateX(orient.x);
  box(img.width, img.height, 10);
  translate(0, 0, 5.1);
  texture(txt);
  if (tipping) tip += 0.01;

  noStroke();
  //  plane(img.width, img.height);
  box(img.width, img.height, 1);
}

void mousePressed() {
  tipping = !tipping;
}

void keyPressed() {
  if (keyCode == UP) ztarget += 0.1;
  if (keyCode == DOWN) ztarget -= 0.1;
}

void mouseDragged() {
  ztarget += (pmouseY - mouseY) / 1000;
}

// 【作者】midorigokeさん
// 【作品名】360
// https://openprocessing.org/sketch/947901

float h = -125 + 90, v = 20 - 45;
PImage tex;
PShape sphere;

void setup() {
  //size(1112, 834, P3D);
  size(500, 800, P3D);
  tex = loadImage("360.png");
  sphere = createShape(SPHERE, 1000);
  sphere.setTexture(tex);
  sphere.setStrokeWeight(0);
}

void draw() {
  translate(width/2, height/2);
  background(0);
  noStroke();
  //  camera(0, 0, 0, 0, 0, 1, 0, 1, 0);
  final float sc = 3.0f;
  scale(-sc, sc, sc);
  rotateX(radians(v));
  rotateY(radians(h));

  //  texture(tex);
  //sphere(1000);
  shape(sphere);

  if (keyCode == 39) h--;
  if (keyCode == 37) h++;
  if (keyCode == 38 && v > -90) v--;
  if (keyCode == 40 && v < 90) v++;

  if (mousePressed) {
    h -= (mouseX - width / 2) / (float)width;
    v = min(90, max(-90, v + (mouseY - height / 2) / (float)height));
  }
  
  if (!keyPressed) {
    keyCode = 0;
  }
}

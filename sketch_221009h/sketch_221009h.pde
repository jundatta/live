// こちらがオリジナルです。
// 【作者】MGさん
// 【作品名】第12回課題
// https://openprocessing.org/sketch/1047844

class Box {
  float x, y, z;
  color c;
  Box(float x, float y, float z, color c) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.c = c;
  }
}
Box[] boxes = new Box[80];

PImage img, img2, img3;
PShape cylinder, box1, box2;

void preload() {
  img = loadImage("jura-face.png");
  img2 = loadImage("sida-face.png");
  img3 = loadImage("back_1.png");
}

void setup() {
  preload();

  size(1112, 834, P3D);
  //angleMode(DEGREES);
  colorMode(HSB, 360, 100, 100, 100);

  for (var i = 0; i < boxes.length; i = i + 1) {
    float x = random(-width / 2, width / 2);
    float y = random(-height / 2, height / 2);
    float z = random(-500, 500);
    color c = color(random(360), 80, 100);
    boxes[i] = new Box(x, y, z, c);
  }

  cylinder = createCan(750, 1500);
  cylinder.setStroke(false);
  cylinder.setTexture(img3);

  box1 = createShape(BOX, 60);
  box1.setTexture(img);
  box1.setStroke(color(0, 0, 100));

  box2 = createShape(BOX, 60);
  box2.setTexture(img2);
  box2.setStroke(color(0, 0, 100));
}

void draw() {
  translate(width/2, height/2);
//  background(220, 80, 20);
  background(0, 100, 100);

  // orbitControl();

  // 背景
  shape(cylinder);

  // 箱1
  for (Box box : boxes) {
    push();
    translate(box.x, box.y, box.z);
    rotateX((box.x + frameCount) / 3);
    rotateY((box.y + frameCount) / 4);
    rotateZ((box.z + frameCount) / 5);
    box1.setFill(box.c);
    shape(box1);
    pop();

    box.y = box.y + 3;
    if (box.y > 500) {
      box.y = -500;
    }
  }

  // 箱2
  push();
  for (Box box : boxes) {
    push();
    translate(box.x, box.y, box.z);
    rotateX((box.x + frameCount) / 3);
    rotateY((box.y + frameCount) / 4);
    rotateZ((box.z + frameCount) / 5);
    box2.setFill(box.c);
    shape(box2);
    pop();

    box.y = box.y + 3;
    if (box.y > 500) {
      box.y = -500;
    }
  }
}

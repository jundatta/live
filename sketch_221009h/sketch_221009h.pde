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
    boxes[i].x = random(-width / 2, width / 2);
    boxes[i].y = random(-height / 2, height / 2);
    boxes[i].z = random(-500, 500);
    boxes[i].c = color(random(360), 80, 100);
  }

  cylinder = createCan(750, 1500);
  cylinder.setStroke(false);
  cylinder.setTexture(img3);

  box1 = createShape(BOX, 60, 60, 60);
  box1.setTexture(img);
  box1.setStroke(color(0, 0, 100));
}

void draw() {
  translate(width/2, height/2);
  background(220, 80, 20);

  // orbitControl();

  // 背景
  shape(cylinder);

  // 箱1
  for (BOX box : boxes) {
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

  push();
  　//箱２
    for (let i = 0; i < num; i = i + 1) {
    push();
    translate(x[i], y[i], z[i]);
    rotateX((x[i] + frameCount) / 3);
    rotateY((y[i] + frameCount) / 4);
    rotateZ((z[i] + frameCount) / 5);
    fill(c[i]);
    stroke(0, 0, 100);
    texture(img2);
    box(60);
    pop();

    y[i] = y[i] + 3
      if (y[i] > 500) {
      y[i] = -500;
    }
  }
}

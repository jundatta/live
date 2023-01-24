// こちらがオリジナルです。
// 【作者】kikpondさん
// 【作品名】Illuminated trees #2
// https://openprocessing.org/sketch/1348215

float range;
float treeNum;
int treeHue;
float treesWidth, treesHeight;
int isCoolColor;
float roadWidth, roadHeight;
PImage illumiImg;
Particle[] particles = new Particle[200];

void setup() {
  size(1112, 834);
  illumiImg = createImage(width, height);
  strokeWeight(10);
  range = 8;
  roadWidth = width / 10.0f;
  roadHeight = height / 1.2f;
  treeNum = 30;
  treesWidth = (width / 2 - roadWidth) / treeNum;
  treesHeight = (height - roadHeight) / treeNum;
  initIlluminatedImage();
  particleInit();
}

void draw() {
  background(0);
  image(illumiImg, 0, 0);
  for (int i = 0; i < particles.length; i++) {
    particles[i].update();
    particles[i].display();
  }
}

void particleInit() {
  int y = 0;
  int count = 0;
  int parHeight = 40;
  float blinkSeppd = 0.05;
  for (int i = 0; i < width; i += 100) {
    if (i < width / 2) y += parHeight;
    else y -= parHeight;

    for (int l = 0; l < particles.length; l++) {
      float lx = random(i, i + 100);
      float ly = random(y, height);
      float lr = random(10);
      float rand = setRandomColor();
      particles[count] = new Particle(lx, ly, lr, lr, rand, blinkSeppd);
      count++;
    }
  }
}

void kirakira() {
  push();
  noStroke();
  int y = 0;
  for (int i = 0; i < width; i += 100) {
    if (i < width / 2) y += 70;
    else y -= 70;
    for (int l = 0; l < 300; l++) {
      float lx = random(i, i + 100);
      float ly = random(y, height);
      float lr = random(7);
      float rand = setRandomColor();
      float lightness = int(random(50, 100));

      fill('hsla(' + rand + ', 100%,' + lightness + '%, 1)');
      ellipse(lx, ly, lr, lr);
    }
  }
  pop();
}

function initIlluminatedImage() {
  background(0, 10, 40, 250);
  starLight();
  isCoolColor = int(random(1, 5.1));
  road();
  //redCarpet();
  for (let i = treeNum; i > 0; i--) {
    treeHue = setRandomColor();
    let treeLien = map(i, treeNum, 0, 2, 10);
    push();
    translate((width) - i * treesWidth, height - i * treesHeight);
    tree(0, treeLien, treeHue);
    pop();

    push();
    translate(i * treesWidth, height - i * treesHeight);
    tree(0, treeLien, treeHue);
    pop();
  }
  //kirakira();
  bigTree(2000, roadHeight - 300, roadHeight);
  illumiImg = get();
}

function tree(depth, _treeH, _hue) {
  let lightness = int(random(50, 100));
  stroke('hsla(' + _hue + ', 100%,' + lightness + '%, 0.9)');

  push();
  scale(_treeH / 10);
  if (depth < 10) {
    line(0, 0, 0, -height / 3);
    push();
    {
      translate(0, -height / 5);
      rotate(random(-PI / range, PI / range));
      scale(0.7);
      tree(depth + 1, 10, treeHue);
    }
    pop();

    push();
    {
      translate(0, -height / 3);
      rotate(random(-PI / range, PI / range));
      scale(0.7);
      tree(depth + 1, 10, treeHue);
    }
    pop();
  }
  pop();
}

function road() {
  push();
  noStroke();
  fill(255, 100);
  quad(0, height, width / 2 - roadWidth, roadHeight,
    width / 2 + roadWidth, roadHeight, width, height);
  pop();

  push();
  strokeWeight(1);
  stroke(0);
  for (let y = roadHeight; y < height; y += treesHeight) {
    line(0, y, width, y);
  }
  pop();
}

function redCarpet() {
  push();
  noStroke();
  fill(255, 50, 50, 200);
  quad(100, height, width / 2 - roadWidth, roadHeight,
    width / 2 + roadWidth, roadHeight, width - 100, height);
  pop();
}


function setRandomColor() {
  if (isCoolColor == 1) return int(random(180, 300));
  else　 if (isCoolColor == 2) return int(random(50, 70));
  else if (isCoolColor == 3) return int(random(0, 50));
  else if (isCoolColor == 4) return int(random(0, 150));
  else　 if (isCoolColor == 5) return int(random(0, 360));
}

function starLight() {
  push();
  let rand = random(100, 300);
  let dir = random(1, 3);
  for (let i = 0; i < rand; i++) {
    let x = random(0, width);
    let y = random(0, 300);
    noStroke();
    fill(255);
    ellipse(x, y, dir, dir);
  }
  pop();
}

function bigTree(num, y1, y2) {
  noStroke();
  for (let i = 0; i < num; i++) {
    let y = random(y1, y2);
    let w = map(y, y1, y2, 1, 300);
    let x = random(width / 2 - (w / 2), width / 2 + (w / 2));
    fill('hsla(' + int(random(360)) + ', 100%,' + int(random(50, 90)) + '%, 1)');
    ellipse(x, y, 3, 3);
  }
}

function mouseClicked() {
  initIlluminatedImage();
  particleInit();
}

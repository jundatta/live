// こちらがオリジナルです。
// 【作者】kikpondさん
// 【作品名】Illuminated trees #2
// https://openprocessing.org/sketch/1348215

let step;
let range;
let c1, c2;
let treeNum, treeHue, treesWidth, treesHeight;
let isCoolColor;
let roadWidth, roadHeight;
let illumiImg;
let particles = [];

function setup() {
  createCanvas(windowWidth, windowHeight);
  illumiImg = createImage(width, height);
  strokeWeight(10);
  range = 8;
  roadWidth = width / 10;
  roadHeight = height / 1.2;
  treeNum = 30;
  treesWidth = (width / 2 - roadWidth) / treeNum;
  treesHeight = (height - roadHeight) / treeNum;
  initIlluminatedImage();
  particleInit();
}

function draw() {
  background(0);
  image(illumiImg, 0, 0);
  for (let i = 0; i < particles.length; i++) {
    particles[i].update();
    particles[i].display();
  }
}

function particleInit() {
  let y = 0;
  let count = 0;
  let parHeight = 40;
  let blinkSeppd = 0.05;
  for (let i = 0; i < width; i += 100) {
    if (i < width / 2) y += parHeight;
    else y -= parHeight;

    for (let l = 0; l < 200; l++) {
      let lx = random(i, i + 100);
      let ly = random(y, height);
      let lr = random(10);
      let rand = setRandomColor();
      particles[count] = new Particle(lx, ly, lr, lr, rand, blinkSeppd);
      count++;
    }
  }
}

function kirakira() {
  push();
  noStroke();
  let y = 0;
  for (let i = 0; i < width; i += 100) {
    if (i < width / 2) y += 70;
    else y -= 70;
    for (let l = 0; l < 300; l++) {
      let lx = random(i, i + 100);
      let ly = random(y, height);
      let lr = random(7);
      let rand = setRandomColor();
      let lightness = int(random(50, 100));

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

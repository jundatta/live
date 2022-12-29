let t;
let mountainHeights = [];
let c1, c2;

function setup() {
  createCanvas(windowWidth, windowHeight);
  background(0);
  init();
}


function draw() {
  background(0);
  gradationBackground(0, 0, width, height, c1, c2);
  //    starLight();
  //    moon();
  //    deppMountain();
  townLight(1000);
  //townLightLine(width / 2, height / 2, width, height);
  //   townLightLines(50);
  //    mountain();
  noLoop();
}

function init() {
  t = 0;
  noiseSeed(int(random(5)));
  for (let x = 0; x < width; x++) {
    let n = noise(t);
    t += 0.01;
    mountainHeights[x] = n * 100;
  }
  c1 = color(0);
  c2 = color(0, 102, int(random(100, 255)));
}

function gradationBackground(x, y, w, h, _c1, _c2) {
  for (let i = y; i <= y + h; i += 1) {
    let inter = map(i, y, y + h, 0, 1);
    let c = lerpColor(_c1, _c2, inter);
    stroke(c);
    line(x, i, x + w, i);
  }
}

function mountain() {
  push();
  stroke(0);
  strokeWeight(5);
  let rand = random(1.1, 1.7)
    for (let x = 0; x < width; x++) {
    //line(x, height, x, (height - 50) - (rand * mountainHeights[x]));
    line(x, height, x, ((height - rand * 100) - mountainHeights[x]));
  }
  pop();
}

function deppMountain() {
  push();
  stroke(10);
  strokeWeight(1);
  let rand = random(0.1, 1.3);
  for (let x = width; x > 0; x--) {
    line(width - x, height / 2 + 10, width - x, height / 2 - (mountainHeights[x] * rand));
  }
  pop();
}

function townLight(num) {
  push();
  noStroke();
  for (let i = 0; i < num; i++) {
    let x = random(0, width);
    　
      let y = random(height / 2, height / 2 + height / 10);
    let r = map(y, height / 2, height, 1, 2);
    fill(255);
    ellipse(x, y, r, r);
  }

  for (let i = 0; i < num * 3; i++) {
    let x = random(0, width);
    　
      let y = random(height / 2, height / 2 + height / 10);
    let r = map(y, height / 2, height, 1, 2);
    let rand = int(random(360));
    fill('hsla(' + rand + ', 100%, 50%, 0.5)');
    //        ellipse(x, y, r, r);
  }

  for (let i = 0; i < num; i++) {
    let x = random(0, width);
    let y = random(height / 2, height);
    let r = map(y, height / 2, height, 1, 10);
    fill(255);
    ellipse(x, y, r, r);
  }
  for (let i = 0; i < num * 2; i++) {
    let x = random(0, width);
    let y = random(height / 2, height);
    let r = map(y, height / 2, height, 1, 10);
    let rand = int(random(100));
    fill('hsla(' + rand + ', 100%, 80%, 1)');
    ellipse(x, y, r, r);
  }
  pop();
}

function starLight() {
  push();
  let rand = random(100, 200);
  for (let i = 0; i < rand; i++) {
    let x = random(0, width);
    let y = random(0, 300);
    noStroke();
    fill(255);
    ellipse(x, y, 1, 1);
  }
  pop();
}

function moon() {
  push();
  noStroke();
  let moonX = random(100, width - 100);
  let moonY = random(100, height / 2 - 100);
  let diamater = random(20, 80);
  for (let i = 0; i < diamater; i++) {
    let c = int(map(i, 0, 100, 80, 100));
    fill('hsla(200, 50%,' + c + '%, 0.3)');
    ellipse(moonX, moonY, diamater - i, diamater - i);
  }
  pop();
}

function townLightLine(x, y, x2, y2, leng) {
  let angle = atan2(y2 - y, x2 - x);
  let randColor = int(random(100));
  push();
  noStroke();
  for (let i = 0; i < 1000; i += 10) {
    let rand = random(leng);
    let px = x + cos(angle) * rand;
    let py = y + sin(angle) * rand;
    fill('hsla(' + randColor + ', 100%, 90%, 1)');
    ellipse(px, py, py / 150, py / 150);
  }
  pop();
}

function townLightLines(num) {

  for (let i = 0; i < num; i++) {
    let x = random(width);
    let y = random(height / 2, height / 2 + 100);
    let x2 = random(x, width);
    let y2 = random(y, height);

    townLightLine(x, y, x2, y2, 400);
  }
}

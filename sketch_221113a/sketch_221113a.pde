// こちらがオリジナルです。
// 【作者】Okazzさん
// 【作品名】蚊柱
// https://neort.io/art/ca7nl543p9fbkmo5rqrg

let balls = [];
let colors = ['#ee1d38', '#2d55e6', '#FFE149', '#ffffff'];

function setup() {
  createCanvas(1080, 1080);
  for (let i = 0; i < 2000; i++) {
    balls.push(new Ball());
  }
}

function draw() {
  background(0);
  for (let i of balls) {
    i.move();
    i.show();
  }
}

class Ball {
  constructor() {
    this.x = random(width);
    this.y = random(height);
    this.d = min(width, height) * random(0.01, 0.03);
    this.alph;
    this.col = color(random(colors));
    this.xStep = random(-1, 1) * width / 200;
    this.yStep = random(-1, 1) * height / 200;
  }

  show() {
    this.col.setAlpha(this.alph);
    noStroke();
    fill(this.col);
    circle(this.x, this.y, this.d);
  }

  move() {
    this.alph = pow(((sin((this.x / 31.7)) + 1) / 2) * ((cos((this.y / 31.7)) + 1) / 2), 0.9) * 300;
    this.x += this.xStep;
    this.y += this.yStep;
    if (this.x < 0 || width < this.x) {
      this.xStep *= -1;
    }
    if (this.y < 0 || height < this.y) {
      this.yStep *= -1;
    }
  }
}

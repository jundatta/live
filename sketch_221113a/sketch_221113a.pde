// こちらがオリジナルです。
// 【作者】Okazzさん
// 【作品名】蚊柱
// https://neort.io/art/ca7nl543p9fbkmo5rqrg

ArrayList<Ball> balls = new ArrayList();
color[] colors = {#ee1d38, #2d55e6, #FFE149, #ffffff};

void setup() {
  P5JS.setup(this);
  size(1080, 1080);
  for (int i = 0; i < 2000; i++) {
    balls.add(new Ball());
  }
}

void draw() {
  background(0);
  for (var i : balls) {
    i.move();
    i.show();
  }
}

class Ball {
  float x, y, d;
  int alph;
  color col;
  float xStep, yStep;

  Ball() {
    this.x = random(width);
    this.y = random(height);
    this.d = min(width, height) * random(0.01, 0.03);
    this.alph = 255;
    this.col = color(P5JS.random(colors));
    this.xStep = random(-1, 1) * width / 200.0f;
    this.yStep = random(-1, 1) * height / 200.0f;
  }

  void show() {
    this.col = color(red(col), green(col), blue(col), alph);
    noStroke();
    fill(this.col);
    circle(this.x, this.y, this.d);
  }

  void move() {
    this.alph = (int)(pow(((sin((this.x / 31.7)) + 1) / 2.0f) * ((cos((this.y / 31.7)) + 1) / 2.0f), 0.9) * 300);
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

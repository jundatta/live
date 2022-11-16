// こちらがオリジナルです。
// 【作者】Okazzさん
// 【作品名】arcs
// https://neort.io/art/caiqec43p9fbkmo5ummg

ArrayList<Arc> arcs = new ArrayList();
color[] colors = {#ffd630, #329fe3, #154296, #c4071d, #ff9f1c, #ffffff, #98ce00, #16e0bd};

void setup() {
  P5JS.setup(this);
  size(800, 800);
  
  //angleMode(DEGREES);
  strokeCap(SQUARE);
  float c = 9;
  float w = width / c;
  for (float i = 0; i < c; i++) {
    for (float j = 0; j < c; j++) {
      float x = i * w + w / 2;
      float y = j * w + w / 2;
      int num = int(random(3, 7));
      if ((i + j) % 2 == 0) {
        for (int n = 0; n < num; n++) {
          arcs.add(new Arc(x, y, w));
        }
      }
    }
  }
}

void draw() {
  background(5);
  for (var i : arcs) {
    i.show();
    i.move();
  }
}

void myArc(float x, float y, float d, float a) {
  float r = d * 0.5;
  beginShape();
  if (a > 0) {
    for (float i = 0; i < a; i++) {
      vertex(x + r * cos(radians(i)), y + r * sin(radians(i)));
    }
  } else {
    for (float i = 0; i > a; i--) {
      vertex(x + r * cos(radians(i)), y + r * sin(radians(i)));
    }
  }
  endShape();
}

class Arc {
  float x, y;
  float d, d0;
  float rot;
  float a;
  float t, tStr1, tStr2;
  float sw;
  color col;
  
  Arc(float x, float y, float d) {
    this.x = x;
    this.y = y;
    this.d = d;
    this.d0 = d;
    this.rot = random(360);
    this.a = 0;
    this.t = random(12345);
    this.tStr1 = random(0.5, 2);
    this.tStr2 = random(0.5, 2);
    this.sw = random(d * 0.01, d * 0.3);
    this.col = color(P5JS.random(colors));
    this.col = color(red(col), green(col), blue(col), random(200, 255));
  }

  void show() {
    noFill();
    noStroke();
    strokeWeight(this.sw);
    stroke(this.col);
    push();
    translate(this.x, this.y);
    rotate(this.rot);
    myArc(0, 0, this.d, this.a);
    pop();
  }

  void move() {
    this.a = sin(this.t * this.tStr1) * 360;
    this.d = map(sin(this.t * this.tStr2), -1, 1, this.sw, this.d0);
    this.t++;
  }
}

// こちらがオリジナルです。
// 【作者】センバクさん
// 【作品名】traffic
// https://neort.io/art/ca1b66k3p9fbkmo5q0gg

float t = 0.0;
float vel = 0.2;
float num;
color[] palette_selected;
float size;

void setup() {
  P5JS.setup(this);
  size(1112, 834);
  size = min(width, height);

  background(#f4f1de);
  //angleMode(DEGREES);
  num = random(100);
  palette_selected = P5JS.random(palettes);
}

void draw() {
  randomSeed((long)num);
  background(#f4f1de);
  shape(width / 2, height / 2, width * 0.4);
}

void shape(float x, float y, float s) {
  push();
  translate(x, y);
  float count = 1000;
  for (var i = 0; i < count; i++) {
    var colNum = int(random(1, palette_selected.length));
    color col = color(palette_selected[colNum]);

    var angle = random(360);
    var magic = -1+ (random(random(random(1))));
    var d = s ;
    var ex = d * sin(radians(angle)) * magic*sin(radians(i+t));
    var ey = d * cos(radians(angle)) * magic*cos(radians(i+t));
    push();
    translate(ex, ey);
    var l = random(random(random(size/10.0f)));
    noStroke();
    fill(col);
    ellipse(0, 0, l, l);
    pop();
  }
  pop();
  t+=vel;
}

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
  randomSeed(num);
  background(#f4f1de);
  shape(width / 2, height / 2, width * 0.4);
}

function shape(x, y, s) {
  push();
  translate(x, y);
  let count = 1000;
  for (let i = 0; i < count; i++) {
    let colNum = int(random(1, palette_selected.length));
    col = color(palette_selected[colNum]);

    let angle = random(360);
    let magic = -1+ (random(random(random(1))));
    let d = s ;
    let ex = d * sin(angle) * magic*sin(i+t);
    let ey = d * cos(angle) * magic*cos(i+t);
    push();
    translate(ex, ey);
    let l = random(random(random(size/10)));
    noStroke();
    fill(col);
    ellipse(0, 0, l);
    pop();
  }
  pop();
  t+=vel;
}

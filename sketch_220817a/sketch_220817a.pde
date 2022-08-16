// https://openprocessing.org/sketch/1315519

float t = 0.0;
float vel = 0.02;
int num;

color[] palette_selected;
PGraphics pg;

void setup() {
  P5JS.mPApplet = this;
  size(500, 800);
  num = (int)random(100);
  int rrr = (int)random(palettes.length);
  palette_selected = palettes[rrr];
  pg = createGraphics(width, height);
  pg.beginDraw();
  pg.noStroke();
  for (var i = 0; i < 30000; i++) {
    var x = random(width);
    var y = random(height);
    var n = noise(x * 0.01, y * 0.01) * width * 0.002;
    pg.fill(255, 50);
    pg.ellipse(x, y, n, n);
  }
  pg.endDraw();
}

void mouseClicked() {
  palette_selected = P5JS.shuffle(palette_selected);
}

void draw() {
  randomSeed(num);
  background(palette_selected[0]);
  push();
  var count = width/80; //一行の数
  var w = width / count;
  stroke(255);
  strokeWeight(2);
  for (var j = 0.5; j < count; j++) {
    for (var i = 0.5; i < count; i++) {
      point(i * w, j * w);
    }
  }
  pop();
  for (var i = 0; i < 20; i++) {
    var colNum = int(random(1, palette_selected.length));
    color col = color(palette_selected[colNum]);
    star(random(width), random(height), random(20, 150), col);
  }
  image(pg, 0, 0);
  t += vel;
}

void star(float x, float y, float d, color col) {
  push();
  blendMode(OVERLAY);
  fill(col);
  noStroke();
  push();
  translate(x, y);
  var angle = TAU / 7.0f;
  var rBase = d; //半径
  var xInit = -10;
  var yInit = -10;
  var rDiv = width * 0.1;
  beginShape();
  float points = 7;
  float radian = 0;
  for (var i = 0; i < points + 3; radian = i++/points) {
    var pN = noise(xInit + (rBase) * cos(TAU * radian) * 0.02, yInit + (rBase) * sin(TAU * radian) * 0.5, t);
    var pR = (rBase) + rDiv * noise(pN);
    var pX = xInit + pR * cos(TAU * radian);
    var pY = yInit + pR * sin(TAU * radian);
    curveVertex(pX, pY);

    pX = xInit + (pR * 0.8) * cos(TAU * radian + (angle * 0.5));
    pY = yInit + (pR * 0.8) * sin(TAU * radian + (angle * 0.5));
    curveVertex(pX, pY);
  }
  endShape(CLOSE);
  pop();
  pop();
}

color[][] palettes = {
  {#5bc0eb, #fde74c, #9bc53d, #e55934, #fa7921},
  {#413e4a, #73626e, #b38184, #f0b49e, #f7e4be},
  {#e8ddcb, #cdb380, #036564, #033649, #031634},
  {#223843, #e9dbce, #eff1f3, #dbd3d8, #d8b4a0, #d77a61},
  {#c9cba3, #ffe1a8, #e26d5c, #723d46, #472d30},
  {#e29578, #ffffff, #006d77, #83c5be, #ffddd2, #edf6f9},
  {#ef476f, #ffd166, #06d6a0, #118ab2, #073b4c},
  {#594f4f, #547980, #45ada8, #9de0ad, #e5fcc2},
};

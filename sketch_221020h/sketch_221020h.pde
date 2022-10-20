// こちらがオリジナルです。
// 【作者】センバクさん
// 【作品名】traffic
// https://neort.io/art/ca1b66k3p9fbkmo5q0gg

let t = 0.0;
let vel = 0.2;
let num;
let palette_selected;
let size;

function setup() {
  size = min(windowWidth, windowHeight);
  createCanvas(size, size);

  background("#f4f1de");
  angleMode(DEGREES);
  num = random(100);
  palette_selected = random(palettes);
}
function windowResized() {
  resizeCanvas(size, size);
}

function draw() {
  randomSeed(num);
  background("#f4f1de");
  shape(width / 2, height / 2, width * 0.4)
}

function shape(x, y, s) {
  push();
  translate(x, y)
    let count = 1000;
  for (let i = 0; i < count; i++) {
    let colNum = int(random(1, palette_selected.length));
    col = color(palette_selected[colNum]);

    let angle = random(360)
      let magic = -1+ (random(random(random(1))));
    let d = s ;
    let ex = d * sin(angle) * magic*sin(i+t);
    let ey = d * cos(angle) * magic*cos(i+t);
    push();
    translate(ex, ey)
      let l = random(random(random(size/10)))
      // stroke(col)
      // rotate(100*sin(t))
      //  line(-(l/2), 0,(l/2), 0)
      noStroke();
    fill(col)
      ellipse(0, 0, l)
      pop();
  }
  pop();
  t+=vel;
}

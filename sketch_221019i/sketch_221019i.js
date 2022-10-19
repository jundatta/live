let forms = [];
let colors = ['#e6302b', '#fd7800', '#fbd400', '#51b72d', '#2abde4', '#5534eb', '#f477c3']

  function setup() {
  createCanvas(900, 900);
  strokeCap(PROJECT);
  INIT();
}

function draw() {
  background(0);
  for (i of forms) {
    i.show();
    i.move();
  }
  if (frameCount % 180 == 0) INIT();
}

function INIT() {
  let c = 10;
  let w = width / c;
  forms = [];
  strokeWeight(width / 50)
    for (let i = 0; i < c; i++) {
    for (let j = 0; j < c; j++) {
      let x = i * w + w / 2;
      let y = j * w + w / 2;
      forms.push(new Form(x, y, w));
    }
  }
  shuffle(colors, true);
}

function easeInOutCubic(x) {
  return x < 0.5 ? 4 * x * x * x : 1 - pow(-2 * x + 2, 3) / 2;
}

class Form {
  constructor(x, y, w) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.l = [];
    this.l0 = [];
    this.l1 = [];
    for (let i = 0; i < 4; i++) {
      this.l0[i] = 1;
      this.l[i] = 1;
      this.l1[i] = int(random(3) * random());
    }
    this.t = 0;
    this.t1 = 40;
    this.t2 = this.t1 + 60;
    this.t3 = this.t2 + 40;
    this.a = 0;
    this.a0 = 0;
    this.a1 = HALF_PI * int(random(-1, 1) * 4);
    this.sw0 = width / 400;
    this.sw1 = width / 40;
    this.sw = this.sw0;
    this.col0 = color('#ffffff');
    this.col1 = color(random(colors));
    this.col = this.col0;
  }

  show() {
    push();
    translate(this.x, this.y);
    rotate(this.a);
    strokeWeight(this.sw);
    stroke(this.col);
    line(0, -(this.w / 2) * this.l[0], 0, (this.w / 2) * this.l[1]);
    line(-(this.w / 2) * this.l[2], 0, (this.w / 2) * this.l[3], 0);
    pop();
  }

  move() {
    if (0 < this.t && this.t < this.t1) {
      let amt = norm(this.t, 0, this.t1 - 1);
      for (let i = 0; i < 4; i++) {
        this.l[i] = lerp(this.l0[i], this.l1[i], easeInOutCubic(amt));
      }
      this.a = lerp(this.a0, this.a1, easeInOutCubic(amt));
      this.sw = lerp(this.sw0, this.sw1, easeInOutCubic(amt));
      this.col = lerpColor(this.col0, this.col1, easeInOutCubic(amt));
    }
    if (this.t2 < this.t && this.t < this.t3) {
      let amt = norm(this.t, this.t2, this.t3 - 1);
      for (let i = 0; i < 4; i++) {
        this.l[i] = lerp(this.l1[i], this.l0[i], easeInOutCubic(amt));
      }
      this.a = lerp(this.a1, this.a0, easeInOutCubic(amt));
      this.sw = lerp(this.sw1, this.sw0, easeInOutCubic(amt));
      this.col = lerpColor(this.col1, this.col0, easeInOutCubic(amt));
    }
    this.t++;
  }
}

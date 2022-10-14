let balloons = [];
let colors = ["#000000", "#ED4141", "#2B8BDF", "#159670", '#ffffff'];
let bsSize;

function setup() {
  // createCanvas(1080, 1080);
  createCanvas(windowWidth, windowHeight);
  bsSize = (width * height) / 900;
  for (let i = 0; i < 132; i++) {
    balloons.push(new Balloon());
  }
}

function draw() {
  background('#FECA16');
  noStroke();
  fill(255);
  for (let b of balloons) {
    b.run();
  }
  for (let i = 0; i < balloons.length; i++) {
    let b = balloons[i];
    if (b.isDead) {
      balloons.splice(i, 1);
      balloons.push(new Balloon());
    }
  }
}

function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
  bsSize = min(width, height);
}

class Balloon {
  constructor() {
    this.x0 = random(width);
    this.x1 = random(width);
    this.x = this.x0;
    this.y0 = -height * 0.4;
    this.y1 = random(height);
    this.y = this.y0;
    this.d = random(random(random(random(bsSize * 0.4)))) + bsSize * 0.01;
    this.t = -int(random(200));
    this.t1 = int(random(100, 200));
    this.t2 = this.t1 + 60;
    this.pops = [];
    let pn = int(random(10, 20))
      for (let i = 0; i < pn; i++) {
      this.pops.push(new Pop(this.x1, this.y1, this.d));
    }
    this.isDead = false;
    this.col = random(colors);
  }

  show() {
    if (this.t < this.t1) {
      fill(this.col);
      noStroke();
      circle(this.x, this.y, this.d);
    } else if (this.t < this.t2) {
      for (let p of this.pops) {
        p.show(this.col);
        p.move();
        // p.show();
        // this.pops
        // let a = map(i, 0, this.nh, 0, TAU);
        // circle(this.x + this.mcl[i] * cos(a), this.y + this.mcl[i] * sin(a), this.mcs[i]);
      }
    }
  }

  move() {
    if (0 < this.t && this.t < this.t1) {
      // this.x -= this.xStep;
      // this.y -= this.yStep;
      let amt = norm(this.t, 0, this.t1 - 1);
      this.x = lerp(this.x0, this.x1, amt ** 0.3);
      this.y = lerp(this.y0, this.y1, amt ** 0.3);
    }
    // if(this.t < this.t1){
    // }
    this.t++;
    if (this.t > this.t2) {
      this.isDead = true;
    }
  }

  run() {
    this.show();
    this.move();
  }
}

class Pop {
  constructor(x, y, d) {
    this.x = x;
    this.y = y;
    this.d0 = d * random(0.1, 0.5);
    this.d = this.d0;
    this.n = int(random(10));
    this.r = 0;
    this.tr = d * random(0.1, 2);
    this.t = 0;
    this.t1 = int(random(1, 50));
    this.a = random(TAU);
  }

  show(col) {
    if (this.t < this.t1) {
      fill(col);
      noStroke();
      circle(this.x + this.r * cos(this.a), this.y + this.r * sin(this.a), this.d);
    }
  }

  move() {
    if (this.t < this.t1) {
      let amt = norm(this.t, 0, this.t1 - 1);
      this.d = lerp(this.d0, 0, amt ** 0.5);
      this.r = lerp(0, this.tr, amt ** 0.5);
      this.t++;
    }
  }
}

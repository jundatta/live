// こちらがオリジナルです。
// 【作者】独楽回しeddyさん
// 【作品名】CircleHistograms
// https://neort.io/art/c98oaqc3p9f0i94dl3rg

let hs = [];

function setup() {
  createCanvas(windowWidth, windowHeight);
  background(0);
  colorMode(HSB, 360, 100, 100, 100);

  // eLine = new ExpansionLine(200, 200, random(1000), color(ColorPalette.colorH), 200);
  hs.push(new Histogram(200));
  hs.push(new Histogram(400));
}

function draw() {
  background(0, 20);

  for (let i = 0; i < hs.length; i++) {
    hs[i].update();
    hs[i].display();
  }
}

function Histogram(r)
{
  this.eLines = [];
  this.angle = random(TWO_PI);
  this.aVel = random(-0.01, 0.01);

  let nSeed = random(10000);

  for (let i = 0; i < 180; i++) {
    let theta = TWO_PI / 180 * i;
    let x = r * cos(theta);
    let y = r * sin(theta);
    let c = color(i * 2, 100, 100, 100);
    this.eLines.push(new ExpansionLine(x, y, nSeed + i, c, r * 0.6));
  }

  this.update = function()
  {
    this.angle += this.aVel;
    for (let i = 0; i < this.eLines.length; i++) {
      this.eLines[i].update();
    }
  }

  this.display = function()
  {
    push();
    translate(width/2, height/2);
    rotate(this.angle);
    for (let i = 0; i < this.eLines.length; i++) {
      this.eLines[i].display();
    }
    pop();
  }
}

function ExpansionLine(x, y, seed, col, len)
{
  this.pos1 = createVector(x, y);
  this.dir = p5.Vector.sub(createVector(0, 0), this.pos1).normalize();
  this.pos2 = p5.Vector.add(this.pos1, this.dir);
  this.seed = seed;
  this.col = col;
  this.maxLength = len;
  this.len = len;

  this.update = function() {
    this.seed += 0.01;
    this.len = map(noise(this.seed), 0, 1, 0, this.maxLength);
    this.pos2 = p5.Vector.add(this.pos1, this.dir.copy().mult(this.len));
  }

  this.display = function() {
    push()
      noFill();
    stroke(this.col);
    strokeWeight(5);
    strokeCap(SQUARE);
    line(this.pos1.x, this.pos1.y, this.pos2.x, this.pos2.y);
    pop();
  }
}

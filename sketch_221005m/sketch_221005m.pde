let mypoints = [];
let mypointsNum = 500;
let maxR;
const palette = ["#ffffff", "#000000"];

function setup() {
  createCanvas(windowWidth, windowHeight);

  maxR = min(width, height) * 0.5;

  for (let i = 0; i < mypointsNum; i++) {
    mypoints.push(new MyPoint());
  }

  noStroke();
}

function draw() {
  background(0);

  for (let j = 0; j < palette.length; j++) {
    fill(palette[j]);
    if (j == 0) {
      let gradientFill = drawingContext.createLinearGradient(
        0,
        -maxR / 2,
        0,
        maxR / 2
        );

      gradientFill.addColorStop(0, color(255, 0, 255));
      gradientFill.addColorStop(0.5, color(255, 255, 0));
      gradientFill.addColorStop(1, color(0, 255, 255));

      drawingContext.fillStyle = gradientFill;
    }
    push();
    translate(width / 2, height / 2);
    rotate(TWO_PI * j / palette.length);

    beginShape();
    for (let i = 0; i < mypoints.length; i++) {
      mypoints[i].move();

      curveVertex(mypoints[i].x, mypoints[i].y);
    }
    endShape(CLOSE);
    pop();
  }
}

class MyPoint {
  constructor() {
    this.r = maxR * sqrt(random(1));
    this.t = random(TAU);
    this.tSpeed = random(0.001, 0.01);
    this.tSign = random(10) < 5 ? -1 : 1;
    this.d = 10;
    this.x = 0;
    this.y = 0;
    this.nvA = random(1000);

    this.nStep = random(1000);
    this.nSpeed = random(0.001, 0.01);
  }

  move() {
    this.r = maxR * sqrt(lerp(0, 1, noise(this.nStep, this.nvA)));

    this.x = this.r * cos(this.t);
    this.y = this.r * sin(this.t);

    this.nStep += this.nSpeed;
    this.t += this.tSign * this.tSpeed;
  }
}

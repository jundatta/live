// https://openprocessing.org/sketch/1051702

// By Roni Kaufman
// https://ronikaufman.github.io/
// inspired by https://twitter.com/beesandbombs/status/1343221449218285570?s=09

let points = [];

function setup() {
  createCanvas(windowWidth, windowHeight);
  noStroke();

  for (let r = 12; r < 200; r += 12) {
    for (let i = 0; i < r/2; i++) {
      let theta = map(i, 0, r/2, 0, TWO_PI);
      points.push( {
      r:
        r,
        theta:
        theta
      }
      );
    }
  }
}

function draw() {
  let f = frameCount/25;
  blendMode(BLEND);
  background(0);
  blendMode(ADD);
  translate(width/2, height/2);
  rotate(PI/2);
  for (let p of points) {
    let disp = map(p.r, 100, 192, 70, 0);
    if (p.r < 100) {
      disp = map(p.r, 12, 100, 0, 70);
    }
    let cost = cos(p.theta);
    let sint = sin(p.theta);
    let t = f + p.r/70;

    fill(255, 0, 0);
    let val = cos(t)/2+0.5;
    let r = p.r + val*disp;
    circle(r*cost, r*sint, 5);
    fill(0, 255, 0);
    val = cos(t + 0.05)/2+0.5;
    r = p.r + val*disp;
    circle(r*cost, r*sint, 5);
    fill(0, 0, 255);
    val = cos(t + 0.1)/2+0.5;
    r = p.r + val*disp;
    circle(r*cost, r*sint, 5);
  }
}

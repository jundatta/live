// こちらがオリジナルです。
// 【作者】sayoさん
// 【作品名】Shaved Ice
// https://openprocessing.org/sketch/921087

let cols = ['#FFE296', '#9FFF9A', '#92E8FF', '#C976FF', '#FF92D9'];

let upper = 600;
let bottom = 400;
let depth = 100;
let offset = 50;

let h = [];
let N = 100;

let mode = 0;

function setup() {
  createCanvas(800, 600, P2D);
  background(cols[int(random(cols.length))]);

  for (let i=0; i<width; i++) {
    if (i<width/2-(upper+bottom)/4 || i>width/2+(upper+bottom)/4) {
      h[i] = offset;
    } else {
      h[i] = offset+depth-10;
    }
  }
}

function draw() {
  stroke(255);
  strokeWeight(0.5);
  for (let i=0; i<N; i++) {
    var n;
    var angle;
    if (mode == 0) {
      n = int(randomGaussian(width/2, upper/6));
      angle = random(0, PI);
      if (h[n] != null) {
        stroke(255);
        line(n+10*cos(angle), height-(h[n]+10*sin(angle)), n-10*cos(angle), height-(h[n]-10*sin(angle)));
        h[n] += 1;
        if (h[n] >=height-offset) {
          mode = 1;
        }
      }
    } else {
      n = int(randomGaussian(width/2, upper/12)/2)*2;
      angle = random(0, PI);
      stroke('#F73576');
      line(n+10*cos(angle), height-(h[n]+10*sin(angle)), n-10*cos(angle), height-(h[n]-10*sin(angle)));
      h[n] -= 2;
      if (h[width/2] <= height/2) {
        noLoop();
      }
    }
  }
  noStroke();
  fill(240);
  quad(width/2-bottom/2, height-offset, width/2+bottom/2, height-offset, width/2+upper/2, height-(offset+depth), width/2-upper/2, height-(offset+depth));
}

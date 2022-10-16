// こちらがオリジナルです。
// 【作者】sayoさん
// 【作品名】Shaved Ice
// https://openprocessing.org/sketch/921087

color[] cols = {#FFE296, #9FFF9A, #92E8FF, #C976FF, #FF92D9};

float upper = 600;
float bottom = 400;
float depth = 100;
float offset = 50;

float[] h;
float N = 100;

int mode = 0;

void setup() {
  P5JS.setup(this);

  size(800, 600, P2D);
  h = new float[width];
  background(cols[int(random(cols.length))]);

  for (var i=0; i<width; i++) {
    if (i<width/2-(upper+bottom)/4 || i>width/2+(upper+bottom)/4) {
      h[i] = offset;
    } else {
      h[i] = offset+depth-10;
    }
  }
}

void draw() {
  stroke(255);
  strokeWeight(0.5);
  for (var i=0; i<N; i++) {
    int n;
    float angle;
    if (mode == 0) {
      n = int(P5JS.randomGaussian(width/2, upper/6));
      angle = random(0, PI);
      //if (h[n] != null) {
      if (0 <= n && n < h.length) {
        stroke(255);
        line(n+10*cos(angle), height-(h[n]+10*sin(angle)), n-10*cos(angle), height-(h[n]-10*sin(angle)));
        h[n] += 1;
        if (h[n] >=height-offset) {
          mode = 1;
        }
      }
      //}
    } else if (mode == 1) {
      n = int(P5JS.randomGaussian(width/2, upper/12)/2)*2;
      angle = random(0, PI);
      stroke(#F73576);
      line(n+10*cos(angle), height-(h[n]+10*sin(angle)), n-10*cos(angle), height-(h[n]-10*sin(angle)));
      h[n] -= 2;
      if (h[width/2] <= height/2) {
        mode = -1;  // なにもしない。に遷移する
      }
    } else {
      ;  // なにもしない＼(^_^)／
    }
  }
  if (mode != -1) {
    noStroke();
    fill(240);
    quad(width/2-bottom/2, height-offset, width/2+bottom/2, height-offset, width/2+upper/2, height-(offset+depth), width/2-upper/2, height-(offset+depth));
  }
}

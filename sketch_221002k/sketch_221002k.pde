// 【作者】へいへい📫１人前のプログラマ＆脱引きこもり目指す🔥
// 【作品名】randomMoveDot
// https://0000.studio/shoheyhey

float t;

void setup() {
  size(600, 600);
  t=0;
  dts=[];
  c=["#eebb00", "#77ddaa", "#ee99dd"];
}

class DOTS {
  float x, y;
  float vx, vy;
  float l;
  color c;
  float s;
  DOTS(float x, float y, float vx, float vy, float l, color c, float s) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.l = l;
    this.c = c;
    float s;
  }
}

void draw() {
  clear();
  d=random(TWO_PI);
}

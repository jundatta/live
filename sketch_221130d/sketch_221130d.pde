// こちらがオリジナルです。
// 【作者】はぅ君さん
// 【作品名】つぶやきCoding | 2022/11/28 by はぅ君
// https://twitter.com/Hau_kun

float t=0;
float W;
void setup() {
  size(720, 720, P3D);
  W = width;
  noStroke();
}
void draw() {
  t+=.01;
  colorMode(HSB, 360, 100, 100, 1.0f);
  blendMode(BLEND);
  //background(0, .3);
  push();
  fill(0, .3);
  rect(0, 0, width, height);
  pop();
  blendMode(ADD);
  for (float y=W; 0.0f < y; y-=16) {
    for (float x=y/16.0f%2*-9; x<W; x+=18) {
      //      fill((N=noise(x/99, y/99, t))*W%360, 70, W, T=tan(noise(x/W, y/W, t/9)*20+t))+circle(x+cos(R=N*9)*9/T, y+sin(R)*9/T, 5/T);
      float N=noise(x/99, y/99, t);
      float H = N*W%360;
      float T=tan(noise(x/W, y/W, t/9)*20+t);
      fill(H, 70, W, T);
      float R=N*9;
      circle(x+cos(R)*9/T, y+sin(R)*9/T, 5/T);
    }
  }
}

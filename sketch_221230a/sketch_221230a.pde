// こちらがオリジナルです。
// 【作者】はぅ君さん
// 【作品名】つぶやきCoding | 2022/07/12
// https://twitter.com/Hau_kun/status/1546817561828167680

float t=0;
float W = 720;

void setup() {
  size(720, 720, P3D);
}
void draw() {
  t+=.01;

  noStroke();
  colorMode(HSB, 360, 100, 100, 1.0f);
  background(0);

  beginShape(TRIANGLE_STRIP);
  float F = 0;
  for (float r=0; r<80; r+=.0393) {
    float A=r+t;
    float N=noise(A, t)*W;
    fill(N%360, 30, N/4.0f);
    float R=(F%2 != 0)?r:r-6;
    float rrr = 0.0f;
    if (R == 0.0f) {
      rrr = 1.0f;
    }
    float D=F++%8>3?R*R/9.0f:R*R/9.0f-R/2.0f;
    vertex(rrr+cos(A)*D+360, sin(A)*D+360);
  }
  endShape();
}

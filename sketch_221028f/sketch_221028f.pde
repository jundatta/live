// こちらがオリジナルです。
// 【作者】はぅ君さん
// 【作品名】つぶやきCoding | 2022/10/20
// https://0000.studio/haukun/broadcasts/cabc0564-f8bd-4e33-bdac-d3f60972403e/archive
// https://twitter.com/Hau_kun

float t=0;
void setup() {
  size(720, 720);
}
void draw() {
  t+=.05;
  background(0, 50);
  noFill();
  stroke(255, 50);
  float F=1;
  for (float r=0; r<TAU; r+=.01) {
    F=-F;
    beginShape();
    float X=360;
    float Y=360;
    for (float d=0; d<80; d++) {
      float R;
      vertex(X+=cos(R=r+(noise(tan(r*4)/50, d/9-t)-.5)*d/6*F)*d/7, Y+=sin(R)*d/7);
    }
    endShape();
  }
}

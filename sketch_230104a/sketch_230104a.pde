// こちらがオリジナルです。
// 【作者】はぅ君さん
// 【作品名】つぶやきCoding | 2022/12/27 by はぅ君 | 00:00 Studioで配信中
// https://twitter.com/Hau_kun/status/1607739155131551745

float t=0;
float W = 720;
void setup() {
  size(720, 720);
}
void draw() {
  t+=.01;
  background(0);
  noStroke();
  for (float r=0; r<56; r+=.1-r/W) {
    push();
    float D=r*(9+sin(r*9+t));
    translate(cos(r)*D+360, sin(r)*D+360);
    rotate(r*5+t);
    //float T=tan(r/45-t)**8*50;
    float T = pow(tan(r/45-t), 8) * 50;
    fill(255, T);
    rect(W/T, 0, 40+W/T, 3+W/T);
    pop();
  }
}

// こちらがオリジナルです。
// 【作者】はぅ君さん
// 【作品名】2022年2月12日 午後3:52 ツイートの「つぶやきProcessing」
// はぅ君プロジェクト＼(^_^)／「型くりこ／Tangent Cross/タンジェントクロス」
// https://twitter.com/Hau_kun/status/1492391109422575621

float t=0;
float W = 720;
void setup() {
  size(720, 720, P3D);
}
void draw() {
  t+=.02;
  colorMode(HSB, 360, 100, 100, 1.0f);
  blendMode(BLEND);
  //background(0, .1);
  push();
  noStroke();
  fill(0, .1);
  rect(0, 0, width, height);
  pop();
  blendMode(ADD);
  for (int i=48; i-- != 0; ) {
    beginShape();
    for (float r=0; r<1; r+=.2) {
      float R=r+i/4.0f+t;
      fill(R*60%360, 80, W, .1);
      float D=i%6*60;
      vertex(cos(R+i)*D+360, tan(-R)*D+360);
    }
    endShape();
  }
}

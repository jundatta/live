// こちらがオリジナルです。
// 【作者】はぅ君さん
// 【作品名】DailyCodingChallenge_Sky
// https://twitter.com/Hau_kun/status/1361310464114712591

float t=0;
float W;
void setup() {
  size(720, 720);
  W = width;
  noStroke();
}
void draw() {
  for (int y=0; y<W; y+=9) {
    float Y=y/6.0f;
    fill(Y, Y, y/2.0f);
    rect(0, y, W, 9);
  }
  t+=.01;
  for (int i=0; i<999; i++) {
    float T=tan(t+(int(i/99))*.3)*30;
    fill(W, T);
    circle(sin(t)*50+cos(noise(i)*9)*T*9+(width/2), sin(t*2)*50+sin(noise(i/9.0f))*T*5+(height/2), T*2);
  }
}

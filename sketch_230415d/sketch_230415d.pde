// こちらがオリジナルです。
// 【作者】KomaTebeさん
// 【作品名】Falling
// https://openprocessing.org/sketch/1811802

float f=0;
void setup() {
  size(400, 400, P3D);
  noStroke();
}
void draw() {
  // 原点座標を左上隅から画面ど真ん中にする。
  translate(width * 0.5f, height * 0.5f);

  background(0);
  rotateY(1);
  //[-1, -1, 1].map(i=>spotLight(200, 200, 200, -400, 400*i, 100, 1, -i, -.2));
  int i;
  i = -1;
  spotLight(200, 200, 200, -400, 400*i, 100, 1, -i, -.2, PI/3.0f, 100);
  i = -1;
  spotLight(200, 200, 200, -400, 400*i, 100, 1, -i, -.2, PI/3.0f, 100);
  i = 1;
  spotLight(200, 200, 200, -400, 400*i, 100, 1, -i, -.2, PI/3.0f, 100);
    // 見えないので青の平行光線を置いてみました。
  directionalLight(51, 102, 126, 0, +1, 0);
  push();
  translate(0, 30-abs(cos(f/31.8))*200);
  sphere(30);
  pop();
  for (float ii=-200; ii<1000; ii+=100) {
    push();
    translate(ii-f%100-50, 200-ii+f%100);
    box(100, 200, 1000);
    pop();
  }
  f-=1.8;
}

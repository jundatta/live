// これがp5.js から Processing Java に書き換えてもらったソースコードです。

float f = 0;

void setup() {
  size(1600, 1000, P3D);
  noStroke();
}

void draw() {
  // 原点をキャンバスの中心に移動する
  translate(width/2, height/2, 0);
  background(0);
  rotateY(PI/2.0);
  int[] arr = {-1, -1, 1};
  for (int i = 0; i < arr.length; i++) {
    spotLight(200, 200, 200, -400, 400*arr[i], 100, 1, -arr[i], -.2, PI/2, 2);
  }
  pushMatrix();
  translate(0, 30-abs(cos(f/31.8))*200, 0);
  sphere(30);
  popMatrix();
  for (int i = -200; i < 1000; i += 100) {
    pushMatrix();
    translate(i-f%100-50, 200-i+f%100, 0);
    box(100, 200, 1000);
    popMatrix();
  }
  f -= 1.8;
}

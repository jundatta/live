// こちらがオリジナルです。
// 【作者】Richard Bourneさん
// 【作品名】Windy
// https://openprocessing.org/sketch/1891974

PImage img;
float imx = 10;
float imy = 20;

void preload() {
  img = loadImage("./download.png");
}

void setup() {
  preload();
  
  size(1112, 834);
  img.resize(width, height);
  background(100);
}

void draw() {
  for (var i = 0; i < 1000; i++) {
    var x = int(random(width));
    var y = int(random(height));
    color col = img.get(x, y);
    noStroke();
    var rotation
      = map(saturation(col), 0, 255, 0, 360);
    fill((int)(red(col)*1.2f), (int)(green(col)*1.2f), (int)(blue(col)*1.2f), 128);
    push();
    translate(x, y);
    rotate(radians(rotation));
    rect(0, 0, imx, imy);
    imx *= .999997;
    imy *= .999997;
    pop();
  }
}

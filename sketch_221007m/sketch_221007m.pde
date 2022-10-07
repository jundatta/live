// こちらがオリジナルです。
// 【作者】Ivan Rudnickiさん
// 【作品名】Photo Fragments
// https://openprocessing.org/sketch/973470

PImage img;
ArrayList<Pixel> drips = new ArrayList();
float interval;
int counter = 0;

void preload() {
  //img = loadImage("Monroe-Square.png");
  img = loadImage("IMG_0103.JPG");
}

void setup() {
  size(1112, 834);
  img.resize(width, height);
  interval = img.height / 50.0f;
  //angleMode(DEGREES);
  noStroke();
  for (float y = interval / 2; y <= img.height; y += interval) {
    for (float x = interval / 2; x <= img.width; x += interval) {
      color c = img.get(x, y);
      int a = alpha(c);
      int r = red(c);
      int g = green(c);
      int b = blue(c);
      a = 200;
      int id = r + g + b;
      if (id > 0) {
        c = color(r, g, b, a);
        drips.add(new Pixel(x, y, c, id));
      }
    }
  }
}

void draw() {
  preload();
  
  counter += 2;
  background(0);
  for (Pixel d : drips) {
    if (d.id < counter) {
      d.move();
      if (d.y > 0) {
        d.show();
      }
    }
  }
}

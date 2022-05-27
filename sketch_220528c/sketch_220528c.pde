// https://neort.io/art/c84clgs3p9f3k6tgvq4g

PImage img;
float size;
float x_num = 1;
float y_num = 1;

void preload() {
  img = loadImage("c84cksk3p9f3k6tgvq3g.png");
}

void setup() {
  preload();
  size(1112, 834);
  image(img, 0, 0, width, height);
}

void draw() {
  float x_size = width / x_num;
  float y_size = height / y_num;

  for (float i = 0; i < width; i += x_size) {
    for (float j = 0; j < height; j += y_size) {
      image(img, i, j, x_size, y_size);
    }
  }

  if (x_num < 100) {
    x_num += x_num * x_num * 0.002;
  } else {
    x_num = 1;
  }

  if (y_num < 1000) {
    y_num += y_num * y_num * 0.002;
  } else {
    y_num = 1;
  }
}

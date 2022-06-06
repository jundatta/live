// 【作者】Ivan Rudnickiさん
// 【作品名】Whirlygig Blossom
// https://openprocessing.org/sketch/1327994

int numcars = 36;
Car[] cars = new Car[numcars];
float wSize;
float av = 0;
float swing = 5;
int starget = 0;
float zoom = 1;
float ztarget = 1;

void setup() {
  size(1112, 834);
  wSize = height / 5.0f;
  rectMode(CENTER);
  colorMode(HSB, 360);

  for (int i = 0; i < numcars; i += 1) {
    float a = i * TWO_PI / (float)numcars;
    int c = i*(360/(float)numcars);
    cars[i] = new Car(a, wSize, i, c);
  }
}

void draw() {
  background(0);
  translate(width / 2, height / 2);
  scale(zoom);
  av = map(mouseX, 0, width, -0.01, 0.01);
  ztarget = map(mouseY, height, 0, 0.5, 2);
  swing = lerp(swing, 1 + starget, 0.05);
  zoom = lerp(zoom, ztarget, 0.05);
  for (Car c : cars) {
    c.show();
    c.move();
  }
}

void mousePressed() {
  starget = (starget + 1) % 13;
}

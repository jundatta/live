float n;
void setup() {
  size(800, 600, P3D);
  noStroke();
  n = 0.0f;
}

void draw() {
  translate(width * 0.5f, height * 0.5f);
  background(0);
  //spotLight(200, 200, 200, 0, 0, 1000, 0, 0, -1, PI/3.0f, 20);
  spotLight(200, 200, 200, 0, 0, 1000, sin(n), 0, cos(n), PI/3.0f, 20);
  box(600, 500, 10);
  n+=0.02f;
}

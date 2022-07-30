// https://neort.io/art/bpr34343p9fefb9240sg

PShader s;

void setup() {
  size(787, 442, P3D);
  //size(500, 800, P3D);
  noStroke();
  s = loadShader("data/neort.glsl");
  s.set("resolution", width, height);
}

void draw() {
  s.set("time", millis() / 1000.0f);
  shader(s);
  rect(0, 0, width, height);
  resetShader();
}

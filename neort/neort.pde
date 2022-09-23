// https://neort.io/art/bnb7t7k3p9f5erb527s0

PShader s;

void setup() {
  size(787, 442, P3D);
  //size(500, 800, P3D);
  noStroke();
  s = loadShader("neort.glsl");
  s.set("resolution", width, height);
}

void draw() {
  s.set("backbuffer", getGraphics());
  s.set("time", millis() / 1000.0f);
  s.set("mouse", (float)mouseX / (float)width, (float)mouseY / (float)height);
  shader(s);
  rect(0, 0, width, height);
  resetShader();
}

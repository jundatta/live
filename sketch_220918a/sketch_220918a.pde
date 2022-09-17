// https://neort.io/art/c8dcs843p9fffhugumv0

PShader s;

void setup() {
  size(787, 442, P3D);
  //size(500, 800, P3D);
  noStroke();
  s = loadShader("neort.frag");
  s.set("resolution", width, height);
}

void draw() {
  shader(s);
  rect(0, 0, width, height);
  resetShader();
}

PGraphics pg;

void setup() {
  size(400, 400, P3D);
  background(0);
  noStroke();

  pg = createGraphics(width, height, P3D);
}

float r = 0.0f;
void draw() {
  background(0);
  // Include lights() at the beginning
  // of draw() to keep them persistent
  lights();
  
  push();
  pg.beginDraw();
  pg.lights();
  pg.background(0);
  pg.noStroke();
  pg.translate(80, 200, 0);
  pg.rotateX(r);
  pg.box(120);
  pg.endDraw();
  pop();
  image(pg, 0, 0);
  
  push();
  translate(320, 200, 0);
  rotateX(r);
  box(120);
  pop();
  
  r+=0.01;
}

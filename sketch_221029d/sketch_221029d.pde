PShape mesh;
void setup() {
  size(720, 720, P3D);

  mesh = new Sphere(250, 3).get();
}
void draw() {
  background(0);
  translate(width/2, height/2);
  shape(mesh);
}

// こちらがオリジナルです。
// 【作者】Richard Bourneさん
// 【作品名】Nut Job
// https://openprocessing.org/sketch/1905890

PShape normalNutMesh;

void preload() {
  normalNutMesh = loadShape("cube.obj");
}

void setup() {
  preload();
  size(1000, 750, P3D);
  background(100);
  noStroke();
}

void draw() {
  translate(width * 0.5f, height * 0.5f);

  scale(1.6);
  background(100);
  lights();
  ambientLight(200, 200, 200);
  directionalLight(100, 100, 100, width, 0, 50);
  rotateY(millis() * 0.0005);
  rotateX(millis() * 0.0002);
  //specularMaterial(50);
  specular(50);
  shape(normalNutMesh);
}

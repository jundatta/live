// こちらがオリジナルです。
// 【作者】Richard Bourneさん
// 【作品名】Nut Job
// https://openprocessing.org/sketch/1905890

p5.disableFriendlyErrors = true;
var normalNutMesh;

function preload() {
  normalNutMesh = loadModel("cube.obj");
}

function setup() {
  canvas = createCanvas(1000, 750, WEBGL);
  background(100);
  noStroke();
}

function draw() {
  scale(1.6);
  background(100);
  lights(100);
  ambientLight(200);
  directionalLight(100, 100, 100, width, 0, 50);
  rotateY(millis() * 0.0005);
  rotateX(millis() * 0.0002);
  specularMaterial(50);
  model(normalNutMesh);
}

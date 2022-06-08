// 【作者】KomaTebeさん
// 【作品名】Shark 3D（Shark test）
// https://openprocessing.org/sketch/1427621

p5.disableFriendlyErrors = true;
let shark1, glContext;

function preload() {
  shark1 = loadModel('Shark_LP.obj', true);
}

function setup() {
  let c = createCanvas(1112, 834, WEBGL);
  glContext = c.GL;
  frameRate(30);
}

function draw() {
  background(0);
  rotateX(PI);
  rotateY(PI/2 + frameCount * 0.01);
  for (let i=20; i > 1; i -= 1) {
    push();
    scale(i * 1.4);
    colorMode(HSB, 20);
    emissiveMaterial(12, 10, (20-i) * 0.5);
    model(shark1);
    glContext.clear(glContext.DEPTH_BUFFER_BIT);
    pop();
  }

  push();
  colorMode(RGB);
  emissiveMaterial(255);
  scale(2); //scale(2.08);
  noFill(0);
  //stroke(255);
  strokeWeight(5);
  model(shark1);
  glContext.clear(glContext.DEPTH_BUFFER_BIT);
  pop();

  scale(3);
  normalMaterial(); // For effect
  model(shark1);
}

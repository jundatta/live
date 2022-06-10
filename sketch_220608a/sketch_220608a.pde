// 【作者】KomaTebeさん
// 【作品名】Shark 3D（Shark test）
// https://openprocessing.org/sketch/1427621

PShape shark1;

void preload() {
  shark1 = loadShape("Shark_LP.obj");
}

void setup() {
  preload();
  size(1112, 834, P3D);
}

void draw() {
  translate(width/2, height/2);
  scale(50);

  background(0);
  rotateX(PI);
  rotateY(PI/2 + frameCount * 0.01);
  for (var i=20; i > 1; i -= 1) {
    push();
    hint(DISABLE_DEPTH_TEST);
    scale(i * 1.4);
    colorMode(HSB, 20);
    //emissive(12, 10, (20-i) * 0.5);
    color hsb = color(12, 10, (20-i) * 0.5);
    shark1.setFill(hsb);
    shape(shark1);
    //    glContext.clear(glContext.DEPTH_BUFFER_BIT);
    pop();
  }

    push();
    colorMode(RGB);
    //emissive(255);
    color rgb = color(255);
    shark1.setFill(rgb);
    scale(2); //scale(2.08);
    noFill();
    //stroke(255);
    strokeWeight(5);
    shape(shark1);
  //  glContext.clear(glContext.DEPTH_BUFFER_BIT);
    pop();

  scale(3);
  //  normalMaterial(); // For effect
  shape(shark1);
}

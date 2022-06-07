// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Seesaw. Draw by openFrameworks
// https://junkiyoshi.com/2022/02/13/

//--------------------------------------------------------------
void setup() {
  size(720, 720, P3D);
  strokeWeight(3);
}

//--------------------------------------------------------------
//--------------------------------------------------------------
void draw() {
  translate(width/2, height/2);
  background(0);

  int width = 500;
  int height = 150;
  int len = 15;
  for (int z = -300; z <= 300; z += 10) {
    push();
    translate(0, 0, z);
    float r = map(openFrameworks.ofNoise((z + 300) * 0.0035 + frameCount * 0.01), 0, 1, -360, 360);
    rotate(radians(r));

    stroke(255);
    fill(0);

    beginShape();

    vertex(width * -0.5, height * -0.5);
    vertex(width * 0.5, height * -0.5);
    vertex(width * 0.5, height * 0.5);
    vertex(width * -0.5, height * 0.5);

    //    ofNextContour(true);

    beginContour();
    vertex(width * -0.5 + len, height * -0.5 + len);
    vertex(width * -0.5 + len, height * 0.5 - len);
    vertex(width * 0.5 - len, height * 0.5 - len);
    vertex(width * 0.5 - len, height * -0.5 + len);
    endContour();

    endShape(CLOSE);
    pop();
  }
}

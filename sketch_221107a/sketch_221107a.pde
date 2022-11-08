// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Separated flocks. Draw by openFrameworks
// https://junkiyoshi.com/2021/09/29/

ArrayList<ArrayList<Particle>> flock_list = new ArrayList();
//--------------------------------------------------------------
void setup() {
  size(720, 720, P3D);

  color col;
  for (int i = 0; i < 6; i++) {
    ArrayList<Particle> flock = new ArrayList();
    push();
    colorMode(HSB, 255, 255, 255);
    col = color(ofMap(i, 0, 6, 0, 255), 192, 255);
    pop();
    //for (int k = 0; k < 50 + i * 50; k++) {
    for (int k = 0; k < 1; k++) {
      var particle = new Particle(col);
      flock.add(particle);
    }
    flock_list.add(flock);
  }
}

//--------------------------------------------------------------
void update() {
  for (var flock : flock_list) {
    for (var particle : flock) {
      particle.update(flock);
    }
  }
}

//--------------------------------------------------------------
void draw() {
  update();
  translate(width/2, height/2);

  ofBackground(0);
  ofSetLineWidth(2);

  ofRotateY(ofGetFrameNum() * -0.5);
  translate(width * -0.5, height * -0.5, 700);

  int i = 0;
  for (var flock : flock_list) {
    translate(0, 0, -200);

    color col;
    push();
    colorMode(HSB, 255, 255, 255);
    col = color(ofMap(i++, 0, 6, 0, 255), 192, 255);
    pop();
    noFill();
    stroke(col);
    circle(width * 0.5, height * 0.5, 300);

    fill(col);
    for (var particle : flock) {
      particle.draw();
    }
  }
}

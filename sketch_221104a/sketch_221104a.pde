// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Walker from circle to square. Draw by openFrameworks
// https://junkiyoshi.com/2021/10/12/

ArrayList<PVector> base_location_list = new ArrayList();
ArrayList<ArrayList<PVector>> log_list = new ArrayList();
//--------------------------------------------------------------
void setup() {
  size(720, 720);
  int radius = 100;
  for (float deg = 0; deg < 360; deg += 10) {
    var location = new PVector(radius * cos(deg * DEG_TO_RAD), radius * sin(deg * DEG_TO_RAD));
    base_location_list.add(location);
  }
}

//--------------------------------------------------------------
void update() {
  log_list.clear();

  int limit = 300;
  for (int i = 0; i < base_location_list.size(); i++) {
    ArrayList<PVector> log = new ArrayList();
    //PVector base = base_location_list.get(i);
    log.add(base_location_list.get(i));
    log_list.add(log);
  }

  int step = 1;
  for (int i = 0; i < log_list.size(); i++) {
    int k = 0;
    while (true) {
      ArrayList<PVector> logArray = log_list.get(i);
      int last = logArray.size() - 1;
      PVector lastP = logArray.get(last);
      PVector log = PVector.mult(lastP, 0.0035);
      PVector p = new PVector(log.x, log.y, ofGetFrameNum() * 0.003 + k * 0.0005);
      var deg = ofMap(openFrameworks.ofNoise(p.x, p.y, p.z), 0, 1, -360, 360);
      var next = new PVector(step * cos(deg * DEG_TO_RAD), step * sin(deg * DEG_TO_RAD));
      next.add(lastP);
      if (next.x < -limit || next.x > limit || next.y < -limit || next.y > limit) {
        break;
      }
      logArray.add(next);
      k++;
    }
  }
}

//--------------------------------------------------------------
void draw() {
  update();
  //translate(width/2, height/2);
  ofBackground(0);
  //ofEnableBlendMode(ofBlendMode::OF_BLENDMODE_ADD);
  blendMode(ADD);

  translate(width * 0.5, height * 0.5);

  ofSetLineWidth(1.2);
  for (int i = 0; i < log_list.size(); i++) {
    ArrayList<PVector> logArray = log_list.get(i);
    if (logArray.size() > 1) {
      noFill();
      stroke(39, 39, 239);
      beginShape();
      //ofVertices(logArray);
      for (var log : logArray) {
        vertex(log.x, log.y);
      }
      endShape();

      noStroke();
      fill(255);
      int last = logArray.size() - 1;
      PVector lastP = logArray.get(last);
      circle(lastP.x, lastP.y, 3 * 2);
      fill(39, 39, 239);
      PVector frontP = logArray.get(0);
      circle(frontP.x, frontP.y, 3 * 2);
    }
  }

  noFill();
  ofSetLineWidth(0.2 * 4);
  stroke(255);
  rect(-300, -300, 600, 600);
}

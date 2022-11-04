// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Walker from circle to square. Draw by openFrameworks
// https://junkiyoshi.com/2021/10/12/

ArrayList<PVector> base_location_list = new ArrayList();
ArrayList<ArrayList<PVector>> log_list = new ArrayList();
//--------------------------------------------------------------
void setup() {
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
    log.add(new PVector(base_location_list.get(i)));
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
      var next = this->log_list[i].back() + glm::vec2(step * cos(deg * DEG_TO_RAD), step * sin(deg * DEG_TO_RAD));

      if (next.x < -limit || next.x > limit || next.y < -limit || next.y > limit) {

        break;
      } else {

        this->log_list[i].push_back(next);
      }

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

  ofTranslate(ofGetWidth() * 0.5, ofGetHeight() * 0.5);

  ofSetLineWidth(1.2);
  for (int i = 0; i < this->log_list.size(); i++) {

    if (this->log_list[i].size() > 1) {

      ofNoFill();
      ofSetColor(39, 39, 239);
      ofBeginShape();
      ofVertices(this->log_list[i]);
      ofEndShape();

      ofFill();
      ofSetColor(255);
      ofDrawCircle(this->log_list[i].back(), 3);
      ofSetColor(39, 39, 239);
      ofDrawCircle(this->log_list[i].front(), 3);
    }
  }

  ofNoFill();
  ofSetLineWidth(0.2);
  ofSetColor(255);
  ofDrawRectangle(-300, -300, 600, 600);
}

//--------------------------------------------------------------
int main() {

  ofSetupOpenGL(720, 720, OF_WINDOW);
  ofRunApp(new ofApp());
}

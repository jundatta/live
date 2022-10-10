// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】10 PRINT on Sphere. Draw by openFrameworks
// https://junkiyoshi.com/2021/12/29/

//--------------------------------------------------------------
void ofApp::setup() {

  ofSetFrameRate(30);
  ofSetWindowTitle("openFrameworks");

  ofBackground(255);
  ofSetLineWidth(3);
  ofEnableDepthTest();

  this->frame.setMode(ofPrimitiveMode::OF_PRIMITIVE_LINES);
}

//--------------------------------------------------------------
void ofApp::update() {

  ofSeedRandom(39);

  this->frame.clear();

  float phi_deg_step = 5;
  float theta_deg_step = 5;

  float radius = 250;

  for (float phi_deg = 0; phi_deg < 360; phi_deg += phi_deg_step) {

    for (float theta_deg = 0; theta_deg <= 180; theta_deg += theta_deg_step) {

      auto location = glm::vec3(
        radius * sin(theta_deg * DEG_TO_RAD) * cos(phi_deg * DEG_TO_RAD),
        radius * sin(theta_deg * DEG_TO_RAD) * sin(phi_deg * DEG_TO_RAD),
        radius * cos(theta_deg * DEG_TO_RAD));

      auto noise_value = ofNoise(ofRandom(1000));

      if (noise_value < 0.5) {

        this->frame.addVertex(glm::vec3(
          radius * sin((theta_deg - theta_deg_step * 0.5) * DEG_TO_RAD) * cos((phi_deg + phi_deg_step * 0.5) * DEG_TO_RAD),
          radius * sin((theta_deg - theta_deg_step * 0.5) * DEG_TO_RAD) * sin((phi_deg + phi_deg_step * 0.5) * DEG_TO_RAD),
          radius * cos((theta_deg - theta_deg_step * 0.5) * DEG_TO_RAD)));
        this->frame.addVertex(glm::vec3(
          radius * sin((theta_deg + theta_deg_step * 0.5) * DEG_TO_RAD) * cos((phi_deg - phi_deg_step * 0.5) * DEG_TO_RAD),
          radius * sin((theta_deg + theta_deg_step * 0.5) * DEG_TO_RAD) * sin((phi_deg - phi_deg_step * 0.5) * DEG_TO_RAD),
          radius * cos((theta_deg + theta_deg_step * 0.5) * DEG_TO_RAD)));
      } else {

        this->frame.addVertex(glm::vec3(
          radius * sin((theta_deg - theta_deg_step * 0.5) * DEG_TO_RAD) * cos((phi_deg - phi_deg_step * 0.5) * DEG_TO_RAD),
          radius * sin((theta_deg - theta_deg_step * 0.5) * DEG_TO_RAD) * sin((phi_deg - phi_deg_step * 0.5) * DEG_TO_RAD),
          radius * cos((theta_deg - theta_deg_step * 0.5) * DEG_TO_RAD)));
        this->frame.addVertex(glm::vec3(
          radius * sin((theta_deg + theta_deg_step * 0.5) * DEG_TO_RAD) * cos((phi_deg + phi_deg_step * 0.5) * DEG_TO_RAD),
          radius * sin((theta_deg + theta_deg_step * 0.5) * DEG_TO_RAD) * sin((phi_deg + phi_deg_step * 0.5) * DEG_TO_RAD),
          radius * cos((theta_deg + theta_deg_step * 0.5) * DEG_TO_RAD)));
      }

      this->frame.addIndex(this->frame.getNumVertices() - 1);
      this->frame.addIndex(this->frame.getNumVertices() - 2);
    }
  }
}

//--------------------------------------------------------------
void ofApp::draw() {

  this->cam.begin();
  ofRotateX(90);
  ofRotateZ(ofGetFrameNum() * 0.6666666666666);

  ofSetColor(255);
  ofDrawSphere(248);

  ofSetColor(0);
  this->frame.draw();

  for (auto& vertex : this->frame.getVertices()) {

    ofDrawSphere(vertex, 3);
  }

  this->cam.end();
}

//--------------------------------------------------------------
int main() {

  ofSetupOpenGL(720, 720, OF_WINDOW);
  ofRunApp(new ofApp());
}

// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Noisy wall. Draw by openFrameworks
// https://junkiyoshi.com/openframeworks20221204/

ofMesh mesh;

//--------------------------------------------------------------
void ofApp::setup() {

  ofSetFrameRate(30);
  ofSetWindowTitle("openFrameworks");

  ofBackground(255);
}

//--------------------------------------------------------------
void ofApp::update() {

  ofSeedRandom(39);

  this->mesh.clear();

  int span = 1;
  for (int i = 0; i < 3; i++) {

    auto noise_seed = ofRandom(1000);

    for (int x = 0; x < 720; x += span) {

      for (int y = 0; y < 720; y += span) {

        auto noise_value = ofNoise(noise_seed, x * 0.005, y * 0.005 + ofGetFrameNum() * 0.01, ofGetFrameNum() * 0.005);
        if (noise_value <= 0.45 || noise_value >= 0.55) {
          continue;
        }

        this->mesh.addVertex(glm::vec3(x, y, 0));
        this->mesh.addVertex(glm::vec3(x + span, y, 0));
        this->mesh.addVertex(glm::vec3(x + span, y + span, 0));
        this->mesh.addVertex(glm::vec3(x, y + span, 0));

        this->mesh.addIndex(this->mesh.getNumVertices() - 1);
        this->mesh.addIndex(this->mesh.getNumVertices() - 4);
        this->mesh.addIndex(this->mesh.getNumVertices() - 3);
        this->mesh.addIndex(this->mesh.getNumVertices() - 1);
        this->mesh.addIndex(this->mesh.getNumVertices() - 2);
        this->mesh.addIndex(this->mesh.getNumVertices() - 3);

        ofColor color = ofColor(ofMap(i, -1, 2, 255, 0));
        for (int k = 0; k < 4; k++) {
          this->mesh.addColor(color);
        }
      }
    }
  }
}

//--------------------------------------------------------------
void ofApp::draw() {

  this->mesh.draw();
}

//--------------------------------------------------------------
int main() {

  ofSetupOpenGL(720, 720, OF_WINDOW);
  ofRunApp(new ofApp());
}

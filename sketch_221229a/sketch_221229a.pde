// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Splitting apple. openFrameworks
// https://junkiyoshi.com/openframeworks20191210/

ofMesh mesh;

//--------------------------------------------------------------
void ofApp::setup() {

  ofSetFrameRate(60);
  ofSetWindowTitle("openframeworks");

  ofBackground(239);
  ofSetColor(39);
  ofEnableDepthTest();
}

//--------------------------------------------------------------
void ofApp::update() {

  ofSeedRandom(39);
  this->mesh.clear();

  int span = 8;
  int scale, index;
  for (int v = 0; v < 360; v += span) {

    for (int u = -170; u < 250; u += span) {

      auto noise_seed = (this->make_apple_point(u - span * 0.5, v - span * 0.5) + this->make_apple_point(u - span * 0.5, v + span * 0.5) + this->make_apple_point(u + span * 0.5, v + span * 0.5)) / 3;
      auto noise_value = ofNoise(glm::vec4(noise_seed * 0.25, ofGetFrameNum() * 0.008));
      scale = 30;
      if (noise_value > 0.65) {

        scale = ofMap(noise_value, 0.65, 1, 30, 50);
      }
      index = this->mesh.getNumVertices();

      this->mesh.addVertex(this->make_apple_point(u - span * 0.5, v - span * 0.5) * scale);
      this->mesh.addVertex(this->make_apple_point(u - span * 0.5, v + span * 0.5) * scale);
      this->mesh.addVertex(this->make_apple_point(u + span * 0.5, v + span * 0.5) * scale);

      this->mesh.addIndex(index);
      this->mesh.addIndex(index + 1);
      this->mesh.addIndex(index + 2);

      noise_seed = (this->make_apple_point(u - span * 0.5, v - span * 0.5) + this->make_apple_point(u + span * 0.5, v - span * 0.5) + this->make_apple_point(u + span * 0.5, v + span * 0.5)) / 3;
      noise_value = ofNoise(glm::vec4(noise_seed * 0.25, ofGetFrameNum() * 0.008));
      scale = 30;
      if (noise_value > 0.65) {

        scale = ofMap(noise_value, 0.65, 1, 30, 50);
      }
      index = this->mesh.getNumVertices();

      this->mesh.addVertex(this->make_apple_point(u - span * 0.5, v - span * 0.5) * scale);
      this->mesh.addVertex(this->make_apple_point(u + span * 0.5, v - span * 0.5) * scale);
      this->mesh.addVertex(this->make_apple_point(u + span * 0.5, v + span * 0.5) * scale);

      this->mesh.addIndex(index);
      this->mesh.addIndex(index + 1);
      this->mesh.addIndex(index + 2);
    }
  }
}

//--------------------------------------------------------------
void ofApp::draw() {

  this->cam.begin();
  ofRotateZ(ofGetFrameNum() * 0.5);

  ofSetColor(39);
  this->mesh.drawFaces();

  ofSetColor(239);
  this->mesh.drawWireframe();

  this->cam.end();
}

//--------------------------------------------------------------
glm::vec3 ofApp::make_apple_point(float u, float v) {

  // 数学デッサン教室 描いて楽しむ数学たち リンゴ局面 apple surface P.33

  u *= DEG_TO_RAD;
  v *= DEG_TO_RAD;

  float x = (4 + 3.8 * cos(u)) * cos(v);
  float y = (4 + 3.8 * cos(u)) * sin(v);
  float z = -5 * log10(1 - 0.315 * u) + 5 * sin(u) + 2 * cos(u);

  return glm::vec3(x, y, z);
}

//--------------------------------------------------------------
int main() {

  ofSetupOpenGL(720, 720, OF_WINDOW);
  ofRunApp(new ofApp());
}

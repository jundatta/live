// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Rotate rectangles. Draw by openFrameworks
// https://junkiyoshi.com/2021/11/29/

//--------------------------------------------------------------
void ofApp::setup() {

  ofSetFrameRate(60);
  ofSetWindowTitle("openframeworks");

  ofBackground(0);
  ofSetLineWidth(1);
  ofEnableDepthTest();

  this->frame.setMode(ofPrimitiveMode::OF_PRIMITIVE_LINES);
}
//--------------------------------------------------------------
void ofApp::update() {

  ofSeedRandom(39);

  this->face.clear();
  this->frame.clear();

  for (int x = -300; x <= 300; x += 300) {

    for (int y = -300; y <= 300; y += 300) {

      glm::highp_mat4 rotation;
      auto noise_value = ofNoise(abs(x), y, ofGetFrameNum() * 0.003);
      rotation = glm::rotate(glm::mat4(), ofMap(noise_value, 0, 1, -360, 360) * (float)DEG_TO_RAD, glm::vec3(0, 1, 0));

      this->setRingToMesh(this->face, this->frame, glm::vec3(x, y, 0), 0, 50, 10, rotation);
      for (auto radius = 60; radius <= 190; radius += 30) {

        glm::highp_mat4 rotation;
        auto noise_value = ofNoise(abs(x), y, (ofGetFrameNum() + radius) * 0.003);

        if (noise_value < 0.2) {
          noise_value = 0;
        } else if (noise_value < 0.4) {
          noise_value = ofMap(noise_value, 0.2, 0.4, 0, 0.5);
        } else if (noise_value < 0.6) {
          noise_value = 0.5;
        } else if (noise_value < 0.8) {
          noise_value = ofMap(noise_value, 0.6, 0.8, 0.5, 1.0);
        } else {
          noise_value = 1;
        }

        rotation = glm::rotate(glm::mat4(), ofMap(noise_value, 0, 1, -180, 180) * (float)DEG_TO_RAD, glm::vec3(0, 1, 0));

        this->setRingToMesh(this->face, this->frame, glm::vec3(x, y, 0), radius, 28, 10, rotation);
      }
    }
  }
}

//--------------------------------------------------------------
void ofApp::draw() {

  this->cam.begin();
  ofRotateX(90);

  ofSetColor(0);
  this->face.draw();

  ofSetColor(255);
  this->frame.drawWireframe();

  this->cam.end();
}

//--------------------------------------------------------------
void ofApp::setRingToMesh(ofMesh& face_target, ofMesh& frame_target, glm::vec3 location, float radius, float width, float height, glm::highp_mat4 rotation) {

  int deg_span = 90;
  for (int deg = 45; deg < 400; deg += deg_span) {

    auto face_index = face_target.getNumVertices();

    vector<glm::vec3> vertices;
    vertices.push_back(glm::vec3((radius + width * 0.5) * cos(deg * DEG_TO_RAD), (radius + width * 0.5) * sin(deg * DEG_TO_RAD), height * -0.5));
    vertices.push_back(glm::vec3((radius + width * 0.5) * cos((deg + deg_span) * DEG_TO_RAD), (radius + width * 0.5) * sin((deg + deg_span) * DEG_TO_RAD), height * -0.5));
    vertices.push_back(glm::vec3((radius + width * 0.5) * cos((deg + deg_span) * DEG_TO_RAD), (radius + width * 0.5) * sin((deg + deg_span) * DEG_TO_RAD), height * 0.5));
    vertices.push_back(glm::vec3((radius + width * 0.5) * cos(deg * DEG_TO_RAD), (radius + width * 0.5) * sin(deg * DEG_TO_RAD), height * 0.5));

    vertices.push_back(glm::vec3((radius - width * 0.5) * cos(deg * DEG_TO_RAD), (radius - width * 0.5) * sin(deg * DEG_TO_RAD), height * -0.5));
    vertices.push_back(glm::vec3((radius - width * 0.5) * cos((deg + deg_span) * DEG_TO_RAD), (radius - width * 0.5) * sin((deg + deg_span) * DEG_TO_RAD), height * -0.5));
    vertices.push_back(glm::vec3((radius - width * 0.5) * cos((deg + deg_span) * DEG_TO_RAD), (radius - width * 0.5) * sin((deg + deg_span) * DEG_TO_RAD), height * 0.5));
    vertices.push_back(glm::vec3((radius - width * 0.5) * cos(deg * DEG_TO_RAD), (radius - width * 0.5) * sin(deg * DEG_TO_RAD), height * 0.5));

    for (auto& vertex : vertices) {

      vertex = glm::vec4(vertex + location, 0) * rotation;
    }

    face_target.addVertices(vertices);

    face_target.addIndex(face_index + 0);
    face_target.addIndex(face_index + 1);
    face_target.addIndex(face_index + 2);
    face_target.addIndex(face_index + 0);
    face_target.addIndex(face_index + 2);
    face_target.addIndex(face_index + 3);

    face_target.addIndex(face_index + 4);
    face_target.addIndex(face_index + 5);
    face_target.addIndex(face_index + 6);
    face_target.addIndex(face_index + 4);
    face_target.addIndex(face_index + 6);
    face_target.addIndex(face_index + 7);

    face_target.addIndex(face_index + 0);
    face_target.addIndex(face_index + 4);
    face_target.addIndex(face_index + 5);
    face_target.addIndex(face_index + 0);
    face_target.addIndex(face_index + 5);
    face_target.addIndex(face_index + 1);

    face_target.addIndex(face_index + 3);
    face_target.addIndex(face_index + 7);
    face_target.addIndex(face_index + 6);
    face_target.addIndex(face_index + 3);
    face_target.addIndex(face_index + 6);
    face_target.addIndex(face_index + 2);

    auto frame_index = frame_target.getNumVertices();

    frame_target.addVertices(vertices);

    frame_target.addIndex(frame_index + 0);
    frame_target.addIndex(frame_index + 1);
    frame_target.addIndex(frame_index + 2);
    frame_target.addIndex(frame_index + 3);
    frame_target.addIndex(frame_index + 4);
    frame_target.addIndex(frame_index + 5);
    frame_target.addIndex(frame_index + 6);
    frame_target.addIndex(frame_index + 7);

    frame_target.addIndex(frame_index + 0);
    frame_target.addIndex(frame_index + 3);
  }
}

//--------------------------------------------------------------
int main() {

  ofSetupOpenGL(720, 720, OF_WINDOW);
  ofRunApp(new ofApp());
}

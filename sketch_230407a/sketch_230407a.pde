// オリジナルはこちらです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Square ring. Draw by openFrameworks
// https://junkiyoshi.com/2023/04/03/

ofMesh face, frame;

//--------------------------------------------------------------
void ofApp::setup() {

  ofSetFrameRate(60);
  ofSetWindowTitle("openframeworks");

  ofBackground(239);
  ofSetLineWidth(1.5);
  ofEnableDepthTest();

  this->frame.setMode(ofPrimitiveMode::OF_PRIMITIVE_LINES);
}
//--------------------------------------------------------------
void ofApp::update() {

  ofSeedRandom(39);

  this->face.clear();
  this->frame.clear();

  auto noise_seed = glm::vec2(ofRandom(1000), ofRandom(1000));
  for (auto radius = 60; radius <= 360; radius += 15) {

    auto angle_x = ofMap(ofNoise(noise_seed.x, ofGetFrameNum() * -0.004 + radius * 0.005), 0, 1, -45, 45);
    auto angle_y = ofMap(ofNoise(noise_seed.y, ofGetFrameNum() * -0.004 + radius * 0.005), 0, 1, -45, 45);
    this->setRingToMesh(this->face, this->frame, glm::vec3(), radius, 10, 20, angle_x * DEG_TO_RAD, angle_y * DEG_TO_RAD);
  }
}

//--------------------------------------------------------------
void ofApp::draw() {

  this->cam.begin();
  ofRotateX(180);
  ofRotateY(ofGetFrameNum());

  ofSetColor(0);
  this->face.draw();

  ofSetColor(255);
  this->frame.drawWireframe();

  this->cam.end();
}

//--------------------------------------------------------------
void ofApp::setRingToMesh(ofMesh& face_target, ofMesh& frame_target, glm::vec3 location, float radius, float width, float height, float angle_x, float angle_y) {

  auto rotation_x = glm::rotate(glm::mat4(), angle_x, glm::vec3(1, 0, 0));
  auto rotation_y = glm::rotate(glm::mat4(), angle_y, glm::vec3(0, 1, 0));

  int deg_span = 90;
  for (int deg = 0; deg < 360; deg += deg_span) {

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

      vertex = location + glm::vec4(vertex, 0) * rotation_y * rotation_x;
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

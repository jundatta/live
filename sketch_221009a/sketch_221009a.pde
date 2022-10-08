// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Rotating rectangles. Draw by openFrameworks
// https://junkiyoshi.com/2022/01/04/

ofMesh face, frame;

//--------------------------------------------------------------
void setup() {
}
//--------------------------------------------------------------
void update() {

  randomSeed(39);

  face.clear();
  frame.clear();

  int y = 200;
  for (int x = -300 * 3; x <= 300 * 3; x += 300) {
    auto noise_seed = random(1000);
    for (int i = 1; i >= -1; i -= 2) {
      for (auto radius = 50; radius <= 150; radius += 5) {
        var noise_value = openFrameworks.ofNoise(noise_seed, radius * 0.00085 + frameCount * 0.0015);
        auto rotation = glm::rotate(glm::mat4(), ofMap(noise_value, 0, 1, -720, 720) * (float)DEG_TO_RAD, glm::vec3(1, 0, 0));

        ofColor face_color;
        if (i == 1) {

          this->setRingToMesh(this->face, this->frame, glm::vec3(x, y * i, 0), radius, 2, 30, rotation, ofColor(0), ofColor(255));
        } else {

          this->setRingToMesh(this->face, this->frame, glm::vec3(x, y * i, 0), radius, 2, 30, rotation, ofColor(255), ofColor(0));
        }
      }
    }
  }
}

//--------------------------------------------------------------
void draw() {
  translate(width/2, height/2);
  background(255);

  this->cam.begin();
  ofRotateX(90);

  this->face.draw();

  ofSetColor(255);
  this->frame.drawWireframe();

  this->cam.end();
}

//--------------------------------------------------------------
void ofApp::setRingToMesh(ofMesh& face_target, ofMesh& frame_target, glm::vec3 location, float radius, float width, float height, glm::highp_mat4 rotation, ofColor face_color, ofColor line_color) {

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

    for (int i = 0; i < vertices.size(); i++) {

      face_target.addColor(face_color);
      frame_target.addColor(line_color);
    }
  }
}

//--------------------------------------------------------------
int main() {

  ofSetupOpenGL(720, 720, OF_WINDOW);
  ofRunApp(new ofApp());
}

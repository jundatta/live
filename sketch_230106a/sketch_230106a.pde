// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】flowing character. Draw by openFrameworks
// https://junkiyoshi.com/openframeworks20221208/

vector<tuple<ofColor, glm::vec3, float>> sphere_list; // BodyColor, Location, size
vector<glm::vec3> deg_list;
int number_of_sphere;

ofTrueTypeFont font;
string word;

//--------------------------------------------------------------
void ofApp::setup() {

  ofSetFrameRate(30);
  ofSetWindowTitle("openFrameworks");

  ofBackground(0);
  ofSetLineWidth(1);
  ofEnableDepthTest();

  auto ico_sphere = ofIcoSpherePrimitive(1, 5);

  this->number_of_sphere = 3600;
  while (this->sphere_list.size() < this->number_of_sphere) {

    auto tmp_location = this->make_point(280, ofRandom(0, 50), ofRandom(360), ofRandom(360));
    auto radius = this->sphere_list.size() < 100 ? ofRandom(10, 50) : ofRandom(3, 20);

    bool flag = true;
    for (int i = 0; i < this->sphere_list.size(); i++) {

      if (glm::distance(tmp_location, get<1>(this->sphere_list[i])) < get<2>(this->sphere_list[i]) + radius) {

        flag = false;
        break;
      }
    }

    if (flag) {

      ofColor color;
      color.setHsb(ofRandom(255), 200, 255);

      auto size = (radius * 2) / sqrt(3);

      this->sphere_list.push_back(make_tuple(color, tmp_location, size));
      this->deg_list.push_back(glm::vec3(ofRandom(360), ofRandom(360), ofRandom(360)));
    }
  }

  this->font.loadFont("fonts/Kazesawa-Bold.ttf", 100, true, true, true);
  this->word = "JunKiyoshi";
}

//--------------------------------------------------------------
void ofApp::update() {

  ofSeedRandom(39);

  for (int i = 0; i < this->sphere_list.size(); i++) {

    auto step = glm::vec3(ofRandom(1, 3), ofRandom(1, 3), ofRandom(-3, 3));

    if (ofGetFrameNum() % 60 < 30) {

      this->deg_list[i] += step * ofMap(ofGetFrameNum() % 60, 0, 30, 15, 0);
    }
  }
}

//--------------------------------------------------------------
void ofApp::draw() {

  this->cam.begin();
  ofRotateX(270);

  ofTranslate(280, -560, 0);
  ofRotateZ(ofGetFrameNum() * 0.5);

  for (int i = 0; i < this->sphere_list.size(); i++) {

    auto location = get<1>(this->sphere_list[i]);
    auto size = get<2>(this->sphere_list[i]) * 1.2;

    ofPushMatrix();
    ofTranslate(location);

    ofRotateZ(this->deg_list[i].z);
    ofRotateY(this->deg_list[i].y);
    ofRotateX(this->deg_list[i].x);

    ofPath chara_path = this->font.getCharacterAsPoints(this->word[ofRandom(this->word.size())], true, false);
    vector<ofPolyline> outline = chara_path.getOutline();

    ofFill();
    ofSetColor(0);
    ofBeginShape();
    for (int outline_index = 0; outline_index < outline.size(); outline_index++) {

      ofNextContour(true);

      auto vertices = outline[outline_index].getVertices();
      for (auto& vertex : vertices) {

        glm::vec2 location = vertex / 100 * size;
        location -= glm::vec2(size * 0.5, -size * 0.5);
        ofVertex(location);
      }
    }
    ofEndShape(true);

    ofNoFill();
    ofSetColor(255);
    ofBeginShape();
    for (int outline_index = 0; outline_index < outline.size(); outline_index++) {

      ofNextContour(true);

      auto vertices = outline[outline_index].getVertices();
      for (auto& vertex : vertices) {

        glm::vec2 location = vertex / 100 * size;
        location -= glm::vec2(size * 0.5, -size * 0.5);
        ofVertex(location);
      }
    }
    ofEndShape(true);

    ofPopMatrix();
  }

  this->cam.end();
}

//--------------------------------------------------------------
glm::vec3 ofApp::make_point(float R, float r, float u, float v) {

  // 数学デッサン教室 描いて楽しむ数学たち　P.31

  u *= DEG_TO_RAD;
  v *= DEG_TO_RAD;

  auto x = (R + r * cos(u)) * cos(v);
  auto y = (R + r * cos(u)) * sin(v);
  auto z = r * sin(u);

  return glm::vec3(x, y, z);
}

//--------------------------------------------------------------
int main() {

  ofSetupOpenGL(720, 720, OF_WINDOW);
  ofRunApp(new ofApp());
}

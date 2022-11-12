// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Random work is curry. openFrameworks
// https://junkiyoshi.com/2020/12/18/

//--------------------------------------------------------------
Actor::Actor(vector<glm::vec3>& location_list, vector<vector<int>>& next_index_list, vector<int>& destination_list) {

  this->select_index = ofRandom(location_list.size());
  while (true) {

    auto itr = find(destination_list.begin(), destination_list.end(), this->select_index);
    if (itr == destination_list.end()) {

      destination_list.push_back(this->select_index);
      break;
    }

    this->select_index = (this->select_index + 1) % location_list.size();
  }

  this->next_index = this->select_index;
}

//--------------------------------------------------------------
void Actor::update(const int& frame_span, vector<glm::vec3>& location_list, vector<vector<int>>& next_index_list, vector<int>& destination_list) {

  if (ofGetFrameNum() % frame_span == 0) {

    auto tmp_index = this->select_index;
    this->select_index = this->next_index;
    int retry = next_index_list[this->select_index].size();
    this->next_index = next_index_list[this->select_index][(int)ofRandom(next_index_list[this->select_index].size())];
    while (--retry > 0) {

      auto destination_itr = find(destination_list.begin(), destination_list.end(), this->next_index);
      if (destination_itr == destination_list.end()) {

        if (tmp_index != this->next_index) {

          destination_list.push_back(this->next_index);
          break;
        }
      }

      this->next_index = next_index_list[this->select_index][(this->next_index + 1) % next_index_list[this->select_index].size()];
    }
    if (retry <= 0) {

      destination_list.push_back(this->select_index);
      this->next_index = this->select_index;
    }
  }

  auto param = ofGetFrameNum() % frame_span;
  auto distance = location_list[this->next_index] - location_list[this->select_index];
  this->location = location_list[this->select_index] + distance / frame_span * param;
}

//--------------------------------------------------------------
glm::vec3 Actor::getLocation() {

  return this->location;
}

//--------------------------------------------------------------
void ofApp::setup() {

  ofSetFrameRate(60);
  ofSetWindowTitle("openFrameworks");

  ofBackground(239);
  ofEnableDepthTest();
  ofSetLineWidth(2);

  ofFbo fbo;
  fbo.allocate(ofGetWidth(), ofGetHeight());
  fbo.begin();
  ofTranslate(ofGetWidth() * 0.5, ofGetHeight() * 0.45);
  ofClear(0);
  ofSetColor(0);

  ofTrueTypeFont font;
  ofTrueTypeFontSettings font_settings("fonts/HuiFont29.ttf", 195);
  font_settings.antialiased = true;
  font_settings.addRanges(ofAlphabet::Japanese);
  font.load(font_settings);

  font.drawString(u8"12", -250, 120);
  font.drawString(u8"34", -250, 360);

  fbo.end();

  auto span = 10;
  ofPixels pixels;
  fbo.readToPixels(pixels);
  for (int x = 0; x < fbo.getWidth(); x += span) {

    for (int y = 0; y < fbo.getHeight(); y += span) {

      ofColor color = pixels.getColor(x, y);
      if (color != ofColor(0, 0)) {

        for (int z = span * -1; z <= span; z += span) {

          this->location_list.push_back(glm::vec3(x - ofGetWidth() * 0.5, ofGetHeight() - y - ofGetWidth() * 0.25, z));
        }
      }
    }
  }

  for (auto& location : this->location_list) {

    vector<int> next_index = vector<int>();
    int index = -1;
    for (auto& other : this->location_list) {

      index++;
      if (location == other) {
        continue;
      }

      float distance = glm::distance(location, other);
      if (distance <= span) {

        next_index.push_back(index);
      }
    }

    this->next_index_list.push_back(next_index);
  }

  for (int i = 0; i < 3500; i++) {

    this->actor_list.push_back(make_unique<Actor>(this->location_list, this->next_index_list, this->destination_list));
  }

  this->frame.setMode(ofPrimitiveMode::OF_PRIMITIVE_LINES);
}

//--------------------------------------------------------------
void ofApp::update() {

  int frame_span = 30;
  int prev_index_size = 0;

  if (ofGetFrameNum() % frame_span == 0) {

    prev_index_size = this->destination_list.size();
  }

  for (auto& actor : this->actor_list) {

    actor->update(frame_span, this->location_list, this->next_index_list, this->destination_list);
  }

  if (prev_index_size != 0) {

    this->destination_list.erase(this->destination_list.begin(), this->destination_list.begin() + prev_index_size);
  }

  this->face.clear();
  this->frame.clear();

  for (auto& actor : this->actor_list) {

    this->setBoxToMesh(this->face, this->frame, actor->getLocation(), 10, 10, 10);
  }
}

//--------------------------------------------------------------
void ofApp::draw() {

  this->cam.begin();

  ofSetColor(239);
  this->face.draw();

  ofSetColor(39);
  this->frame.drawWireframe();

  this->cam.end();
}


//--------------------------------------------------------------
void ofApp::setBoxToMesh(ofMesh& face_target, ofMesh& frame_target, glm::vec3 location, float height, float width, float depth) {

  int index = face_target.getVertices().size();

  face_target.addVertex(location + glm::vec3(width * -0.5 * 0.99, height * 0.5 * 0.99, depth * -0.5 * 0.99));
  face_target.addVertex(location + glm::vec3(width * 0.5 * 0.99, height * 0.5 * 0.99, depth * -0.5 * 0.99));
  face_target.addVertex(location + glm::vec3(width * 0.5 * 0.99, height * 0.5 * 0.99, depth * 0.5 * 0.99));
  face_target.addVertex(location + glm::vec3(width * -0.5 * 0.99, height * 0.5 * 0.99, depth * 0.5 * 0.99));

  face_target.addVertex(location + glm::vec3(width * -0.5 * 0.99, height * -0.5 * 0.99, depth * -0.5 * 0.99));
  face_target.addVertex(location + glm::vec3(width * 0.5 * 0.99, height * -0.5 * 0.99, depth * -0.5 * 0.99));
  face_target.addVertex(location + glm::vec3(width * 0.5 * 0.99, height * -0.5 * 0.99, depth * 0.5 * 0.99));
  face_target.addVertex(location + glm::vec3(width * -0.5 * 0.99, height * -0.5 * 0.99, depth * 0.5 * 0.99));

  face_target.addIndex(index + 0);
  face_target.addIndex(index + 1);
  face_target.addIndex(index + 2);
  face_target.addIndex(index + 0);
  face_target.addIndex(index + 2);
  face_target.addIndex(index + 3);

  face_target.addIndex(index + 4);
  face_target.addIndex(index + 5);
  face_target.addIndex(index + 6);
  face_target.addIndex(index + 4);
  face_target.addIndex(index + 6);
  face_target.addIndex(index + 7);

  face_target.addIndex(index + 0);
  face_target.addIndex(index + 4);
  face_target.addIndex(index + 1);
  face_target.addIndex(index + 4);
  face_target.addIndex(index + 5);
  face_target.addIndex(index + 1);

  face_target.addIndex(index + 1);
  face_target.addIndex(index + 5);
  face_target.addIndex(index + 6);
  face_target.addIndex(index + 6);
  face_target.addIndex(index + 2);
  face_target.addIndex(index + 1);

  face_target.addIndex(index + 2);
  face_target.addIndex(index + 6);
  face_target.addIndex(index + 7);
  face_target.addIndex(index + 7);
  face_target.addIndex(index + 3);
  face_target.addIndex(index + 2);

  face_target.addIndex(index + 3);
  face_target.addIndex(index + 7);
  face_target.addIndex(index + 4);
  face_target.addIndex(index + 4);
  face_target.addIndex(index + 0);
  face_target.addIndex(index + 3);

  frame_target.addVertex(location + glm::vec3(width * -0.5, height * 0.5, depth * -0.5));
  frame_target.addVertex(location + glm::vec3(width * 0.5, height * 0.5, depth * -0.5));
  frame_target.addVertex(location + glm::vec3(width * 0.5, height * 0.5, depth * 0.5));
  frame_target.addVertex(location + glm::vec3(width * -0.5, height * 0.5, depth * 0.5));

  frame_target.addVertex(location + glm::vec3(width * -0.5, height * -0.5, depth * -0.5));
  frame_target.addVertex(location + glm::vec3(width * 0.5, height * -0.5, depth * -0.5));
  frame_target.addVertex(location + glm::vec3(width * 0.5, height * -0.5, depth * 0.5));
  frame_target.addVertex(location + glm::vec3(width * -0.5, height * -0.5, depth * 0.5));

  frame_target.addIndex(index + 0);
  frame_target.addIndex(index + 1);
  frame_target.addIndex(index + 1);
  frame_target.addIndex(index + 2);
  frame_target.addIndex(index + 2);
  frame_target.addIndex(index + 3);
  frame_target.addIndex(index + 3);
  frame_target.addIndex(index + 0);

  frame_target.addIndex(index + 4);
  frame_target.addIndex(index + 5);
  frame_target.addIndex(index + 5);
  frame_target.addIndex(index + 6);
  frame_target.addIndex(index + 6);
  frame_target.addIndex(index + 7);
  frame_target.addIndex(index + 7);
  frame_target.addIndex(index + 4);

  frame_target.addIndex(index + 0);
  frame_target.addIndex(index + 4);
  frame_target.addIndex(index + 1);
  frame_target.addIndex(index + 5);
  frame_target.addIndex(index + 2);
  frame_target.addIndex(index + 6);
  frame_target.addIndex(index + 3);
  frame_target.addIndex(index + 7);
}

//--------------------------------------------------------------
int main() {

  ofSetupOpenGL(720, 720, OF_WINDOW);
  ofRunApp(new ofApp());
}

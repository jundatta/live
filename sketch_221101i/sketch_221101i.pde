// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Cube in cube. Draw by openframeworks
// https://junkiyoshi.com/2021/10/29/

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

  this->log.push_front(this->location);
  while (this->log.size() > 60) {
    this->log.pop_back();
  }
}

//--------------------------------------------------------------
glm::vec3 Actor::getLocation() {

  return this->location;
}

//--------------------------------------------------------------
glm::vec3 Actor::getLocation(int i) {

  return i > 0 && i < this->log.size() ? this->log[i] : glm::vec3();
}

//--------------------------------------------------------------
deque<glm::vec3> Actor::getLog() {

  return this->log;
}

//--------------------------------------------------------------
void Actor::setColor(ofColor value) {

  this->color = value;
}

//--------------------------------------------------------------
ofColor Actor::getColor() {

  return this->color;
}


//--------------------------------------------------------------
void ofApp::setup() {

  ofSetFrameRate(60);
  ofSetWindowTitle("openFrameworks");

  ofBackground(239);
  ofSetLineWidth(1);
  ofEnableDepthTest();

  ofColor color;
  vector<ofColor> base_color_list;
  vector<int> hex_list = { 0xee6352, 0x59cd90, 0x3fa7d6, 0xfac05e, 0xf79d84 };
  for (auto hex : hex_list) {

    color.setHex(hex);
    base_color_list.push_back(color);
  }

  int span = 180;
  for (int x = -180; x <= 180; x += span) {

    for (int y = -180; y <= 180; y += span) {

      for (int z = -180; z <= 180; z += span) {

        this->parent_location_group.push_back(glm::vec3(x, y, z));
      }
    }
  }

  for (auto& location : this->parent_location_group) {

    vector<int> next_index = vector<int>();
    int index = -1;
    for (auto& other : this->parent_location_group) {

      index++;
      if (location == other) {
        continue;
      }

      float distance = glm::distance(location, other);
      if (distance <= span) {

        next_index.push_back(index);
      }
    }
    this->parent_next_index_group.push_back(next_index);
  }

  for (int i = 0; i < 23; i++) {

    this->parent_actor_group.push_back(make_unique<Actor>(this->parent_location_group, this->parent_next_index_group, this->parent_destination_group));
    this->parent_actor_group.back()->setColor(base_color_list[(int)ofRandom(base_color_list.size())]);
  }

  span = 50;
  for (int g = 0; g < this->parent_actor_group.size(); g++) {

    vector<glm::vec3> location_group;
    for (int x = -50; x <= 50; x += span) {

      for (int y = -50; y <= 50; y += span) {

        for (int z = -50; z <= 50; z += span) {

          location_group.push_back(glm::vec3(x, y, z));
        }
      }
    }
    location_group_list.push_back(location_group);

    vector<vector<int>> next_index_group;
    for (auto& location : location_group) {

      vector<int> next_index = vector<int>();
      int index = -1;
      for (auto& other : location_group) {

        index++;
        if (location == other) {
          continue;
        }

        float distance = glm::distance(location, other);
        if (distance <= span) {

          next_index.push_back(index);
        }
      }

      next_index_group.push_back(next_index);
    }
    this->next_index_group_list.push_back(next_index_group);


    vector<unique_ptr<Actor>> actor_group;
    vector<int> destination_group;
    for (int i = 0; i < 23; i++) {

      auto a = make_unique<Actor>(location_group, next_index_group, destination_group);
      actor_group.push_back(move(a));
      actor_group.back()->setColor(base_color_list[(int)ofRandom(base_color_list.size())]);
    }

    this->actor_group_list.push_back(move(actor_group));
    this->destination_group_list.push_back(destination_group);
  }
}

//--------------------------------------------------------------
void ofApp::update() {

  int frame_span = 20;
  int prev_index_size = 0;

  if (ofGetFrameNum() % frame_span == 0) {

    prev_index_size = this->parent_destination_group.size();
  }

  for (auto& actor : this->parent_actor_group) {

    actor->update(frame_span, this->parent_location_group, this->parent_next_index_group, this->parent_destination_group);
  }

  if (prev_index_size != 0) {

    this->parent_destination_group.erase(this->parent_destination_group.begin(), this->parent_destination_group.begin() + prev_index_size);
  }

  frame_span = 5;
  for (int g = 0; g < this->parent_actor_group.size(); g++) {

    if (ofGetFrameNum() % frame_span == 0) {

      prev_index_size = this->destination_group_list[g].size();
    }

    for (auto& actor : this->actor_group_list[g]) {

      actor->update(frame_span, this->location_group_list[g], this->next_index_group_list[g], this->destination_group_list[g]);
    }

    if (prev_index_size != 0) {

      this->destination_group_list[g].erase(this->destination_group_list[g].begin(), this->destination_group_list[g].begin() + prev_index_size);
    }
  }
}

//--------------------------------------------------------------
void ofApp::draw() {

  this->cam.begin();

  ofRotateY(ofGetFrameNum() * 0.5);
  ofRotateX(ofGetFrameNum() * 0.38);

  for (int g = 0; g < parent_actor_group.size(); g++) {

    ofPushMatrix();
    ofTranslate(this->parent_actor_group[g]->getLocation());

    for (auto& actor : this->actor_group_list[g]) {

      ofFill();
      ofSetColor(actor->getColor());
      ofDrawBox(actor->getLocation(), 45);

      ofNoFill();
      ofSetColor(239);
      ofDrawBox(actor->getLocation(), 46);
    }

    ofPopMatrix();
  }

  this->cam.end();
}


//--------------------------------------------------------------
int main() {

  ofSetupOpenGL(720, 720, OF_WINDOW);
  ofRunApp(new ofApp());
}

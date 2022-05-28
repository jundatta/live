// https://junkiyoshi.com/2022/02/09/

//--------------------------------------------------------------
class Actor {
  Actor(ArrayList<PVector> location_list, ArrayList<ArrayList<Integer>> next_index_list, ArrayList<Integer> destination_list) {
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
  void update(int frame_span, ArrayList<PVector> location_list, ArrayList<ArrayList<Integer>> next_index_list, ArrayList<Integer> destination_list) {
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
    while (this->log.size() > 20) {
      this->log.pop_back();
    }
  }

  //--------------------------------------------------------------
  PVector getLocation() {
    return this->location;
  }

  //--------------------------------------------------------------
  ArrayList<PVector> getLog() {
    return this->log;
  }

  //--------------------------------------------------------------
  void setColor(color col) {
    this->col = col;
  }

  //--------------------------------------------------------------
  color getColor() {
    return this->col;
  }
}

//--------------------------------------------------------------
void ofApp::setup() {

  ofSetFrameRate(30);
  ofSetWindowTitle("openFrameworks");

  ofBackground(255);

  auto span = 40;
  for (int x = -280; x <= 280; x += span) {

    for (int y = -280; y <= 280; y += span) {

      this->location_list.push_back(glm::vec3(x, y, 0));
    }
  }

  auto param = span * sqrt(3);
  for (auto& location : this->location_list) {

    vector<int> next_index = vector<int>();
    int index = -1;
    for (auto& other : this->location_list) {

      index++;
      if (location == other) {
        continue;
      }

      float distance = glm::distance(location, other);
      if (distance <= param) {

        next_index.push_back(index);
      }
    }

    this->next_index_list.push_back(next_index);
  }

  ofColor color;
  vector<int> hex_list = { 0xef476f, 0xffd166, 0x06d6a0, 0x118ab2, 0x073b4c };
  vector<ofColor> base_color_list;
  for (auto hex : hex_list) {

    color.setHex(hex);
    base_color_list.push_back(color);
  }

  for (int i = 0; i < 180; i++) {

    this->actor_list.push_back(make_unique<Actor>(this->location_list, this->next_index_list, this->destination_list));
    this->actor_list.back()->setColor(base_color_list[(int)ofRandom(base_color_list.size())]);
  }
}

//--------------------------------------------------------------
void ofApp::update() {

  int frame_span = 10;
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
}

//--------------------------------------------------------------
void ofApp::draw() {

  ofTranslate(ofGetWindowSize() * 0.5);

  ofSetColor(0, 128);
  ofSetLineWidth(1);
  for (auto& location : this->location_list) {

    ofDrawCircle(location, 5);
  }

  ofSetLineWidth(3);
  for (auto& actor : this->actor_list) {

    ofSetColor(actor->getColor());

    ofFill();
    ofDrawCircle(actor->getLocation(), 6);

    ofNoFill();

    ofBeginShape();
    for (auto& l : actor->getLog()) {

      ofVertex(l);
    }
    ofEndShape();
  }
}


//--------------------------------------------------------------
int main() {

  ofSetupOpenGL(720, 720, OF_WINDOW);
  ofRunApp(new ofApp());
}

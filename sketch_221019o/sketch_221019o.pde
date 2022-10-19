// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Looking forward to the new Matrix ! Draw by openFrameworks
// https://junkiyoshi.com/2021/12/17/

//--------------------------------------------------------------
void ofApp::setup() {

  ofSetFrameRate(60);
  ofSetWindowTitle("openFrameworks");

  ofBackground(0);
  ofSetLineWidth(0.5);
  ofEnableDepthTest();

  int span = 30;
  for (int x = -300; x <= 300; x += span) {

    for (int y = -300; y <= 300; y += span) {

      for (int z = 0; z <= 1200; z += span * 2) {

        this->location_list.push_back(glm::vec3(x, y, z));
        this->rotate_deg_list.push_back(0);
        this->param_list.push_back(0);
        this->word_index_list.push_back(0);
      }
    }
  }

  for (auto& location : this->location_list) {

    vector<int> route_info = vector<int>();
    int index = -1;
    for (auto& other : this->location_list) {

      index++;
      if (location == other) {
        continue;
      }

      float distance = glm::distance(location, other);
      if (distance <= span) {

        route_info.push_back(index);
      }
    }

    this->route_info_list.push_back(route_info);
  }

  for (int i = 0; i < 80; i++) {

    this->index_list.push_back((int)ofRandom(this->location_list.size()));
  }

  this->font_size = 23;
  ofTrueTypeFontSettings font_settings("fonts/msgothic.ttc", this->font_size);
  font_settings.antialiased = true;
  font_settings.addRanges(ofAlphabet::Japanese);
  this->font.load(font_settings);

  this->words = {

    u8"ｱ", u8"ｲ", u8"ｳ", u8"ｴ", u8"ｵ",
    u8"ｶ", u8"ｷ", u8"ｸ", u8"ｹ", u8"ｺ",
    u8"ｻ", u8"ｼ", u8"ｽ", u8"ｾ", u8"ｿ",
    u8"ﾀ", u8"ﾁ", u8"ﾂ", u8"ﾃ", u8"ﾄ",
    u8"ﾅ", u8"ﾆ", u8"ﾇ", u8"ﾈ", u8"ﾉ",
    u8"ﾊ", u8"ﾋ", u8"ﾌ", u8"ﾍ", u8"ﾎ",
    u8"ﾏ", u8"ﾐ", u8"ﾑ", u8"ﾒ", u8"ﾓ",
    u8"ﾔ", u8"ﾕ", u8"ﾖ",
    u8"ﾗ", u8"ﾘ", u8"ﾙ", u8"ﾚ", u8"ﾛ",
    u8"ﾜ", u8"ｦ", u8"ﾝ",
  };
}

//--------------------------------------------------------------
void ofApp::update() {

  if (ofGetFrameNum() % 3 != 0) {

    for (int i = 0; i < this->index_list.size(); i++) {

      this->word_index_list[this->index_list[i]] = (int)ofRandom(this->words.size());
    }
    return;
  }

  for (int i = 0; i < this->index_list.size(); i++) {

    int next_index = this->route_info_list[this->index_list[i]][(int)ofRandom(this->route_info_list[this->index_list[i]].size())];
    for (int k = 0; k < this->route_info_list[this->index_list[i]].size(); k++) {

      if (this->param_list[next_index] <= 0) {

        auto loc = this->location_list[this->index_list[i]];
        auto next = this->location_list[next_index];

        auto angle = std::atan2(next.y - loc.y, next.x - loc.x);
        if (angle != 0) {

          this->rotate_deg_list[next_index] = angle * RAD_TO_DEG + 90;
        }
        this->param_list[next_index] = 60;
        this->index_list[i] = next_index;
        this->word_index_list[next_index] = (int)ofRandom(this->words.size());
        break;
      }
    }
  }
}

//--------------------------------------------------------------
void ofApp::draw() {

  this->cam.begin();

  for (int i = 0; i < this->location_list.size(); i++) {

    if (this->param_list[i] > 0) {

      int z = (int)(this->location_list[i].z + ofGetFrameNum() * 3) % 1200 - 600;

      ofPushMatrix();
      ofTranslate(this->location_list[i].x, this->location_list[i].y, z);

      ofFill();
      int alpha = ofMap(this->param_list[i], 0, 60, 0, 255);
      int rb = this->param_list[i] >= 57 ? 239 : 39;
      ofSetColor(ofColor(rb, 239, rb, alpha));

      ofRotateZ(this->rotate_deg_list[i]);
      this->font.drawString(this->words[this->word_index_list[i]], -15, -15);

      ofPopMatrix();
    }

    if (this->param_list[i] > 0) {
      this->param_list[i] -= 1;
    }
  }

  this->cam.end();
}

//--------------------------------------------------------------
int main() {

  ofSetupOpenGL(720, 720, OF_WINDOW);
  ofRunApp(new ofApp());
}

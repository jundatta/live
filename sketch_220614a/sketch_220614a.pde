// 【作者】中内　純(ハンドルネーム：JunKiyoshi)
// 【作品名】Arrows on the numbers. Draw by openFrameworks
// https://junkiyoshi.com/2022/02/03/


#include "ofApp.h"

  //--------------------------------------------------------------
  void ofApp::setup() {

  ofSetFrameRate(30);
  ofSetWindowTitle("openFrameworks");

  ofBackground(255);
  ofSetLineWidth(4);

  this->font_size = 550;
  // https://www.ei.tohoku.ac.jp/xkozima/lab/ofTutorial4.html
  //ofTrueTypeFontSettings font_settings("fonts/msgothic.ttc", this->font_size);
  this->font.loadFont("fonts/Kazesawa-Bold.ttf", this->font_size, true, true, true);
}

//--------------------------------------------------------------
void ofApp::update() {

  ofSeedRandom(39);
}

//--------------------------------------------------------------
void ofApp::draw() {

  ofTranslate(ofGetWindowSize() * 0.5 + glm::vec2(this->font_size * -0.4, this->font_size * 0.5));

  string word = "0123456789";
  int word_index = (ofGetFrameNum() / 54) % word.size();

  ofPath chara_path = this->font.getCharacterAsPoints(word[word_index], true, false);
  vector<ofPolyline> outline = chara_path.getOutline();

  for (int outline_index = 0; outline_index < outline.size(); outline_index++) {

    auto vertices = outline[outline_index].getResampledBySpacing(38);

    for (int i = 0; i < vertices.size(); i++) {

      int param = ofGetFrameNum() % 5;
      if (i < vertices.size() - 1) {

        auto gap = vertices[i + 1] - vertices[i];
        auto location = vertices[i] + gap * ofMap(param, 0, 5, 0, 1);
        this->draw_arrow(location, vertices[i + 1], 18, ofColor(255), ofColor(0));
      } else {

        auto distance = glm::distance(vertices[0], vertices[i]);
        #if 1
          if (distance >= 18) {

          auto gap = vertices[0] - vertices[i];
          auto location = vertices[i] + gap * ofMap(param, 0, 5, 0, 1);
          this->draw_arrow(location, vertices[0], 18, ofColor(255), ofColor(0));
        }
        #endif
      }
    }
  }
}

//--------------------------------------------------------------
void ofApp::draw_arrow(glm::vec2 location, glm::vec2 target, float size, ofColor fill_color, ofColor no_fill_color) {

  auto angle = std::atan2(target.y - location.y, target.x - location.x);
  #if 0
    ofSetColor(fill_color);
  ofFill();
  ofBeginShape();
  ofVertex(location + glm::vec2(size * cos(angle), size * sin(angle)));
  ofVertex(location + glm::vec2(size * 0.5 * cos(angle + PI * 0.5), size * 0.5 * sin(angle + PI * 0.5)));
  ofVertex(location + glm::vec2(size * 0.5 * cos(angle - PI * 0.5), size * 0.5 * sin(angle - PI * 0.5)));
  ofEndShape();

  ofBeginShape();
  ofVertex(location + glm::vec2(size * 0.5 * cos(angle + PI * 0.5), size * 0.5 * sin(angle + PI * 0.5)) * 0.25);
  ofVertex(location + glm::vec2(size * 0.5 * cos(angle + PI * 0.5), size * 0.5 * sin(angle + PI * 0.5)) * 0.25 - glm::vec2(size * cos(angle), size * sin(angle)) * 0.5);
  ofVertex(location + glm::vec2(size * 0.5 * cos(angle - PI * 0.5), size * 0.5 * sin(angle - PI * 0.5)) * 0.25 - glm::vec2(size * cos(angle), size * sin(angle)) * 0.5);
  ofVertex(location + glm::vec2(size * 0.5 * cos(angle - PI * 0.5), size * 0.5 * sin(angle - PI * 0.5)) * 0.25);
  ofEndShape();
  #endif
    #if 1
    ofSetColor(no_fill_color);
  ofNoFill();
  ofBeginShape();
  ofVertex(location + glm::vec2(size * 0.5 * cos(angle + PI * 0.5), size * 0.5 * sin(angle + PI * 0.5)) * 0.25);
  ofVertex(location + glm::vec2(size * 0.5 * cos(angle + PI * 0.5), size * 0.5 * sin(angle + PI * 0.5)));
  ofVertex(location + glm::vec2(size * cos(angle), size * sin(angle)));
  ofVertex(location + glm::vec2(size * 0.5 * cos(angle - PI * 0.5), size * 0.5 * sin(angle - PI * 0.5)));
  ofVertex(location + glm::vec2(size * 0.5 * cos(angle - PI * 0.5), size * 0.5 * sin(angle - PI * 0.5)) * 0.25);
  ofEndShape();

  ofBeginShape();
  ofVertex(location + glm::vec2(size * 0.5 * cos(angle - PI * 0.5), size * 0.5 * sin(angle - PI * 0.5)) * 0.25);
  ofVertex(location + glm::vec2(size * 0.5 * cos(angle - PI * 0.5), size * 0.5 * sin(angle - PI * 0.5)) * 0.25 - glm::vec2(size * cos(angle), size * sin(angle)) * 0.5);
  ofVertex(location + glm::vec2(size * 0.5 * cos(angle + PI * 0.5), size * 0.5 * sin(angle + PI * 0.5)) * 0.25 - glm::vec2(size * cos(angle), size * sin(angle)) * 0.5);
  ofVertex(location + glm::vec2(size * 0.5 * cos(angle + PI * 0.5), size * 0.5 * sin(angle + PI * 0.5)) * 0.25);
  ofEndShape();
  #endif
}



//--------------------------------------------------------------
int main() {

  ofSetupOpenGL(720, 720, OF_WINDOW);
  ofRunApp(new ofApp());
}

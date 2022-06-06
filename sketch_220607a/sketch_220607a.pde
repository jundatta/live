// 【作者】中内　純(ハンドルネーム：JunKiyoshi)
// 【作品名】Seesaw. Draw by openFrameworks
// https://junkiyoshi.com/2022/02/13/

#include "ofApp.h"

  //--------------------------------------------------------------
  void ofApp::setup() {

  ofSetFrameRate(30);
  ofSetWindowTitle("openframeworks");

  ofBackground(0);

  ofEnableDepthTest();
  ofSetLineWidth(3);
}

//--------------------------------------------------------------
void ofApp::update() {
}

//--------------------------------------------------------------
void ofApp::draw() {

  this->cam.begin();

  int width = 500;
  int height = 150;
  int len = 15;
  for (int z = -300; z <= 300; z += 10) {

    ofPushMatrix();
    ofTranslate(0, 0, z);
    ofRotate(ofMap(ofNoise((z + 300) * 0.0035 + ofGetFrameNum() * 0.01), 0, 1, -360, 360));

    ofFill();
    ofSetColor(0);

    ofBeginShape();

    ofVertex(glm::vec2(width * -0.5, height * -0.5));
    ofVertex(glm::vec2(width * 0.5, height * -0.5));
    ofVertex(glm::vec2(width * 0.5, height * 0.5));
    ofVertex(glm::vec2(width * -0.5, height * 0.5));

    ofNextContour(true);

    ofVertex(glm::vec2(width * -0.5 + len, height * -0.5 + len));
    ofVertex(glm::vec2(width * 0.5 - len, height * -0.5 + len));
    ofVertex(glm::vec2(width * 0.5 - len, height * 0.5 - len));
    ofVertex(glm::vec2(width * -0.5 + len, height * 0.5 - len));

    ofEndShape(true);

    ofNoFill();
    ofSetColor(255);

    ofBeginShape();

    ofVertex(glm::vec2(width * -0.5, height * -0.5));
    ofVertex(glm::vec2(width * 0.5, height * -0.5));
    ofVertex(glm::vec2(width * 0.5, height * 0.5));
    ofVertex(glm::vec2(width * -0.5, height * 0.5));

    ofNextContour(true);

    ofVertex(glm::vec2(width * -0.5 + len, height * -0.5 + len));
    ofVertex(glm::vec2(width * 0.5 - len, height * -0.5 + len));
    ofVertex(glm::vec2(width * 0.5 - len, height * 0.5 - len));
    ofVertex(glm::vec2(width * -0.5 + len, height * 0.5 - len));

    ofEndShape(true);

    ofPopMatrix();
  }

  this->cam.end();
}

//--------------------------------------------------------------
int main() {

  ofSetupOpenGL(720, 720, OF_WINDOW);
  ofRunApp(new ofApp());
}

#include "ofMain.h"

class ofApp : public ofBaseApp {
public:
    void setup();
    void draw();
    ofLight spotLight;
    float n;
};

void ofApp::setup() {
    ofSetWindowTitle("OpenFrameworks");

    ofSetBackgroundColor(0);
    ofSetSmoothLighting(true);
    ofEnableDepthTest();
//    ofNoFill();
    ofFill();
    n = 0;

    spotLight.setDiffuseColor(ofColor(200, 200, 200));
    spotLight.setSpecularColor(ofColor(255, 255, 255));
    spotLight.setPosition(0, 0, 1000);
    spotLight.setDirectional();
    float angle = PI / 3.0;
    float concentration = 20;
    float x = sin(n);
    float y = 0;
    float z = cos(n);
    ofVec3f direction(x, y, z);
    spotLight.setOrientation(direction);
    spotLight.setSpotlightCutOff(angle);
    spotLight.setSpotConcentration(concentration);

    spotLight.setSpotlight();

    spotLight.enable();
}

void ofApp::draw() {
    ofTranslate(ofGetWindowSize() * 0.5);

    ofBackground(0);
    ofSetColor(200);
    ofEnableLighting();
    spotLight.enable();
    ofDrawBox(0, 0, 0, 600, 500, 10);
    ofDisableDepthTest();
    n += 0.02;
}

int main() {
    ofSetupOpenGL(800, 600, OF_WINDOW);
    ofRunApp(new ofApp());
}

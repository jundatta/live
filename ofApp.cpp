#include "ofMain.h"

class ofApp : public ofBaseApp {
public:
    void setup();
    void draw();

    float n;
};

void ofApp::setup() {
    ofSetWindowTitle("OpenFrameworks");

    ofSetSmoothLighting(true);
    ofEnableDepthTest();

    n = 0;
}

void ofApp::draw() {
    // ���_����ʒ����Ɉړ����Ă���
    ofVec3f origin(ofGetWidth() * 0.5f, ofGetHeight() * 0.5f, 0.0f);
    ofTranslate(origin);

    ofBackground(0);

    // �X�|�b�g���C�g��u��
    ofLight spotLight;
    // �i�˂��̍s��setPointLight()�i�_�����j�ɕς��邩
    //     �R�����g�A�E�g����Ɓi�f�t�H���g���_�������ۂ��j
    //     �����F�ɂȂ�j
    spotLight.setSpotlight();
    // spotLight.setPointLight();

    // ���̐F�͎��F�ɂ���
    ofColor lightColor(255, 0, 255);
    spotLight.setDiffuseColor(lightColor);
    spotLight.setSpecularColor(lightColor);

    // ���C�g�̈ʒu�͌��_�����ʎ�O�iz���W�j500.0f�ɂ���
    // �i�ˍŏ��� setPosition(0.0f, 0.0f, 500.0f); �ɂ��Ă�����
    // �@�@���C�g�̈ʒu�� ofApp::draw() �擪�� ofTranslate(origin);
    //     �ł͈ړ����Ȃ������i�ʍ��W�炵���B�����������̂Ȃ̂��H�j�j
    spotLight.setPosition(origin.x, origin.y, 500.0f);

    // ���C�g�̌��������ɂ��邮���
    float x = sin(n);
    float y = 0;
    float z = cos(n);
    ofVec3f direction(x, y, z);
    spotLight.setOrientation(direction);

    // �R�[���̍L�����60�x�A�悭�킩����l��20.0f�ɂ���
    float angle = ofRadToDeg(PI / 3);
    float concentration = 20.0f;
    spotLight.setSpotlightCutOff(angle);
    spotLight.setSpotConcentration(concentration);

    // �X�|�b�g���C�g�������悤�ɂ���
    // �i�˂��̍s���R�����g�A�E�g����Ɣ������\�������j
    spotLight.enable();

    // �����ɃX�|�b�g���C�g�𓖂Ă�
    ofSetLineWidth(0);
    ofSetColor(255);
    ofFill();
    ofDrawBox(0, 0, 0, 600, 500, 10);

    n += 0.02;
}

int main() {
    ofSetupOpenGL(800, 600, OF_WINDOW);
    ofRunApp(new ofApp());
}

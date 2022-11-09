// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Rising intersection. Draw by openFrameworks
// https://junkiyoshi.com/2021/08/31/

class pair {
  PVector first;
  float second;
}
ArrayList<pair<PVector, float>> box_info_list = new ArrayList();
IntList box_color_list = new IntList();
ArrayList<pair<PVector, float>> wave_list = new ArrayList();
float size;

ofMesh face = new ofMesh();
ofMesh frame = new ofMesh();
//--------------------------------------------------------------
void setup() {
  size(720, 720, P3D);

  size = 5;
  color col;
  for (var x = -450; x <= 450; x += size) {

    for (var y = -450; y <= 450; y += size) {

      box_info_list.add(make_pair(glm::vec2(x, y), 0.f));

      color.setHsb(ofRandom(255), 130, 255);
      box_color_list.add(col);
    }
  }

  frame.setMode(ofPrimitiveMode::OF_PRIMITIVE_LINES);
}

//--------------------------------------------------------------
void ofApp::update() {

  face.clear();
  frame.clear();

  if (ofGetFrameNum() % 20 == 0) {

    var l = glm::vec2(ofRandom(-250, 250), ofRandom(-250, 250));
    var f = 5;
    wave_list.add(make_pair(l, f));
  }

  var max_height = 150;
  for (var& wave : wave_list) {

    for (var& box_info : box_info_list) {

      var distance = glm::distance(wave.first, glm::vec2(box_info.first.x, box_info.first.y));
      if (distance > wave.second - 10 && distance < wave.second + 10) {

        box_info.second = (box_info.second >= 1) ? 1 : box_info.second + ofMap(abs(distance - wave.second), 0, 20, 0.125, 0);
      } else {

        box_info.second = (box_info.second <= 0) ? 0 : box_info.second - 0.018;
      }
    }

    wave.second += 3;
  }

  color color;
  for (int i = 0; i < box_info_list.size(); i++) {

    var& box_info = box_info_list[i];
    if (box_info.second > 0) {

      var len = ofMap(ofNoise(box_info.first.x * 0.02, box_info.first.y * 0.02, ofGetFrameNum() * 0.01), 0, 1, 0, max_height * box_info.second);
      setBoxToMesh(face, frame, glm::vec3(box_info.first.x, box_info.first.y, len * 0.5), size, size, len, box_color_list[i]);
    } else {

      color.setHsb(ofRandom(255), 130, 255);
      box_color_list[i] = color;
    }
  }

  for (int i = wave_list.size() - 1; i >= 0; i--) {

    if (wave_list[i].second > 450) {

      wave_list.erase(wave_list.begin() + i);
    }
  }
}

//--------------------------------------------------------------
void draw() {
  update();
  translate(width/2, height/2);

  ofBackground(239);
  ofSetLineWidth(0.5);

  cam.begin();
  ofRotateX(295);

  face.drawFaces();

  ofSetColor(39);
  frame.drawWireframe();

  cam.end();
}

//--------------------------------------------------------------
void ofApp::setBoxToMesh(ofMesh& face_target, ofMesh& frame_target, glm::vec3 location, float size, color col) {

  setBoxToMesh(face_target, frame_target, location, size, size, size, col);
}

//--------------------------------------------------------------
void ofApp::setBoxToMesh(ofMesh& face_target, ofMesh& frame_target, glm::vec3 location, float height, float width, float depth, color col) {

  int index = face_target.getVertices().size();

  face_target.addVertex(location + glm::vec3(width * -0.5 * 0.999, height * 0.5 * 0.999, depth * -0.5 * 0.999));
  face_target.addVertex(location + glm::vec3(width * 0.5 * 0.999, height * 0.5 * 0.999, depth * -0.5 * 0.999));
  face_target.addVertex(location + glm::vec3(width * 0.5 * 0.999, height * 0.5 * 0.999, depth * 0.5 * 0.999));
  face_target.addVertex(location + glm::vec3(width * -0.5 * 0.999, height * 0.5 * 0.999, depth * 0.5 * 0.999));

  face_target.addVertex(location + glm::vec3(width * -0.5 * 0.999, height * -0.5 * 0.999, depth * -0.5 * 0.999));
  face_target.addVertex(location + glm::vec3(width * 0.5 * 0.999, height * -0.5 * 0.999, depth * -0.5 * 0.999));
  face_target.addVertex(location + glm::vec3(width * 0.5 * 0.999, height * -0.5 * 0.999, depth * 0.5 * 0.999));
  face_target.addVertex(location + glm::vec3(width * -0.5 * 0.999, height * -0.5 * 0.999, depth * 0.5 * 0.999));

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

  for (int i = 0; i < 8; i++) {

    face_target.addColor(color(col));
  }
}

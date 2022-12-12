// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Endless collapse. Draw by openFrameworks
// https://github.com/junkiyoshi/Insta20210903

ofMesh face;
ofMesh frame;

//--------------------------------------------------------------
void setup() {
  size(720, 720, P3D);
  
  face = new ofMesh();
  frame = new ofMesh();
}

//--------------------------------------------------------------
void update() {
  face.clear();
  frame.clear();

  int span = 15;
  int len = 300;
  for (int x = len * -0.5; x <= len * 0.5; x += span) {
    for (int y = len * -2; y <= len * 0.5; y += span) {
      for (int z = len * -0.5; z <= len * 0.5; z += span) {
        float noise_value = openFrameworks.ofNoise(x * 0.01, z * 0.01, y * 0.01 + ofGetFrameNum() * 0.08);
        if (y > len * 0.35) {
          noise_value += map(y, len * 0.35, len, 0.25, 1);
        } else if (y < len * 0.15) {
          noise_value += map(y, len * -2, len * 0.15, -0.65, 0);
        }

        if (noise_value > 0.35) {
          int color_value = y < len * 0.35 ? y > -len * 0.75 ? map(y, len * 0.35, -len * 0.75, 39, 128) : map(y, -len * 0.75, len * -2, 128, 239) : 39;
          setBoxToMesh(face, frame, new PVector(x, y, z), span, color(color_value), color(239));
        }
      }
    }
  }
}

//--------------------------------------------------------------
void draw() {
  update();
  translate(width/2, height/2);

  background(239);

  ofRotateY(ofGetFrameNum() * 0.5);

  face.draw(color(39));
  frame.drawWireframe(color(239));
}

//--------------------------------------------------------------
void setBoxToMesh(ofMesh face_target, ofMesh frame_target, PVector location, float size, color face_color, color frame_color) {
  setBoxToMesh(face_target, frame_target, location, size, size, size, face_color, frame_color);
}

//--------------------------------------------------------------
void ofApp::setBoxToMesh(ofMesh& face_target, ofMesh& frame_target, glm::vec3 location, float height, float width, float depth, color face_color, color frame_color) {

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

  for (int i = 0; i < 8; i++) {

    face_target.addColor(face_color);
    frame_target.addColor(frame_color);
  }
}

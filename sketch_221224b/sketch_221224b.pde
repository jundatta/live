// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Hexagon plate. Draw by openframeworks
// https://junkiyoshi.com/2022/03/20/

ArrayList<PVector> location_list = new ArrayList();
IntList life_list = new IntList();
FloatList noise_param_list = new FloatList();
ArrayList<PVector> noise_location_list = new ArrayList();

ofMesh face = new ofMesh();
ofMesh frame = new ofMesh();

//--------------------------------------------------------------
void setup() {
  size(720, 720, P3D);

  float radius = 8;
  float x_span = radius * sqrt(3);
  boolean flg = true;
  for (float y = -500; y < 500; y += radius * 1.5) {
    for (float x = -500; x < 500; x += x_span) {
      PVector location;
      if (flg) {
        location = new PVector(x, y, 0);
      } else {
        location = new PVector(x + (x_span / 2), y, 0);
      }

      location_list.push_back(location);
      life_list.push_back(0);
      noise_param_list.push_back(ofRandom(1000));
    }
    flg = !flg;
  }
}

//--------------------------------------------------------------
void update() {
  ofSeedRandom(39);

  face.clear();
  frame.clear();
  noise_location_list.clear();

  for (int i = 0; i < location_list.size(); i++) {
    life_list[i] = life_list[i] > 0 ? life_list[i] - 0.05 : 0;
    if (life_list[i] > 0) {
      noise_param_list[i] += ofMap(life_list[i], 0, 100, 0.05, 0.1);
    }
  }

  for (int i = 0; i < 1; i++) {
    int deg_start = ofMap(ofNoise(ofRandom(1000), ofGetFrameNum() * 0.005), 0, 1, -360, 360);
    int radius = ofMap(ofNoise(ofRandom(1000), ofGetFrameNum() * 0.01), 0, 1, 0, 400);

    for (int deg = deg_start; deg < deg_start + 360; deg += 60) {
      PVector noise_location = new PVector(radius * cos(deg * DEG_TO_RAD), radius * sin(deg * DEG_TO_RAD), 0);
      noise_location_list.push_back(noise_location);
      for (int i = 0; i < location_list.size(); i++) {
        if (PVector.dist(noise_location, location_list[i]) < 35) {
          life_list[i] = life_list[i] < 100 ? life_list[i] + 8 : 100;
        }
      }
    }
  }

  for (int i = 0; i < location_list.size(); i++) {
    float height = 5.f;
    if (life_list[i] > 10) {
      setHexagonToMesh(face, frame, location_list[i], 8, height);
    } else if (life_list[i] > 0) {
      setHexagonToMesh(face, frame, location_list[i], ofMap(life_list[i], 0, 10, 0, 8), height);
    } else {
      //setHexagonToMesh(face, frame, location_list[i], 15, height);
    }
  }
}

//--------------------------------------------------------------
void draw() {
  update();
  translate(width/2, height/2);
  background(255);
  ofSetLineWidth(3);

  face.draw();
  frame.draw();
}

//--------------------------------------------------------------
PVector makeLocation(PVector loc, float x, float y, float z) {
  return new PVector(loc.x + x, loc.y + y, loc.z + z);
}
void setHexagonToMesh(ofMesh face_target, ofMesh frame_target, PVector location, float radius, float height) {
  color face_color = color(255);
  color frame_color = color(0);

  for (int deg = 90; deg < 450; deg += 60) {
    float face_radius = radius - 0.5;
    float face_index = face_target.getNumVertices();

    ArrayList<Pvector> vertices = new ArrayList();
    vertices.push_back(makeLocation(location, 0, 0, 0));
    vertices.push_back(makeLocation(location, face_radius * cos(deg * DEG_TO_RAD), face_radius * sin(deg * DEG_TO_RAD), 0));
    vertices.push_back(makeLocation(location, face_radius * cos((deg + 60) * DEG_TO_RAD), face_radius * sin((deg + 60) * DEG_TO_RAD), 0));
    vertices.push_back(makeLocation(location, 0, 0, height));
    vertices.push_back(makeLocation(location, face_radius * cos((deg + 60) * DEG_TO_RAD), face_radius * sin((deg + 60) * DEG_TO_RAD), height));
    vertices.push_back(makeLocation(location, face_radius * cos(deg * DEG_TO_RAD), face_radius * sin(deg * DEG_TO_RAD), height));

    face_target.addVertices(vertices);

    face_target.addIndex(face_index + 0);
    face_target.addIndex(face_index + 1);
    face_target.addIndex(face_index + 2);
    face_target.addIndex(face_index + 3);
    face_target.addIndex(face_index + 4);
    face_target.addIndex(face_index + 5);
    face_target.addIndex(face_index + 1);
    face_target.addIndex(face_index + 2);
    face_target.addIndex(face_index + 4);
    face_target.addIndex(face_index + 1);
    face_target.addIndex(face_index + 4);
    face_target.addIndex(face_index + 5);

    auto frame_index = frame_target.getNumVertices();

    vertices.clear();
    vertices.push_back(makeLocation(location, 0, 0, 0));
    vertices.push_back(makeLocation(location, radius * cos(deg * DEG_TO_RAD), radius * sin(deg * DEG_TO_RAD), 0));
    vertices.push_back(makeLocation(location, radius * cos((deg + 60) * DEG_TO_RAD), radius * sin((deg + 60) * DEG_TO_RAD), 0));
    vertices.push_back(makeLocation(location, 0, 0, height));
    vertices.push_back(makeLocation(location, radius * cos((deg + 60) * DEG_TO_RAD), radius * sin((deg + 60) * DEG_TO_RAD), height));
    vertices.push_back(makeLocation(location, radius * cos(deg * DEG_TO_RAD), radius * sin(deg * DEG_TO_RAD), height));

    frame_target.addVertices(vertices);

    frame_target.addIndex(frame_index + 1);
    frame_target.addIndex(frame_index + 2);
    frame_target.addIndex(frame_index + 4);
    frame_target.addIndex(frame_index + 5);
    frame_target.addIndex(frame_index + 1);
    frame_target.addIndex(frame_index + 5);
    frame_target.addIndex(frame_index + 2);
    frame_target.addIndex(frame_index + 4);

    for (int i = 0; i < vertices.size(); i++) {
      face_target.addColor(face_color);
      frame_target.addColor(frame_color);
    }
  }
}

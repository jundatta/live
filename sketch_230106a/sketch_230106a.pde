// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】flowing character. Draw by openFrameworks
// https://junkiyoshi.com/openframeworks20221208/

class ShereUnit {
  PVector location;
  float size;
  ShereUnit(PVector location, float size) {
    this.location = location;
    this.size = size;
  }
}
ArrayList<ShereUnit> sphere_list = new ArrayList();
ArrayList<PVector> deg_list = new ArrayList();
int number_of_sphere;

String word;

//--------------------------------------------------------------
void setup() {
  size(720, 720, P3D);

  number_of_sphere = 3600;
  while (sphere_list.size() < number_of_sphere) {
    PVector tmp_location = make_point(280, random(0, 50), random(360), random(360));
    float radius = sphere_list.size() < 100 ? random(10, 50) : random(3, 20);

    boolean flag = true;
    for (int i = 0; i < sphere_list.size(); i++) {
      ShereUnit su = sphere_list.get(i);
      if (PVector.dist(tmp_location, su.location) < su.size + radius) {
        flag = false;
        break;
      }
    }
    if (flag) {
      float size = (radius * 2) / sqrt(3);
      ShereUnit su = new ShereUnit(tmp_location, size);
      sphere_list.add(su);
      deg_list.add(new PVector(random(360), random(360), random(360)));
    }
  }

  PFont font = createFont("HuiFont29.ttf", 100, true);
  textFont(font);
  word = "JunKiyoshi";
}

//--------------------------------------------------------------
void update() {
  ofSeedRandom(39);

  for (int i = 0; i < sphere_list.size(); i++) {
    PVector step = new PVector(random(1, 3), random(1, 3), random(-3, 3));
    if (ofGetFrameNum() % 60 < 30) {
      //deg_list[i] += step * ofMap(ofGetFrameNum() % 60, 0, 30, 15, 0);
      step.mult(map(ofGetFrameNum() % 60, 0, 30, 15, 0));
      PVector deg = deg_list.get(i);
      deg.add(step);
      deg_list.set(i, deg);
    }
  }
}

//--------------------------------------------------------------
void draw() {
  update();
  translate(width/2, height/2);

  background(0);
  //ofSetLineWidth(1);

  ofRotateX(270);

  ofTranslate(280, -560, 0);
  ofRotateZ(ofGetFrameNum() * 0.5);

  for (int i = 0; i < sphere_list.size(); i++) {
    ShereUnit su = sphere_list.get(i);
    PVector location = su.location;
    auto size = su.size * 1.2;

    pushMatrix();
    translate(location);

    PVector deg = deg_list.get(i);
    ofRotateZ(deg.z);
    ofRotateY(deg.y);
    ofRotateX(deg.x);

    ofPath chara_path = font.getCharacterAsPoints(word[ofRandom(word.size())], true, false);
    vector<ofPolyline> outline = chara_path.getOutline();

    ofFill();
    ofSetColor(0);
    ofBeginShape();
    for (int outline_index = 0; outline_index < outline.size(); outline_index++) {

      ofNextContour(true);

      auto vertices = outline[outline_index].getVertices();
      for (auto& vertex : vertices) {

        glm::vec2 location = vertex / 100 * size;
        location -= glm::vec2(size * 0.5, -size * 0.5);
        ofVertex(location);
      }
    }
    ofEndShape(true);

    ofNoFill();
    ofSetColor(255);
    ofBeginShape();
    for (int outline_index = 0; outline_index < outline.size(); outline_index++) {

      ofNextContour(true);

      auto vertices = outline[outline_index].getVertices();
      for (auto& vertex : vertices) {

        glm::vec2 location = vertex / 100 * size;
        location -= glm::vec2(size * 0.5, -size * 0.5);
        ofVertex(location);
      }
    }
    ofEndShape(true);

    ofPopMatrix();
  }
}

//--------------------------------------------------------------
glm::vec3 ofApp::make_point(float R, float r, float u, float v) {

  // 数学デッサン教室 描いて楽しむ数学たち　P.31

  u *= DEG_TO_RAD;
  v *= DEG_TO_RAD;

  auto x = (R + r * cos(u)) * cos(v);
  auto y = (R + r * cos(u)) * sin(v);
  auto z = r * sin(u);

  return glm::vec3(x, y, z);
}

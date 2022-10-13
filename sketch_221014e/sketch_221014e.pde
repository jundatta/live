// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Connection bubble. Draw by openFrameworks
// https://junkiyoshi.com/2021/12/20/

ofMesh mesh;
ArrayList<PVector> circle_list;
//--------------------------------------------------------------
void setup() {
  size(720, 720, P3D);

  mesh = new ofMesh();
  circle_list = new ArrayList();
}

//--------------------------------------------------------------
void update() {
  randomSeed(39);

  mesh.clear();
  circle_list.clear();

  ArrayList<PVector> location_list;
  for (int i = 0; i < 120; i++) {
    var location = new PVector(map(openFrameworks.ofNoise(random(1000), frameCount * 0.0035), 0, 1, -300, 300),
      map(openFrameworks.ofNoise(random(1000), frameCount * 0.0035), 0, 1, -300, 300));
    location_list.add(location);
  }

  for (int i = 0; i < location_list.size(); i++) {
    int near_count = 0;
    for (int k = 0; k < location_list.size(); k++) {
      if (i == k) {
        continue;
      }

      float distance = PVector.dist(location_list.get(i), location_list.get(k));
      if (distance < 50) {
        mesh.addVertex(location_list.get(i));
        mesh.addVertex(location_list.get(k));

        mesh.addIndex(mesh.getNumVertices() - 1);
        mesh.addIndex(mesh.getNumVertices() - 2);

        near_count++;
      }
    }
    PVector loc = location_list.get(i);
    PVector cir = new PVector(loc.x, loc.y, pow(1.5, near_count));
    circle_list.add(cir);
  }
}

//--------------------------------------------------------------
void draw() {
  update();
  translate(width/2, height/2);
  background(0);

  translate(width * 0.5, height * 0.5);

  ofSetLineWidth(0.5);
  this->mesh.drawWireframe();

  ofSetLineWidth(1.5);
  for (auto& circle : this->circle_list) {

    ofFill();
    ofSetColor(0);
    ofDrawCircle(glm::vec2(circle.x, circle.y), circle.z);

    ofNoFill();
    ofSetColor(255);
    ofDrawCircle(glm::vec2(circle.x, circle.y), circle.z);
  }
}

//--------------------------------------------------------------
int main() {

  ofSetupOpenGL(720, 720, OF_WINDOW);
  ofRunApp(new ofApp());
}

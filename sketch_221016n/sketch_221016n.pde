// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Shaving spheres. Draw by openFrameworks
// https://junkiyoshi.com/2021/12/16/

ofMesh face, frame;
//--------------------------------------------------------------
void setup() {
  size(720, 720, P3D);

  face = new ofMesh();
  frame = new ofMesh();
}

//--------------------------------------------------------------
void update() {
  randomSeed(39);

  face.clear();
  frame.clear();

  float phi_deg_step = 5;
  float theta_deg_step = 5;

  ArrayList<PVector> noise_location_list = new ArrayList();

  for (int i = 0; i < 20; i++) {
    var noise_location = new PVector(
      map(openFrameworks.ofNoise(random(1000), ofGetFrameNum() * 0.005), 0, 1, -250, 250),
      map(openFrameworks.ofNoise(random(1000), ofGetFrameNum() * 0.005), 0, 1, -250, 250),
      map(openFrameworks.ofNoise(random(1000), ofGetFrameNum() * 0.005), 0, 1, -250, 250));
    noise_location_list.add(noise_location);
  }

  for (float radius = 50; radius <= 250; radius += 15) {

    for (float phi_deg = 0; phi_deg < 360; phi_deg += phi_deg_step) {

      for (float theta_deg = 0; theta_deg <= 360; theta_deg += theta_deg_step) {

        auto location = glm::vec3(
          radius * sin(theta_deg * DEG_TO_RAD) * cos(phi_deg * DEG_TO_RAD),
          radius * sin(theta_deg * DEG_TO_RAD) * sin(phi_deg * DEG_TO_RAD),
          radius * cos(theta_deg * DEG_TO_RAD));

        bool draw_flag = true;
        for (int i = 0; i < noise_location_list.size(); i++) {

          if (glm::distance(location, noise_location_list[i]) < 100) {

            draw_flag = false;
            break;
          }
        }

        if (draw_flag) {

          auto index = this->face.getNumVertices();
          vector<glm::vec3> vertices;

          vertices.push_back(glm::vec3(
            radius * sin((theta_deg - theta_deg_step * 0.5) * DEG_TO_RAD) * cos((phi_deg + phi_deg_step * 0.5) * DEG_TO_RAD),
            radius * sin((theta_deg - theta_deg_step * 0.5) * DEG_TO_RAD) * sin((phi_deg + phi_deg_step * 0.5) * DEG_TO_RAD),
            radius * cos((theta_deg - theta_deg_step * 0.5) * DEG_TO_RAD)));
          vertices.push_back(glm::vec3(
            radius * sin((theta_deg - theta_deg_step * 0.5) * DEG_TO_RAD) * cos((phi_deg - phi_deg_step * 0.5) * DEG_TO_RAD),
            radius * sin((theta_deg - theta_deg_step * 0.5) * DEG_TO_RAD) * sin((phi_deg - phi_deg_step * 0.5) * DEG_TO_RAD),
            radius * cos((theta_deg - theta_deg_step * 0.5) * DEG_TO_RAD)));
          vertices.push_back(glm::vec3(
            radius * sin((theta_deg + theta_deg_step * 0.5) * DEG_TO_RAD) * cos((phi_deg + phi_deg_step * 0.5) * DEG_TO_RAD),
            radius * sin((theta_deg + theta_deg_step * 0.5) * DEG_TO_RAD) * sin((phi_deg + phi_deg_step * 0.5) * DEG_TO_RAD),
            radius * cos((theta_deg + theta_deg_step * 0.5) * DEG_TO_RAD)));
          vertices.push_back(glm::vec3(
            radius * sin((theta_deg + theta_deg_step * 0.5) * DEG_TO_RAD) * cos((phi_deg - phi_deg_step * 0.5) * DEG_TO_RAD),
            radius * sin((theta_deg + theta_deg_step * 0.5) * DEG_TO_RAD) * sin((phi_deg - phi_deg_step * 0.5) * DEG_TO_RAD),
            radius * cos((theta_deg + theta_deg_step * 0.5) * DEG_TO_RAD)));

          this->face.addVertices(vertices);
          this->frame.addVertices(vertices);

          this->face.addIndex(index + 0);
          this->face.addIndex(index + 1);
          this->face.addIndex(index + 3);
          this->face.addIndex(index + 0);
          this->face.addIndex(index + 3);
          this->face.addIndex(index + 2);

          this->frame.addIndex(index + 0);
          this->frame.addIndex(index + 1);
          this->frame.addIndex(index + 0);
          this->frame.addIndex(index + 2);
          this->frame.addIndex(index + 3);
          this->frame.addIndex(index + 1);
          this->frame.addIndex(index + 3);
          this->frame.addIndex(index + 2);
        }
      }
    }
  }
}

//--------------------------------------------------------------
void draw() {
  update();
  translate(width/2, height/2);
  background(0);
  strokeWeight(1.5);

  this->cam.begin();
  ofRotateX(90);
  ofRotateZ(ofGetFrameNum());

  ofSetColor(0);
  this->face.draw();

  ofSetColor(239);
  this->frame.draw();

  this->cam.end();
}

//--------------------------------------------------------------
int main() {

  ofSetupOpenGL(720, 720, OF_WINDOW);
  ofRunApp(new ofApp());
}

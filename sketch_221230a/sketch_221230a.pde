// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】White to Black. Draw by openFrameworks
// https://junkiyoshi.com/2021/02/28/

ofMesh frame = new ofMesh();
float noise_param;

//--------------------------------------------------------------
void setup() {
  size(720, 720, P3D);
}

//--------------------------------------------------------------
void update() {
  ofSeedRandom(39);
  frame.clear();

  for (int len = 100; len <= 350; len += 250) {
    PVector noise_seed = new PVector(random(1000), random(1000), random(1000));
    for (int i = 0; i < 20; i++) {
      float angle_x = map(ofNoise(noise_seed.x, (ofGetFrameNum() + i) * 0.003), 0, 1, -PI, PI);
      float angle_y = map(ofNoise(noise_seed.y, (ofGetFrameNum() + i) * 0.003), 0, 1, -PI, PI);
      float angle_z = map(ofNoise(noise_seed.z, (ofGetFrameNum() + i) * 0.003), 0, 1, -PI, PI);

      auto rotation_x = glm::rotate(glm::mat4(), angle_x, glm::vec3(1, 0, 0));
      auto rotation_y = glm::rotate(glm::mat4(), angle_y, glm::vec3(0, 1, 0));
      auto rotation_z = glm::rotate(glm::mat4(), angle_z, glm::vec3(0, 0, 1));

      auto index = frame.getNumVertices();
      vector<glm::vec3> vertices;

      vertices.push_back(glm::vec3(len * -0.5, len * 0.5, len * -0.5));
      vertices.push_back(glm::vec3(len * 0.5, len * 0.5, len * -0.5));
      vertices.push_back(glm::vec3(len * 0.5, len * 0.5, len * 0.5));
      vertices.push_back(glm::vec3(len * -0.5, len * 0.5, len * 0.5));

      vertices.push_back(glm::vec3(len * -0.5, len * -0.5, len * -0.5));
      vertices.push_back(glm::vec3(len * 0.5, len * -0.5, len * -0.5));
      vertices.push_back(glm::vec3(len * 0.5, len * -0.5, len * 0.5));
      vertices.push_back(glm::vec3(len * -0.5, len * -0.5, len * 0.5));

      for (auto& vertex : vertices) {

        vertex = glm::vec4(vertex, 0) * rotation_z * rotation_y * rotation_x;
        frame.addColor(ofColor(ofMap(i, 0, 20, 39, 239)));
      }

      frame.addVertices(vertices);

      frame.addIndex(index + 0);
      frame.addIndex(index + 1);
      frame.addIndex(index + 1);
      frame.addIndex(index + 2);
      frame.addIndex(index + 2);
      frame.addIndex(index + 3);
      frame.addIndex(index + 3);
      frame.addIndex(index + 0);

      frame.addIndex(index + 4);
      frame.addIndex(index + 5);
      frame.addIndex(index + 5);
      frame.addIndex(index + 6);
      frame.addIndex(index + 6);
      frame.addIndex(index + 7);
      frame.addIndex(index + 7);
      frame.addIndex(index + 4);

      frame.addIndex(index + 0);
      frame.addIndex(index + 4);
      frame.addIndex(index + 1);
      frame.addIndex(index + 5);
      frame.addIndex(index + 2);
      frame.addIndex(index + 6);
      frame.addIndex(index + 3);
      frame.addIndex(index + 7);
    }
  }
}

//--------------------------------------------------------------
void draw() {
  update();
  translate(width/2, height/2);
  
  background(139);
  stroke(39);
  strokeWeight(3);

  frame.drawWireframe();
}

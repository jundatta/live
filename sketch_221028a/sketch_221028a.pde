// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Mountains of Noise. Draw by openFrameworks
// https://junkiyoshi.com/2021/11/25/

//--------------------------------------------------------------
void setup() {
  size(720, 720, P3D);
}

//--------------------------------------------------------------
void update() {
  ofSeedRandom(39);

  face.clear();
  line.clear();

  var x_span = 1;
  var z_span = 20;
  for (var z = -100; z <= 100; z += z_span) {
    auto hue = ofRandom(255);
    color col;
    //color.setHsb(hue, 180, 255);
    push();
    colorMode(HSB, 255, 255, 255);
    col = color(hue, 180, 255);
    pop();

    var noise_seed = ofRandom(1000);
    var param_noise_seed = ofRandom(1000);
    var start_index = face.getNumVertices();

    auto param_noise_value = ofNoise(z * 0.035, ofGetFrameNum() * 0.0001);

    for (auto x = -500; x <= 500; x += x_span) {

      vector<glm::vec3> vertices;

      auto noise_value = ofNoise(z * 0.05, x * 0.035, ofGetFrameNum() * 0.005);
      auto next_noise_value = ofNoise(z * 0.05, (x + x_span) * 0.035, ofGetFrameNum() * 0.005);

      if (abs(x) <= 150) {

        auto param = ofMap(param_noise_value, 0, 1, -150, 150);
        auto distance = abs(x - param);
        noise_value = noise_value * (distance > 30 ? 0.1 : ofMap(distance, 0, 30, 0.5, 0.1)) * (abs(x) < 100 ? 1 : ofMap(abs(x), 100, 150, 1, 0));
      } else {

        noise_value = 0;
      }

      if (abs(x + x_span) <= 150) {

        auto param = ofMap(param_noise_value, 0, 1, -150, 150);
        auto distance = abs((x + x_span) - param);
        next_noise_value = next_noise_value * (distance > 30 ? 0.1 : ofMap(distance, 0, 30, 0.5, 0.1)) * (abs(x + x_span) < 100 ? 1 : ofMap(abs(x + x_span), 100, 150, 1, 0));
      } else {

        next_noise_value = 0;
      }

      auto height = ofMap(noise_value, 0, 1, -150, 350);
      auto next_height = ofMap(next_noise_value, 0, 1, -150, 350);

      vertices.push_back(glm::vec3(x, -150, z - 4.5));
      vertices.push_back(glm::vec3(x + x_span, -150, z - 4.5));
      vertices.push_back(glm::vec3(x + x_span, next_height, z - 4.5));
      vertices.push_back(glm::vec3(x, height, z - 4.5));

      vertices.push_back(glm::vec3(x, -150, z + 4.5));
      vertices.push_back(glm::vec3(x + x_span, -150, z + 4.5));
      vertices.push_back(glm::vec3(x + x_span, next_height, z + 4.5));
      vertices.push_back(glm::vec3(x, height, z + 4.5));

      auto index = this->face.getNumVertices();
      this->face.addVertices(vertices);

      this->face.addIndex(index + 0);
      this->face.addIndex(index + 1);
      this->face.addIndex(index + 2);
      this->face.addIndex(index + 0);
      this->face.addIndex(index + 2);
      this->face.addIndex(index + 3);

      this->face.addIndex(index + 4);
      this->face.addIndex(index + 5);
      this->face.addIndex(index + 6);
      this->face.addIndex(index + 4);
      this->face.addIndex(index + 6);
      this->face.addIndex(index + 7);

      this->face.addIndex(index + 0);
      this->face.addIndex(index + 4);
      this->face.addIndex(index + 5);
      this->face.addIndex(index + 0);
      this->face.addIndex(index + 5);
      this->face.addIndex(index + 1);

      this->face.addIndex(index + 2);
      this->face.addIndex(index + 6);
      this->face.addIndex(index + 7);
      this->face.addIndex(index + 2);
      this->face.addIndex(index + 7);
      this->face.addIndex(index + 3);

      this->line.addVertices(vertices);

      this->line.addIndex(index + 0);
      this->line.addIndex(index + 1);
      this->line.addIndex(index + 2);
      this->line.addIndex(index + 3);
      this->line.addIndex(index + 4);
      this->line.addIndex(index + 5);
      this->line.addIndex(index + 6);
      this->line.addIndex(index + 7);

      for (int i = index; i < index + 8; i++) {

        this->face.addColor(ofColor(0));
        this->line.addColor(ofColor(255));
      }
    }

    this->face.addIndex(start_index + 0);
    this->face.addIndex(start_index + 4);
    this->face.addIndex(start_index + 7);
    this->face.addIndex(start_index + 0);
    this->face.addIndex(start_index + 7);
    this->face.addIndex(start_index + 3);

    this->line.addIndex(start_index + 0);
    this->line.addIndex(start_index + 3);
    this->line.addIndex(start_index + 0);
    this->line.addIndex(start_index + 4);
    this->line.addIndex(start_index + 7);
    this->line.addIndex(start_index + 3);
    this->line.addIndex(start_index + 7);
    this->line.addIndex(start_index + 4);

    auto index = this->face.getNumVertices() - 8;

    this->face.addIndex(index + 1);
    this->face.addIndex(index + 2);
    this->face.addIndex(index + 6);
    this->face.addIndex(index + 1);
    this->face.addIndex(index + 6);
    this->face.addIndex(index + 5);

    this->line.addIndex(index + 1);
    this->line.addIndex(index + 2);
    this->line.addIndex(index + 1);
    this->line.addIndex(index + 5);
    this->line.addIndex(index + 6);
    this->line.addIndex(index + 2);
    this->line.addIndex(index + 6);
    this->line.addIndex(index + 5);
  }
}

//--------------------------------------------------------------
void draw() {
  update();
  translate(width/2, height/2);
  ofBackground(0);
  ofSetLineWidth(2);

  this->cam.begin();
  ofRotateY(180 + ofGetFrameNum() * 0.75);

  this->face.draw();
  this->line.drawWireframe();

  this->cam.end();
}

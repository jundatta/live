// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Crevice torus. Draw by openFrameworks
// https://junkiyoshi.com/2022/01/27/
class MESH {
  ArrayList<PVector> vertices;
  IntList colors;
  IntList indices;

  MESH() {
    clear();
  }
  void clear() {
    vertices = new ArrayList();
    colors = new IntList();
    indices = new IntList();
  }
  void addVertices(ArrayList<PVector> vertices) {
    for (PVector v : vertices) {
      this.vertices.add(v);
    }
  }
  int getNumVertices() {
    return vertices.length;
  }
  void addColor(color c) {
    colors.append(c);
  }
  void addIndex(int ix) {
    indices.append(ix);
  }
}
MESH face, line;

//--------------------------------------------------------------
void setup() {
  background(255);
  strokeWeight(3);
}

//--------------------------------------------------------------
void update() {
  randomSeed(39);

  face.clear();
  line.clear();

  float R = 250;
  float r = R * 0.25;
  float v_step = 0;
  float u_span = 20;

  for (float u = 0; u < 360; u += u_span) {
    var noise_seed = random(1000);
    for (float v = 0; v < 360; v += 3) {
      var noise_value = openFrameworks.ofNoise(new PVector(noise_seed + frameCount * 0.05, make_point(R, r, u, v) * 0.005));
      if (noise_value < 0.45) {
        continue;
      }

      var prev_noise_value = openFrameworks.ofNoise(new PVector(noise_seed + frameCount * 0.05, make_point(R, r, u, v - 1.5) * 0.005));
      var next_noise_value = openFrameworks.ofNoise(new PVector(noise_seed + frameCount * 0.05, make_point(R, r, u, v + 1.5) * 0.005));

      ArrayList<PVector> vertices = new ArrayList();
      vertices.add(new PVector(make_point(R, r, u - u_span * 0.5 + 1, v - 1.5)));
      vertices.add(new PVector(make_point(R, r, u + u_span * 0.5 - 1, v - 1.5)));
      vertices.add(new PVector(make_point(R, r, u + u_span * 0.5 - 1, v + 1.5)));
      vertices.add(new PVector(make_point(R, r, u - u_span * 0.5 + 1, v + 1.5)));

      face.addVertices(vertices);
      line.addVertices(vertices);

      for (int i = 0; i < 4; i++) {
        face.addColor(color(0));
        line.addColor(color(255));
      }

      face.addIndex(face.getNumVertices() - 1);
      face.addIndex(face.getNumVertices() - 2);
      face.addIndex(face.getNumVertices() - 4);
      face.addIndex(face.getNumVertices() - 3);
      face.addIndex(face.getNumVertices() - 2);
      face.addIndex(face.getNumVertices() - 4);

      line.addIndex(line.getNumVertices() - 1);
      line.addIndex(line.getNumVertices() - 4);
      line.addIndex(line.getNumVertices() - 2);
      line.addIndex(line.getNumVertices() - 3);

      if (next_noise_value < 0.45) {
        line.addIndex(line.getNumVertices() - 1);
        line.addIndex(line.getNumVertices() - 2);
      }

      if (prev_noise_value < 0.45) {
        line.addIndex(line.getNumVertices() - 3);
        line.addIndex(line.getNumVertices() - 4);
      }
    }
  }
}

//--------------------------------------------------------------
void ofApp::draw() {

  this->cam.begin();

  ofRotateY(ofGetFrameNum() * 0.6666666666666666);

  this->line.drawWireframe();
  this->face.draw();

  this->cam.end();
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


//--------------------------------------------------------------
int main() {

  ofSetupOpenGL(720, 720, OF_WINDOW);
  ofRunApp(new ofApp());
}

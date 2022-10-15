// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Fives. Draw by openFrameworks
// https://junkiyoshi.com/2021/12/15/

PVector[] vertices;
//--------------------------------------------------------------
void setup() {
  vertices = loadOutline("5.txt");
}

//--------------------------------------------------------------
void update() {
  randomSeed(39);
}

//--------------------------------------------------------------
void draw() {
  update();
  translate(width/2, height/2);
  background(255);

  rotateY(radians(frameCount * 0.66666666666666666));

  for (int i = 0; i < 1; i++) {
    int x = random(-300, 300);
    int y = random(-300, 300);
    int z = random(-300, 300);
    int rad_x = random(-TAU, TAU);
    int rad_y = random(-TAU, TAU);
    int rad_z = random(-TAU, TAU);

    var translate_location = PVector.normalize(new PVector(x, y, z)) * random(540);
    var len = (int)(PVector.mag(translate_location) + frameCount * 2) % 540;
    translate_location = PVector.normalize(translate_location) * len;

    pushMatrix();
    translate(translate_location);
    rotateZ(rad_z);
    rotateY(rad_y);
    rotateX(rad_x);

    ArrayList<PVector> mesh_vertices = new ArrayList();
    ArrayList<PVector> base_location_list = new ArrayList();

    for (int vertices_index = 0; vertices_index < vertices.size(); vertices_index++) {
      auto base_location = glm::vec3(this->font.stringWidth(word) * 0.5, this->font.stringHeight(word) * 0.5, 0);
      auto location = vertices[vertices_index] - glm::vec2(this->font.stringWidth(word) * 0.5, this->font.stringHeight(word) * 0.5);

      mesh_vertices.push_back(location);
      base_location_list.push_back(base_location);
    }

    ofMesh face, line;
    line.setMode(ofPrimitiveMode::OF_PRIMITIVE_LINES);
    for (int k = 0; k < mesh_vertices.size(); k++) {

      face.addVertex(base_location_list[k] + glm::vec3(mesh_vertices[k] - glm::vec3(0, 0, 5)));
      face.addVertex(base_location_list[k] + glm::vec3(mesh_vertices[k] + glm::vec3(0, 0, 5)));

      line.addVertex(base_location_list[k] + glm::vec3(mesh_vertices[k] - glm::vec3(0, 0, 5)));
      line.addVertex(base_location_list[k] + glm::vec3(mesh_vertices[k] + glm::vec3(0, 0, 5)));

      if (k > 0) {

        face.addIndex(face.getNumVertices() - 1);
        face.addIndex(face.getNumVertices() - 2);
        face.addIndex(face.getNumVertices() - 4);
        face.addIndex(face.getNumVertices() - 1);
        face.addIndex(face.getNumVertices() - 3);
        face.addIndex(face.getNumVertices() - 4);

        line.addIndex(line.getNumVertices() - 1);
        line.addIndex(line.getNumVertices() - 3);
        line.addIndex(line.getNumVertices() - 2);
        line.addIndex(line.getNumVertices() - 4);
      }
    }

    face.addIndex(face.getNumVertices() - 1);
    face.addIndex(0);
    face.addIndex(1);
    face.addIndex(face.getNumVertices() - 1);
    face.addIndex(face.getNumVertices() - 2);
    face.addIndex(2);

    line.addIndex(line.getNumVertices() - 1);
    line.addIndex(1);
    line.addIndex(line.getNumVertices() - 2);
    line.addIndex(0);

    ofColor color;
    color.setHsb(ofRandom(255), 130, 255);
    ofSetColor(color);
    face.draw();

    ofSetColor(255);
    line.drawWireframe();
    popMatrix();
  }

  this->cam.end();
}

//--------------------------------------------------------------
int main() {

  ofSetupOpenGL(720, 720, OF_WINDOW);
  ofRunApp(new ofApp());
}

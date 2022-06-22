// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Rotating number. Draw by openFrameworks
// https://junkiyoshi.com/2022/01/30/

class ofPolyline {
  PVector[] v;
}
ArrayList<ofPolyline[]> word;

final int source[] = {
  // openFrameworks側で取ったフォント0～9のアウトラインのxy座標をファイルにしたので
  // それをProcessing側で読み込む。
  // フォント：0  1  2  3  4  5  6  7  8  9のそれぞれのアウトラインの数を定義する。
  2, 1, 1, 1, 2, 1, 2, 1, 3, 2,
};
ofPolyline loadOutline(String path) {
  ofPolyline vertices = new ofPolyline();
  String[] lines = loadStrings(path);
  PVector[] v = new PVector[lines.length];
  for (int i = 0; i < v.length; i++) {
    String s = lines[i];
    String[] units = splitTokens(s, ", ");
    PVector p = new PVector(float(units[0]), float(units[1]));
    v[i] = p;
  }
  vertices.v = v;
  return vertices;
}

void preload() {
  // アウトラインのxy座標を定義した0_x.txt～9_x.txtを読み込む。
  word = new ArrayList();
  for (int i = 0; i < source.length; i++) {
    int outlineNum = source[i];
    ofPolyline[] outline = new ofPolyline[outlineNum];
    for (int outline_index = 0; outline_index < outlineNum; outline_index++) {
      String path = "data/";
      path += i + "_" + outline_index + ".txt";
      ofPolyline vertices = loadOutline(path);
      outline[outline_index] = vertices;
    }
    word.add(outline);
  }
}

//--------------------------------------------------------------
void setup() {
  preload();
}

//--------------------------------------------------------------
void draw() {
  ofBackground(0);
  ofSetLineWidth(2);

  this->cam.begin();

  vector<string> word_list = {
    "0", "1", "2", "3",
    "6", "5", "4",
    "7", "8", "9", "0"
  };

  for (int base_deg = 0; base_deg < 360; base_deg += 15) {

    for (int y = -120; y <= 180; y += 60) {

      int word_index = ofMap(ofNoise(ofRandom(1000), ofGetFrameNum() * 0.005), 0, 1, 0, word_list.size());
      auto word = word_list[word_index];

      vector<ofPath> word_path = this->font.getStringAsPoints(word, true, false);
      for (int word_index = 0; word_index < word_path.size(); word_index++) {

        vector<ofPolyline> outline = word_path[word_index].getOutline();
        for (int outline_index = 0; outline_index < outline.size(); outline_index++) {

          outline[outline_index] = outline[outline_index].getResampledBySpacing(2);
          vector<glm::vec3> vertices = outline[outline_index].getVertices();
          vector<glm::vec3> mesh_vertices;
          vector<glm::vec3> base_location_list;
          vector<glm::highp_mat4x4> rotate_vertices;

          for (int vertices_index = 0; vertices_index < vertices.size(); vertices_index++) {

            auto base_location = glm::vec3(0, y, 200);
            base_location += glm::vec3(this->font.stringWidth(word_list[word_index]) * 0.5, this->font.stringHeight(word_list[word_index]) * 0.5, 0);

            auto noise_value = ofNoise(base_location.y * 0.08, ofGetFrameNum() * 0.005);
            auto deg = base_deg;
            if (noise_value > 0.75) {

              deg = base_deg + ofMap(noise_value, 0.75, 1, 0, 360);
            } else if (noise_value < 0.35) {

              deg = base_deg + ofMap(noise_value, 0, 0.35, -360, 0);
            }


            auto rotation = glm::rotate(glm::mat4(), (float)(deg * DEG_TO_RAD), glm::vec3(0, 1, 0));
            auto location = vertices[vertices_index] - glm::vec3(this->font.stringWidth(word_list[word_index]) * 1.5, this->font.stringHeight(word_list[word_index]) * -1.5, 0);
            location.x *= -1;

            mesh_vertices.push_back(location);
            rotate_vertices.push_back(rotation);
            base_location_list.push_back(base_location);
          }

          ofMesh face, line;
          line.setMode(ofPrimitiveMode::OF_PRIMITIVE_LINES);
          for (int k = 0; k < mesh_vertices.size(); k++) {

            face.addVertex(glm::vec4(base_location_list[k], 0) * rotate_vertices[k] + glm::vec4(mesh_vertices[k] + glm::vec3(0, 0, -15), 0) * -rotate_vertices[k]);
            face.addVertex(glm::vec4(base_location_list[k], 0) * rotate_vertices[k] + glm::vec4(mesh_vertices[k] + glm::vec3(0, 0, 15), 0) * -rotate_vertices[k]);

            line.addVertex(glm::vec4(base_location_list[k], 0) * rotate_vertices[k] + glm::vec4(mesh_vertices[k] + glm::vec3(0, 0, -15), 0) * -rotate_vertices[k]);
            line.addVertex(glm::vec4(base_location_list[k], 0) * rotate_vertices[k] + glm::vec4(mesh_vertices[k] + glm::vec3(0, 0, 15), 0) * -rotate_vertices[k]);

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

            line.addIndex(line.getNumVertices() - 1);
            line.addIndex(line.getNumVertices() - 2);
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

          ofSetColor(0);
          face.draw();

          ofSetColor(0, 255, 255);
          line.drawWireframe();
        }
      }
    }
  }

  this->cam.end();
}

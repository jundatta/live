// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Rotating number. Draw by openFrameworks
// https://junkiyoshi.com/2022/01/30/

class ofPolyline {
  PVector[] v;
  PVector[] getVertices() {
    return v;
  }
}
ArrayList<ofPolyline[]> word;

final float fontStringWidth = 37;
final float fontStringHeight = 51;

final int source[] = {
  // openFrameworks側で取ったフォント0～9のアウトラインのxy座標をファイルにしたので
  // それをProcessing側で読み込む。
  // フォント：0  1  2  3  4  5  6  7  8  9のそれぞれのアウトラインの数を定義する。
  2, 1, 1, 1, 2, 1, 2, 1, 3, 2,
};
ofPolyline loadOutline(String path) {
  ofPolyline vertices = new ofPolyline();
  String[] lines = loadStrings(path); //<>//
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
  size(720, 720, P3D);
  preload();
  strokeWeight(2);
}

class ofMesh {
  ArrayList<PVector> vertices;
  ArrayList<Integer> indices;
  ofMesh() {
    vertices = new ArrayList();
    indices = new ArrayList();
  }
  void addVertex(PVector v) {
    vertices.add(v);
  }
  void addIndex(int i) {
    indices.add(i);
  }
  int getNumVertices() {
    return vertices.size();
  }
  void drawWireframe() {
    beginShape(LINES);
    for (int index : indices) {
      PVector v = vertices.get(index);
      vertex(v.x, v.y, v.z);
    }
    endShape();
  }
}

PVector rotateVertex(PMatrix3D r, PVector base, PVector mesh, PVector vec3) {
  PVector p0 = r.mult(base, null);
  PVector p1 = PVector.add(mesh, vec3);
  PVector p2 = r.mult(p1, null);
  p2.mult(-1);
  PVector p3 = PVector.add(p0, p2);
  return p3;
}

//--------------------------------------------------------------
void draw() {
  translate(width/2, height/2);
  background(0);

  for (int base_deg = 0; base_deg < 360; base_deg += 15) {
    for (int y = -120; y <= 180; y += 60) {
      int word_index = (int)map(openFrameworks.ofNoise(random(1000), frameCount * 0.005), 0, 1, 0, 10);

      ofPolyline[] outline = word.get(word_index);
      for (int outline_index = 0; outline_index < outline.length; outline_index++) {
        PVector[] vertices = outline[outline_index].getVertices();
        PVector[] mesh_vertices = new PVector[vertices.length];
        PVector[] base_location_list = new PVector[vertices.length];
        PMatrix3D[] rotate_vertices = new PMatrix3D[vertices.length];

        for (int vertices_index = 0; vertices_index < vertices.length; vertices_index++) {
          var base_location = new PVector(0, y, 200);
          base_location.x += fontStringWidth * 0.5;
          base_location.y += fontStringHeight * 0.5;


          var noise_value = openFrameworks.ofNoise(base_location.y * 0.08, frameCount * 0.005);
          var deg = base_deg;
          if (noise_value > 0.75) {
            deg = base_deg + (int)map(noise_value, 0.75, 1, 0, 360);
          } else if (noise_value < 0.35) {
            deg = base_deg + (int)map(noise_value, 0, 0.35, -360, 0);
          }


          //auto rotation = glm::rotate(glm::mat4(), (float)(deg * DEG_TO_RAD), glm::vec3(0, 1, 0));
          PMatrix3D rotation = new PMatrix3D();
          rotation.rotateY(deg * DEG_TO_RAD);
          //auto location = vertices[vertices_index] - glm::vec3(fontStringWidth * 1.5, fontStringHeight * -1.5, 0);
          var location = new PVector(vertices[vertices_index].x, vertices[vertices_index].y);
          location.x -= fontStringWidth * 1.5;
          location.y -= fontStringHeight * -1.5;
          location.x *= -1;

          mesh_vertices[vertices_index] = location;
          rotate_vertices[vertices_index] = rotation;
          base_location_list[vertices_index] = base_location;
        }

        ofMesh face, line;
        face = new ofMesh();
        line = new ofMesh();
        //line.setMode(ofPrimitiveMode::OF_PRIMITIVE_LINES);
        for (int k = 0; k < mesh_vertices.length; k++) {
          //face.addVertex(glm::vec4(base_location_list[k], 0) * rotate_vertices[k] + glm::vec4(mesh_vertices[k] + glm::vec3(0, 0, -15), 0) * -rotate_vertices[k]);
          //face.addVertex(glm::vec4(base_location_list[k], 0) * rotate_vertices[k] + glm::vec4(mesh_vertices[k] + glm::vec3(0, 0, 15), 0) * -rotate_vertices[k]);
          PVector face0 = rotateVertex(rotate_vertices[k], base_location_list[k], mesh_vertices[k], new PVector(0, 0, -15));
          face.addVertex(face0);
          PVector face1 = rotateVertex(rotate_vertices[k], base_location_list[k], mesh_vertices[k], new PVector(0, 0, 15));
          face.addVertex(face1);

          //line.addVertex(glm::vec4(base_location_list[k], 0) * rotate_vertices[k] + glm::vec4(mesh_vertices[k] + glm::vec3(0, 0, -15), 0) * -rotate_vertices[k]);
          //line.addVertex(glm::vec4(base_location_list[k], 0) * rotate_vertices[k] + glm::vec4(mesh_vertices[k] + glm::vec3(0, 0, 15), 0) * -rotate_vertices[k]);
          PVector line0 = rotateVertex(rotate_vertices[k], base_location_list[k], mesh_vertices[k], new PVector(0, 0, -15));
          line.addVertex(line0);
          PVector line1 = rotateVertex(rotate_vertices[k], base_location_list[k], mesh_vertices[k], new PVector(0, 0, 15));
          line.addVertex(line1);

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

        //ofSetColor(0);
        //face.draw();

        stroke(0, 255, 255);
        noFill();
        line.drawWireframe();
      }
    }
  }
}

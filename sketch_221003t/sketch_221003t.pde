// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Crevice torus. Draw by openFrameworks
// https://junkiyoshi.com/2022/01/27/
class MESH {
  ArrayList<PVector> vertices;
  IntList colors;
  IntList indices;

  MESH() {
    vertices = new ArrayList();
    colors = new IntList();
    indices = new IntList();
  }
  void clear() {
    vertices.clear();
    colors.clear();
    indices.clear();
  }
  void addVertices(ArrayList<PVector> vertices) {
    for (PVector v : vertices) {
      this.vertices.add(v);
    }
  }
  int getNumVertices() {
    return vertices.size();
  }
  void addColor(color c) {
    colors.append(c);
  }
  void addIndex(int ix) {
    indices.append(ix);
  }
  // 設定されたOF_PRIMITIVE_LINESの解釈で描画する
  void drawWireframe() {
    PShape sh = createShape();
    sh.setFill(false);
    sh.beginShape(LINES);
    for (int i : indices) {
      PVector v = vertices.get(i);
      sh.vertex(v.x, v.y, v.z);
    }
    sh.endShape();
    for (int i = 0; i < indices.size(); i++) {
      int idx = indices.get(i);
      color col = colors.get(idx);
      sh.setStroke(i, col);
    }
    shape(sh);
  }
  // デフォルトのOF_PRIMITIVE_TRIANGLESの解釈で描画する
  void draw() {
    PShape sh = createShape();
    sh.setStroke(false);
    sh.beginShape(TRIANGLES);
    for (int i : indices) {
      PVector v = vertices.get(i);
      sh.vertex(v.x, v.y, v.z);
    }
    sh.endShape();
    for (int i = 0; i < indices.size(); i++) {
      int idx = indices.get(i);
      color col = colors.get(idx);
      sh.setFill(i, col);
    }
    shape(sh);
  }
}
MESH face, line;

//--------------------------------------------------------------
void setup() {
  size(720, 720, P3D);

  face = new MESH();
  line = new MESH();
}

//--------------------------------------------------------------
void update() {
  translate(width/2, height/2);

  background(255, 0, 0);
  strokeWeight(3);

  randomSeed(39);

  face.clear();
  line.clear();

  float R = 250;
  float r = R * 0.25;
  float u_span = 20;

  for (float u = 0; u < 360; u += u_span) {
    var noise_seed = random(1000);
    for (float v = 0; v < 360; v += 3) {
      PVector p = make_point(R, r, u, v).mult(0.005);
      var noise_value = openFrameworks.ofNoise(noise_seed + frameCount * 0.05, p.x, p.y, p.z);
      if (noise_value < 0.45) {
        continue;
      }

      p = make_point(R, r, u, v - 1.5).mult(0.005);
      var prev_noise_value = openFrameworks.ofNoise(noise_seed + frameCount * 0.05, p.x, p.y, p.z);
      p = make_point(R, r, u, v + 1.5).mult(0.005);
      var next_noise_value = openFrameworks.ofNoise(noise_seed + frameCount * 0.05, p.x, p.y, p.z);

      ArrayList<PVector> vertices = new ArrayList();
      vertices.add(make_point(R, r, u - u_span * 0.5 + 1, v - 1.5));
      vertices.add(make_point(R, r, u + u_span * 0.5 - 1, v - 1.5));
      vertices.add(make_point(R, r, u + u_span * 0.5 - 1, v + 1.5));
      vertices.add(make_point(R, r, u - u_span * 0.5 + 1, v + 1.5));

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
void draw() {
  update();

  rotateY(radians(frameCount * 0.6666666666666666));

  line.drawWireframe();
  face.draw();
}

//--------------------------------------------------------------
PVector make_point(float R, float r, float u, float v) {
  // 数学デッサン教室 描いて楽しむ数学たち　P.31

  u *= DEG_TO_RAD;
  v *= DEG_TO_RAD;

  var x = (R + r * cos(u)) * cos(v);
  var y = (R + r * cos(u)) * sin(v);
  var z = r * sin(u);

  return new PVector(x, y, z);
}

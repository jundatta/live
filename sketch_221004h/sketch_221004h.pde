// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Half rectangle. Draw by openFrameworks
// https://junkiyoshi.com/2022/01/18/
//

ofMesh face;

//--------------------------------------------------------------
void setup() {
  size(720, 720, P3D);

  face = new ofMesh();
}

//--------------------------------------------------------------
void update() {
  face.clear();

  int len = 300;
  int width = 1;
  for (int y = -1500; y <= 150; y += width) {
    int start_param = (int)map(openFrameworks.ofNoise(y * 0.0008, frameCount * 0.005), 0, 1, 0, 720);
    int end_param = start_param + 70;

    for (int param = start_param; param <= end_param; param++) {
      ArrayList<PVector> vertices = new ArrayList();
      PVector p = make_point(len, param);
      vertices.add(new PVector(p.x, p.y, width * 0.5 + y));
      p = make_point(len, param);
      vertices.add(new PVector(p.x, p.y, width * -0.5 + y));

      face.addVertices(vertices);

      float value = 0;
      if (y < -500) {
        value = map(y, -500, -1500, 0, 255);
      }

      face.addColor(color(value));
      face.addColor(color(value));

      if (param > start_param) {
        face.addIndex(face.getNumVertices() - 1);
        face.addIndex(face.getNumVertices() - 2);
        face.addIndex(face.getNumVertices() - 4);
        face.addIndex(face.getNumVertices() - 1);
        face.addIndex(face.getNumVertices() - 3);
        face.addIndex(face.getNumVertices() - 4);
      }
    }
  }
}

//--------------------------------------------------------------
void draw() {
  update();

  translate(width/2, height/2);
  
  background(255);
  strokeWeight(2);

  face.draw();
}

//--------------------------------------------------------------
PVector make_point(int len, int param) {
  param = param % 100;
  if (param < 25) {
    return new PVector(map(param, 0, 25, -len * 0.5, len * 0.5), -len * 0.5);
  }
  if (param < 50) {
    return new PVector(len * 0.5, map(param, 25, 50, -len * 0.5, len * 0.5));
  }
  if (param < 75) {
    return new PVector(map(param, 50, 75, len * 0.5, -len * 0.5), len * 0.5);
  }
  return new PVector(-len * 0.5, map(param, 75, 100, len * 0.5, -len * 0.5));
}

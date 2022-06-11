// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Spherical pillar. Draw by openFrameworks
// https://junkiyoshi.com/2022/02/02/

class ofMeshFace {
  PVector[] vertices;
  ofMeshFace(PVector v0, PVector v1, PVector v2) {
    vertices = new PVector[3];
    vertices[0] = v0;
    vertices[1] = v1;
    vertices[2] = v2;
  }
  PVector getVertex(int index) {
    return vertices[index];
  }
}
ofMeshFace[] triangle_list;
ofMeshFace[] loadTriangleList(String filePath) {
  String[] lines = loadStrings(filePath);
  float[] vertices = new float[lines.length];
  for (int i = 0; i < lines.length; i++) {
    String s = lines[i];
    vertices[i] = float(s);
  }

  ofMeshFace[] triangleList = new ofMeshFace[vertices.length / (3 * 3)];
  for (int i = 0; i < vertices.length; i += (3 * 3)) {
    PVector v0 = new PVector(vertices[i + (0*3+0)], vertices[i + (0*3+1)], vertices[i + (0*3+2)]);
    PVector v1 = new PVector(vertices[i + (1*3+0)], vertices[i + (1*3+1)], vertices[i + (1*3+2)]);
    PVector v2 = new PVector(vertices[i + (2*3+0)], vertices[i + (2*3+1)], vertices[i + (2*3+2)]);
    triangleList[i / (3 * 3)] = new ofMeshFace(v0, v1, v2);
  }
  return triangleList;
}

class ofMesh {
  ArrayList<PVector> vertices;
  ArrayList<Integer> indices;
  ofMesh() {
    vertices = new ArrayList();
    indices = new ArrayList();
  }
  void addVertices(ArrayList<PVector> vs) {
    vertices.addAll(v);
  }
  void addIndex(int index) {
    indices.add(index);
  }
  void addTriangle(int i0, int i1, int i2) {
    addIndex(i0);
    addIndex(i1);
    addIndex(i2);
  }
  int getNumVertices() {
    return vertices.size();
  }
}

//--------------------------------------------------------------
void setup() {
  size(720, 720, P3D);

  //auto ico_sphere = ofIcoSpherePrimitive(300, 3);
  //triangle_list.insert(triangle_list.end(), ico_sphere.getMesh().getUniqueFaces().begin(), ico_sphere.getMesh().getUniqueFaces().end());
  triangle_list = loadTriangleList("triangle_list.txt");

  frame.setMode(ofPrimitiveMode::OF_PRIMITIVE_LINES);
}

//--------------------------------------------------------------
void update() {

  mesh.clear();
  frame.clear();

  for (float radius = 150; radius <= 300; radius += 10) {

    for (int i = 0; i < triangle_list.size(); i++) {

      PVector avg = (triangle_list[i].getVertex(0) + triangle_list[i].getVertex(1) + triangle_list[i].getVertex(2)) / 3;
      var noise_value = openFrameworks.ofNoise(avg.y * 0.0065 + ofGetFrameNum() * 0.035, avg.x * 0.0025, avg.z * 0.0025);

      if (noise_value < 0.35) {
        noise_value = 0;
      } else if (noise_value > 0.7) {
        noise_value = 1;
      } else {
        noise_value = map(noise_value, 0.35, 0.7, 0, 1);
      }

      ArrayList<PVector> vertices;

      vertices.push_back(glm::normalize(triangle_list[i].getVertex(0)) * (radius + 5) - avg);
      vertices.push_back(glm::normalize(triangle_list[i].getVertex(1)) * (radius + 5) - avg);
      vertices.push_back(glm::normalize(triangle_list[i].getVertex(2)) * (radius + 5) - avg);

      vertices.push_back(glm::normalize(triangle_list[i].getVertex(0)) * (radius - 5) - avg);
      vertices.push_back(glm::normalize(triangle_list[i].getVertex(1)) * (radius - 5) - avg);
      vertices.push_back(glm::normalize(triangle_list[i].getVertex(2)) * (radius - 5) - avg);

      for (var vertex : vertices) {

        vertex *= noise_value;
        vertex += avg;
      }

      mesh.addVertices(vertices);
      frame.addVertices(vertices);

      for (int k = 0; k < 6; k++) {

        mesh.addColor(ofColor(0));
        frame.addColor(ofColor(255));
      }

      mesh.addTriangle(mesh.getNumVertices() - 1, mesh.getNumVertices() - 2, mesh.getNumVertices() - 3);
      mesh.addTriangle(mesh.getNumVertices() - 4, mesh.getNumVertices() - 5, mesh.getNumVertices() - 6);

      mesh.addTriangle(mesh.getNumVertices() - 1, mesh.getNumVertices() - 2, mesh.getNumVertices() - 5);
      mesh.addTriangle(mesh.getNumVertices() - 1, mesh.getNumVertices() - 5, mesh.getNumVertices() - 4);

      mesh.addTriangle(mesh.getNumVertices() - 1, mesh.getNumVertices() - 3, mesh.getNumVertices() - 6);
      mesh.addTriangle(mesh.getNumVertices() - 1, mesh.getNumVertices() - 6, mesh.getNumVertices() - 4);

      mesh.addTriangle(mesh.getNumVertices() - 2, mesh.getNumVertices() - 3, mesh.getNumVertices() - 6);
      mesh.addTriangle(mesh.getNumVertices() - 2, mesh.getNumVertices() - 6, mesh.getNumVertices() - 5);

      if (radius == 150) {

        frame.addIndex(frame.getNumVertices() - 1);
        frame.addIndex(frame.getNumVertices() - 2);
        frame.addIndex(frame.getNumVertices() - 2);
        frame.addIndex(frame.getNumVertices() - 3);
        frame.addIndex(frame.getNumVertices() - 1);
        frame.addIndex(frame.getNumVertices() - 3);
      }

      if (radius == 300) {

        frame.addIndex(frame.getNumVertices() - 4);
        frame.addIndex(frame.getNumVertices() - 5);
        frame.addIndex(frame.getNumVertices() - 5);
        frame.addIndex(frame.getNumVertices() - 6);
        frame.addIndex(frame.getNumVertices() - 4);
        frame.addIndex(frame.getNumVertices() - 6);
      }

      frame.addIndex(frame.getNumVertices() - 1);
      frame.addIndex(frame.getNumVertices() - 4);
      frame.addIndex(frame.getNumVertices() - 2);
      frame.addIndex(frame.getNumVertices() - 5);
      frame.addIndex(frame.getNumVertices() - 3);
      frame.addIndex(frame.getNumVertices() - 6);
    }
  }
}

//--------------------------------------------------------------
void draw() {
  update();
  background(0);

  rotateY(radians(frameCount * 0.333333333333333333));

  fill(239);
  mesh.drawFaces();

  stroke(39);
  frame.drawWireframe();
}

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

void setup() {
  size(1112, 834);
  triangle_list = loadTriangleList("triangle_list.txt");
  println(triangle_list.length);
  var t = triangle_list[triangle_list.length-1];
  println(t.getVertex(0));
  println(t.getVertex(1));
  println(t.getVertex(2));
}
void draw() {
}

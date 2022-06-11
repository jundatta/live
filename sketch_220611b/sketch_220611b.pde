class ofMeshFace {
  PVector[] vertex;
  ofMeshFace(PVector v0, PVector v1, PVector v2) {
    vertex = new PVector[3];
    vertex[0] = v0;
    vertex[1] = v1;
    vertex[2] = v2;
  }
  PVector getVertex(int index) {
    return vertex[index];
  }
}
ofMeshFace[] triangle_list;
ofMeshFace[] loadTriangleList(String filePath) {
  String[] lines = loadStrings(filePath);
  println(lines.length);
  float[] vertex = new float[lines.length];
  for (int i = 0; i < lines.length; i++) {
    String s = lines[i];
    vertex[i] = float(s);
  }

  ofMeshFace[] triangleList = new ofMeshFace[vertex.length / (3 * 3)];
  for (int i = 0; i < vertex.length; i += (3 * 3)) {
    PVector v0 = new PVector(vertex[i + (0*3+0)], vertex[i + (0*3+1)], vertex[i + (0*3+2)]);
    PVector v1 = new PVector(vertex[i + (1*3+0)], vertex[i + (1*3+1)], vertex[i + (1*3+2)]);
    PVector v2 = new PVector(vertex[i + (2*3+0)], vertex[i + (2*3+1)], vertex[i + (2*3+2)]);
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

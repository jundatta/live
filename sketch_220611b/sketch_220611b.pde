void setup() {
  size(1112, 834);
  String[] lines = loadStrings("triangle_list.txt");
  println(lines.length);
  float[] vertex = new float[lines.length];
  for (int i = 0; i < lines.length; i++) {
    String s = lines[i];
    vertex[i] = float(s);
  }
  for (float v : vertex) {
    println(v);
  }
}
void draw() {
}

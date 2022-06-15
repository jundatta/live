void setup() {
  size(640, 480);
  String[] lines = loadStrings("0_0.txt");
  for (String s : lines) {
    String[] units = splitTokens(s, ", ");
    for (String u : units) {
      println(u);
    }
  }
}
void draw() {
}

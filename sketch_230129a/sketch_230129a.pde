ArrayList<ofOutline> outlineWords;
void setup() {
  size(400, 400, P3D);
  noStroke();
  fill(255);

  outlineWords = openFrameworksOutline.ofOutline();
}
void draw() {
  translate(width/2, height/2);
  float s = 1.0f;
  scale(s, -s, s);
  translate(0, -50);
  background(0);
  rotateX(radians(180));

  for (int i = 0; i < outlineWords.size(); i++) {
    ofOutline ow = outlineWords.get(i);
    beginShape();
    for (ofOutlineCoord oc : ow.coord) {
      for (PVector vertex : oc.vertices) {
        final int font_size = 80;
        float fs = font_size * 0.5f;
        //auto location = vertex - glm::vec3(this->font_size * 0.5, this->font_size * -0.5, 320);
        PVector location = new PVector(vertex.x - fs, vertex.y - fs, 320);
        //auto rotation_y = glm::rotate(glm::mat4(), (i * 13.5f) * (float)DEG_TO_RAD, glm::vec3(0, 1, 0));
        //location = glm::vec4(location, 0) * rotation_y;
        PMatrix3D rotation_y = new PMatrix3D();
        rotation_y.rotateY(radians(i * 13.5f));
        location = rotation_y.mult(location, null);
        vertex(location.x, location.y, location.z);
      }
    }
    endShape(CLOSE);
  }
}

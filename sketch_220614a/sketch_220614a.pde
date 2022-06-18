// 【作者】中内　純(ハンドルネーム：JunKiyoshi)
// 【作品名】Arrows on the numbers. Draw by openFrameworks
// https://junkiyoshi.com/2022/02/03/

final int font_size = 550;

class ofPolyline {
  PVector[] v;
}
ArrayList<ofPolyline[]> word;

void setup() {
  size(720, 720, P3D);

  word = new ArrayList();
}

//--------------------------------------------------------------
void draw() {
  background(255);
  strokeWeight(4);

  //  ofTranslate(ofGetWindowSize() * 0.5 + glm::vec2(this->font_size * -0.4, this->font_size * 0.5));
  float translateX = width * 0.5 + font_size * (-0.4);
  float translateY = height * 0.5 + font_size * 0.5;
  translate(translateX, translateY);

  int word_index = (int)((frameCount / 54.0f) % (float)word.size());
  ofPolyline[] outline = word.get(word_index);
  for (int outline_index = 0; outline_index < outline.length; outline_index++) {
    ofPolyline vertices = outline[outline_index];
    for (int i = 0; i < vertices.v.length; i++) {
      int param = frameCount % 5;
      if (i < vertices.v.length - 1) {
        //        var gap = vertices.v[i + 1] - vertices.v[i];
        PVector gap = new PVector(vertices.v[i + 1].x, vertices.v[i + 1].y);
        gap.sub(vertices.v[i]);
        //var location = vertices.v[i] + gap * map(param, 0, 5, 0, 1);
        PVector location = new PVector(vertices.v[i].x, vertices.v[i].y);
        gap.mult(map(param, 0, 5, 0, 1));
        location.add(gap);
        draw_arrow(location, vertices.v[i + 1], 18, color(0));
      }
    }
  }
}

//--------------------------------------------------------------
void draw_arrow(PVector location, PVector target, float size, color no_fill_color) {
  var angle = atan2(target.y - location.y, target.x - location.x);
  stroke(no_fill_color);
  noFill();
  beginShape();
  PVector p0 = new PVector(size * 0.5 * cos(angle + PI * 0.5), size * 0.5 * sin(angle + PI * 0.5));
  p0.mult(0.25);
  PVector p00 = new PVector(size * cos(angle), size * sin(angle));
  p00.mult(0.5);
  p0.sub(p00);
  p0.add(location);
  vertex(p0.x, p0.y);
  PVector p1 = new PVector(size * 0.5 * cos(angle + PI * 0.5), size * 0.5 * sin(angle + PI * 0.5));
  p1.mult(0.25);
  p1.add(location);
  vertex(p1.x, p1.y);
  PVector p2 = new PVector(size * 0.5 * cos(angle + PI * 0.5), size * 0.5 * sin(angle + PI * 0.5));
  p2.add(location);
  vertex(p2.x, p2.y);
  PVector p3 = new PVector(size * cos(angle), size * sin(angle));
  p3.add(location);
  vertex(p3.x, p3.y);
  PVector p4 = new PVector(size * 0.5 * cos(angle - PI * 0.5), size * 0.5 * sin(angle - PI * 0.5));
  p4.add(location);
  vertex(p4.x, p4.y);
  PVector p5 = new PVector(size * 0.5 * cos(angle - PI * 0.5), size * 0.5 * sin(angle - PI * 0.5));
  p5.mult(0.25);
  p5.add(location);
  vertex(p5.x, p5.y);
  PVector p6 = new PVector(size * 0.5 * cos(angle - PI * 0.5), size * 0.5 * sin(angle - PI * 0.5));
  p6.mult(0.25);
  PVector p66 = new PVector(size * cos(angle), size * sin(angle));
  p66.mult(0.5);
  p6.sub(p66);
  p6.add(location);
  vertex(p6.x, p6.y);
  endShape(CLOSE);
}

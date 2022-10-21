// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Glitter. Draw by openFrameworks
// https://junkiyoshi.com/2021/12/14/

color[] color_list;
ofMesh mesh = new ofMesh();
PGraphics pg;

//--------------------------------------------------------------
void setup() {
  size(720, 720, P3D);

  pg = createGraphics(width, height);
  push();
  colorMode(HSB, 256, 256, 256);
  int color_count = 12;
  color_list = new color[color_count];
  for (int i = 0; i < color_count; i++) {
    color c = color(map(i, 0, color_count, 0, 255), 150, 200);
    color_list[i] = c;
  }
  pop();
}

//--------------------------------------------------------------
void update() {
  randomSeed(39);

  mesh.clear();

  int radius = 540;
  int span = 30;

  for (int i = 0; i < color_list.length; i++) {
    int deg_start = i % 3;
    for (int deg = deg_start; deg < deg_start + 360; deg += 3) {
      var tmp_radius = (int)(random(radius)  + ofGetFrameNum() * 2) % radius;
      mesh.addVertex(new PVector(tmp_radius * cos(deg * DEG_TO_RAD), tmp_radius * sin(deg * DEG_TO_RAD), 0));
      color c = color_list[i];
      mesh.addColor(color(red(c), green(c), blue(c), 0));
    }
  }

  for (int i = 0; i < mesh.getNumVertices(); i++) {
    for (int k = i + 1; k < mesh.getNumVertices(); k++) {
      var distance = PVector.dist(mesh.getVertex(i), mesh.getVertex(k));
      if (distance < span) {
        var alpha = distance < span * 0.25 ? 255 : map(distance, span * 0.25, span, 255, 0);
        if (alpha(mesh.getColor(i)) < alpha) {
          color c = mesh.getColor(i);
          mesh.setColor(i, color(red(c), green(c), blue(c), alpha));
        }
        if (alpha(mesh.getColor(k)) < alpha) {
          color c = mesh.getColor(k);
          mesh.setColor(k, color(red(c), green(c), blue(c), alpha));
        }
        mesh.addIndex(i);
        mesh.addIndex(k);
      }
    }
  }
}

//--------------------------------------------------------------
void draw() {
  update();
  //translate(width/2, height/2);
  pg.beginDraw();
  pg.background(0);
  pg.blendMode(ADD);

  pg.translate(width * 0.5, height * 0.5);

  mesh.drawWireframe(pg);

  pg.noStroke();
  for (int i = 0; i < mesh.getNumVertices(); i++) {
    color c = mesh.getColor(i);
    pg.fill(red(c), green(c), blue(c), alpha(c));
    PVector p = mesh.getVertex(i);
    pg.circle(p.x, p.y, /*1.85*/ 10*2);
  }
  pg.endDraw();
  image(pg, 0, 0);
}

// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Sun and sea. Draw by openFrameworks
// https://junkiyoshi.com/2022/01/05/

ofMesh mesh;

//--------------------------------------------------------------
void setup() {
  size(720, 720, P3D);

  mesh = new ofMesh();
}

//--------------------------------------------------------------
void update() {
  randomSeed(39);

  mesh.clear();

  int span = 6;
  PVector seed = new PVector(random(1000), random(1000), random(1000));
  for (int x = -500; x <= 500; x += span) {
    for (int y = -300; y <= 300; y += span) {
      ArrayList<PVector> vertices = new ArrayList();
      vertices.add(rotate(seed, new PVector(x, y, 0)));
      vertices.add(rotate(seed, new PVector(x + span, y, 0)));
      vertices.add(rotate(seed, new PVector(x + span, y + span, 0)));
      vertices.add(rotate(seed, new PVector(x, y + span, 0)));

      for (PVector vertex : vertices) {
        vertex.z = map(vertex.z, -5, 5, -30, 30);
      }

      mesh.addVertices(vertices);

      mesh.addIndex(mesh.getNumVertices() - 1);
      mesh.addIndex(mesh.getNumVertices() - 2);
      mesh.addIndex(mesh.getNumVertices() - 3);
      mesh.addIndex(mesh.getNumVertices() - 1);
      mesh.addIndex(mesh.getNumVertices() - 3);
      mesh.addIndex(mesh.getNumVertices() - 4);
    }
  }
}

//--------------------------------------------------------------
void draw() {
  update();

  translate(width/2, height/2);

  background(255);

  rotateX(radians(270));

  strokeWeight(1);

  mesh.drawLine(255);

  translate(0, 0, 0.01);

  mesh.drawLine(0);

  strokeWeight(3);

  translate(0, 400, 0);
  rotateX(radians(90));

  noFill();
  stroke(0);
  circle(0, 0, 250);

  fill(255);
  circle(0, 0, 249.5);
}

//--------------------------------------------------------------
PVector rotate(PVector seed, PVector location) {
  float deg_x = map(openFrameworks.ofNoise(seed.x, location.x * 0.003, location.y * 0.003 + frameCount * 0.0085), 0, 1, -180, 180);
  float deg_y = map(openFrameworks.ofNoise(seed.y, location.x * 0.003, location.y * 0.003 + frameCount * 0.0085), 0, 1, -180, 180);
  float deg_z = map(openFrameworks.ofNoise(seed.z, location.x * 0.003, location.y * 0.003 + frameCount * 0.0085), 0, 1, -180, 180);

  //auto rotation_x = glm::rotate(glm::mat4(), deg_x * (float)DEG_TO_RAD, glm::vec3(1, 0, 0));
  deg_x = radians(deg_x);
  PMatrix3D rotation_x = new PMatrix3D(
    1.0f, 0.0f, 0.0f, 0.0f,
    0.0f, cos(deg_x), -sin(deg_x), 0.0f,
    0.0f, sin(deg_x), cos(deg_x), 0.0f,
    0.0f, 0.0f, 0.0f, 1.0f);
  //auto rotation_y = glm::rotate(glm::mat4(), deg_y * (float)DEG_TO_RAD, glm::vec3(0, 1, 0));
  deg_y = radians(deg_y);
  PMatrix3D rotation_y = new PMatrix3D(
    cos(deg_y), 0.0f, sin(deg_y), 0.0f,
    0.0f, 1.0f, 0.0f, 0.0f,
    -sin(deg_y), 0.0f, cos(deg_y), 0.0f,
    0.0f, 0.0f, 0.0f, 1.0f);
  //auto rotation_z = glm::rotate(glm::mat4(), deg_z * (float)DEG_TO_RAD, glm::vec3(0, 0, 1));
  deg_z = radians(deg_z);
  PMatrix3D rotation_z = new PMatrix3D(
    cos(deg_z), -sin(deg_z), 0.0f, 0.0f,
    sin(deg_z), cos(deg_z), 0.0f, 0.0f,
    0.0f, 0.0f, 1.0f, 0.0f,
    0.0f, 0.0f, 0.0f, 1.0f);

  PVector tmp = new PVector(5 * cos(radians(0)), 5 * sin(radians(0)), 0);
  //tmp = glm::vec4(tmp, 0) * rotation_z * rotation_y * rotation_x;
  PMatrix3D mat = new PMatrix3D();
  mat.apply(rotation_z);
  mat.apply(rotation_y);
  mat.apply(rotation_x);
  PVector ret = new PVector();
  ret.x = mat.multX(tmp.x, tmp.y, tmp.z);
  ret.y = mat.multY(tmp.x, tmp.y, tmp.z);
  ret.z = mat.multZ(tmp.x, tmp.y, tmp.z);

  //return location + tmp;
  return location.add(tmp);
}
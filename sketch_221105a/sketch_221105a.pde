// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】1 to 2, 2 to 1. Draw by openFrameworks
// https://junkiyoshi.com/2021/10/14/

PGraphics[] pixcels_list = new PGraphics[2];
//--------------------------------------------------------------
void setup() {
  size(720, 720, P3D);

  PFont font = createFont("HuiFont29.ttf", 195, true);

  PGraphics pg = createGraphics(320, 320);
  pg.beginDraw();
  pg.translate(pg.width * 0.5f, pg.height * 0.5f);
  pg.rectMode(CENTER);
  pg.background(0);
  pg.textFont(font);
  pg.fill(255);
  pg.text("壱", -130, 90);
  pg.noFill();
  pg.stroke(255);
  pg.rect(0, 0, 300, 300);
  pg.endDraw();
  pixcels_list[0] = pg;

  pg = createGraphics(320, 320);
  pg.beginDraw();
  pg.translate(pg.width * 0.5f, pg.height * 0.5f);
  pg.rectMode(CENTER);
  pg.background(0);
  pg.textFont(font);
  pg.fill(255);
  pg.text("零", -130, 90);
  pg.noFill();
  pg.stroke(255);
  pg.rect(0, 0, 300, 300);
  pg.endDraw();
  pixcels_list[1] = pg;
}

//--------------------------------------------------------------
void ofApp::update() {

  this->face_list.clear();

  int x_span = 20;
  int y_span = 5;

  for (int i = 0; i < 2; i++) {

    vector<ofMesh> mesh_list;
    for (int x = 0; x < 320; x += x_span) {

      ofMesh mesh;
      for (int y = 0; y < 320; y += y_span) {

        int index = mesh.getNumVertices();

        float z = -160;

        vector<glm::vec3> vertices;
        vertices.push_back(glm::vec3(x, y, z) - glm::vec3(160, 160, 0));
        vertices.push_back(glm::vec3(x + x_span, y, z) - glm::vec3(160, 160, 0));
        vertices.push_back(glm::vec3(x + x_span, y + y_span, z) - glm::vec3(160, 160, 0));
        vertices.push_back(glm::vec3(x, y + y_span, z) - glm::vec3(160, 160, 0));

        auto deg = (x / 3 + ofGetFrameNum()) % 360;
        if (deg < 90) {
          deg = 0;
        } else if (deg < 180) {
          deg = ofMap(deg, 90, 180, 0, 180);
        } else if (deg < 270) {
          deg = 180;
        } else if (deg < 360) {
          deg = ofMap(deg, 270, 360, 180, 360);
        }

        deg += i * 180;

        auto rotation_x = glm::rotate(glm::mat4(), deg * (float)DEG_TO_RAD, glm::vec3(1, 0, 0));
        for (auto& vertex : vertices) {

          vertex = glm::vec4(vertex, 0) * rotation_x;
        }

        mesh.addVertices(vertices);

        mesh.addTexCoord(glm::vec3(x, y, 0));
        mesh.addTexCoord(glm::vec3(x + x_span, y, 0));
        mesh.addTexCoord(glm::vec3(x + x_span, y + y_span, 0));
        mesh.addTexCoord(glm::vec3(x, y + y_span, 0));

        mesh.addIndex(index + 0);
        mesh.addIndex(index + 1);
        mesh.addIndex(index + 2);
        mesh.addIndex(index + 0);
        mesh.addIndex(index + 2);
        mesh.addIndex(index + 3);
      }

      mesh_list.push_back(mesh);
    }

    this->face_list.push_back(mesh_list);
  }
}

//--------------------------------------------------------------
void draw() {
  update();
  translate(width/2, height/2);

  ofBackground(239);
  ofSetLineWidth(2);
  rectMode(CENTER);

  this->cam.begin();
  ofRotateX(180);

  int i = 0;
  for (auto& mesh_list : this->face_list) {

    ofImage image;
    image.setFromPixels(this->pixcels_list[i++]);

    for (auto& mesh : mesh_list) {

      image.bind();
      mesh.draw();
      image.unbind();
    }
  }

  this->cam.end();
}

// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Numbers on the box. Draw by openFrameworks
// https://junkiyoshi.com/2023/02/07/

ArrayList<ArrayList<ofOutlineCoord>> path_list = new ArrayList();
//--------------------------------------------------------------
void setup() {
  size(720, 720, P3D);

  string word = "0123456789";
  ArrayList<ofOutline> outlineWords = openFrameworksOutline.ofOutline();
  String word = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  char[] charArray = word.toCharArray();
  for (char c : charArray) {
    for (ofOutline out : outlineWords) {
      if (c == out.code) {
        path_list.add(out.coord);
        break;
      }
    }
  }
}

//--------------------------------------------------------------
void update() {
  ofSeedRandom(39);
}

//--------------------------------------------------------------
void draw() {
  update();

  translate(width * 0.5f, height * 0.5f);

  background(0);
  ofSetLineWidth(2);
  colorMode(HSB, 255, 255, 255, 255);

  ofRotateY(ofGetFrameNum() * 0.333333333333);
  ofRotateX(ofGetFrameNum() * 0.666666666666);

  noFill();
  int len = 200;
  for (int i = 0; i < 8; i++) {
    if (i < 4) {
      ofRotateX(90);
    } else if (i < 5) {
      ofRotateY(90);
    } else {
      ofRotateY(180);
    }

    for (int k = 0; k < 30; k++) {
      ArrayList<ofOutlineCoord> outline = path_list.get(k % path_list.size());

      PVector location = new PVector(random(-len * 0.5, len * 0.5), random(-len * 0.5, len * 0.5), len * 0.5);
      int radius = (int)(random(1000) + ofGetFrameNum()) % 150 - 100;
      color ccc = color(random(255), 180, 255);

      float angle = random(-PI * 2, PI * 2);
      //auto rotation = glm::rotate(glm::mat4(), angle, glm::vec3(0, 0, 1));
      PMatrix3D rotation = new PMatrix3D();
      rotation.rotateZ(angle);

      if (radius > 0) {
        fill(color, radius > 25 ? (int)map(radius, 25, 50, 255, 0) : 255);
        beginShape();
        for (int outline_index = 0; outline_index < outline.size(); outline_index++) {
          beginContour();

          //outline[outline_index] = outline[outline_index].getResampledByCount(60);
          ArrayList<PVector> vertices = outline.get(i).vertices;

          for (int vertices_index = 0; vertices_index < vertices.size(); vertices_index++) {
            glm::vec3 vertex = location + glm::vec4(((vertices[vertices_index] - glm::vec2(25, -25)) / 50) * radius * 2, 0) * rotation;
            vertex.z += k;

            if (vertex.y > len * 0.5) {
              vertex.y = len * 0.5;
            }
            if (vertex.y < -len * 0.5) {
              vertex.y = -len * 0.5;
            }
            if (vertex.x > len * 0.5) {
              vertex.x = len * 0.5;
            }
            if (vertex.x < -len * 0.5) {
              vertex.x = -len * 0.5;
            }

            ofVertex(vertex);
          }
          endContour();
        }
        endShape(CLOSE);

        ofSetColor(color, radius > 25 ? ofMap(radius, 25, 80, 32, 0) : 32);

        ofNoFill();
        ofBeginShape();
        for (int outline_index = 0; outline_index < outline.size(); outline_index++) {

          ofNextContour(true);

          outline[outline_index] = outline[outline_index].getResampledByCount(60);
          vector<glm::vec3> vertices = outline[outline_index].getVertices();

          for (int vertices_index = 0; vertices_index < vertices.size(); vertices_index++) {

            glm::vec3 vertex = location + glm::vec4(((vertices[vertices_index] - glm::vec2(25, -25)) / 50) * radius * 2, 0) * rotation;
            vertex.z += k;

            if (vertex.y > len * 0.5) {
              vertex.y = len * 0.5;
            }
            if (vertex.y < -len * 0.5) {
              vertex.y = -len * 0.5;
            }
            if (vertex.x > len * 0.5) {
              vertex.x = len * 0.5;
            }
            if (vertex.x < -len * 0.5) {
              vertex.x = -len * 0.5;
            }

            ofVertex(vertex);
          }
        }
        ofEndShape(true);
      }
    }

    ofSetColor(0);
    ofFill();
    ofDrawBox(len * 0.95);
  }
}

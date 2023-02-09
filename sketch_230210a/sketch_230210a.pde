// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Twisting font. Draw by openFrameworks
// https://junkiyoshi.com/2023/01/22/

ArrayList<ArrayList<ofOutlineCoord>> path_list = new ArrayList();
//--------------------------------------------------------------
void setup() {
  size(720, 720, P3D);

  ArrayList<ofOutline> outlineWords = openFrameworksOutline.ofOutline();
  String word = "From Code";
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
void draw() {
  background(255);
  fill(0);
  ofSetLineWidth(1.5);

  translate(width * 0.5f, height * 0.5f);

  // coutして値を見た
  // cout << this->font.stringWidth(word) << endl;
  float stringWidth = 632.0f;
  float charWidth = stringWidth / (float)path_list.size();

  for (int y = -240 + 40; y < height - 480; y += 120) {
    for (int x = 0; x < path_list.size(); x++) {
      ArrayList<ofOutlineCoord> outline = path_list.get(x);
      float offsetX = x * charWidth;
      beginShape();
      for (int outline_index = 0; outline_index < outline.size(); outline_index++) {
        //outline[outline_index] = outline[outline_index].getResampledByCount(300);
        ArrayList<PVector> vertices = outline.get(outline_index).vertices;
        for (PVector v : vertices) {
          //PVector location = new PVector((v.x + offsetX) - stringWidth * 0.5, y + v.y + stringWidth * 0.5, 0);
          PVector location = new PVector((v.x + offsetX) - stringWidth * 0.5, (y-240) + v.y + stringWidth * 0.5, 0);
          float len = location.mag();
          float noise_value = openFrameworksNoise.ofNoise(len * 0.01 - ofGetFrameNum() * 0.05);
          float deg = 0;
          if (noise_value < 0.35) {
            deg = map(noise_value, 0, 0.35, -360, 0);
          } else if (noise_value > 0.65) {
            deg = map(noise_value, 0.65, 1, 0, 360);
          }
          //auto rotation = glm::rotate(glm::mat4(), deg * (float)DEG_TO_RAD, glm::vec3(0, 0, 1));
          PMatrix3D rotation = new PMatrix3D();
          rotation.rotateZ(deg * (float)DEG_TO_RAD);
          //location = glm::vec4(location, 0) * rotation;
          location = rotation.mult(location, null);
          vertex(location.x, location.y, location.z);
        }
      }
      endShape(CLOSE);
    }
  }
}
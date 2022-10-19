// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Looking forward to the new Matrix ! Draw by openFrameworks
// https://junkiyoshi.com/2021/12/17/

//--------------------------------------------------------------
ArrayList<PVector> location_list = new ArrayList();
FloatList rotate_deg_list = new FloatList();
IntList param_list = new IntList();
IntList word_index_list = new IntList();
ArrayList<IntList> route_info_list = new ArrayList();
IntList index_list = new IntList();

PFont font;
int font_size;

String[] words;

void setup() {
  size(720, 720, P3D);
  int span = 30;
  for (int x = -300; x <= 300; x += span) {
    for (int y = -300; y <= 300; y += span) {
      for (int z = 0; z <= 1200; z += span * 2) {
        location_list.add(new PVector(x, y, z));
        rotate_deg_list.append(0);
        param_list.append(0);
        word_index_list.append(0);
      }
    }
  }

  for (PVector location : location_list) {
    IntList route_info = new IntList();
    int index = -1;
    for (PVector other : location_list) {
      index++;
      if (location == other) {
        continue;
      }
      float distance = PVector.dist(location, other);
      if (distance <= span) {
        route_info.append(index);
      }
    }
    route_info_list.add(route_info);
  }

  for (int i = 0; i < 80; i++) {
    index_list.append((int)random(location_list.size()));
  }

  font_size = 23;
  font = createFont("HuiFont29.ttf", 50, true);
  textFont(font);
  textSize(font_size);

  String[] wordsT = {
    "ｱ", "ｲ", "ｳ", "ｴ", "ｵ",
    "ｶ", "ｷ", "ｸ", "ｹ", "ｺ",
    "ｻ", "ｼ", "ｽ", "ｾ", "ｿ",
    "ﾀ", "ﾁ", "ﾂ", "ﾃ", "ﾄ",
    "ﾅ", "ﾆ", "ﾇ", "ﾈ", "ﾉ",
    "ﾊ", "ﾋ", "ﾌ", "ﾍ", "ﾎ",
    "ﾏ", "ﾐ", "ﾑ", "ﾒ", "ﾓ",
    "ﾔ", "ﾕ", "ﾖ",
    "ﾗ", "ﾘ", "ﾙ", "ﾚ", "ﾛ",
    "ﾜ", "ｦ", "ﾝ",
  };
  words = wordsT;
}

//--------------------------------------------------------------
void update() {
  if (ofGetFrameNum() % 3 != 0) {
    for (int i = 0; i < index_list.size(); i++) {
      word_index_list.set(index_list.get(i), (int)random(words.size()));
    }
    return;
  }

  for (int i = 0; i < index_list.size(); i++) {
    //int next_index = this->route_info_list[this->index_list[i]][(int)ofRandom(this->route_info_list[this->index_list[i]].size())];
    IntList routeInfo = route_info_list.get(index_list.get(i));
    int next_index = routeInfo.get((int)random(routeInfo.size()));
    for (int k = 0; k < routeInfo.size(); k++) {
      if (param_list.get(next_index) <= 0) {
        var loc = location_list.get(index_list.get(i));
        var next = location_list.get(next_index);

        var angle = atan2(next.y - loc.y, next.x - loc.x);
        if (angle != 0) {
          rotate_deg_list.set(next_index, angle * RAD_TO_DEG + 90);
        }
        param_list.set(next_index, 60);
        index_list.set(i, next_index);
        word_index_list.set(next_index, (int)random(words.size()));
        break;
      }
    }
  }
}

//--------------------------------------------------------------
void draw() {
  update();
  translate(width/2, height/2);
  background(0);
  strokeWeight(0.5);

  this->cam.begin();

  for (int i = 0; i < this->location_list.size(); i++) {

    if (this->param_list[i] > 0) {

      int z = (int)(this->location_list[i].z + ofGetFrameNum() * 3) % 1200 - 600;

      ofPushMatrix();
      ofTranslate(this->location_list[i].x, this->location_list[i].y, z);

      ofFill();
      int alpha = ofMap(this->param_list[i], 0, 60, 0, 255);
      int rb = this->param_list[i] >= 57 ? 239 : 39;
      ofSetColor(ofColor(rb, 239, rb, alpha));

      ofRotateZ(this->rotate_deg_list[i]);
      this->font.drawString(this->words[this->word_index_list[i]], -15, -15);

      ofPopMatrix();
    }

    if (this->param_list[i] > 0) {
      this->param_list[i] -= 1;
    }
  }

  this->cam.end();
}

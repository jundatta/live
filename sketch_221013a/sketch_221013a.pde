// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Active boxes colorful. Draw by openFrameworks
// https://junkiyoshi.com/2021/12/26/

ArrayList<PVector> location_list;
ArrayList<IntList> next_index_list;
IntList destination_list;

ArrayList<Actor> actor_list;

//--------------------------------------------------------------
class Actor {
  int select_index;
  int next_index;
  float hue;

  PVector location;

  Actor(ArrayList<PVector> location_list, IntList destination_list) {
    this.select_index = random(location_list.size());
    while (true) {
      if (!destination_list.hasValue(this.select_index)) {
        destination_list.add(this.select_index);
        break;
      }
      this.select_index = (this.select_index + 1) % location_list.size();
    }
    this.next_index = this.select_index;
    this.hue = random(255);
  }

  //--------------------------------------------------------------
  void update(int frame_span, ArrayList<PVector> location_list, ArrayList<IntList> next_index_list, IntList destination_list) {
    if (frameCount % frame_span == 0) {
      var tmp_index = this.select_index;
      this.select_index = this.next_index;
      //int retry = next_index_list[this->select_index].size();
      IntList index_list = next_index_list.get(this.select_index);
      int retry = index_list.size();
      //this->next_index = next_index_list[this->select_index][(int)ofRandom(next_index_list[this->select_index].size())];
      this.next_index = index_list.get(random(index_list.size()));
      while (--retry > 0) {
        if (!destination_list.hasValue(this.next_index)) {
          if (tmp_index != this.next_index) {
            destination_list.add(this.next_index);
            break;
          }
        }
        //this->next_index = next_index_list[this->select_index][(this->next_index + 1) % next_index_list[this->select_index].size()];
        this.next_index = index_list.get((this.next_index+1) % index_list.size());
      }
      if (retry <= 0) {
        destination_list.add(this.select_index);
        this.next_index = this.select_index;
      }
    }

    var param = frameCount % frame_span;
    var distance = location_list.get(this.next_index) - location_list.get(this.select_index);
    this.location = location_list.get(this.select_index) + distance / frame_span * param;
  }

  //--------------------------------------------------------------
  PVector getLocation() {
    return this.location;
  }

  //--------------------------------------------------------------
  boolean isActive() {
    return this.select_index != this.next_index;
  }

  //--------------------------------------------------------------
  float getHue() {
    return this.hue;
  }
}

//--------------------------------------------------------------
void setup() {
  for (int x = -250; x <= 250; x += 25) {
    for (int y = -250; y <= 250; y += 25) {
      for (int z = -250; z <= 250; z += 25) {
        PVector v = new PVector(x, y, z);
        if (v.mag() < 250) {
          this.location_list.add(v);
        }
      }
    }
  }

  for (PVector location : this.location_list) {
    IntList next_index = IntList();
    int index = -1;
    for (PVector other : this.location_list) {
      index++;
      if (location == other) {
        continue;
      }
      float distance = PVector.dist(location, other);
      if (distance <= 25) {
        next_index.add(index);
      }
    }
    this.next_index_list.add(next_index);
  }

  for (int i = 0; i < 3500; i++) {
    //this->actor_list.push_back(make_unique<Actor>(this->location_list, this->next_index_list, this->destination_list));
    Actor a = new Actor(this.location_list, this.destination_list);
  }
}

//--------------------------------------------------------------
void ofApp::update() {

  int frame_span = 20;
  int prev_index_size = 0;

  if (ofGetFrameNum() % frame_span == 0) {

    prev_index_size = this->destination_list.size();
  }

  for (auto& actor : this->actor_list) {

    actor->update(frame_span, this->location_list, this->next_index_list, this->destination_list);
  }

  if (prev_index_size != 0) {

    this->destination_list.erase(this->destination_list.begin(), this->destination_list.begin() + prev_index_size);
  }
}

//--------------------------------------------------------------
void draw() {
  update();
  translate(width/2, height/2);
  background(0);
  strokeWeight(1.5);

  this->cam.begin();
  ofRotateY(ofGetFrameNum() * 0.6666666666666666);

  for (auto& actor : this->actor_list) {

    ofColor fill_color;

    if (actor->isActive()) {

      if (ofGetFrameNum() % 20 < 10) {

        fill_color.setHsb(actor->getHue(), 130, ofMap(ofGetFrameNum() % 20, 0, 10, 0, 255));
        ofSetColor(fill_color);
      } else {

        fill_color.setHsb(actor->getHue(), 130, ofMap(ofGetFrameNum() % 20, 10, 20, 255, 0));
        ofSetColor(fill_color);
      }
    } else {

      ofSetColor(0);
    }
    ofFill();
    ofDrawBox(actor->getLocation(), 23);

    if (actor->isActive()) {

      if (ofGetFrameNum() % 20 < 10) {

        ofSetColor(ofMap(ofGetFrameNum() % 20, 0, 10, 255, 0));
      } else {

        ofSetColor(ofMap(ofGetFrameNum() % 20, 10, 20, 0, 255));
      }
    } else {

      ofSetColor(255);
    }
    ofNoFill();
    ofDrawBox(actor->getLocation(), 23);
  }

  this->cam.end();
}


//--------------------------------------------------------------
int main() {

  ofSetupOpenGL(720, 720, OF_WINDOW);
  ofRunApp(new ofApp());
}
// https://junkiyoshi.com/2022/02/09/

ArrayList<PVector> location_list;
ArrayList<ArrayList<int>> next_index_list;
ArrayList<int> destination_list;

ArrayList<Actor> actor_list;

//--------------------------------------------------------------
class Actor {
  int select_index;
  int next_index;

  PVector location;
  ArrayList<PVector> log;
  color col;

  Actor(ArrayList<PVector> location_list, ArrayList<ArrayList<Integer>> next_index_list, ArrayList<Integer> destination_list) {
    this.select_index = random(0, location_list.size());
    while (true) {
      auto itr = find(destination_list.begin(), destination_list.end(), this.select_index);
      if (itr == destination_list.end()) {
        destination_list.push_back(this.select_index);
        break;
      }

      this.select_index = (this.select_index + 1) % location_list.size();
    }

    this.next_index = this.select_index;
  }

  //--------------------------------------------------------------
  void update(int frame_span, ArrayList<PVector> location_list, ArrayList<ArrayList<Integer>> next_index_list, ArrayList<Integer> destination_list) {
    if (ofGetFrameNum() % frame_span == 0) {
      auto tmp_index = this.select_index;
      this.select_index = this.next_index;
      int retry = next_index_list[this.select_index].size();
      this.next_index = next_index_list[this.select_index][(int)random(0, next_index_list[this.select_index].size())];
      while (--retry > 0) {
        auto destination_itr = find(destination_list.begin(), destination_list.end(), this.next_index);
        if (destination_itr == destination_list.end()) {
          if (tmp_index != this.next_index) {
            destination_list.push_back(this.next_index);
            break;
          }
        }

        this.next_index = next_index_list[this.select_index][(this.next_index + 1) % next_index_list[this.select_index].size()];
      }
      if (retry <= 0) {
        destination_list.push_back(this.select_index);
        this.next_index = this.select_index;
      }
    }

    auto param = ofGetFrameNum() % frame_span;
    auto distance = location_list[this.next_index] - location_list[this.select_index];
    this.location = location_list[this.select_index] + distance / frame_span * param;

    this.log.push_front(this.location);
    while (this.log.size() > 20) {
      this.log.pop_back();
    }
  }

  //--------------------------------------------------------------
  PVector getLocation() {
    return this.location;
  }

  //--------------------------------------------------------------
  ArrayList<PVector> getLog() {
    return this.log;
  }

  //--------------------------------------------------------------
  void setColor(color col) {
    this.col = col;
  }

  //--------------------------------------------------------------
  color getColor() {
    return this.col;
  }
}

//--------------------------------------------------------------
void setup() {
  size(720, 720);
  
  //  ofSetFrameRate(30);

  background(255);

  auto span = 40;
  for (int x = -280; x <= 280; x += span) {
    for (int y = -280; y <= 280; y += span) {
      this.location_list.push_back(new PVector(x, y, 0));
    }
  }

  auto param = span * sqrt(3);
  for (auto location : location_list) {
    ArrayList<int> next_index = new ArrayList();
    int index = -1;
    for (auto other : location_list) {
      index++;
      if (location == other) {
        continue;
      }

      float distance = distance(location, other);
      if (distance <= param) {
        next_index.push_back(index);
      }
    }

    next_index_list.push_back(next_index);
  }

  color col;
  color[] base_color_list = { #ef476f, #ffd166, #06d6a0, #118ab2, #073b4c };

  for (int i = 0; i < 180; i++) {
    actor_list.push_back(new Actor(location_list, next_index_list, destination_list));
    actor_list.back().setColor(base_color_list[(int)random(0, base_color_list.size())]);
  }
}

//--------------------------------------------------------------
void update() {
  int frame_span = 10;
  int prev_index_size = 0;

  if (ofGetFrameNum() % frame_span == 0) {
    prev_index_size = destination_list.size();
  }

  for (auto actor : actor_list) {
    actor.update(frame_span, location_list, next_index_list, destination_list);
  }

  if (prev_index_size != 0) {
    destination_list.erase(destination_list.begin(), destination_list.begin() + prev_index_size);
  }
}

//--------------------------------------------------------------
void draw() {
  update();
  
  //  ofTranslate(ofGetWindowSize() * 0.5);
  translate(width/2, height/2);

  stroke(0, 128);
  strokeWeight(1);
  fill(0, 128);
  for (auto location : location_list) {
    circle(location, 5);
  }

  strokeWeight(3);
  for (auto actor : actor_list) {
    fill(actor.getColor());
    circle(actor.getLocation(), 6);
    noFill();

    beginShape();
    for (auto l : actor.getLog()) {
      vertex(l);
    }
    endShape();
  }
}

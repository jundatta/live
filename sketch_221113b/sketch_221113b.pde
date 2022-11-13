// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Random work is curry. openFrameworks
// https://junkiyoshi.com/2020/12/18/

//--------------------------------------------------------------
class Actor {
  int select_index;
  int next_index;

  PVector location;

  Actor(ArrayList<PVector> location_list, ArrayList<IntList> next_index_list, IntList destination_list) {
    select_index = ofRandom(location_list.size());
    while (true) {
      if (!destination_list.hasValue(select_index)) {
        destination_list.add(select_index);
        break;
      }
      select_index = (select_index + 1) % location_list.size();
    }
    next_index = select_index;
  }

  //--------------------------------------------------------------
  void update(int frame_span, ArrayList<PVector> location_list, ArrayList<IntList> next_index_list, IntList destination_list) {
    if (ofGetFrameNum() % frame_span == 0) {
      var tmp_index = select_index;
      select_index = next_index;
      IntList ni = next_index_list.get(select_index);
      int retry = ni.size();
      next_index = ni.get((int)ofRandom(ni.size()));
      while (--retry > 0) {
        if (!destination_list.hasValue(next_index)) {
          if (tmp_index != next_index) {
            destination_list.add(next_index);
            break;
          }
        }
        next_index = ni.get((next_index + 1) % next_index_list[select_index].size());
      }
      if (retry <= 0) {
        destination_list.add(select_index);
        next_index = select_index;
      }
    }

    var param = ofGetFrameNum() % frame_span;
    var distance = location_list.get(next_index) - location_list.get(select_index);
    location = location_list.get(select_index) + distance / frame_span * param;
  }

  //--------------------------------------------------------------
  PVector getLocation() {
    return location;
  }
}

//--------------------------------------------------------------
void setup() {
  size(720, 720, P3D);

  PGraphics fbo = createGraphics(width, height);
  fbo.beginDraw();
  fbo.background(239);
  fbo.translate(ofGetWidth() * 0.5, ofGetHeight() * 0.45);
  fbo.fill(0);

  PFont font = createFont("HuiFont29.ttf", 195, true);
  fbo.textFont(font);
  fbo.text("12", -250, 120);
  fbo.text("34", -250, 360);
  fbo.endDraw();

  var span = 10;
  fbo.loadPixels();
  color[] pixels = fbo.pixels;
  for (int x = 0; x < fbo.width; x += span) {
    for (int y = 0; y < fbo.height; y += span) {
      color col = pixels.get(x, y);
      if (col != ofColor(0, 0)) {
        for (int z = span * -1; z <= span; z += span) {
          location_list.add(new PVector(x - width * 0.5, height - y - width * 0.25, z));
        }
      }
    }
  }

  for (var location : location_list) {
    vector<int> next_index = vector<int>();
    int index = -1;
    for (var& other : location_list) {
      index++;
      if (location == other) {
        continue;
      }

      float distance = glm::distance(location, other);
      if (distance <= span) {
        next_index.add(index);
      }
    }

    next_index_list.add(next_index);
  }

  for (int i = 0; i < 3500; i++) {

    actor_list.add(make_unique<Actor>(location_list, next_index_list, destination_list));
  }

  frame.setMode(ofPrimitiveMode::OF_PRIMITIVE_LINES);
}

//--------------------------------------------------------------
void ofApp::update() {

  int frame_span = 30;
  int prev_index_size = 0;

  if (ofGetFrameNum() % frame_span == 0) {

    prev_index_size = destination_list.size();
  }

  for (var& actor : actor_list) {

    actor->update(frame_span, location_list, next_index_list, destination_list);
  }

  if (prev_index_size != 0) {

    destination_list.erase(destination_list.begin(), destination_list.begin() + prev_index_size);
  }

  face.clear();
  frame.clear();

  for (var& actor : actor_list) {

    setBoxToMesh(face, frame, actor->getLocation(), 10, 10, 10);
  }
}

//--------------------------------------------------------------
void draw() {
  update();
  //translate(width/2, height/2);

  ofBackground(239);
  ofSetLineWidth(2);

  cam.begin();

  ofSetColor(239);
  face.draw();

  ofSetColor(39);
  frame.drawWireframe();

  cam.end();
}


//--------------------------------------------------------------
void ofApp::setBoxToMesh(ofMesh& face_target, ofMesh& frame_target, PVector location, float height, float width, float depth) {

  int index = face_target.getVertices().size();

  face_target.addVertex(location + PVector(width * -0.5 * 0.99, height * 0.5 * 0.99, depth * -0.5 * 0.99));
  face_target.addVertex(location + PVector(width * 0.5 * 0.99, height * 0.5 * 0.99, depth * -0.5 * 0.99));
  face_target.addVertex(location + PVector(width * 0.5 * 0.99, height * 0.5 * 0.99, depth * 0.5 * 0.99));
  face_target.addVertex(location + PVector(width * -0.5 * 0.99, height * 0.5 * 0.99, depth * 0.5 * 0.99));

  face_target.addVertex(location + PVector(width * -0.5 * 0.99, height * -0.5 * 0.99, depth * -0.5 * 0.99));
  face_target.addVertex(location + PVector(width * 0.5 * 0.99, height * -0.5 * 0.99, depth * -0.5 * 0.99));
  face_target.addVertex(location + PVector(width * 0.5 * 0.99, height * -0.5 * 0.99, depth * 0.5 * 0.99));
  face_target.addVertex(location + PVector(width * -0.5 * 0.99, height * -0.5 * 0.99, depth * 0.5 * 0.99));

  face_target.addIndex(index + 0);
  face_target.addIndex(index + 1);
  face_target.addIndex(index + 2);
  face_target.addIndex(index + 0);
  face_target.addIndex(index + 2);
  face_target.addIndex(index + 3);

  face_target.addIndex(index + 4);
  face_target.addIndex(index + 5);
  face_target.addIndex(index + 6);
  face_target.addIndex(index + 4);
  face_target.addIndex(index + 6);
  face_target.addIndex(index + 7);

  face_target.addIndex(index + 0);
  face_target.addIndex(index + 4);
  face_target.addIndex(index + 1);
  face_target.addIndex(index + 4);
  face_target.addIndex(index + 5);
  face_target.addIndex(index + 1);

  face_target.addIndex(index + 1);
  face_target.addIndex(index + 5);
  face_target.addIndex(index + 6);
  face_target.addIndex(index + 6);
  face_target.addIndex(index + 2);
  face_target.addIndex(index + 1);

  face_target.addIndex(index + 2);
  face_target.addIndex(index + 6);
  face_target.addIndex(index + 7);
  face_target.addIndex(index + 7);
  face_target.addIndex(index + 3);
  face_target.addIndex(index + 2);

  face_target.addIndex(index + 3);
  face_target.addIndex(index + 7);
  face_target.addIndex(index + 4);
  face_target.addIndex(index + 4);
  face_target.addIndex(index + 0);
  face_target.addIndex(index + 3);

  frame_target.addVertex(location + PVector(width * -0.5, height * 0.5, depth * -0.5));
  frame_target.addVertex(location + PVector(width * 0.5, height * 0.5, depth * -0.5));
  frame_target.addVertex(location + PVector(width * 0.5, height * 0.5, depth * 0.5));
  frame_target.addVertex(location + PVector(width * -0.5, height * 0.5, depth * 0.5));

  frame_target.addVertex(location + PVector(width * -0.5, height * -0.5, depth * -0.5));
  frame_target.addVertex(location + PVector(width * 0.5, height * -0.5, depth * -0.5));
  frame_target.addVertex(location + PVector(width * 0.5, height * -0.5, depth * 0.5));
  frame_target.addVertex(location + PVector(width * -0.5, height * -0.5, depth * 0.5));

  frame_target.addIndex(index + 0);
  frame_target.addIndex(index + 1);
  frame_target.addIndex(index + 1);
  frame_target.addIndex(index + 2);
  frame_target.addIndex(index + 2);
  frame_target.addIndex(index + 3);
  frame_target.addIndex(index + 3);
  frame_target.addIndex(index + 0);

  frame_target.addIndex(index + 4);
  frame_target.addIndex(index + 5);
  frame_target.addIndex(index + 5);
  frame_target.addIndex(index + 6);
  frame_target.addIndex(index + 6);
  frame_target.addIndex(index + 7);
  frame_target.addIndex(index + 7);
  frame_target.addIndex(index + 4);

  frame_target.addIndex(index + 0);
  frame_target.addIndex(index + 4);
  frame_target.addIndex(index + 1);
  frame_target.addIndex(index + 5);
  frame_target.addIndex(index + 2);
  frame_target.addIndex(index + 6);
  frame_target.addIndex(index + 3);
  frame_target.addIndex(index + 7);
}

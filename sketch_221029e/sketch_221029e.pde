// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Spherical piece random walker. Draw by openFrameworks
// https://junkiyoshi.com/2021/11/17/

color[] base_color_list = { #247BA0, #70C1B3, #B2DBBF, #F3FFBD, #FF1654 };
ArrayList<ofMeshFace> triangle_list = new ArrayList();
ArrayList<PVector> location_list = new ArrayList();
IntList param_list = new IntList();
IntList param_color_list = new IntList();
ArrayList<IntList> route_info_list = new IntList();
IntList index_list = new IntList();
//--------------------------------------------------------------
void setup() {
  size(720, 720, P3D);

  //auto ico_sphere = ofIcoSpherePrimitive(250, 3);
  //this->triangle_list.insert(this->triangle_list.end(), ico_sphere.getMesh().getUniqueFaces().begin(), ico_sphere.getMesh().getUniqueFaces().end());
  Sphere sp = new Sphere(250, 3);
  ArrayList<PVector> vertices = sp.getVertices();
  for (int i = 0; i < vertices.size(); i+=3) {
    PVector t0 = vertices.get(i+0);
    PVector t1 = vertices.get(i+1);
    PVector t2 = vertices.get(i+2);
    ofMeshFace mf = new ofMeshFace(t0, t1, t2);
    triangle_list.add(mf);
  }

  for (var triangle : triangle_list) {
    //glm::vec3 avg = (triangle.getVertex(0) + triangle.getVertex(1) + triangle.getVertex(2)) / 3;
    PVector avg = PVector.add(triangle.getVertex(0), triangle.getVertex(1));
    avg.add(triangle.getVertex(2));
    avg.div(3);
    location_list.add(avg);
    param_list.add(0);
    param_color_list.add(color(239));
  }

  int span = 25;
  for (PVector location : location_list) {
    IntList route_info = IntList();
    int index = -1;
    for (PVector other : location_list) {
      index++;
      if (location == other) {
        continue;
      }
      float distance = PVector.dist(location, other);
      if (distance <= span) {
        if (abs(PVector.mag(location) - PVector.mag(other)) <= 10) {
          route_info.add(index);
        }
      }
    }
    route_info_list.add(route_info);
  }

  for (int i = 0; i < 30; i++) {
    index_list.push_back((int)ofRandom(location_list.size()));
    index_color_list.add(base_color_list[i % base_color_list.size()]);
  }
}

//--------------------------------------------------------------
void ofApp::update() {

  this->mesh.clear();
  this->frame.clear();

  for (int i = 0; i < this->index_list.size(); i++) {

    int next_index = this->route_info_list[this->index_list[i]][(int)ofRandom(this->route_info_list[this->index_list[i]].size())];
    for (int k = 0; k < this->route_info_list[this->index_list[i]].size(); k++) {

      if (this->param_list[next_index] <= 0) {

        this->param_list[next_index] = 30;
        this->param_color_list[next_index] = this->index_color_list[i];
        this->index_list[i] = next_index;
        break;
      }
    }
  }

  int radius = 250;
  for (int i = 0; i < this->location_list.size(); i++) {

    if (this->param_list[i] > 0) {

      glm::vec3 avg = (this->triangle_list[i].getVertex(0) + this->triangle_list[i].getVertex(1) + this->triangle_list[i].getVertex(2)) / 3;

      vector<glm::vec3> vertices;

      vertices.push_back(glm::normalize(this->triangle_list[i].getVertex(0)) * (radius + 5) - avg);
      vertices.push_back(glm::normalize(this->triangle_list[i].getVertex(1)) * (radius + 5) - avg);
      vertices.push_back(glm::normalize(this->triangle_list[i].getVertex(2)) * (radius + 5) - avg);

      vertices.push_back(glm::normalize(this->triangle_list[i].getVertex(0)) * (radius - 5) - avg);
      vertices.push_back(glm::normalize(this->triangle_list[i].getVertex(1)) * (radius - 5) - avg);
      vertices.push_back(glm::normalize(this->triangle_list[i].getVertex(2)) * (radius - 5) - avg);

      float scale = 1;
      if (this->param_list[i] < 25) {

        scale = ofMap(this->param_list[i], 0, 25, 0.15, 1);
      }

      for (auto& vertex : vertices) {

        vertex *= scale;
        vertex += avg;
      }

      this->mesh.addVertices(vertices);
      this->frame.addVertices(vertices);

      this->mesh.addColor(ofColor(this->param_color_list[i]));
      this->mesh.addColor(ofColor(this->param_color_list[i]));
      this->mesh.addColor(ofColor(this->param_color_list[i]));

      this->mesh.addColor(ofColor(0));
      this->mesh.addColor(ofColor(0));
      this->mesh.addColor(ofColor(0));

      this->frame.addColor(ofColor(0));
      this->frame.addColor(ofColor(0));
      this->frame.addColor(ofColor(0));

      this->frame.addColor(ofColor(this->param_color_list[i]));
      this->frame.addColor(ofColor(this->param_color_list[i]));
      this->frame.addColor(ofColor(this->param_color_list[i]));

      this->mesh.addTriangle(this->mesh.getNumVertices() - 1, this->mesh.getNumVertices() - 2, this->mesh.getNumVertices() - 3);
      this->mesh.addTriangle(this->mesh.getNumVertices() - 4, this->mesh.getNumVertices() - 5, this->mesh.getNumVertices() - 6);

      this->mesh.addTriangle(this->mesh.getNumVertices() - 1, this->mesh.getNumVertices() - 2, this->mesh.getNumVertices() - 5);
      this->mesh.addTriangle(this->mesh.getNumVertices() - 1, this->mesh.getNumVertices() - 5, this->mesh.getNumVertices() - 4);

      this->mesh.addTriangle(this->mesh.getNumVertices() - 1, this->mesh.getNumVertices() - 3, this->mesh.getNumVertices() - 6);
      this->mesh.addTriangle(this->mesh.getNumVertices() - 1, this->mesh.getNumVertices() - 6, this->mesh.getNumVertices() - 4);

      this->mesh.addTriangle(this->mesh.getNumVertices() - 2, this->mesh.getNumVertices() - 3, this->mesh.getNumVertices() - 6);
      this->mesh.addTriangle(this->mesh.getNumVertices() - 2, this->mesh.getNumVertices() - 6, this->mesh.getNumVertices() - 5);

      this->frame.addIndex(this->frame.getNumVertices() - 1);
      this->frame.addIndex(this->frame.getNumVertices() - 2);
      this->frame.addIndex(this->frame.getNumVertices() - 2);
      this->frame.addIndex(this->frame.getNumVertices() - 3);
      this->frame.addIndex(this->frame.getNumVertices() - 1);
      this->frame.addIndex(this->frame.getNumVertices() - 3);

      this->frame.addIndex(this->frame.getNumVertices() - 4);
      this->frame.addIndex(this->frame.getNumVertices() - 5);
      this->frame.addIndex(this->frame.getNumVertices() - 5);
      this->frame.addIndex(this->frame.getNumVertices() - 6);
      this->frame.addIndex(this->frame.getNumVertices() - 4);
      this->frame.addIndex(this->frame.getNumVertices() - 6);

      this->frame.addIndex(this->frame.getNumVertices() - 1);
      this->frame.addIndex(this->frame.getNumVertices() - 4);
      this->frame.addIndex(this->frame.getNumVertices() - 2);
      this->frame.addIndex(this->frame.getNumVertices() - 5);
      this->frame.addIndex(this->frame.getNumVertices() - 3);
      this->frame.addIndex(this->frame.getNumVertices() - 6);
    }

    if (this->param_list[i] > 0) {
      this->param_list[i] -= 1;
    }
  }
}

//--------------------------------------------------------------
void draw() {
  update();
  translate(width/2, height/2);

  ofBackground(255);
  ofSetLineWidth(2);

  this->cam.begin();
  ofRotateX(ofGetFrameNum() * 0.37);
  ofRotateY(ofGetFrameNum() * 0.72);

  this->mesh.drawFaces();

  this->frame.drawWireframe();

  this->cam.end();
}

// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Spherical piece random walker. Draw by openFrameworks
// https://junkiyoshi.com/2021/11/17/

color[] base_color_list = { #247BA0, #70C1B3, #B2DBBF, #F3FFBD, #FF1654 };
ArrayList<ofMeshFace> triangle_list = new ArrayList();
ArrayList<PVector> location_list = new ArrayList();
IntList param_list = new IntList();
IntList param_color_list = new IntList();
ArrayList<IntList> route_info_list = new ArrayList();
IntList index_list = new IntList();
IntList index_color_list = new IntList();
ofMesh mesh = new ofMesh();
ofMesh frame = new ofMesh();
//--------------------------------------------------------------
void setup() {
  size(720, 720, P3D);

  //auto ico_sphere = ofIcoSpherePrimitive(250, 3);
  //triangle_list.insert(triangle_list.end(), ico_sphere.getMesh().getUniqueFaces().begin(), ico_sphere.getMesh().getUniqueFaces().end());
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
    param_list.append(0);
    param_color_list.append(color(239));
  }

  int span = 25;
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
        if (abs(location.mag() - other.mag()) <= 10) {
          route_info.append(index);
        }
      }
    }
    route_info_list.add(route_info);
  }

  for (int i = 0; i < 30; i++) {
    index_list.append((int)ofRandom(location_list.size()));
    index_color_list.append(base_color_list[i % base_color_list.length]);
  }
}

//--------------------------------------------------------------
void update() {
  mesh.clear();
  frame.clear();

  for (int i = 0; i < index_list.size(); i++) {
    int next_index = route_info_list[index_list[i]][(int)ofRandom(route_info_list[index_list[i]].size())];
    for (int k = 0; k < route_info_list[index_list[i]].size(); k++) {
      if (param_list[next_index] <= 0) {
        param_list[next_index] = 30;
        param_color_list[next_index] = index_color_list[i];
        index_list[i] = next_index;
        break;
      }
    }
  }

  int radius = 250;
  for (int i = 0; i < location_list.size(); i++) {
    if (param_list[i] > 0) {
      PVector avg = (triangle_list[i].getVertex(0) + triangle_list[i].getVertex(1) + triangle_list[i].getVertex(2)) / 3;

      ArrayList<PVector> vertices = new ArrayList();

      vertices.add(PVector.normalize(triangle_list[i].getVertex(0)) * (radius + 5) - avg);
      vertices.add(PVector.normalize(triangle_list[i].getVertex(1)) * (radius + 5) - avg);
      vertices.add(PVector.normalize(triangle_list[i].getVertex(2)) * (radius + 5) - avg);

      vertices.add(PVector.normalize(triangle_list[i].getVertex(0)) * (radius - 5) - avg);
      vertices.add(PVector.normalize(triangle_list[i].getVertex(1)) * (radius - 5) - avg);
      vertices.add(PVector.normalize(triangle_list[i].getVertex(2)) * (radius - 5) - avg);

      float scale = 1;
      if (param_list[i] < 25) {
        scale = ofMap(param_list[i], 0, 25, 0.15, 1);
      }

      for (PVector vertex : vertices) {
        //vertex *= scale;
        //vertex += avg;
        vertex.mult(scale);
        vertex.add(avg);
      }

      mesh.addVertices(vertices);
      frame.addVertices(vertices);

      mesh.addColor(color(param_color_list[i]));
      mesh.addColor(color(param_color_list[i]));
      mesh.addColor(color(param_color_list[i]));

      mesh.addColor(color(0));
      mesh.addColor(color(0));
      mesh.addColor(color(0));

      frame.addColor(color(0));
      frame.addColor(color(0));
      frame.addColor(color(0));

      frame.addColor(color(param_color_list[i]));
      frame.addColor(color(param_color_list[i]));
      frame.addColor(color(param_color_list[i]));

      mesh.addTriangle(mesh.getNumVertices() - 1, mesh.getNumVertices() - 2, mesh.getNumVertices() - 3);
      mesh.addTriangle(mesh.getNumVertices() - 4, mesh.getNumVertices() - 5, mesh.getNumVertices() - 6);

      mesh.addTriangle(mesh.getNumVertices() - 1, mesh.getNumVertices() - 2, mesh.getNumVertices() - 5);
      mesh.addTriangle(mesh.getNumVertices() - 1, mesh.getNumVertices() - 5, mesh.getNumVertices() - 4);

      mesh.addTriangle(mesh.getNumVertices() - 1, mesh.getNumVertices() - 3, mesh.getNumVertices() - 6);
      mesh.addTriangle(mesh.getNumVertices() - 1, mesh.getNumVertices() - 6, mesh.getNumVertices() - 4);

      mesh.addTriangle(mesh.getNumVertices() - 2, mesh.getNumVertices() - 3, mesh.getNumVertices() - 6);
      mesh.addTriangle(mesh.getNumVertices() - 2, mesh.getNumVertices() - 6, mesh.getNumVertices() - 5);

      frame.addIndex(frame.getNumVertices() - 1);
      frame.addIndex(frame.getNumVertices() - 2);
      frame.addIndex(frame.getNumVertices() - 2);
      frame.addIndex(frame.getNumVertices() - 3);
      frame.addIndex(frame.getNumVertices() - 1);
      frame.addIndex(frame.getNumVertices() - 3);

      frame.addIndex(frame.getNumVertices() - 4);
      frame.addIndex(frame.getNumVertices() - 5);
      frame.addIndex(frame.getNumVertices() - 5);
      frame.addIndex(frame.getNumVertices() - 6);
      frame.addIndex(frame.getNumVertices() - 4);
      frame.addIndex(frame.getNumVertices() - 6);

      frame.addIndex(frame.getNumVertices() - 1);
      frame.addIndex(frame.getNumVertices() - 4);
      frame.addIndex(frame.getNumVertices() - 2);
      frame.addIndex(frame.getNumVertices() - 5);
      frame.addIndex(frame.getNumVertices() - 3);
      frame.addIndex(frame.getNumVertices() - 6);
    }

    if (param_list[i] > 0) {
      param_list[i] -= 1;
    }
  }
}

//--------------------------------------------------------------
void draw() {
  update();
  translate(width/2, height/2);

  ofBackground(255);
  ofSetLineWidth(2);

  ofRotateX(ofGetFrameNum() * 0.37);
  ofRotateY(ofGetFrameNum() * 0.72);

  mesh.drawFaces();

  frame.drawWireframe();
}

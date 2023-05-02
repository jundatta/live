// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Rainbow Ribbons. Draw by openFrameworks
// https://junkiyoshi.com/openframeworks20230425/

ofMesh face, frame;

PVector target_location, camera_location;

//--------------------------------------------------------------
void setup() {
  size(720, 720, P3D);

  face = new ofMesh();
  frame = new ofMesh();
}

//--------------------------------------------------------------
void update() {
  ofSeedRandom(39);

  face.clear();
  frame.clear();

  var base_noise_seed = new PVector(random(1000), random(1000), random(1000));
  camera_location = new PVector(
    map(openFrameworksNoise.ofNoise(base_noise_seed.x, (ofGetFrameNum()) * 0.01), 0, 1, -500, 500),
    map(openFrameworksNoise.ofNoise(base_noise_seed.y, (ofGetFrameNum()) * 0.01), 0, 1, -500, 500),
    map(openFrameworksNoise.ofNoise(base_noise_seed.z, (ofGetFrameNum()) * 0.01), 0, 1, -500, 500));

  target_location = new PVector(
    map(openFrameworksNoise.ofNoise(base_noise_seed.x, (ofGetFrameNum() + 100) * 0.01), 0, 1, -500, 500),
    map(openFrameworksNoise.ofNoise(base_noise_seed.y, (ofGetFrameNum() + 100) * 0.01), 0, 1, -500, 500),
    map(openFrameworksNoise.ofNoise(base_noise_seed.z, (ofGetFrameNum() + 100) * 0.01), 0, 1, -500, 500));

  for (int k = 0; k < 7; k++) {
    var param = new PVector(15, 0, 0);
    var noise_seed = new PVector(random(1000), random(1000), random(1000));
    var start_index = face.getNumVertices();

    for (int i = 0; i < 100; i++) {
      int index = face.getNumVertices();

      var base_location = new PVector(
        map(openFrameworksNoise.ofNoise(base_noise_seed.x, (i + ofGetFrameNum()) * 0.01), 0, 1, -500, 500),
        map(openFrameworksNoise.ofNoise(base_noise_seed.y, (i + ofGetFrameNum()) * 0.01), 0, 1, -500, 500),
        map(openFrameworksNoise.ofNoise(base_noise_seed.z, (i + ofGetFrameNum()) * 0.01), 0, 1, -500, 500));

      var location = new PVector(
        map(openFrameworksNoise.ofNoise(noise_seed.x, (i + ofGetFrameNum()) * 0.02), 0, 1, -100, 100),
        map(openFrameworksNoise.ofNoise(noise_seed.y, (i + ofGetFrameNum()) * 0.02), 0, 1, -100, 100),
        map(openFrameworksNoise.ofNoise(noise_seed.z, (i + ofGetFrameNum()) * 0.02), 0, 1, -100, 100));

      //location += base_location;
      location.x += base_location.x;
      location.y += base_location.y;
      location.z += base_location.z;

      PVector p0 = new PVector(location.x + param.x, location.y + param.y, location.z + param.z);
      face.addVertex(p0);
      PVector p1 = new PVector(location.x - param.x, location.y - param.y, location.z - param.z);
      face.addVertex(p1);

      push();
      //color.setHsb(map(k, 0, 7, 0, 255), 200, 255);
      colorMode(HSB, 255, 255, 255);
      color c = color(map(k, 0, 7, 0, 255), 200, 255);
      pop();

      face.addColor(c);
      face.addColor(c);

      frame.addVertex(p0);
      frame.addVertex(p1);

      frame.addColor(color(255));
      frame.addColor(color(255));

      if (i > 0) {
        face.addIndex(index + 0);
        face.addIndex(index - 1);
        face.addIndex(index - 2);
        face.addIndex(index + 0);
        face.addIndex(index + 1);
        face.addIndex(index - 1);

        frame.addIndex(index + 0);
        frame.addIndex(index - 2);
        frame.addIndex(index + 1);
        frame.addIndex(index - 1);
      }
    }

    frame.addIndex(start_index + 0);
    frame.addIndex(start_index + 1);
    frame.addIndex(frame.getNumVertices() - 1);
    frame.addIndex(frame.getNumVertices() - 2);
  }
}

//--------------------------------------------------------------
void draw() {
  update();
  translate(width * 0.5f, height * 0.5f);

  background(39);

  //var camera_location = camera_location + glm::vec3(0, 0, 500);
  PVector cl = new PVector(camera_location.x, camera_location.y, camera_location.z + 500);
  //cam.setPosition(camera_location);
  //cam.setTarget(target_location);
  //cam.lookAt(target_location);
  camera(cl.x, cl.y, cl.z, target_location.x, target_location.y, target_location.z, 0, 1, 0);

  face.drawFaces();

  stroke(239);
  frame.drawWireframe();
}

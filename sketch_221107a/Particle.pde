//--------------------------------------------------------------
class Particle {
  PVector location;
  ArrayList<PVector> log = new ArrayList();

  PVector velocity;
  PVector acceleration;

  float range;
  float max_force;
  float max_speed;

  color col;

  Particle() {
    location = new PVector(ofRandom(width), ofRandom(height));
    velocity = new PVector(ofRandom(-1, 1), ofRandom(-1, 1));

    range = 25;
    max_force = 1;
    max_speed = 8;

    //col.setHsb(ofRandom(255), 130, 255);
    push();
    colorMode(HSB, 255, 255, 255);
    col = color(ofRandom(255), 130, 255);
    pop();
  }

  //--------------------------------------------------------------
  Particle(color col) {
    location = new PVector(ofRandom(width), ofRandom(height));
    velocity = new PVector(ofRandom(-1, 1), ofRandom(-1, 1));

    range = 25;
    max_force = 1;
    max_speed = 8;

    this.col = col;
  }

  //--------------------------------------------------------------
  void update(ArrayList<Particle> particles) {
    // 分離
    PVector separate = separate(particles);
    applyForce(separate);

    // 整列
    PVector align = align(particles);
    applyForce(align);

    // 結合
    PVector cohesion = cohesion(particles);
    applyForce(cohesion);

    // 自我
    if (velocity.mag() > 0) {
      PVector future = velocity.copy();
      future.normalize();
      future.mult(range);
      future.add(location);

      float angle = ofRandom(360);
      PVector target = future.copy();
      target.add(new PVector(range * 0.5 * cos(angle * DEG_TO_RAD), range * 0.5 * sin(angle * DEG_TO_RAD)));

      PVector ego = seek(target);
      applyForce(ego);
    }

    // 境界
    PVector org = new PVector(width * 0.5, height * 0.5);
    PVector p = PVector.sub(location, org);
    if (p.mag() > 300) {
      PVector area = seek(new PVector(width * 0.5, height * 0.5));
      area.mult(10);
      applyForce(area);
    }

    // 前進
    velocity.add(acceleration);
    if (velocity.mag() > max_speed) {
      velocity.normalize();
      velocity.mult(max_speed);
    }
    location.add(velocity);
    acceleration.mult(0);
    velocity.mult(0.98);

    // 記録
    log.add(location);
    while (log.size() > 15) {
      log.remove(0);
    }
  }

  //--------------------------------------------------------------
  void draw() {

    if (log.size() < 3) {
      return;
    }

    var head_size = 5;
    ofMesh mesh;
    ArrayList<PVector> right, left;
    PVector last_location;
    float last_theta;

    for (int k = 0; k < log.size() - 1; k++) {

      var loc = PVector(log[k], 0);
      var next = PVector(log[k + 1], 0);

      var direction = next - loc;
      var theta = atan2(direction.y, direction.x);

      right.push_back(loc + PVector(ofMap(k, 0, log.size(), 0, head_size) * cos(theta + PI * 0.5), ofMap(k, 0, log.size(), 0, head_size) * sin(theta + PI * 0.5), 0));
      left.push_back(loc + PVector(ofMap(k, 0, log.size(), 0, head_size) * cos(theta - PI * 0.5), ofMap(k, 0, log.size(), 0, head_size) * sin(theta - PI * 0.5), 0));

      last_location = loc;
      last_theta = theta;
    }

    for (int k = 0; k < right.size(); k++) {

      mesh.addVertex(left[k]);
      mesh.addVertex(right[k]);

      mesh.addColor(ofColor(col, ofMap(k, 0, log.size(), 0, 255)));
      mesh.addColor(ofColor(col, ofMap(k, 0, log.size(), 0, 255)));
    }

    for (int k = 0; k < mesh.getNumVertices() - 2; k += 2) {

      mesh.addIndex(k + 0);
      mesh.addIndex(k + 1);
      mesh.addIndex(k + 3);
      mesh.addIndex(k + 0);
      mesh.addIndex(k + 2);
      mesh.addIndex(k + 3);
    }

    var tmp_header_size = ofMap(log.size() - 2, 0, log.size(), 0, head_size);
    var tmp_alpha = ofMap(log.size() - 2, 0, log.size(), 0, 255);

    mesh.addVertex(last_location);
    mesh.addColor(ofColor(col, tmp_alpha));

    int index = mesh.getNumVertices();
    for (var theta = last_theta - PI * 0.5; theta <= last_theta + PI * 0.5; theta += PI / 20) {

      mesh.addVertex(last_location + PVector(tmp_header_size * cos(theta), tmp_header_size * sin(theta), 0));
      mesh.addColor(ofColor(col, tmp_alpha));
    }

    for (int k = index; k < mesh.getNumVertices() - 1; k++) {

      mesh.addIndex(index);
      mesh.addIndex(k + 0);
      mesh.addIndex(k + 1);
    }

    mesh.draw();
  }

  //--------------------------------------------------------------
  PVector separate(ArrayList<Particle> particles) {

    PVector result;
    PVector sum;
    int count = 0;
    for (var other : particles) {

      PVector difference = location - other->location;
      if (difference.mag() > 0 && difference.mag() < range * 0.5) {

        sum += PVector.normalize(difference);
        count++;
      }
    }

    if (count > 0) {

      PVector avg = sum / count;
      avg = avg * max_speed;
      if (avg.mag() > max_speed) {

        avg = PVector.normalize(avg) * max_speed;
      }
      PVector steer = avg - velocity;
      if (steer.mag() > max_force) {

        steer = PVector.normalize(steer) * max_force;
      }
      result = steer;
    }

    return result;
  }

  //--------------------------------------------------------------
  PVector align(ArrayList<Particle> particles) {

    PVector result;
    PVector sum;
    int count = 0;
    for (var other : particles) {

      PVector difference = location - other->location;
      if (difference.mag() > 0 && difference.mag() < range) {

        sum += other->velocity;
        count++;
      }
    }

    if (count > 0) {

      PVector avg = sum / count;
      avg = avg * max_speed;
      if (avg.mag() > max_speed) {

        avg = PVector.normalize(avg) * max_speed;
      }
      PVector steer = avg - velocity;
      if (steer.mag() > max_force) {

        steer = PVector.normalize(steer) * max_force;
      }
      result = steer;
    }

    return result;
  }

  //--------------------------------------------------------------
  PVector cohesion(ArrayList<Particle> particles) {

    PVector result;
    PVector sum;
    int count = 0;
    for (var other : particles) {

      PVector difference = location - other->location;
      if (difference.mag() > 0 && difference.mag() < range * 0.5) {

        sum += other->location;
        count++;
      }
    }

    if (count > 0) {

      result = seek(sum / count);
    }

    return result;
  }

  //--------------------------------------------------------------
  PVector seek(PVector target) {

    PVector desired = target - location;
    float distance = desired.mag();
    desired = PVector.normalize(desired);
    desired *= distance < range ? ofMap(distance, 0, range, 0, max_speed) : max_speed;
    PVector steer = desired - velocity;
    if (steer.mag() > max_force) {

      steer = PVector.normalize(steer) * max_force;
    }
    return steer;
  }

  //--------------------------------------------------------------
  void applyForce(PVector force) {

    acceleration += force;
  }
}

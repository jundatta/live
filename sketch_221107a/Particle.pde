//--------------------------------------------------------------
class Particle {
  PVector location;
  ArrayList<PVector> log = new ArrayList();

  PVector velocity;
  PVector acceleration = new PVector(0, 0, 0);

  float range;
  float max_force;
  float max_speed;

  color col;

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
    ofMesh mesh = new ofMesh();
    ArrayList<PVector> right = new ArrayList();
    ArrayList<PVector> left = new ArrayList();
    PVector last_location = new PVector(0, 0, 0);
    float last_theta = 0;

    for (int k = 0; k < log.size() - 1; k++) {
      PVector p = log.get(k);
      var loc = new PVector(p.x, p.y, 0);
      p = log.get(k + 1);
      var next = new PVector(p.x, p.y, 0);

      var direction = PVector.sub(next, loc);
      var theta = atan2(direction.y, direction.x);

      p = new PVector(ofMap(k, 0, log.size(), 0, head_size) * cos(theta + PI * 0.5), ofMap(k, 0, log.size(), 0, head_size) * sin(theta + PI * 0.5), 0);
      p.add(loc);
      right.add(p);
      p = new PVector(ofMap(k, 0, log.size(), 0, head_size) * cos(theta - PI * 0.5), ofMap(k, 0, log.size(), 0, head_size) * sin(theta - PI * 0.5), 0);
      p.add(loc);
      left.add(p);

      last_location = loc;
      last_theta = theta;
    }

    for (int k = 0; k < right.size(); k++) {
      mesh.addVertex(left.get(k));
      mesh.addVertex(right.get(k));

      int alpha = (int)ofMap(k, 0, log.size(), 0, 255);
      //mesh.addColor(color(red(col), green(col), blue(col), alpha));
      //mesh.addColor(color(red(col), green(col), blue(col), alpha));
      mesh.addColor(#ff0000);
      mesh.addColor(#ff0000);
    }

    for (int k = 0; k < mesh.getNumVertices() - 2; k += 2) {
      mesh.addIndex(k + 0);
      mesh.addIndex(k + 1);
      mesh.addIndex(k + 3);
      mesh.addIndex(k + 0);
      mesh.addIndex(k + 2);
      mesh.addIndex(k + 3);
    }

    //var tmp_header_size = ofMap(log.size() - 2, 0, log.size(), 0, head_size);
    //var tmp_alpha = ofMap(log.size() - 2, 0, log.size(), 0, 255);

    //mesh.addVertex(last_location);
    ////mesh.addColor(color(red(col), green(col), blue(col), tmp_alpha));
    //mesh.addColor(#ff0000);

    //int index = mesh.getNumVertices();
    //for (var theta = last_theta - PI * 0.5; theta <= last_theta + PI * 0.5; theta += PI / 20) {
    //  PVector p = new PVector(tmp_header_size * cos(theta), tmp_header_size * sin(theta), 0);
    //  p.add(last_location);
    //  mesh.addVertex(p);
    //  //mesh.addColor(color(red(col), green(col), blue(col), tmp_alpha));
    //  mesh.addColor(#ff0000);
    //}

    //for (int k = index; k < mesh.getNumVertices() - 1; k++) {
    //  mesh.addIndex(index);
    //  mesh.addIndex(k + 0);
    //  mesh.addIndex(k + 1);
    //}

    mesh.draw();
  }

  //--------------------------------------------------------------
  PVector separate(ArrayList<Particle> particles) {
    PVector result = new PVector(0, 0, 0);
    PVector sum = new PVector(0, 0, 0);

    int count = 0;
    for (var other : particles) {
      PVector difference = PVector.sub(location, other.location);
      if (difference.mag() > 0 && difference.mag() < range * 0.5) {
        difference.normalize();
        sum.add(difference);
        count++;
      }
    }
    if (count > 0) {
      PVector avg = PVector.div(sum, count);
      avg.mult(max_speed);
      if (avg.mag() > max_speed) {
        avg.normalize();
        avg.mult(max_speed);
      }
      PVector steer = PVector.sub(avg, velocity);
      if (steer.mag() > max_force) {
        steer.normalize();
        steer.mult(max_force);
      }
      result = steer;
    }
    return result;
  }

  //--------------------------------------------------------------
  PVector align(ArrayList<Particle> particles) {
    PVector result = new PVector(0, 0, 0);
    PVector sum = new PVector(0, 0, 0);

    int count = 0;
    for (var other : particles) {
      PVector difference = PVector.sub(location, other.location);
      if (difference.mag() > 0 && difference.mag() < range) {
        sum.add(other.velocity);
        count++;
      }
    }
    if (count > 0) {
      PVector avg = PVector.div(sum, count);
      avg.mult(max_speed);
      if (avg.mag() > max_speed) {
        avg.normalize();
        avg.mult(max_speed);
      }
      PVector steer = PVector.sub(avg, velocity);
      if (steer.mag() > max_force) {
        steer.normalize();
        steer.mult(max_force);
      }
      result = steer;
    }
    return result;
  }

  //--------------------------------------------------------------
  PVector cohesion(ArrayList<Particle> particles) {
    PVector result = new PVector(0, 0, 0);
    PVector sum = new PVector(0, 0, 0);

    int count = 0;
    for (var other : particles) {
      PVector difference = PVector.sub(location, other.location);
      if (difference.mag() > 0 && difference.mag() < range * 0.5) {
        sum.add(other.location);
        count++;
      }
    }
    if (count > 0) {
      result = seek(PVector.div(sum, count));
    }
    return result;
  }

  //--------------------------------------------------------------
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, location);
    float distance = desired.mag();
    desired.normalize();
    desired.mult(distance < range ? ofMap(distance, 0, range, 0, max_speed) : max_speed);
    PVector steer = PVector.sub(desired, velocity);
    if (steer.mag() > max_force) {
      steer.normalize();
      steer.mult(max_force);
    }
    return steer;
  }

  //--------------------------------------------------------------
  void applyForce(PVector force) {
    acceleration.add(force);
  }
}

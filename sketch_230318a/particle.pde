class Particle extends Coordinate2D {
  float prevX, prevY;
  float sx, sy;
  float vx, vy;
  float radius;
  float damping;
  float friction;
  float mass;
  Blob parent;
  HashGridClient client;
  Particle(
    float x,
    float y,
    float radius,
    float damping,
    float friction,
    float mass,
    Blob parent
    ) {
    super(x, y);
    this.prevX = x;
    this.prevY = y;
    this.sx = x;
    this.sy = y;
    this.vx = 0;
    this.vy = 0;
    // とりあえず、こうしておこう♪
    //this.radius = radius ?? 10;
    //this.damping = damping ?? 0.9;
    //this.friction = friction ?? 0.1;
    //this.mass = mass ?? 1;
    this.radius = radius;
    this.damping = damping;
    this.friction = friction;
    this.mass = mass;
    this.parent = parent;
  }

  void setClient(HashGridClient client) {
    this.client = client;
  }

  void move(float dx, float dy) {
    this.x += dx;
    this.y += dy;
  }

  void addForce(float fx, float fy) {
    this.vx += fx;
    this.vy += fy;
  }

  void attract(
    float otherX,
    float otherY,
    //strength = 1
    float strength
    ) {
    float diffx = otherX - this.x;
    float diffy = otherY - this.y;
    float mag = diffx * diffx + diffy * diffy;
    if (mag > 0.1) {
      float magSqrt = 1 / pow(mag, 0.5);
      this.addForce(
        diffx * magSqrt * strength, // force x
        diffy * magSqrt * strength // force y
        );
    }
  }

  Coordinate2D repel(
    float otherX,
    float otherY,
    //radius = 1,
    //strength = 1
    float radius,
    float strength
    ) {
    float diffx = this.x - otherX;
    float diffy = this.y - otherY;
    float mag = diffx * diffx + diffy * diffy;
    float combinedRadius = radius + this.radius;
    float minDist = combinedRadius * combinedRadius;
    if (mag > 0 && mag < minDist) {
      float magSqrt = pow(1 / mag, 0.5);
      float forceX = diffx * magSqrt * strength;
      float forceY = diffy * magSqrt * strength;
      this.addForce(forceX, forceY);
      return new Coordinate2D(forceX, forceY);
    }
    return null;
  }

  Coordinate2D testCollision(
    float otherX,
    float otherY,
    float radius
    ) {
    float diffx = otherX - this.x;
    float diffy = otherY - this.y;
    float diffMag = diffx * diffx + diffy * diffy;
    float combinedRadius = radius + this.radius;
    if (diffMag < pow(combinedRadius, 2)) {
      float forceMag = pow(diffMag, 0.5) - combinedRadius;
      float invMag = 1 / diffMag;
      float fx = diffx * invMag * forceMag;
      float fy = diffy * invMag * forceMag;
      return new Coordinate2D(fx, fy);
    }
    return null;
  }

  Coordinate2D collide(
    float otherX,
    float otherY,
    float radius
    ) {
    float diffx = otherX - this.x;
    float diffy = otherY - this.y;
    float diffMag = diffx * diffx + diffy * diffy;
    float combinedRadius = radius + this.radius;
    if (diffMag < pow(combinedRadius, 2)) {
      float forceMag = pow(diffMag, 0.5) - combinedRadius;
      float invMag = 1 / diffMag;
      float fx = diffx * invMag * forceMag;
      float fy = diffy * invMag * forceMag;

      this.move(fx, fy);

      this.prevX = lerp(this.prevX, this.x, this.friction);
      this.prevY = lerp(this.prevY, this.y, this.friction);

      return new Coordinate2D(fx, fy);
    }
    return null;
  }

  void constrain(
    float left,
    float top,
    float right,
    float bottom
    ) {
    final float x = this.x;
    final float y = this.y;
    final float friction = this.friction;
    final float radius = this.radius;

    left += radius;
    top += radius;
    right -= radius;
    bottom -= radius;

    boolean collide = false;

    if (x > right) {
      this.x = right;
      collide = true;
    } else if (x < left) {
      this.x = left;
      collide = true;
    }
    if (y > bottom) {
      this.y = bottom;
      collide = true;
    } else if (y < top) {
      this.y = top;
      collide = true;
    }

    if (collide) {
      this.prevX = lerp(this.prevX, this.x, friction);
      this.prevY = lerp(this.prevY, this.y, friction);
    }
  }

  Coordinate2D getVelocity() {
    return new Coordinate2D(this.vx, this.vy);
  }

  float getVelocityMag() {
    return pow((this.vx * this.vx + this.vy * this.vy), 0.5);
  }

  //update(dt = 1) {
  void update(float dt) {
    this.prevX = this.x;
    this.prevY = this.y;

    this.x += this.vx * dt;
    this.y += this.vy * dt;
  }

  //endUpdate(dt = 1) {
  void endUpdate(float dt) {
    float m = this.damping / dt;
    this.vx = (this.x - this.prevX) * m;
    this.vy = (this.y - this.prevY) * m;
  }

  void updateClient() {
    if (this.client != null) this.client.update();
  }
}

class ChainableParticle extends Particle {
  boolean isRoot;
  ChainableParticle prevSibling, nextSibling;
  ChainableParticle(
    float x,
    float y,
    float radius,
    float damping,
    float friction,
    float mass,
    Blob parent
    ) {
    super(x, y, radius, damping, friction, mass, parent);
    this.isRoot = false;
    this.prevSibling = null;
    this.nextSibling = null;
  }
  void setIsRoot(boolean isRoot) {
    this.isRoot = isRoot;
  }

  void setNextSibling(ChainableParticle sibling) {
    this.nextSibling = sibling;
  }
  void setPrevSibling(ChainableParticle sibling) {
    this.prevSibling = sibling;
  }
}

ArrayList<Bullet> bullets = new ArrayList();

class Bullet {
  PVector pos;
  boolean isDead;
  Bullet(float x, float y) {
    this.pos = new PVector(x, y);
    this.isDead = false;
  }
  void draw() {
    float frac = pos.y / (float)height;
    color colour = lerpColor(magenta, cyan, frac);
    fill(colour);
    noStroke();
    rect(b.pos.x, b.pos.y, 5, -10);
  }
  void update(float bulletSpeed) {
    if (isDead) {
      return;
    }
    pos.y -= bulletSpeed;
    checkCollisions(b);
  }
  void remove() {
    isDead = true;
  }
  boolean areColliding(Alien alien) {
    return dist(pos.x, pos.y, alien.pos.x, alien.pos.y) < 20;
  }
}

void drawBullets() {
  for (Bullet b : bullets) {
    b.draw();
  }
}

void updateBullets() {
  for (Bullet b : bullets) {
    b.update(config.bulletSpeed);
  }
  ArrayList<Bullet> newBullets = new ArrayList();
  for (Bullet b : bullets) {
    if (b.isDead == false) {
      newBullets.add(b);
    }
  }
  bullets = newBullets;
}

void removeAllBullets() {
  bullets = new ArrayList();
}

void checkCollisions(Bullet b) {
  for (Alien alien : aliens) {
    if (b.areColliding(alien)) {
      b.remove();
      alien.kill();
    }
  }
}

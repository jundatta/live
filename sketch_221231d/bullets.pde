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

function removeAllBullets() {
  bullets = [];
}

function removeBullet(b) {
  b.isDead = true;
}

function checkCollisions(b) {
  for (let alien of aliens) {
    if (areColliding(b, alien)) {
      removeBullet(b);
      killAlien(alien);
    }
  }
}

function areColliding(bullet, alien) {
  return dist(bullet.pos.x, bullet.pos.y, alien.pos.x, alien.pos.y) < 20;
}

let bullets = [];

function createBullet(x, y) {
  return {
  pos:
    {
      x,
        y
    }
    ,
    isDead:
    false
  };
}


function drawBullets() {
  bullets.forEach(drawBullet);
}

function drawBullet(b) {
  const frac = (b.pos.y / height);
  const colour = lerpColor(color("magenta"), color("cyan"), frac);
  fill(colour);
  noStroke();
  rect(b.pos.x, b.pos.y, 5, -10);
}

function updateBullets() {
  bullets.forEach(updateBullet);
  bullets = bullets.filter(a => !a.isDead);
}

function updateBullet(b) {
  if (b.isDead) {
    return;
  }
  b.pos.y -= config.bulletSpeed;
  checkCollisions(b);
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

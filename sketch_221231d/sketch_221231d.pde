// こちらがオリジナルです。
// 【作者】Neill Bogieさん
// 【作品名】Space invaders (WIP) procedural
// https://openprocessing.org/sketch/997803

int score = 0;

class Config{
  float alienSpriteSize = 30;
  float alienStepSize = 4;
  float framesBeforeAlienMove = 10;
  float playerMoveSpeed = 2;
  float bulletSpeed = 5;
};
Config config = new Config();

void setup() {
  size(600, 600);
  rectMode(CENTER);
    createAliens();
  createPlayer();
  aliensMoveDirectionIx = 0;
}

void draw() {
  background(50);

  drawAliens();
  drawBuildings();
  drawBullets();
  drawPlayer();

  updateAliens();
  updateBullets();
  updatePlayer();
  textSize(20);
  text(str(score), 100, 50);
}

void newLevel() {
  removeAllBullets();
  createAliens();
}



function keyPressed() {
  if (key === " ") {
    bullets.push(createBullet(player.pos.x, player.pos.y));
  }
}

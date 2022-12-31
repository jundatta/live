let score = 0;

let config = {
  alienSpriteSize:
30,
  alienStepSize:
4,
  framesBeforeAlienMove:
10,
  playerMoveSpeed:
2,
  bulletSpeed:
5
  }


function setup() {
  createCanvas(600, 600);
  rectMode(CENTER)
    createAliens();
  createPlayer();
  aliensMoveDirectionIx = 0;
}

function draw() {
  background(50);

  drawAliens();
  drawBuildings();
  drawBullets();
  drawPlayer();

  updateAliens();
  updateBullets();
  updatePlayer();
  textSize(20);
  text(score, 100, 50);
}

function newLevel() {
  removeAllBullets();
  createAliens();
}



function keyPressed() {
  if (key === " ") {
    bullets.push(createBullet(player.pos.x, player.pos.y));
  }
}

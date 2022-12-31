let player;

function createPlayer() {
  player = {
  pos:
  {
  x:
    width / 2,
    y:
    height - 50
  }
};
}

function drawPlayer() {
  fill(255);
  push();
  translate(player.pos.x, player.pos.y);
  rect(0, 0, 30, 12);
  rect(0, -8, 8, 12);
  pop();
}

function updatePlayer() {

  if (keyIsDown(LEFT_ARROW)) {
    player.pos.x = constrain(player.pos.x - config.playerMoveSpeed, 0, width);
  }
  if (keyIsDown(RIGHT_ARROW)) {
    player.pos.x = constrain(player.pos.x + config.playerMoveSpeed, 0, width);
  }
}

Player player;

class Player {
  PVector pos;
  Player() {
    this.pos = new PVector(width / 2, height - 50);
  }
  void draw() {
    fill(255);
    push();
    translate(pos.x, pos.y);
    rect(0, 0, 30, 12);
    rect(0, -8, 8, 12);
    pop();
  }
  void update(float playerMoveSpeed) {
    if (keyPressed && keyCode == LEFT) {
      pos.x = constrain(pos.x - playerMoveSpeed, 0, width);
    }
    if (keyPressed && keyCode == RIGHT) {
      pos.x = constrain(pos.x + playerMoveSpeed, 0, width);
    }
  }
}

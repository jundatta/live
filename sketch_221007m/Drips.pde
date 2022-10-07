class Pixel {
  float x, y;
  float yvel;
  float basex, basey;
  color c;
  int id;
  boolean falling;

  Pixel(float x, float y, color c, int id) {
    this.x = x;
    this.y = -300;
    this.yvel = 0;
    this.basex = x;
    this.basey = y;
    this.c = c;
    this.id = id;
    this.falling = true;
  }
  void move() {
    final int offset = 100; // 適当な値にゃ＼(^_^)／
    this.y += this.yvel;
    if (this.y < this.basey) {
      this.yvel += 0.5;
    } else {
      this.y -= this.yvel;
      this.yvel *= -0.3;
      // マウスの位置が画面範囲外なら何もしない
      if (mouseX < offset || width-offset < mouseX
        || mouseY < offset || height-offset < mouseY) {
        return;
      }
      float d = dist(this.x, this.y, mouseX, mouseY);
      if (d < 100) {
        this.yvel -= 1000 / (float)(d + 10);
      }
    }
  }
  void show() {
    push();
    fill(this.c);
    translate(this.x, this.y);
    rotate(radians(this.y-this.basey));
    rect(0, 0, 1.1*interval, 1.1*interval);
    pop();
  }
}

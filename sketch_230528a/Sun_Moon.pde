class CosmoObject {
  int type;
  float r, r_orbit;
  float x, y;
  color ccc;
  CosmoObject(int type) { // type=1: sun, type=-1: moon
    this.type = type;
    this.r = 200;
    this.r_orbit = 0.4 * width * type;
    this.x = 0;
    this.y = 0;
  }

  void get_pos(float angle) {
    this.x = width / 2.0f + 1.1 * this.r_orbit * cos(angle);
    this.y = height * 1.05 + this.r_orbit * sin(angle);
  }

  void get_sun_color() {
    float sunrise_alpha = (this.y - height * 2 / 3.0f) / (float)height;
    color color_high = color(255, 255, 230);
    color color_low = color(255, 255, 0);
    this.ccc = lerpColor(color_high, color_low, sunrise_alpha);
  }

  void get_moon_color() {
    float moonrise_alpha = (this.y - height / 2.0f) / (float)(1 / 3.0f * height);
    color color_high = color(210, 215, 235);
    color color_low = color(240, 245, 255);
    this.ccc = lerpColor(color_high, color_low, moonrise_alpha);
  }

  void draw() {
    noStroke();
    if (1 + this.type != 0) {
      this.get_sun_color();
      float gloom_alpha = 40 * (height * 2 / 3.0f - this.y) / (float)height;
      fill(color(250, 250, 80, gloom_alpha));

      circle(this.x, this.y, this.r * 2.5);
      circle(this.x, this.y, this.r * 2.2);
      circle(this.x, this.y, this.r * 1.9);
      circle(this.x, this.y, this.r * 1.6);
      circle(this.x, this.y, this.r * 1.3);
      fill(this.ccc);
      circle(this.x, this.y, this.r);
    } else {
      this.get_moon_color();
      fill(this.ccc);
      circle(this.x, this.y, this.r);
      fill(color(240, 245, 255));
      circle(this.x - 8, this.y - 8, this.r * 0.88);
    }
  }
}


class Star {
  float r, angle, r_orbit;
  float x, y;
  Star() {
    this.r = random(2, 8);
    this.angle = random(2 * PI);
    this.r_orbit = random(100, max(width, height));
    this.x = 0;
    this.y = 0;
  }

  void renew() {
    this.r_orbit *= -1;
  }

  void get_pos(float angle) {
    this.x = width / 2.0f + 1.1 * this.r_orbit * cos(angle + this.angle);
    this.y = height * 1.05 + this.r_orbit * sin(angle + this.angle);
  }

  void draw(color col) {
    noStroke();
    fill(col);
    circle(this.x, this.y, this.r);
  }
}

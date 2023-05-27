class CosmoObject {
  constructor(type) { // type=1: sun, type=-1: moon
    this.type = type;
    this.r = 200;
    this.r_orbit = 0.4 * width * type;
    this.x = 0;
    this.y = 0;
  }

  get_pos(angle) {
    this.x = width / 2 + 1.1 * this.r_orbit * cos(angle);
    this.y = height * 1.05 + this.r_orbit * sin(angle);
  }

  get_sun_color() {
    let sunrise_alpha = (this.y - height * 2 / 3) / height;
    let color_high = color(255, 255, 230);
    let color_low = color(255, 255, 0);
    this.color = lerpColor(color_high, color_low, sunrise_alpha);
  }

  get_moon_color() {
    let moonrise_alpha = (this.y - height / 2) / (1 / 3 * height);
    let color_high = color(210, 215, 235);
    let color_low = color(240, 245, 255);
    this.color = lerpColor(color_high, color_low, moonrise_alpha);
  }

  draw() {
    noStroke();
    if (1 + this.type) {
      this.get_sun_color();
      let gloom_alpha = 40 * (height * 2 / 3 - this.y) / height;
      fill(color(250, 250, 80, gloom_alpha));

      circle(this.x, this.y, this.r * 2.5);
      circle(this.x, this.y, this.r * 2.2);
      circle(this.x, this.y, this.r * 1.9);
      circle(this.x, this.y, this.r * 1.6);
      circle(this.x, this.y, this.r * 1.3);
      fill(this.color);
      circle(this.x, this.y, this.r);
    } else {
      this.get_moon_color();
      fill(this.color);
      circle(this.x, this.y, this.r);
      fill(color(240, 245, 255))
        circle(this.x - 8, this.y - 8, this.r * 0.88);
    }
  }
}


class Star {
  constructor() {
    this.r = random(2, 8);
    this.angle = random(2 * PI);
    this.r_orbit = random(100, max(width, height));
    this.x = 0;
    this.y = 0;
  }

  renew() {
    this.r_orbit *= -1;
  }

  get_pos(angle) {
    this.x = width / 2 + 1.1 * this.r_orbit * cos(angle + this.angle);
    this.y = height * 1.05 + this.r_orbit * sin(angle + this.angle);
  }

  draw(col) {
    noStroke();
    fill(col);
    circle(this.x, this.y, this.r);
  }
}

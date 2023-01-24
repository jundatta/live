class Particle {

  constructor(_x, _y, _w, _h, _hue, _alphaSpeed) {
    this.x = _x;
    this.y = _y;
    this.w = _w;
    this.h = _h;

    this.parHue = _hue;
    this.parLightness = int(random(50, 90));
    this.parAlpha = random(0.1, 1);
    this.alphaSpeed = _alphaSpeed;
  }

  update() {
    //------pattern1 (Lightness) ------
    // if (this.parLightness <= 50 || 100 <= this.parLightness) {
    //     this.lightPower *= -1;
    // }
    // this.parLightness += this.lightPower;

    //------pattern2 (lightAlpha) ------
    if (this.parAlpha < 0.1 || 0.9 < this.parAlpha) {
      this.alphaSpeed *= -1;
    }
    this.parAlpha += this.alphaSpeed;
  }

  display() {
    push();
    noStroke();
    fill('hsla(' + this.parHue + ', 100%, ' + int(this.parLightness) + '%, ' + this.parAlpha + ')');
    ellipse(this.x, this.y, this.w, this.h);
    pop();
  }
}

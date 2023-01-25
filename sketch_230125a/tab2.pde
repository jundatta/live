class Particle {
  float x, y, w, h;
  int parHue, parLightness;
  float parAlpha;
  float alphaSpeed;

  Particle(float _x, float _y, float _w, float _h, int _hue, float _alphaSpeed) {
    this.x = _x;
    this.y = _y;
    this.w = _w;
    this.h = _h;

    this.parHue = _hue;
    this.parLightness = int(random(50, 90));
    this.parAlpha = random(0.1, 1);
    this.alphaSpeed = _alphaSpeed;
  }

  void update() {
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

  void display() {
    push();
    noStroke();
    //fill('hsla(' + this.parHue + ', 100%, ' + int(this.parLightness) + '%, ' + this.parAlpha + ')');
    fill(P5JS.hsla2rgba(this.parHue, 100, int(this.parLightness), this.parAlpha));
    ellipse(this.x, this.y, this.w, this.h);
    pop();
  }
}

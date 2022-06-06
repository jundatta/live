class Car {
  float a, ra;
  float s;
  float id;
  int c;
  Car(float a, float s, int id, int num, int c) {
    this.a = a;
    this.ra = 0;
    this.s = s;
    this.id = id * TWO_PI / (float)num;
    this.c = c;
  }
  void show() {
    push();
    noFill();
    rotate(this.a - this.ra);
    translate(this.s / 2.0f, 0);
    stroke(this.c, 300, 360);
    ellipse(0, 0, this.s / 20.0f, this.s / 20.0f);
    line(0, 0, this.s / 1.5, 0);
    translate(this.s / 1.5, 0);
    ellipse(0, 0, this.s / 20.0f, this.s / 20.0f);
    rotate(this.ra);
    line(0, 0, this.s / 2.0f, 0);
    translate(this.s / 2.0f, 0);
    ellipse(0, 0, this.s / 20.0f, this.s / 20.0f);
    rotate(swing * this.a);
    rect(0, 0, this.s / 4.0f, this.s / 4.0f, this.s / 12.0f);
    pop();
  }
  void move() {
    this.ra = (this.id - ((swing * this.a) % TWO_PI)) % TWO_PI;
    this.a += av;
  }
}

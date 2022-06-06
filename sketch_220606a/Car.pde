class Car {
  constructor(a, s, id, c) {
    this.a = a;
    this.ra = 0;
    this.s = s;
    this.id = id * TWO_PI / numcars;
    this.c = c;
  }
  show() {
    push();
    noFill();
    rotate(this.a - this.ra);
    translate(this.s / 2, 0);
    stroke(this.c, 300, 360);
    ellipse(0, 0, this.s / 20, this.s / 20);
    line(0, 0, this.s / 1.5, 0);
    translate(this.s / 1.5, 0);
    ellipse(0, 0, this.s / 20, this.s / 20);
    rotate(this.ra);
    line(0, 0, this.s / 2, 0);
    translate(this.s / 2, 0);
    ellipse(0, 0, this.s / 20, this.s / 20);
    rotate(swing * this.a);
    rect(0, 0, this.s / 4, this.s / 4, this.s / 12);
    pop();
  }
  move() {
    this.ra = (this.id - ((swing * this.a) % TWO_PI)) % TWO_PI;
    this.a += av;
  }
}

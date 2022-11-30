void draw() {
  background(240);
  PVector v0 = new PVector(50, 50);

  PVector v1 = new PVector(50, 0);
  drawArrow(v0, v1, #ff0000);

  PVector v2 = new PVector(mouseX - 50, mouseY - 50);
  drawArrow(v0, v2, #0000ff);

  //float angleBetween = v1.angleBetween(v2);
  float angleBetween = PVector.angleBetween(v1, v2);
  noStroke();
  push();
  fill(0);
  text(
    "angle between: " +
    angleBetween +
    " radians or " +
    degrees(angleBetween) +
    " degrees",
    10,
    50,
    90,
    50
    );
    pop();
}

// draw an arrow for a vector at a given base position
void drawArrow(PVector base, PVector vec, color myColor) {
  push();
  stroke(myColor);
  strokeWeight(3);
  fill(myColor);
  translate(base.x, base.y);
  line(0, 0, vec.x, vec.y);
  rotate(vec.heading());
  float arrowSize = 7;
  translate(vec.mag() - arrowSize, 0);
  triangle(0, arrowSize / 2, 0, -arrowSize / 2, arrowSize, 0);
  pop();
}

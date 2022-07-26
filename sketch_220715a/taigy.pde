void taigy(float r) {
  float an1 = radians( - 90);
  float an2 = radians(  90);

  stroke(0);
  fill(255);
  float x = -r/4 * cos(an1);
  float y = -r/4 * sin(an1);
  ellipse(x, y, r/2, r/2);

  stroke(0);
  fill(255);
  arc(0, 0, r, r, an1, an2);

  fill(0);
  x = r/4 * cos(an1);
  y = r/4 * sin(an1);
  ellipse(x, y, r/2, r/2);

  stroke(255);
  fill(255);
  ellipse(x, y, r/6, r/6);

  noStroke();
  x = -r/4 * cos(an1);
  y = -r/4 * sin(an1);

  fill(0);
  ellipse(x, y, r/6, r/6);
}

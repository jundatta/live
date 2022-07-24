function taigy(r) {
  an1 = radians( - 90);
  an2 = radians(  90);
  an3 = radians(  270);
  an4 = radians(  270);

  stroke(0);
  fill(255);
  arc(0, 0, r, r, an1, an2);

  stroke(0);
  fill(255);
  x = -r/4 * cos(an1);
  y = -r/4 * sin(an1);
  arc(x, y, r/2, r/2, an2, an1);

  fill(0);
  x = r/4 * cos(an1);
  y = r/4 * sin(an1);
  ellipse(x, y, r/2);

  stroke(255);
  fill(255);
  ellipse(x, y, r/6);

  noStroke();
  x = -r/4 * cos(an1);
  y = -r/4 * sin(an1);

  fill(0);
  ellipse(x, y, r/6);
}

// this would better be described as highlight arcs
void ring(float i, float t, PMatrix2D aMatrix,
  float aRandomNumber, float rings, float ringSize, color[] colors, color c) {
  c = random(1) < 0.3 ? P5JS.random(colors) : c;
  int alpha = (int)map(1/rings, 0, 0.2, 0, 40);
  c = color(red(c), green(c), blue(c), alpha);

  stroke(c);
  noFill();

  applyMatrix(aMatrix);
  strokeWeight(map(noise(i/rings, t), 0, 1, relSize(1), relSize(20)));

  float arcStart = noise(5, i/rings) * PI*2;
  float arcEnd = arcStart + noise(aRandomNumber + i)*PI*2;

  if (arcEnd < arcStart) {
    arcEnd += TWO_PI;
  }
  arc(width/2, height/2, ringSize, ringSize, arcStart, arcEnd);
}

// the main blurry shape
void fadeRing(float i, float s, float rings, float ringSize, color[] colors, color c) {
  float arcStart = noise(i, i / rings) * PI * 2;
  float arcEnd = arcStart - random(PI * 0.5);
  c = random(1) < 0.3 ? P5JS.random(colors) : c;
  final float r = map(noise(s+i), 0, 1, ringSize*0.75, ringSize*1.25);

  c = color(red(c), green(c), blue(c), 100/rings);

  stroke(c);
  strokeWeight(map(noise(i), 0, 1, relSize(1), relSize(200)));
  if (arcEnd < arcStart) {
    arcEnd += TWO_PI;
  }
  arc(width / 2, height / 2, r, r, arcStart, arcEnd);
}

// look, i know glitter lost, but, glitter
void flecks(float i, float t, float ringSize, float startAngle, color c, color[] colors) {
  final PVector v = new PVector(0, ringSize/2);
  // why didn't anyone tell me circle math is so much easier with vectors
  v.rotate((noise(i/5.0f) * 3*PI)+ startAngle);
  v.setMag(P5JS.randomGaussian(ringSize/2, ringSize/10.0f));
  v.add(width/2, height/2);

  c = random(1) > 0.3 ? c : P5JS.random(colors);
  c = color(red(c), green(c), blue(c), 255 - (noise(i/5.0f + 1) * 255));

  fill(c);
  noStroke();
  final float r = map(noise(i/5.0f + 0.1), 0, 1, relSize(0.5), relSize(25));

  push();
  rectMode(CENTER);
  translate(v.x, v.y);
  rotate(PI/4.0f);

  if (noise(i*5, t*5) > 0.2) {
    ellipse(0, 0, r, r);
  }

  if (noise(i*5, t*5) > 0.65) {
    rect(0, 0, r*0.6, r*0.6);
  }
  pop();
}

// the "ridges" so to speak
void streaks(float i, float t, float rings, float ringSize, color c, color[] colors) {
  final float streakOffset = 40;
  push();
  final float ringIndex = floor(i/25.0f);
  final float offsetX = map(noise(ringIndex), 0, 1, -relSize(streakOffset), relSize(streakOffset));
  final float offsetY = map(noise(1000 + ringIndex), 0, 1, -relSize(streakOffset), relSize(streakOffset));
  translate(offsetX, offsetY);
  c = random(1) < 0.1 ? P5JS.random(colors) : c;
  c = color(red(c), green(c), blue(c), 100);
  stroke(c);
  strokeWeight(map(noise(i/rings), 0, 1, relSize(1), relSize(4)));
  noFill();

  float arcStart = (noise(5, ringIndex)+ P5JS.fract(t / ringIndex)/3.0f) * PI*2;
  float arcEnd = arcStart + (PI * 2 * noise(20, ringIndex));

  final float rs = ringSize * (noise(ringIndex) + 0.5);

  if (arcEnd < arcStart) {
    arcEnd += TWO_PI;
  }
  arc(width/2, height/2, P5JS.randomGaussian(rs, relSize(15)), P5JS.randomGaussian(rs, relSize(15)), arcStart, arcEnd);
  pop();
}


// the "grid lines" so to speak
void gridLines(float i, float s, float ringSize, float startAngle, color c) {
  final PVector v = new PVector(0, ringSize/2.0f);
  v.rotate((P5JS.fract(i/130.0f) * 2*PI) + floor(startAngle * s/3.0f));
  v.setMag(map(noise(floor(i/12.0f), s), 0, 1, ringSize/10.0f, ringSize*0.85));

  final PVector v2 = v.copy();
  v2.mult(random(1) > 0.1 ? 0.8 : 1.2);

  v.add(width/2, height/2);
  v2.add(width/2, height/2);

  c = color(red(c), green(c), blue(c), 255 - (noise(i/5.0f + 1) * 255));

  noFill();
  stroke(c);
  final float w = map(noise(i/5.0f + 0.1), 0, 1, relSize(0.5), relSize(5));
  strokeWeight(w);
  line(v.x, v.y, v2.x, v2.y);
}

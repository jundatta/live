// this would better be described as highlight arcs
void ring(float i, float t, PMatrix2D aMatrix,
  float aRandomNumber, float rings, float ringSize, color[] colors, color c) {
  c = random(1) < 0.3 ? random(colors) : c;
  c.setAlpha(map(1/rings, 0, 0.2, 0, 40));

  stroke(c);
  noFill();

  applyMatrix(aMatrix);
  strokeWeight(map(noise(i/rings, t), 0, 1, utils.relSize(1), utils.relSize(20)));

  let arcStart = noise(5, i/rings) * PI*2;
  let arcEnd = arcStart + noise(aRandomNumber + i)*PI*2;

  arc(width/2, height/2, ringSize, ringSize, arcStart, arcEnd);
}

// the main blurry shape
function fadeRing(i, s, rings, ringSize, colors, c) {
  let arcStart = noise(i, i / rings) * PI * 2;
  let arcEnd = arcStart - random(PI * 0.5);
  c = random() < 0.3 ? random(colors) : c;
  const r = map(noise(s+i), 0, 1, ringSize*0.75, ringSize*1.25);

  c.setAlpha(100/rings);

  stroke(c);
  strokeWeight(map(noise(i), 0, 1, utils.relSize(1), utils.relSize(200)))
    arc(width / 2, height / 2, r, r, arcStart, arcEnd);
}

// look, i know glitter lost, but, glitter
function flecks(i, t, ringSize, startAngle, c, colors) {
  const v = createVector(0, ringSize/2);
  // why didn't anyone tell me circle math is so much easier with vectors
  v.rotate((noise(i/5) * 3*PI)+ startAngle);
  v.setMag(randomGaussian(ringSize/2, ringSize/10));
  v.add(width/2, height/2);

  c = random() > 0.3 ? c : random(colors);
  c.setAlpha(255 - (noise(i/5 + 1) * 255));

  fill(c);
  noStroke();
  const r = map(noise(i/5 + 0.1), 0, 1, utils.relSize(0.5), utils.relSize(25));

  push();
  rectMode(CENTER);
  translate(v.x, v.y);
  rotate(PI/4);

  if (noise(i*5, t*5) > 0.2) {
    ellipse(0, 0, r, r);
  }

  if (noise(i*5, t*5) > 0.65) {
    rect(0, 0, r*0.6, r*0.6);
  }
  pop();
}

// the "ridges" so to speak
function streaks(i, t, rings, ringSize, c, colors) {
  const streakOffset = 40;
  push();
  const ringIndex = floor(i/25);
  const offsetX = map(noise(ringIndex), 0, 1, -utils.relSize(streakOffset), utils.relSize(streakOffset));
  const offsetY = map(noise(1000 + ringIndex), 0, 1, -utils.relSize(streakOffset), utils.relSize(streakOffset));
  translate(offsetX, offsetY);
  c = random() < 0.1 ? random(colors) : c;
  c.setAlpha(100);
  stroke(c);
  strokeWeight(map(noise(i/rings), 0, 1, utils.relSize(1), utils.relSize(4)))
    noFill();

  let arcStart = (noise(5, ringIndex)+ fract(t / ringIndex)/3) * PI*2;
  let arcEnd = arcStart + (PI * 2 * noise(20, ringIndex));

  const rs = ringSize * (noise(ringIndex) + 0.5);

  arc(width/2, height/2, randomGaussian(rs, utils.relSize(15)), randomGaussian(rs, utils.relSize(15)), arcStart, arcEnd);
  pop();
}


// the "grid lines" so to speak
function gridLines(i, s, ringSize, startAngle, c) {
  const v = createVector(0, ringSize/2);
  v.rotate((fract(i/130) * 2*PI) + floor(startAngle * s/3));
  v.setMag(map(noise(floor(i/12), s), 0, 1, ringSize/10, ringSize*0.85));

  const v2 = v.copy();
  v2.mult(random() > 0.1 ? 0.8 : 1.2);

  v.add(width/2, height/2);
  v2.add(width/2, height/2);

  c.setAlpha(255 - (noise(i/5 + 1) * 255));

  noFill();
  stroke(c);
  const w = map(noise(i/5 + 0.1), 0, 1, utils.relSize(0.5), utils.relSize(5));
  strokeWeight(w);
  line(v.x, v.y, v2.x, v2.y);
}

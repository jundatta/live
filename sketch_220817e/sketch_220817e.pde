// https://openprocessing.org/sketch/1284920

// By Clara Bower
// https://twitter.com/clarabellum

// Made for @sableRaph's weekly creative challenge on Twitch (#WCCChallenge)
// https://www.twitch.tv/sableraph

// This week: Void

float ringSize;
color mainColor;
color accentColor;
color streakColor;
color[] colors = { // manually set to some colors i thought fit the vibe
  #ff3311,
  #1166ff,
  #6633ff,
  #ee6611,
  color(50, 205, 209),
  color(120, 5, 205),
  color(211, 73, 39),
  color(254, 232, 20)
};

float rings = 100;
final float minShift = -100;
final float maxShift = 100;

float t; // sin time
float s; // cosine time
float aRandomNumber; // for seeds
PMatrix2D aMatrix; // for weirdness

float startAngle = 0;

float shearAmount;

// despite what it sounds like, this is NOT for cross-browser support!
// https://twitter.com/clarabellum/status/1442906188576804865
final boolean forceIE = false;

void setup() {
  size(1112, 834);

  reset();
  blendMode(ADD);
  strokeCap(SQUARE);
}

void reset() {
  // seeds and arbitrary stuff
  aRandomNumber = random(1000);
  aMatrix = utils.getMatrix(0.01);

  // stuff about shapes
  rings = random(50, 150);
  ringSize = utils.relSize(random(250, 600));
  startAngle = random(PI*2);

  shearAmount = random(-0.1, 0.1) * PI;

  // stuff about colors
  mainColor = random(colors);
  streakColor = random(colors);

  accentColor = mainColor;
  while (mainColor == accentColor) {
    accentColor = random(colors);
  }

  if (forceIE) {
    mainColor = colors[1];
    accentColor = colors[4];
    streakColor = colors[7];
    shearAmount = -Math.abs(shearAmount);
  }
}

function drawRing(i) {
  ring(i, t, aMatrix, aRandomNumber, rings, ringSize, colors, mainColor)
}
function drawFadedArc(i) {
  fadeRing(i, s, rings, ringSize, colors, mainColor)
}
function drawFlecks(i) {
  flecks(i, t, ringSize, startAngle, accentColor, colors);
}
function drawLines(i) {
  gridLines(i, s, ringSize, startAngle, accentColor)
}
function drawStreaks(i) {
  streaks(i, t, rings, ringSize, streakColor, colors)
}


function draw() {
  clear();
  background(0);
  t = Math.sin(frameCount/80.0f);
  s = Math.cos(frameCount/60.0f);

  // setting the randomSeed to the same arbitrary number every draw
  // is what keeps the randomized elements in the same places
  // without having to save their location
  // you just have to make sure you call random() the same number of times
  randomSeed(aRandomNumber);

  shearX(shearAmount);
  translate(width * (-shearAmount/2.0f), 0); // wild that this works

  for (float index = 0; index < rings; index++) {
    push();

    translate(
      map(noise(index/rings, 1), 0, 1, utils.relSize(minShift), utils.relSize(maxShift)),
      map(noise(1, index/rings), 0, 1, utils.relSize(minShift), utils.relSize(maxShift))
      ); // jiggle the canvas around

    drawRing(index);
    drawFadedArc(index);
    drawFadedArc(index+0.5);

    drawFlecks(index);
    drawFlecks(index + 0.5);
    pop();
  }

  // these I don't want jiggled
  // i want them twisted slightly in a consistent way.
  // hence, ...aMatrix.
  applyMatrix(aMatrix);

  // btw, i think in openProcessing you can just say applyMatrix(aMatrix)
  // but in my env you need to spread the matrix because webpack is stricter I guess

  for (float index = 0; index < rings; index++) {
    drawStreaks(index);
    drawLines(index);
  }
}

void mouseReleased() {
  reset();
}

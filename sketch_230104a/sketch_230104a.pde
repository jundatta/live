// こちらがオリジナルです。
// 【作者】Sayamaさん
// 【作品名】200621
// https://openprocessing.org/sketch/919601

color[][] palette = {
  {#0e6245, #f9e54d, #18302b},
  {#b10b0b, #fc995f, #3f1732},
  {#393232, #f3e4af, #000000}
};
int UNIT = 10;
color bgCol, lineCol, holeCol;
PGraphics partsGra, holerGra;

void setup() {
  P5JS.setup(this);
  size(1112, 834, P3D);
  holerGra = createGraphics(width, height);
  partsGra = createGraphics(width, height);
  noLoop();
  //let cols = random(palette);
  //bgCol = cols[0];
  //lineCol = cols[1];
  //holeCol = cols[2];
  bgCol = P5JS.random(palette[0]);
  lineCol = P5JS.random(palette[1]);
  holeCol = P5JS.random(palette[2]);
}

void draw() {
  background(bgCol);
  float noff = random(100);
  float sw = UNIT/5.0f;
  float miconSpan = UNIT*20;

  holerGra.beginDraw();
  partsGra.beginDraw();
  
  //line
  for (float i = 0; i < 30; i++) drawLine(unitNum(random(width)), unitNum(random(height)), noff, sw*2);

  //parts
  for (float y = 0; y < height; y += miconSpan) {
    for (float x = 0; x < width; x += miconSpan) {
      int cx = unitNum(x + random(miconSpan*0.3));
      int cy = unitNum(y + random(miconSpan*0.3));
      if (random(1) > 0.2)micon(cx, cy, int(random(1, 15)), noff, sw);
      else {
        drawLine(cx, cy, noff, sw);
        drawLine(cx, cy + UNIT, noff, sw);
        partsGra.noStroke();
        partsGra.fill(holeCol);
        int wh = int(random(1, 5))*UNIT;
        partsGra.ellipse(cx, cy, wh, wh);
      }
    }
  }

  //line
  for (int i = 0; i < 1000; i++) drawLine(unitNum(random(width)), unitNum(random(height)), noff, sw);

  holerGra.endDraw();
  partsGra.endDraw();
  
  //layer
  image(holerGra, 0, 0);
  image(partsGra, 0, 0);

  //noise
  noStroke();
  fill(255, 20);
  for (float i = 0; i < width*height; i++) {
    float x = random(width);
    float y = random(height);
    float s = noise(x*0.01, y*0.01)*1 + 0.5;
    rect(x, y, s, s);
  }
}

/////////////

int unitNum(float num) {
  return floor(num/UNIT)*UNIT;
}

/////////////

void drawLine(int x, int y, float noiseoff, float w) {
  color col = this.get(x, y);
  if (abs(brightness(col) - brightness(lineCol)) < 5)return;
  //setting
  float c = 50;
  float px = x;
  float py = y;
  float t = random(1);
  boolean reverse = random(1) > 0.5 ? true : false;
  float scl = 0.01;
  stroke(lineCol);
  strokeWeight(w);
  noFill();
  //draw
  hole(x, y, UNIT*0.8);
  for (float i = 0; i < c; i++)
  {
    float angle = P5JS.map(int(noise(x* scl +noiseoff, y * scl + noiseoff, t)*9), 0, 8, 0, TAU, true);
    if (reverse)angle  = PI-angle;
    line(x, y, px, py);
    px = x;
    py = y;
    x += round(cos(angle)) * UNIT;
    y += round(sin(angle)) * UNIT;
    //線に当たったら終了
    col = this.get(x, y);
    if (abs(brightness(col) - brightness(lineCol)) < 5) {
      line(x, y, px, py);
      circle(x, y, UNIT*0.2);
      break;
    }
    //最後までいったら
    if (i == c-1)hole(px, py, UNIT*0.8);
  }
}

void micon(float cox, float coy, int pinNum, float noff, float sw)
{
  boolean rot = random(1) > 0.5 ? true : false;
  int x = unitNum(cox);
  int y = unitNum(coy);
  int h = pinNum * UNIT;
  int w = max(UNIT, unitNum(h * random(0.2, 0.6)));

  //きたねえ分岐
  if (rot ==false) {
    for (int p = y; p <= y + h; p += UNIT) {
      drawLine(x, p, noff, sw);
      hole(x, p, UNIT*0.8);
      drawLine(x + w, p, noff, sw);
      hole(x + w, p, UNIT*0.8);
    }
    partsGra.noStroke();
    partsGra.fill(holeCol);
    partsGra.rect(x + UNIT*0.1, y, w-UNIT*0.2, h);
  } else {
    for (int p = x; p <= x + h; p += UNIT) {
      drawLine(p, y, noff, sw);
      hole(p, y, UNIT*0.8);
      drawLine(p, y+w, noff, sw);
      hole(p, y+w, UNIT*0.8);
    }
    partsGra.noStroke();
    partsGra.fill(holeCol);
    partsGra.rect(x, y + UNIT*0.1, h, w-UNIT*0.2);
  }
}


void hole(float x, float y, float dia) {
  holerGra.noStroke();
  holerGra.fill(lineCol);
  holerGra.circle(x, y, dia);
  holerGra.fill(holeCol);
  holerGra.circle(x, y, dia-UNIT*0.4);
}

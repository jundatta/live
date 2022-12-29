// こちらがオリジナルです。
// 【作者】kikpondさん
// 【作品名】Night view from the summit #2
// https://openprocessing.org/sketch/1332776

float t;
float[] mountainHeights;
color c1, c2;

void setup() {
  size(1112, 834);
  mountainHeights = new float[width];
  background(0);
  init();
}


void draw() {
  background(0);
  gradationBackground(0, 0, width, height, c1, c2);
  //starLight();
  //moon();
  //deppMountain();
  townLight(1000);
  //townLightLine(width / 2, height / 2, width, height);
  //townLightLines(50);
  //mountain();
  noLoop();
}

void init() {
  t = 0;
  noiseSeed(int(random(5)));
  for (int x = 0; x < width; x++) {
    float n = noise(t);
    t += 0.01;
    mountainHeights[x] = n * 100;
  }
  c1 = color(0);
  c2 = color(0, 102, int(random(100, 255)));
}

void gradationBackground(float x, float y, float w, float h, color _c1, color _c2) {
  for (float i = y; i <= y + h; i += 1) {
    float inter = map(i, y, y + h, 0, 1);
    //float c = lerpColor(_c1, _c2, inter);  // きゃあ＼(^_^)／
    color c = lerpColor(_c1, _c2, inter);    // うぎゃぁぁあああああああ！！
    stroke(c);
    line(x, i, x + w, i);
  }
}

void mountain() {
  push();
  stroke(0);
  strokeWeight(5);
  float rand = random(1.1, 1.7);
  for (int x = 0; x < width; x++) {
    //line(x, height, x, (height - 50) - (rand * mountainHeights[x]));
    line(x, height, x, ((height - rand * 100) - mountainHeights[x]));
  }
  pop();
}

void deppMountain() {
  push();
  stroke(10);
  strokeWeight(1);
  float rand = random(0.1, 1.3);
  for (int x = width-1; x > 0; x--) {
    line(width - x, height / 2 + 10, width - x, height / 2 - (mountainHeights[x] * rand));
  }
  pop();
}

void townLight(float num) {
  push();
  noStroke();
  for (int i = 0; i < num; i++) {
    float x = random(0, width);
    float y = random(height / 2, height / 2 + height / 10.0f);
    float r = map(y, height / 2, height, 1, 2);
    fill(255);
    ellipse(x, y, r, r);
  }

  push();
  colorMode(HSB, 360, 100, 100, 1.0f);
  for (int i = 0; i < num * 3; i++) {
    float x = random(0, width);
    float y = random(height / 2, height / 2 + height / 10.0f);
    float r = map(y, height / 2, height, 1, 2);
    float rand = int(random(360));
    fill(rand, 100, 50, 0.5);
    //ellipse(x, y, r, r);
  }
  pop();

  for (int i = 0; i < num; i++) {
    float x = random(0, width);
    float y = random(height / 2, height);
    float r = map(y, height / 2, height, 1, 10);
    fill(255);
    ellipse(x, y, r, r);
  }

  push();
  colorMode(HSB, 360, 100, 100, 1.0f);
  for (int i = 0; i < num * 2; i++) {
    float x = random(0, width);
    float y = random(height / 2, height);
    float r = map(y, height / 2, height, 1, 10);
    float rand = int(random(100));
    fill(rand, 100, 80, 1.0f);
    ellipse(x, y, r, r);
  }
  pop();
  pop();
}

void starLight() {
  push();
  float rand = random(100, 200);
  for (int i = 0; i < rand; i++) {
    float x = random(0, width);
    float y = random(0, 300);
    noStroke();
    fill(255);
    ellipse(x, y, 1, 1);
  }
  pop();
}

void moon() {
  push();
  noStroke();
  float moonX = random(100, width - 100);
  float moonY = random(100, height / 2 - 100);
  float diamater = random(20, 80);
  colorMode(HSB, 360, 100, 100, 1.0f);
  for (int i = 0; i < diamater; i++) {
    float c = int(map(i, 0, 100, 80, 100));
    fill(200, 50, c, 0.3);
    ellipse(moonX, moonY, diamater - i, diamater - i);
  }
  pop();
}

void townLightLine(float x, float y, float x2, float y2, float leng) {
  float angle = atan2(y2 - y, x2 - x);
  int randColor = int(random(100));
  push();
  noStroke();
  colorMode(HSB, 360, 100, 100, 1.0f);
  for (int i = 0; i < 1000; i += 10) {
    float rand = random(leng);
    float px = x + cos(angle) * rand;
    float py = y + sin(angle) * rand;
    fill(randColor, 100, 90, 1.0f);
    ellipse(px, py, py / 150.0f, py / 150.0f);
  }
  pop();
}

void townLightLines(float num) {
  for (int i = 0; i < num; i++) {
    float x = random(width);
    float y = random(height / 2, height / 2 + 100);
    float x2 = random(x, width);
    float y2 = random(y, height);

    townLightLine(x, y, x2, y2, 400);
  }
}

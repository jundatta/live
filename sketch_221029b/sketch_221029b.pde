// こちらがオリジナルです。
// 【作者】Austin Obringerさん
// 【作品名】Flappy Bird
// https://openprocessing.org/sketch/857975

ArrayList<Pillar> pillars = new ArrayList<Pillar>();
Bird bird;
float pillarSpacing;
float spaceSize;
float wide;
float g;
float hop;
boolean gameOver;
float worldPos;
float gameSpeed;
float endTime;
float mapHeight;
float mapBottomSize;
float pillarTopSize;
color green;
float[] bushHeights;
float[] cloudHeights;
float cloudOff;
float bushOff;
int pipesPassed;

void setup() {
  size(550, 800);
  rectMode(CENTER);
  frameRate(60);

  pillarSpacing = 400;
  gameSpeed = 4;
  pillarSpacing = floor(pillarSpacing / gameSpeed);
  pillarSpacing *= gameSpeed;
  spaceSize = 200;
  wide = 100;
  g = 9.8 / frameRate;
  hop = 5;
  worldPos = -gameSpeed * 10;
  mapHeight = height - 150;

  bird = new Bird();
  green = color(100, 200, 75);
  mapBottomSize = height - mapHeight;
  pillarTopSize = 35;
  bushHeights = new float[(width * 2 + 50 + (50-1)) / 50];
  for (int i = 0; i < bushHeights.length; i++) {
    bushHeights[i] = random(25, 55);
  }
  cloudHeights = new float[(width * 2 + 75 + (75-1)) / 75];
  for (int i = 0; i < cloudHeights.length; i++) {
    cloudHeights[i] = random(25, 55);
  }
}

void draw() {
  if (!gameOver) {
    background(100, 175, 225);
    drawBack();
    fill(139, 69, 19);
    rect(width / 2, mapHeight + mapBottomSize / 2, width, mapBottomSize);
    fill(75, 180, 75);
    rect(width / 2, mapHeight + 10, width, 20);

    bird.display();
    bird.update();
    for (int i = 0; i < pillars.size(); i++) {
      pillars.get(i).display();
      pillars.get(i).update();
      pillars.get(i).collision();
      pillars.get(i).isPassed();
      if (pillars.get(i).x < -wide / 2) {
        pillars.remove(i);
        i--;
      }
    }
    fill(255);
    textSize(70);
    textAlign(CENTER);
    text(pipesPassed, width / 2, mapHeight + mapBottomSize * (2 / 3));
    worldPos += gameSpeed;
    if (worldPos % pillarSpacing == 0) {
      pillars.add(new Pillar(width + wide / 2, random(spaceSize / 2 + pillarTopSize, mapHeight - spaceSize / 2 - pillarTopSize)));
    }
    cloudOff += 0.2;
    bushOff += 0.1;
  } else {
    background(100, 175, 225);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(50);
    text("You passed " + pipesPassed + " pipes!", width / 2, height / 2);
    endTime++;
  }
}

class Bird {
  float x;
  float y;
  float r;
  float yvel;

  Bird() {
    x = 100;
    y = height / 2;
    r = 20;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    if (yvel >= 0) {
      rotate(radians(25));
    } else if (yvel < 0) {
      rotate(radians(-25));
    }
    stroke(0);
    strokeWeight(2);
    fill(255, 255, 0);
    ellipse(0, 0, r * 2, r * 2);
    fill(255);
    ellipse(-r * (2 / 3.0f), 0, r * 1.2, r);
    fill(255, 165, 0);
    ellipse(r * 7 / 9.0f, r * (3 / 9.0f), r * 1.2, r / 1.5);
    line(r * 7 / 9.0f - r * 0.6, r * (3 / 9.0f), r * 7 / 9.0f + r * 0.6, r * (3 / 9.0f));
    fill(255);
    ellipse(r * (3 / 5.0f), -r * (1 / 3.0f), r * 0.8, r * 0.8);
    fill(0);
    ellipse(r * 7 / 9.0f, -r * (3 / 9.0f), r / 3.0f, r / 3.0f);
    popMatrix();
  }

  void update() {
    y += yvel;
    yvel += g;
    if (y > mapHeight - r || y < r) {
      gameOver = true;
    }
  }
}

class Pillar {
  float x;
  float spaceY;
  float speed;
  float topSize;
  float bottomSize;
  float topEdge;
  float bottomEdge;
  boolean passed;

  Pillar(float x_, float y_) {
    x = x_;
    spaceY = y_;
    speed = gameSpeed;
    topEdge = spaceY - spaceSize / 2;
    bottomEdge = spaceY + spaceSize / 2;
    topSize = topEdge;
    bottomSize = mapHeight - spaceSize - topSize;
  }

  void display() {
    fill(green);
    rect(x, topSize / 2, wide, topSize + 2);
    rect(x, spaceY + spaceSize / 2 + bottomSize / 2, wide, bottomSize);
    rect(x, topEdge - pillarTopSize / 2 + 1, wide + 10, pillarTopSize);
    rect(x, bottomEdge + pillarTopSize / 2 - 1, wide + 10, pillarTopSize);
  }

  void update() {
    x -= speed;
  }

  void collision() {
    float bx = bird.x;
    float by = bird.y;
    float br = bird.r;
    if (bx + br > x - wide / 2 && bx - br < x + wide / 2) {
      if (by + br > bottomEdge || by - br < topEdge) {
        gameOver = true;
      }
    }
  }

  void isPassed() {
    if (!passed && x < bird.x) {
      passed = true;
      pipesPassed++;
    }
  }
}

void mousePressed() {
  bird.yvel = -hop;
  if (gameOver && endTime > 20) {
    reset();
  }
}

void keyPressed() {
  bird.yvel = -hop;
  if (gameOver && endTime > 20) {
    reset();
  }
}

void reset() {
  gameOver = false;
  endTime = 0;
  pillars = new ArrayList<Pillar>();
  bird.y = mapHeight / 2;
  bird.yvel = 0;
  worldPos = -gameSpeed * 10;
  pipesPassed = 0;
}

void drawBack() {
  for (int i = 0; i < width * 2 + 75; i += 75) {
    fill(255, 220);
    stroke(220);
    float pos = i - cloudOff;
    float loops = floor(cloudOff / width);
    float newPos = pos + (width * loops);
    arc(newPos, mapHeight - 75, 75, cloudHeights[i / 75], radians(-180), 0);
  }
  noStroke();
  fill(255, 220);
  rect(width / 2, mapHeight - 50, width, 50);
  for (int i = 0; i < width * 2 + 50; i += 50) {
    fill(75, 180, 75);
    stroke(50, 150, 50);
    float pos = i - bushOff;
    float loops = floor(bushOff / width);
    float newPos = pos + (width * loops);
    arc(newPos, mapHeight - 25, 50, bushHeights[i / 50], radians(-180), 0);
  }
  noStroke();
  rect(width / 2, mapHeight, width, 50);
  stroke(0);
}

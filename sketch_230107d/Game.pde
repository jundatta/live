ArrayList<Alien> aliens = new ArrayList();
ArrayList<Missile> missiles = new ArrayList();
Ship ship;
boolean gameStarted = false;
int hitCount = 0;
float alienXpos = 0;
float alienYpos = 0;
float alienMove;
//let blop, fire, blomp;

void setupGame() {
  cg.beginDraw();
  cg.textFont(font);
  cg.rectMode(CENTER);
  cg.textAlign(CENTER, CENTER);
  cg.textSize(cg.height/10.0f);
  cg.fill(0);
  cg.noStroke();
  alienMove = cg.width/600.0f;
  ship = new Ship(cg.width / 2.0f, cg.height - 20);
  // createAliens()はLaunchGame.kick()のタイミングでまとめる
  //createAliens();
  for (Alien a : aliens) {
    a.show();
  }
  ship.show();
  cg.endDraw();
}

void createAliens() {
  // ゲームオーバー後の再ゲームで初期化できるようにaliansを空にする
  aliens.clear();

  float xw = cg.width/20.0f;
  float yh = cg.height/20.0f;
  int pv = 20;
  for (float y = 4*yh; y < 9*yh; y += 1.5*yh) {
    for (float x = xw; x < cg.width - 6*xw; x += 1.5*xw) {
      aliens.add(new Alien(x, y, xw, yh, pv));
    }
    pv-=5;
  }
}

void checkStick() {
  ship.move(za*500);
}

void restartGame() {
  alienXpos = 0;
  alienYpos = 0;
  //alienMove = 1;
  hitCount = 0;
  createAliens();
}

void drawGame() {
  cg.beginDraw();
  if (!gameStarted) {
    cg.background(50);
  } else {
    cg.background(10);
    cg.fill(255);
    cg.text("Score: " + hitCount, cg.width / 2, cg.height/16);
    for (int i = missiles.size() - 1; i >= 0; i--) {
      Missile m = missiles.get(i);
      m.show();
      m.move();
      if (m.y < 0) {
        missiles.remove(i);
      }
    }
    for (int i = aliens.size() - 1; i >= 0; i--) {
      Alien a = aliens.get(i);
      a.show();
      a.move();
      if (a.intersects(ship)) {
        gameStarted = false;
      }
      for (int j = missiles.size() - 1; j >= 0; j--) {
        Missile m = missiles.get(j);
        if (a.intersects(m)) {
          hitCount += a.pv;
          aliens.remove(i);
          missiles.remove(j);
          //blop.play();
          ma.playAndRewind("blop");
          if (aliens.size() < 1) {
            restartGame();
          }
          break;
        }
      }
    }
    checkStick();
    alienXpos += alienMove;
    if (aliensRight() >= cg.width || aliensLeft() <= 0) {
      alienXpos -= alienMove;
      alienMove *= -1;
      alienYpos += 25;
    }
    ship.show();
  }
  cg.endDraw();
}

float aliensRight() {
  float max = 0;
  for (Alien a : aliens) {
    float re = a.x + a.w / 2.0f;
    if (re > max) {
      max = re;
    }
  }
  return max;
}

float aliensLeft() {
  float min = width;
  for (Alien a : aliens) {
    float le = a.x - a.w / 2.0f;
    if (le < min) {
      min = le;
    }
  }
  return min;
}

class Alien {
  float x, y;
  float startx, starty;
  float w, h;
  color col;
  int pv;
  Alien(float x, float y, float w, float h, int pv) {
    this.x = x;
    this.y = y;
    this.startx = x;
    this.starty = y;
    this.w = w;
    this.h = h;
    // オリジナルのテレビ画面（cg）の高さで色（.col）をマップする
    final int OrgCgH = 442;
    //this.col = color(this.y, 255-this.y, 255);
    int cgY = (int)map(this.y, 0, height, 0, OrgCgH);
    this.col = color(cgY, 255-cgY, 255);
    this.pv = pv;
  }
  void show() {
    cg.fill(this.col);
    cg.rect(this.x, alienYpos + this.y, this.w, this.h);
    cg.fill(0);
    cg.rect(this.x - this.w/4.0f, alienYpos + this.y, this.w/5.0f, this.h/5.0f);
    cg.rect(this.x + this.w/4.0f, alienYpos + this.y, this.w/5.0f, this.h/5.0f);
  }
  boolean intersects(Ship s) {
    return (abs(this.x - s.x) < this.w / 2.0f && abs(alienYpos + this.y - (s.y - s.h)) < this.h);
  }
  boolean intersects(Missile m) {
    return (abs(this.x - m.x) < this.w / 2.0f && abs(alienYpos + this.y - m.y) < this.h);
  }
  void move() {
    this.x += alienMove;
  }
}

class Ship {
  float x, y;
  float h;
  Ship(float x, float y) {
    this.x = x;
    this.y = y;
    this.h = cg.height/20.0f + cg.height/12.0f;
  }
  void show() {
    cg.fill(255);
    cg.rect(this.x, this.y - cg.width/20.0f, cg.width/10.0f, cg.height/20.0f); //60,6
    cg.rect(this.x, this.y - cg.height/12.0f, cg.width/96.0f, cg.height/12.0f); //10,30
  }
  void move(float amount) {
    this.x += amount;
    if (this.x>cg.width-35) this.x = cg.width-35;
    if (this.x<35) this.x = 35;
  }
}

class Missile {
  float x, y;
  float yvel;
  Missile(float x, float y) {
    this.x = x;
    this.y = y;
    this.yvel = -cg.height/45.0f;
  }
  void show() {
    cg.fill(255);
    cg.rect(this.x, this.y, cg.width/128.0f, cg.height/24.0f);
  }
  void move() {
    this.y += this.yvel;
  }
}

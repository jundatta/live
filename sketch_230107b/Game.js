let aliens = [];
let missiles = [];
let ship;
let gameStarted = false;
let hitCount = 0;
let alienXpos = 0;
let alienYpos = 0;
let alienMove;
let img;
let blop, fire, blomp;
let shoot;
let ptvalues = [20, 15, 10, 5];

function setupGame() {
  cg.rectMode(CENTER);
  cg.textAlign(CENTER, CENTER);
  cg.textSize(cg.height/10);
  cg.fill(0);
  cg.noStroke();
  alienMove = cg.width/600;
  ship = new Ship(cg.width / 2, cg.height - 20);
  createAliens();
  for (let a of aliens) {
    a.show();
  }
  ship.show();
}

function createAliens() {
  let xw = cg.width/20;
  let yh = cg.height/20;
  let pv = 20;
  for (let y = 4*yh; y < 9*yh; y += 1.5*yh) {
    for (let x = xw; x < cg.width - 6*xw; x += 1.5*xw) {
      aliens.push(new Alien(x, y, xw, yh, pv));
    }
    pv-=5;
  }
}

function checkStick() {
  ship.move(za*500);
}

function restartGame() {
  alienXpos = 0;
  alienYpos = 0;
  let alienMove = 1;
  aliens = [];
  createAliens();
}

function gameOver() {
  gameStarted = false;
  background(0);
  fill(255);
  textSize(50);
  text('GAME OVER', 200, 200);
}

function drawGame() {
  if (!gameStarted) {
    cg.background(50);
  } else {
    cg.background(10);
    cg.fill(255);
    cg.text('Score: ' + hitCount, cg.width / 2, cg.height/16);
    for (let i = missiles.length - 1; i >= 0; i--) {
      missiles[i].show();
      missiles[i].move();
      if (missiles[i].y < 0) {
        missiles.splice(i, 1);
      }
    }
    for (let i = aliens.length - 1; i >= 0; i--) {
      aliens[i].show();
      aliens[i].move();
      if (aliens[i].intersects(ship)) {
        gameOver();
      }
      for (let j = missiles.length - 1; j >= 0; j--) {
        if (aliens[i].intersects(missiles[j])) {
          hitCount += aliens[i].pv;
          aliens.splice(i, 1);
          missiles.splice(j, 1);
          blop.play();
          if (aliens.length < 1) {
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
}

function aliensRight() {
  var max = 0;
  for (let a of aliens) {
    let re = a.x + a.w / 2;
    if (re > max) {
      max = re;
    }
  }
  return max;
}

function aliensLeft() {
  var min = width;
  for (let a of aliens) {
    let le = a.x - a.w / 2;
    if (le < min) {
      min = le;
    }
  }
  return min;
}

class Alien {
  constructor(x, y, w, h, pv) {
    this.x = x;
    this.y = y;
    this.startx = x;
    this.starty = y;
    this.w = w;
    this.h = h;
    this.color = color(this.y, 255-this.y, 255);
    this.pv = pv;
  }
  show() {
    cg.fill(this.color);
    cg.rect(this.x, alienYpos + this.y, this.w, this.h);
    cg.fill(0);
    cg.rect(this.x - this.w/4, alienYpos + this.y, this.w/5, this.h/5);
    cg.rect(this.x + this.w/4, alienYpos + this.y, this.w/5, this.h/5);
  }
  intersects(other) {
    return (abs(this.x - other.x) < this.w / 2 && abs(alienYpos + this.y - other.y) < this.h);
  }
  move() {
    this.x += alienMove;
  }
}

class Ship {
  constructor(x, y) {
    this.x = x;
    this.y = y
  }
  show() {
    cg.fill(255);
    cg.rect(this.x, this.y - cg.width/20, cg.width/10, cg.height/20); //60,6
    cg.rect(this.x, this.y - cg.height/12, cg.width/96, cg.height/12); //10,30
  }
  move(amount) {
    this.x += amount;
    if (this.x>cg.width-35) this.x = cg.width-35;
    if (this.x<35) this.x = 35;
  }
}

class Missile {
  constructor(x, y) {
    this.x = x;
    this.y = y;
    this.yvel = -cg.height/45;
  }
  show() {
    cg.fill(255);
    cg.rect(this.x, this.y, cg.width/128, cg.height/24);
  }
  move() {
    this.y += this.yvel;
  }
}

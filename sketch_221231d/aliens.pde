ArrayList<Alien> aliens;
int aliensMoveDirectionIx;
let spriteDesigns;

int[][] aliensMoveDirections = { {1, 0}, {0, 1}, {-1, 0}, {0, 1} };

void createAliens() {
  createAlienSpriteDesigns();
  aliens = new ArrayList();
  for (let col = 0; col < 11; col++) {
    for (let row = 0; row < 5; row++) {
      aliens.add(new Alien(col, row));
    }
  }
}

class Alien {
  PVector pos;
  int row;
  boolean isDead;
  Alien(int col, int row) {
    float spacing = width / 14.0f;
    float x = (1 + col) * spacing;
    float y = (1 + row) * spacing;
    this.pos = new PVector(x, y);
    this.row = row;
    this.isDead = false;
  }
  void draw(float sz) {
    fill(255);
    noStroke();
    push();
    translate(pos.x, pos.y);
    drawAlienSprite(row, sz);
    pop();
  }
  void kill() {
    isDead = true;
    score += 20;
    // すべて死んでいたらnewLevel()する
    //if (!aliens.some(a => !a.isDead)) {
    //  newLevel();
    //}
    boolean bAllDead = true;
    for (Alien a : aliens) {
      if (!a.isDead) {
        bAllDead = false;
        break;
      }
    }
    if (bAllDead) {
      newLevel();
    }
  }
  void move(float alienStepSize) {
    if (movingDown()) {
      alien.pos.y += 50;
    } else {
      //const [xOffset, yOffset] = currentMoveDirection().map(v => v * config.alienStepSize);
      int[] offset = currentMoveDirection();
      alien.pos.x += alienStepSize * offset.x;
    }
  }
}

void drawAliens() {
  for (Alien a : aliens) {
    a.draw(config.alienSpriteSize);
  }
}

// 後回し＼(^_^)／
void drawAlienSprite(int alienNumber, float sz) {
  color c = lerpColor(magenta, cyan, alienNumber / 4.0f);
  fill(c);
  const design = spriteDesigns[alienNumber];
  push();
  const pixelSize = sz / 5;
  translate(-sz / 2, -sz / 2);
  const designKeyForFrame = frameCount % 60 < 30 ? "main" : "alt";
  repeat(5, (row) => {
    repeat(5, col => {
      const bit = design[designKeyForFrame].rows[row][col < 3 ? col : 4 - col];
      if (bit) {
        square(col * pixelSize, row * pixelSize, pixelSize);
      }
    }
    );
  }
  );
  pop();
}

int[] currentMoveDirection() {
  return aliensMoveDirections[aliensMoveDirectionIx];
}

boolean movingRight() {
  return currentMoveDirection()[0] > 0;
}

boolean movingLeft() {
  return currentMoveDirection()[0] < 0;
}

boolean movingDown() {
  return currentMoveDirection()[1] == 1;
}

boolean isAtScreenEdge(Alien alien) {
  return (
    (movingRight() && alien.pos.x > width - 50) ||
    (movingLeft() && alien.pos.x < 50));
}

void advanceMoveDirection() {
  aliensMoveDirectionIx = (aliensMoveDirectionIx + 1) % aliensMoveDirections.length;
}

void updateAliens() {
  if (frameCount % config.framesBeforeAlienMove == 0) {
    for (Alian a : aliens) {
      a.move(config.alienStepSize);
    }
    if (movingDown()) {
      advanceMoveDirection();
    }
    if ((movingLeft() || movingRight()) && aliens.some(isAtScreenEdge)) {
      advanceMoveDirection();
    }
  }
  //aliens = aliens.filter(a => !a.isDead);
  ArrayList<Alien> newAliens = new ArrayList();
  for (Alien a : aliens) {
    if (a.isDead == false) {
      newAliens.add(a);
    }
  }
  aliens = newAliens;
}


void createAlienSpriteDesigns() {
  spriteDesigns = collect(5, () => createRandomAlienSpriteDesign());
}

class Design {
  boolean[][] pixelOn = new boolean[5][3];
  Design() {
    for (row = 0; row < pixelOn.length; row++) {
      for (col = 0; col < pixelOn[row].length; col++) {
        if (random(1) < 0.5f) {
          pixelOn[row][col] = true;
        } else {
          pixelOn[row][col] = false;
        }
      }
    }
  }
  Design(Design src) {
    for (row = 0; row < pixelOn.length; row++) {
      for (col = 0; col < pixelOn[row].length; col++) {
        pixelOn[row][col] = src.pixelOn[row][col];
      }
    }
  }
}

// "main" ⇒ Design[0]、"alt" ⇒ Design[1]と決めた！
class IX {
  int x, y;
  IX(int x, int y) {
    this.x = x;
    this.y = y;
  }
}
Design[] createRandomAlienSpriteDesign() {
  Design[] dsn = new Design[2];
  dsn[0] = new Design();  // "main"
  dsn[1] = new Design(dsn[0]);  // "alt"

  //generate the [x,y] values of the possible positions
  IX[] positions = new IX[15];
  for (ix = 0; ix < positions.length; ix++) {
    IX p = new IX(ix % 3, floor(ix / 3));
  }

  //choose which to mutate
  IX[] positionsToToggle = shuffle(positions).slice(0, 3);
  for (IX ix : positionsToToggle) {
    dsn[1].rows[ix.y][ix.x] = !dsn[1].rows[ix.y][ix.x];
  }

  return dsn;
}

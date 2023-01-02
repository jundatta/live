let aliens;
let aliensMoveDirectionIx;
let spriteDesigns;

let aliensMoveDirections = [
  [1, 0],
  [0, 1],
  [-1, 0],
  [0, 1]
];



function createAliens() {
  createAlienSpriteDesigns();
  aliens = [];
  for (let col = 0; col < 11; col++) {
    for (let row = 0; row < 5; row++) {
      aliens.push(createAlien(col, row));
    }
  }
}

function createAlien(col, row) {
  spacing = width / 14;
  const x = (1 + col) * spacing;
  const y = (1 + row) * spacing;
  return {
  pos:
    {
      x,
        y
    }
    ,
      row,
    isDead:
    false
  };
}

function drawAliens() {
  aliens.forEach(drawAlien);
}

function drawAlien(alien) {
  fill(255);
  noStroke();
  push();
  translate(alien.pos.x, alien.pos.y);
  drawAlienSprite(alien.row, config.alienSpriteSize);
  pop();
}

function drawAlienSprite(alienNumber, sz) {
  const c = lerpColor(color("magenta"), color("cyan"), alienNumber / 4);
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

function currentMoveDirection() {
  return aliensMoveDirections[aliensMoveDirectionIx];
}

function movingRight() {
  return currentMoveDirection()[0] > 0;
}

function movingLeft() {
  return currentMoveDirection()[0] < 0;
}

function movingDown() {
  return currentMoveDirection()[1] === 1;
}

function isAtScreenEdge(alien) {
  return (
    (movingRight() && alien.pos.x > width - 50) ||
    (movingLeft() && alien.pos.x < 50));
}

function advanceMoveDirection() {
  aliensMoveDirectionIx = (aliensMoveDirectionIx + 1) % aliensMoveDirections.length;
}

function updateAliens() {
  if (frameCount % config.framesBeforeAlienMove === 0) {
    aliens.forEach(moveAlien);
    if (movingDown()) {
      advanceMoveDirection();
    }
    if ((movingLeft() || movingRight()) && aliens.some(isAtScreenEdge)) {
      advanceMoveDirection()
    }
  }
  aliens = aliens.filter(a => !a.isDead);
}

function moveAlien(alien) {
  if (movingDown()) {
    alien.pos.y += 50;
  } else {

    const [xOffset, yOffset] = currentMoveDirection().map(v => v * config.alienStepSize);
    alien.pos.x += xOffset;
  }
}


function killAlien(alien) {
  alien.isDead = true;
  score += 20;
  if (!aliens.some(a => !a.isDead)) {
    newLevel();
  }
}

function createAlienSpriteDesigns() {
  spriteDesigns = collect(5, () => createRandomAlienSpriteDesign());
}


function createRandomAlienSpriteDesign() {

  const design = {
  main:
  {
  rows:
    collect(5, () => collect(3, () => random([true, false])))
  }
  ,
};
//that's the main design done, but let's create also an alt design for animation,
// where 3 random bits have been toggled

//first make a copy of main
design.alt = {
  rows:
JSON.parse(JSON.stringify(design.main.rows))
  };

//generate the [x,y] values of the possible positions
const positions = collect(15, (ix) => [ix % 3, floor(ix / 3)]);
console.log("[ps]");
console.log(positions);

//choose which to mutate
const positionsToToggle = shuffle(positions).slice(0, 3);
console.log("[pt]");
console.log(positionsToToggle);
console.log();

function flipBit([x, y]) {
  design.alt.rows[y][x] = !design.alt.rows[y][x];
}
positionsToToggle.forEach(flipBit);

return design;
}

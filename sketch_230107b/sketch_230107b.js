let unit;
let xa = 0;
let za = 0;
let orient, otarget;
let clicky;
let buttony = 0;
let wood;
let cg;
let logo;
let font;
let stabilize = false;

function preload() {
  //soundFormats('mp3', 'wav');
  //clicky = loadSound('myclick2.wav');
  //fire = loadSound('fire.wav');
  //blop = loadSound('death.wav');
  wood = loadImage('walnut.jpg');
  logo = loadImage('atari.png');
  font = loadFont('Minecraft.ttf');
  //blomp = loadSound('fastinvader1.wav');
}


function setup() {
  createCanvas(windowWidth, windowHeight, WEBGL);
  unit = height / 50;
  cg = createGraphics(80 * unit, 60 * unit);
  logo.resize(3.5 * unit, 0);
  cg.textFont(font);
  setupGame();
  camera(0, -height / 4, (height / 2.0) / tan(PI * 20.0 / 180.0), 0, 0, 0, 0, 1, 0);
  orient = createVector(0, 0, 0);
  otarget = createVector(0, -PI / 12, 0);
  imageMode(CENTER);
  setInterval(playBlomp, 1000);
}

function draw() {
  background(0);
  if (!stabilize) {
    otarget.x = map(mouseY, 0, height, PI / 6, -PI / 6);
    otarget.y = map(mouseX, 0, width, PI / 24, -PI / 24);
  }
  orient.lerp(otarget, 0.1);
  rotateX(orient.x);
  rotateY(orient.y);
  ambientLight(100);
  pointLight(100, 100, 100, width, -height, 0);
  let lamp = 120*noise(frameCount/20);
  if (gameStarted) pointLight(lamp/2, 0, lamp, 0, 0, 0);

  specularMaterial(0);
  noStroke();
  translate(0, 10 * unit, 20 * unit);
  rotateX(-PI / 12);
  drawGame();
  drawTV();
  drawAntenna();
  rotateY(-3*orient.y);
  drawBase();
  drawBaffles();
  drawStick();
  drawButton();
}

function drawTV() {
  push();
  texture(wood);
  translate(0, 0, -200 * unit);
  box(110 * unit, 70 * unit, 70 * unit);
  translate(0, -36 * unit, 0);
  box(120 * unit, 3 * unit, 74 * unit);
  translate(0, 36 * unit, 0);

  texture(cg);
  translate(7 * unit, 0, 35.5 * unit);
  box(80 * unit, 60 * unit, 2 * unit);
  translate(-48 * unit, 0, 0);
  specularMaterial(20);
  box(12 * unit, 60 * unit, 2 * unit);
  translate(0, 12 * unit, unit);
  rotateX(HALF_PI);
  for (let i = 0; i < 3; i++) {
    specularMaterial('silver');
    cylinder(3 * unit, 13 * unit);
    translate(0, 0, 12 * unit);
  }
  pop();
  for (let x = -45 * unit; x <= 45 * unit; x += 90 * unit) {
    texture(wood);
    push();
    translate(x, 45 * unit, -190 * unit);
    box(35 * unit, 20 * unit, 10 * unit);
    pop();
  }
}

function drawAntenna() {
  push();
  translate(0, -35 * unit, -200 * unit);
  specularMaterial('black');
  sphere(15 * unit);
  push();
  rotateZ(PI / 12);
  translate(0, -50 * unit, 0);
  specularMaterial('silver');
  cylinder(5, 100 * unit);
  translate(0, -50*unit, 0);
  cylinder(15, 8);
  pop();
  push();
  rotateZ(-PI / 12);
  translate(0, -50 * unit, 0);
  specularMaterial('silver');
  cylinder(5, 100 * unit);
  translate(0, -50*unit, 0);
  cylinder(15, 8);

  pop();
  pop();
}

function drawBase() {
  specularMaterial(0);
  box(22 * unit, 5 * unit, 20 * unit);
  box(20 * unit, 5 * unit, 22 * unit);
  box(20 * unit, 7 * unit, 20 * unit);
  for (let x = -10 * unit; x <= 10 * unit; x += 20 * unit) {
    push();
    rotateY(HALF_PI);
    translate(x, -2.5 * unit, 0);
    rotateX(HALF_PI);
    cylinder(unit, 20 * unit);
    translate(0, 0, -5 * unit);
    cylinder(unit, 20 * unit);
    pop();
    push();
    translate(x, -2.5 * unit, 0);
    rotateX(HALF_PI);
    cylinder(unit, 20 * unit);
    translate(0, 0, -5 * unit);
    cylinder(unit, 20 * unit);
    pop();
    for (let z = -10 * unit; z <= 10 * unit; z += 20 * unit) {
      push();
      translate(x, 0, z);
      cylinder(unit, 5 * unit);
      translate(0, -2.5 * unit, 0);
      sphere(unit);
      translate(0, 5 * unit, 0);
      sphere(unit);
      pop();
    }
  }
}

function drawBaffles() {
  push();
  translate(0, -3 * unit, 0);
  rotateX(HALF_PI);
  for (let r = 7 * unit; r > 2 * unit; r -= unit) {
    translate(0, 0, unit / 5);
    rotateX(xa / 5);
    rotateY(za / 5);
    torus(r, unit);
  }
  pop();
}

function drawStick() {
  za = map(mouseX, 0, width, -PI / 18, PI / 18);
  xa = map(mouseY, 0, height, PI / 18, -PI / 18);
  push();
  translate(0, -2 * unit, 0);
  rotateX(xa);
  rotateZ(za);
  translate(0, -10 * unit, 0);
  cylinder(1.5 * unit, 20 * unit, 9, 1);
  pop();
}

function drawButton() {
  push();
  translate(-7.5 * unit, -3.5 * unit - buttony, -7.5 * unit);
  specularMaterial('red');
  cylinder(1.5 * unit, unit);
  pop();
  push();
  translate(-7.5 * unit, -3.5 * unit, -7.5 * unit);
  rotateX(HALF_PI);
  specularMaterial('black');
  torus(1.8 * unit, unit / 2);
  translate(15 * unit, 0, 1);
  image(logo, 0, 0);

  pop();
}

function mousePressed() {
  //userStartAudio();
  buttony = -unit / 4;
  if (gameStarted) {
    //fire.play();
    missiles.push(new Missile(ship.x, ship.y-cg.height/12));
  } else {
    //clicky.play();
    setTimeout(launchGame, 500);
  }
}

function mouseReleased() {
  buttony = unit / 4;
}

function keyPressed() {
  if (keyCode == 32) stabilize = !stabilize;
  if (keyCode == 13) {
    //clicky.play();
    gameStarted = !gameStarted;
  }
}

function playBlomp() {
  if (!gameStarted) return;
  //blomp.play();
}

function launchGame() {
  gameStarted = true;
}

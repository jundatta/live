// こちらがオリジナルです。
// 【作者】Ivan Rudnickiさん
// 【作品名】Atari Joystick
// https://openprocessing.org/sketch/1548176

float unit;
float xa = 0;
float za = 0;
PVector orient, otarget;
//let clicky;
float buttony = 0;
PImage wood;
PGraphics cg;
PImage logo;
PFont font;
boolean stabilize = false;

void preload() {
  //soundFormats('mp3', 'wav');
  //clicky = loadSound('myclick2.wav');
  //fire = loadSound('fire.wav');
  //blop = loadSound('death.wav');
  wood = loadImage("walnut.jpg");
  logo = loadImage("atari.png");
  font = createFont("Minecraft.ttf", 50, true);
  //blomp = loadSound('fastinvader1.wav');
}

class Timer {
  int lastT;
  Timer() {
    lastT = millis();
  }
  boolean kick() {
    return false;  // ワンショット
  }
}
ArrayList<Timer> at;

class PlayBlomp extends Timer {
  boolean kick() {
    int nowT = millis();
    if (lastT + 1000 < nowT) {
      return true;  // 継続する
    }
    lastT = nowT;
    if (!gameStarted) return true;  // ひきつづき監視する
    //blomp.play();
    return true;  // ひきつづき監視する
  }
}

function launchGame() {
  gameStarted = true;
}
class LaunchGame extends Timer {
  boolean kick() {
    int nowT = millis();
    if (lastT + 500 < nowT) {
      return true;  // 継続する
    }
    lastT = nowT;
    gameStarted = true;
    return false;  // ワンショットで終わる
  }
}
void setup() {
  size(1112, 834, P3D);
  preload();

  unit = height / 50.0f;
  cg = createGraphics(80 * unit, 60 * unit);
  logo.resize(3.5 * unit, 0);
  cg.textFont(font);
  setupGame();
  camera(0, -height / 4.0f, (height / 2.0) / tan(PI * 20.0 / 180.0), 0, 0, 0, 0, 1, 0);
  orient = createVector(0, 0, 0);
  otarget = createVector(0, -PI / 12.0f, 0);
  imageMode(CENTER);
  at.add(new PlayBlomp());
}

void draw() {
  ArrayList newAt = new ArrayList();
  for (Timer t : at) {
    if (t.kick()) {
      newAt.add(t);
    }
  }
  at = newAt;

  background(0);
  if (!stabilize) {
    otarget.x = map(mouseY, 0, height, PI / 6.0f, -PI / 6.0f);
    otarget.y = map(mouseX, 0, width, PI / 24.0f, -PI / 24.0f);
  }
  orient.lerp(otarget, 0.1);
  rotateX(orient.x);
  rotateY(orient.y);
  ambientLight(100);
  pointLight(100, 100, 100, width, -height, 0);
  float lamp = 120*noise(frameCount/20.0f);
  if (gameStarted) pointLight(lamp/2.0f, 0, lamp, 0, 0, 0);

  specularMaterial(0);
  noStroke();
  translate(0, 10 * unit, 20 * unit);
  rotateX(-PI / 12.0f);
  drawGame();
  drawTV();
  drawAntenna();
  rotateY(-3*orient.y);
  drawBase();
  drawBaffles();
  drawStick();
  drawButton();
}

void drawTV() {
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
    specularMaterial(#c0c0c0);  // 'silver'
    cylinder(3 * unit, 13 * unit);
    translate(0, 0, 12 * unit);
  }
  pop();
  for (float x = -45 * unit; x <= 45 * unit; x += 90 * unit) {
    texture(wood);
    push();
    translate(x, 45 * unit, -190 * unit);
    box(35 * unit, 20 * unit, 10 * unit);
    pop();
  }
}

void drawAntenna() {
  push();
  translate(0, -35 * unit, -200 * unit);
  specularMaterial(#000000);  // 'black'
  sphere(15 * unit);
  push();
  rotateZ(PI / 12.0f);
  translate(0, -50 * unit, 0);
  specularMaterial(#c0c0c0);  // 'silver'
  cylinder(5, 100 * unit);
  translate(0, -50*unit, 0);
  cylinder(15, 8);
  pop();
  push();
  rotateZ(-PI / 12.0f);
  translate(0, -50 * unit, 0);
  specularMaterial(#c0c0c0);  // 'silver'
  cylinder(5, 100 * unit);
  translate(0, -50*unit, 0);
  cylinder(15, 8);

  pop();
  pop();
}

void drawBase() {
  specularMaterial(0);
  box(22 * unit, 5 * unit, 20 * unit);
  box(20 * unit, 5 * unit, 22 * unit);
  box(20 * unit, 7 * unit, 20 * unit);
  for (float x = -10 * unit; x <= 10 * unit; x += 20 * unit) {
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
    for (float z = -10 * unit; z <= 10 * unit; z += 20 * unit) {
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

void drawBaffles() {
  push();
  translate(0, -3 * unit, 0);
  rotateX(HALF_PI);
  for (let r = 7 * unit; r > 2 * unit; r -= unit) {
    translate(0, 0, unit / 5.0f);
    rotateX(xa / 5.0f);
    rotateY(za / 5.0f);
    torus(r, unit);
  }
  pop();
}

void drawStick() {
  za = map(mouseX, 0, width, -PI / 18.0f, PI / 18.0f);
  xa = map(mouseY, 0, height, PI / 18.0f, -PI / 18.0f);
  push();
  translate(0, -2 * unit, 0);
  rotateX(xa);
  rotateZ(za);
  translate(0, -10 * unit, 0);
  cylinder(1.5 * unit, 20 * unit, 9, 1);
  pop();
}

void drawButton() {
  push();
  translate(-7.5 * unit, -3.5 * unit - buttony, -7.5 * unit);
  specularMaterial(#ff0000);  // 'red'
  cylinder(1.5 * unit, unit);
  pop();
  push();
  translate(-7.5 * unit, -3.5 * unit, -7.5 * unit);
  rotateX(HALF_PI);
  specularMaterial(#000000);  // 'black'
  torus(1.8 * unit, unit / 2.0f);
  translate(15 * unit, 0, 1);
  image(logo, 0, 0);

  pop();
}

void mousePressed() {
  //userStartAudio();
  buttony = -unit / 4.0f;
  if (gameStarted) {
    //fire.play();
    missiles.push(new Missile(ship.x, ship.y-cg.height/12.0f));
  } else {
    //clicky.play();
    at.add(new LaunchGame());
  }
}

void mouseReleased() {
  buttony = unit / 4.0f;
}

void keyPressed() {
  if (keyCode == 32) stabilize = !stabilize;
  if (keyCode == 13) {
    //clicky.play();
    gameStarted = !gameStarted;
  }
}

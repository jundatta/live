// こちらがオリジナルです。
// 【作者】Ivan Rudnickiさん
// 【作品名】Atari Joystick
// https://openprocessing.org/sketch/1548176

MinimAssistance ma;

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

PShape cy3_13;
PShape cy5_100;
PShape cy15_8;
PShape cy_20;
PShape cy_5;
PShape cy15;
PShape tr18;
PShape cy15_20_9_1;
PShape box;
PShape sphere;

PGraphics silver;
PGraphics black;
PGraphics white;
PGraphics red;

PShape plane;

void preload() {
  //soundFormats('mp3', 'wav');
  ma = new MinimAssistance(this);
  //clicky = loadSound('myclick2.wav');
  //fire = loadSound('fire.wav');
  //blop = loadSound('death.wav');
  //blomp = loadSound('fastinvader1.wav');
  ma.entry("clicky", "myclick2.wav");
  ma.entry("fire", "fire.wav");
  ma.entry("blop", "death.wav");
  ma.entry("blomp", "fastinvader1.wav");

  wood = loadImage("walnut.jpg");
  logo = loadImage("atari.png");
  font = createFont("Minecraft.ttf", 50, true);
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
ArrayList<Timer> at = new ArrayList();

class PlayBlomp extends Timer {
  boolean kick() {
    int nowT = millis();
    if (nowT < lastT + 1000) {
      return true;  // 継続する
    }
    lastT = nowT;
    if (!gameStarted) return true;  // ひきつづき監視する
    //blomp.play();
    ma.playAndRewind("blomp");
    return true;  // ひきつづき監視する
  }
}
class LaunchGame extends Timer {
  boolean kick() {
    int nowT = millis();
    if (nowT < lastT + 500) {
      return true;  // 継続する
    }
    lastT = nowT;
    // 再ゲームのために初期化する
    hitCount = 0;
    restartGame();
    gameStarted = true;
    return false;  // ワンショットで終わる
  }
}

void setup() {
  size(1112, 834, P3D);
  preload();

  unit = height / 50.0f;
  cy3_13 = createCan(3 * unit, 13 * unit, 24, true, false);
  cy5_100 = createCan(5, 100 * unit);
  cy15_8 = createCan(15, 8);
  cy_20 = createCan(unit, 20 * unit);
  cy_5 = createCan(unit, 5 * unit);
  cy15 = createCan(1.5 * unit, unit, 24, false, true);
  cy15_20_9_1 = createCan(1.5 * unit, 20 * unit, 9, false, true);
  tr18 = createTorus(1.8 * unit, unit / 2.0f);

  // fill()ではp5.jsの発色に負けるのであえてPShapeに変える
  box = createShape(BOX, 1.0f, 1.0f, 1.0f);
  box.setStroke(false);
  sphere = createShape(SPHERE, 1);
  sphere.setStroke(false);

  // setFill()は色がくすぶるのであえて1x1のテクスチャで色を貼る
  // ※speculer()が効かない？分pointLight()をきつめに当てているので
  // 　色味を色見本の値からいい感じ？に変えている
  silver = createGraphics(1, 1);
  silver.beginDraw();
  silver.background(#606060);
  silver.endDraw();
  black = createGraphics(1, 1);
  black.beginDraw();
  black.background(#202020);
  black.endDraw();
  white = createGraphics(1, 1);
  white.beginDraw();
  white.background(#ffffff);
  white.endDraw();
  red = createGraphics(1, 1);
  red.beginDraw();
  red.background(#ff0000);
  red.endDraw();

  // テレビ画面が左右逆になるのでboxから自前の板ポリゴンを作って貼るように変えた＼(^_^)／
  plane = createShape();
  plane.beginShape();
  plane.vertex(-0.5f, -0.5f, 0.0f, 0.0f, 0.0f);
  plane.vertex(+0.5f, -0.5f, 0.0f, 1.0f, 0.0f);
  plane.vertex(+0.5f, +0.5f, 0.0f, 1.0f, 1.0f);
  plane.vertex(-0.5f, +0.5f, 0.0f, 0.0f, 1.0f);
  plane.endShape(CLOSE);
  plane.setStroke(false);

  cg = createGraphics((int)(80 * unit), (int)(60 * unit));
  logo.resize((int)(3.5 * unit), 0);
  setupGame();
  orient = new PVector(0, 0, 0);
  otarget = new PVector(0, -PI / 12.0f, 0);
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

  camera(0, -height / 4.0f, (height / 2.0) / tan(PI * 20.0 / 180.0), 0, 0, 0, 0, 1, 0);

  background(0);
  if (!stabilize) {
    otarget.x = map(mouseY, 0, height, PI / 6.0f, -PI / 6.0f);
    otarget.y = map(mouseX, 0, width, PI / 24.0f, -PI / 24.0f);
  }
  orient.lerp(otarget, 0.1);
  rotateX(orient.x);
  rotateY(orient.y);
  ambientLight(100, 100, 100);
  pointLight(255, 255, 255, width, -height, 0);
  pointLight(255, 255, 255, width, -height, 0);
  //pointLight(255, 255, 255, width, -height, 0);
  float lamp = 120*noise(frameCount/20.0f);
  if (gameStarted) pointLight(lamp/2.0f, 0, lamp, 0, 0, 0);

  //specular(0);
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
  //texture(wood);
  translate(0, 0, -200 * unit);
  //box(110 * unit, 70 * unit, 70 * unit);
  box.setTexture(wood);
  push();
  scale(110 * unit, 70 * unit, 70 * unit);
  shape(box);
  pop();
  translate(0, -36 * unit, 0);
  //box(120 * unit, 3 * unit, 74 * unit);
  push();
  scale(120 * unit, 3 * unit, 74 * unit);
  shape(box);
  pop();
  translate(0, 36 * unit, 0);

  //texture(cg);
  translate(7 * unit, 0, 35.5 * unit);
  //box(80 * unit, 60 * unit, 2 * unit);
  //box.setTexture(cg);
  plane.setTexture(cg);
  push();
  scale(80 * unit, 60 * unit, 2 * unit);
  //shape(box);
  shape(plane);
  pop();
  translate(-48 * unit, 0, 0);
  //specular(20);
  box.setTexture(silver);
  //box(12 * unit, 60 * unit, 2 * unit);
  push();
  scale(12 * unit, 60 * unit, 2 * unit);
  shape(box);
  pop();
  translate(0, 12 * unit, unit);
  rotateX(HALF_PI);
  cy3_13.setTexture(white);
  for (int i = 0; i < 3; i++) {
    //specular(#c0c0c0);  // 'silver'
    //cylinder(3 * unit, 13 * unit);
    shape(cy3_13);
    translate(0, 0, 12 * unit);
  }
  pop();
  box.setTexture(wood);
  for (float x = -45 * unit; x <= 45 * unit; x += 90 * unit) {
    //texture(wood);
    push();
    translate(x, 45 * unit, -190 * unit);
    //box(35 * unit, 20 * unit, 10 * unit);
    scale(35 * unit, 20 * unit, 10 * unit);
    shape(box);
    pop();
  }
}

void drawAntenna() {
  push();
  translate(0, -35 * unit, -200 * unit);
  //specular(#000000);  // 'black'
  //sphere(15 * unit);
  sphere.setTexture(black);
  push();
  scale(15 * unit);
  shape(sphere);
  pop();
  push();
  rotateZ(PI / 12.0f);
  translate(0, -50 * unit, 0);
  specular(#c0c0c0);  // 'silver'
  //cylinder(5, 100 * unit);
  shape(cy5_100);
  translate(0, -50*unit, 0);
  //cylinder(15, 8);
  shape(cy15_8);
  pop();
  push();
  rotateZ(-PI / 12.0f);
  translate(0, -50 * unit, 0);
  specular(#c0c0c0);  // 'silver'
  //cylinder(5, 100 * unit);
  shape(cy5_100);
  translate(0, -50*unit, 0);
  //cylinder(15, 8);
  shape(cy15_8);

  pop();
  pop();
}

void drawBase() {
  //specular(0);
  box.setTexture(black);
  //box(22 * unit, 5 * unit, 20 * unit);
  push();
  scale(22 * unit, 5 * unit, 20 * unit);
  shape(box);
  pop();
  //box(20 * unit, 5 * unit, 22 * unit);
  push();
  scale(20 * unit, 5 * unit, 22 * unit);
  shape(box);
  pop();
  //box(20 * unit, 7 * unit, 20 * unit);
  push();
  scale(20 * unit, 7 * unit, 20 * unit);
  shape(box);
  pop();
  cy_20.setTexture(black);
  for (float x = -10 * unit; x <= 10 * unit; x += 20 * unit) {
    push();
    rotateY(HALF_PI);
    translate(x, -2.5 * unit, 0);
    rotateX(HALF_PI);
    //cylinder(unit, 20 * unit);
    shape(cy_20);
    translate(0, 0, -5 * unit);
    //cylinder(unit, 20 * unit);
    shape(cy_20);
    pop();
    push();
    translate(x, -2.5 * unit, 0);
    rotateX(HALF_PI);
    //cylinder(unit, 20 * unit);
    shape(cy_20);
    translate(0, 0, -5 * unit);
    //cylinder(unit, 20 * unit);
    shape(cy_20);
    pop();
    cy_5.setTexture(black);
    sphere.setTexture(black);
    for (float z = -10 * unit; z <= 10 * unit; z += 20 * unit) {
      push();
      translate(x, 0, z);
      //cylinder(unit, 5 * unit);
      shape(cy_5);
      translate(0, -2.5 * unit, 0);
      //sphere(unit);
      push();
      scale(unit);
      shape(sphere);
      pop();
      translate(0, 5 * unit, 0);
      //sphere(unit);
      push();
      scale(unit);
      shape(sphere);
      pop();
      pop();
    }
  }
}

void drawBaffles() {
  push();
  translate(0, -3 * unit, 0);
  rotateX(HALF_PI);
  for (float r = 7 * unit; r > 2 * unit; r -= unit) {
    translate(0, 0, unit / 5.0f);
    rotateX(xa / 5.0f);
    rotateY(za / 5.0f);
    //torus(r, unit);
    PShape torus = createTorus(r, unit);
    torus.setTexture(black);
    shape(torus);
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
  //cylinder(1.5 * unit, 20 * unit, 9, 1);
  cy15_20_9_1.setTexture(black);
  shape(cy15_20_9_1);
  pop();
}

void drawButton() {
  push();
  translate(-7.5 * unit, -3.5 * unit - buttony, -7.5 * unit);
  //specular(#ff0000);  // 'red'
  cy15.setTexture(red);
  //cylinder(1.5 * unit, unit);
  shape(cy15);
  pop();
  push();
  translate(-7.5 * unit, -3.5 * unit, -7.5 * unit);
  rotateX(HALF_PI);
  //specular(#000000);  // 'black'
  //torus(1.8 * unit, unit / 2.0f);
  tr18.setTexture(black);
  shape(tr18);
  translate(15 * unit, 0, 1);
  image(logo, 0, 0);

  pop();
}

void mousePressed() {
  //userStartAudio();
  buttony = -unit / 4.0f;
  if (gameStarted) {
    //fire.play();
    ma.playAndRewind("fire");
    missiles.add(new Missile(ship.x, ship.y-cg.height/12.0f));
  } else {
    //clicky.play();
    ma.playAndRewind("clicky");
    at.add(new LaunchGame());
  }
}

void mouseReleased() {
  buttony = unit / 4.0f;
}

void keyPressed() {
  if (keyCode == 32) stabilize = !stabilize;
  // ゲームオーバー後の再ゲーム（初期化）をgameStatedで判別できるようにしたいので
  // ここのENTERキーでgameStartedをトグルする機能はやめる
  //if (key == ENTER) {
  //  //clicky.play();
  //  ma.playAndRewind("clicky");
  //  gameStarted = !gameStarted;
  //}
}

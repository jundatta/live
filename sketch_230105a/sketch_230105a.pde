// こちらがオリジナルです。
// 【作者】Sayamaさん
// 【作品名】Rough Clock2
// https://openprocessing.org/sketch/809934

PImage img;
PFont font;
float ratio;
int psec = 0;
TimeStr strArray;

void preload() {
  img = loadImage("img_base.png");
  font = createFont("segfont.otf", 50, true);
}

void setup() {
  size(1112, 834);
  preload();
  ratio = width/(float)img.width*0.7;
  imageMode(CENTER);
  textFont(font);
  strArray = getTimeArray();
}

void draw() {
  background(68, 132, 204);
  fill(0);
  rectMode(CENTER);
  rect(width*0.48, height/2, width * 0.31, width*0.25);

  if (Math.floor(psec/5) != Math.floor(second()/5)) {
    strArray = getTimeArray();
  }

  //pre

  textSize(width*0.035);
  textAlign(LEFT);
  fill(255, 60);
  noStroke();
  text("前前前前前前前", width/2-width*0.14, height/2-width*0.052);
  fill(155, 255, 171);
  stroke(155, 255, 171, 100);
  text(strArray.preStr, width/2-width*0.14, height/2-width*0.052);
  textAlign(RIGHT);
  fill(255, 60);
  noStroke();
  text("前前前前前前前前前前前", width/2+width*0.089, height/2+width*0.07);
  fill(155, 255, 171);
  stroke(155, 255, 171, 100);
  text(strArray.postStr, width/2+width*0.089, height/2+width*0.07);

  //time

  textSize(width*0.078);
  textAlign(LEFT);
  fill(255, 60);
  noStroke();
  text("前前前前前", width/2-width*0.14, height/2+width*0.028);
  fill(155, 255, 171);
  stroke(155, 255, 171, 100);
  text(strArray.h, width/2-width*0.14, height/2+width*0.028);
  String s = "  :";
  if (second()%2 == 0)s = "  ；";
  text(s, width/2-width*0.14, height/2+width*0.028);
  text("   "+strArray.m, width/2-width*0.14, height/2+width*0.028);

  image(img, width/2, height/2, img.width*ratio, img.height * ratio);

  psec  = second();
}

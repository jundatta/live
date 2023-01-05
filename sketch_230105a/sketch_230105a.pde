// こちらがオリジナルです。
// 【作者】Sayamaさん
// 【作品名】Rough Clock2
// https://openprocessing.org/sketch/809934

let img;
let font;
let ratio;
let psec;
let strArray;

function preload() {
  img = loadImage('./img_base.png');
  font = loadFont('./segfont.otf');
}

function setup() {
  createCanvas(windowWidth, windowHeight);
  ratio = width/img.width*0.7;
  imageMode(CENTER);
  textFont(font);
  strArray = getTimeArray();
}

function draw() {
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
  text('前前前前前前前', width/2-width*0.14, height/2-width*0.052);
  fill(155, 255, 171);
  stroke(155, 255, 171, 100);
  text(strArray[0], width/2-width*0.14, height/2-width*0.052);
  textAlign(RIGHT);
  fill(255, 60);
  noStroke();
  text('前前前前前前前前前前前', width/2+width*0.089, height/2+width*0.07);
  fill(155, 255, 171);
  stroke(155, 255, 171, 100);
  text(strArray[3], width/2+width*0.089, height/2+width*0.07);

  //time

  textSize(width*0.078);
  textAlign(LEFT);
  fill(255, 60);
  noStroke();
  text('前前前前前', width/2-width*0.14, height/2+width*0.028);
  fill(155, 255, 171);
  stroke(155, 255, 171, 100);
  text(strArray[1], width/2-width*0.14, height/2+width*0.028);
  let s = '  :';
  if (second()%2 == 0)s = '  ；';
  text(s, width/2-width*0.14, height/2+width*0.028);
  text('   '+strArray[2], width/2-width*0.14, height/2+width*0.028);

  image(img, width/2, height/2, img.width*ratio, img.height * ratio);

  psec  = second();
}

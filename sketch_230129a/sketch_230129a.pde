// こちらがオリジナルです。
// 【作者】Richard Bourneさん
// 【作品名】Cat on a Cool Tile Roof
// https://openprocessing.org/sketch/1586945

float Width=600;
float Height=450;
float pixel=1;

float Y_AXIS = 1;
float X_AXIS = 2;

float skyHeight=190;
float wall_Width=600;
float wall_Height=300;
float wuyan_width=120;
float wuyan_height=20;
float quad_width=70;
float quad_height=30;
float center_x=500;
float center_y=115;
float cat_scale=111;
float easing=1;
float Time;

function setup() {
  createCanvas(Width, Height);
  pixelDensity(3);
}

function draw() {

  frameRate(5);
  drawwall();
  drawsky();
  push();
  translate(10, -5);
  YinxingTree();
  pop();

  draw_wallshadow();

  if (center_x<-10)
    center_x=650;
  center_x-=15*easing;
  drawcat(cat_scale, center_x, center_y);

  translate(10, -25);
  noStroke();
  fill(30);
  rect(Width-10, 0, 200, Height);

  push();
  YinxingTree();
  pop();
}

function drawcat(cat_scale, center_x, center_y)
{
  stroke(200, 200, 240);
  noStroke();
  //肚子
  pos1_x=center_x-(cat_scale)/3;
  pos1_y=center_y+(cat_scale)*2/5-5;

  pos2_x=center_x+(cat_scale*1/3);
  pos2_y=center_y+(cat_scale)*2/5;

  //前体
  pos3_x=pos1_x-(cat_scale/5);
  pos3_y=center_y+(cat_scale)*2/5;

  pos4_x=pos1_x-(cat_scale/8);
  pos4_y=center_y+(cat_scale)/15;

  pos5_x=pos4_x-(cat_scale/8);
  pos5_y=pos4_y-(cat_scale)/20;

  //头
  pos6_x=pos5_x-(cat_scale/4);
  pos6_y=pos5_y-(cat_scale)/6;

  pos7_x=pos5_x-(cat_scale/6);
  pos7_y=pos5_y-(cat_scale)/30;

  pos8_x=pos5_x-(cat_scale)*3/8;
  pos8_y=pos5_y+(cat_scale)/8;

  pos9_x=pos8_x+(cat_scale)/5;
  pos9_y=pos8_y+(cat_scale)/5;

  //屁股
  pos10_x=pos2_x-(cat_scale/4)*0;
  pos10_y=pos2_y-(cat_scale)*1/3;

  pos11_x=pos10_x+(cat_scale*1/8);
  pos11_y=pos10_y+(cat_scale)/10;

  fill(150, 70, 10);
  triangle(center_x, center_y, pos1_x, pos1_y, pos2_x, pos2_y-6);
  triangle(center_x, center_y, pos1_x, pos1_y, pos3_x, pos3_y);

  fill(220, 200, 180);
  triangle(center_x, center_y+32, pos1_x, pos1_y, pos2_x, pos2_y);

  fill(150, 70, 10);
  triangle(center_x, center_y, pos3_x, pos3_y, pos4_x, pos4_y);
  triangle(pos3_x, pos3_y, pos4_x, pos4_y, pos5_x, pos5_y);
  triangle(pos3_x, pos3_y, pos5_x, pos5_y, pos6_x, pos6_y);

  fill(150, 70, 10);
  triangle(pos3_x, pos3_y, pos7_x, pos7_y, pos8_x, pos8_y);
  //fill(170,72,10);
  triangle(pos8_x+4, pos8_y+10, pos9_x, pos9_y-8, pos5_x, pos5_y);
  triangle(pos8_x+4, pos8_y+10, pos8_x, pos8_y, pos5_x, pos5_y);

  fill(150, 70, 10);
  triangle(center_x, center_y, pos2_x, pos2_y, pos10_x, pos10_y);
  triangle(pos2_x, pos2_y, pos10_x, pos10_y, pos11_x, pos11_y);

  fill(180);
  feetControl(pos1_x-10, pos1_y);
  feetControl(pos2_x+3, pos2_y-4);

  noFill();
  weiba(pos11_x, pos11_y);
}

function weiba(x, y)
{
  push();
  strokeWeight(10);
  stroke(150, 70, 10);
  x1=x-20;
  y1=y;

  x2=x+20;
  y2=y-20;

  x3=x+25;
  y3=y+5;

  x4=x+55;
  y4=y-20;

  bezier(x1, y1, x2, y2, x3, y3, x4, y4);
  noStroke();
  pop();
}

function feetControl(x, y)
{
  fill(150, 70, 10);
  if (x%2==0)
  {
    rect(x-(cat_scale)/10, y-8, (cat_scale)/10, (cat_scale)*1/3+8, 5, 5, 5, 5);
  } else
  {
    quad(x, y-10,
      x-(cat_scale)/10, y-10,
      x-(cat_scale)/10+(cat_scale/10), y+(cat_scale)*1/3,
      x+(cat_scale/10), y+(cat_scale)*1/3);

    quad(x, y-15,
      x-(cat_scale)/10, y-15,
      x-(cat_scale)/10-(cat_scale/5), y+(cat_scale)*1/3,
      x-(cat_scale/5), y+(cat_scale)*1/3);
  }
}

function segment(trans_x, trans_y, a, segLength) {
  push();
  translate(trans_x, trans_y);
  rotate(a);
  rect();
  pop();
}

function draw_wallshadow()
{
  noStroke();
  var c1=color(160, 10, 0);
  var c2=color(80, 10, 80);
  setGradient(0, 450, Width, 150, c1, c2, 1);

  noStroke();
  fill(160, 10, 0);
  for (var i=0; i<Width; i++)
  {
    arc(i, 600, 50, 15, PI, 0);
    i=i+80;
  }
}

function drawwall()
{
  noStroke();
  fill(100, 10, 0);
  rect(0, 0, Width, Height);

  fill(190, 70, 20);
  rect(0, Height/2-wall_Height, wall_Width, wall_Height);

  drawWuYan1();
  drawWuYan2();
  drawWuYan3();
  drawWuYan4();
}

function drawWuYan1()
{
  stroke(20);
  fill(190, 100, 10);
  for (var i=0; i<Width; i++)
  {
    rect(i-5, wall_Height+70, wuyan_width, wuyan_height);
    i=i+wuyan_width;
  }
}

function drawWuYan2()
{
  var cwu2_1=color(50, 120, 30);
  var cwu2_2=color(60, 10, 0);

  for (var j=0; j<Width+80; j++)
  {
    setGradient(j-65, wall_Height+35,
      wuyan_width, wuyan_height+10,
      cwu2_1, cwu2_2, 1);
    stroke(180, 130, 20);
    rect(j-65, wall_Height+36,
      wuyan_width, wuyan_height+10);
    j=j+wuyan_width;
  }

  var cwu3_1=color(10, 20, 10);
  var cwu3_2=color(80, 100, 20);
  fill(50, 120, 30);
  setGradient(0, wall_Height-15,
    Width, 50, cwu3_1, cwu3_2, 1);
}

function drawWuYan3()
{
  noStroke();
  fill(190, 150, 90);
  for (var k=0; k<Width; k++)
  {
    rect(k, skyHeight, wuyan_width, 10);
    k=k+wuyan_width;
  }

  fill(190, 100, 10);
  rect(0, skyHeight+15, Width, 12);
  fill(190, 110, 30);
  rect(0, skyHeight+35, Width, 35);
}

function drawPIdwon(x_trans)
{
  stroke(90, 50, 50);
  push();
  translate(x_trans, skyHeight+100);
  rotate(0.0);
  fill(140, 100, 50);
  arc(0, 0, quad_width, quad_width-15, 0, PI);
  pop();
}

function drawPIdwon_shadow(x_trans, shadow)
{
  noStroke();
  push();
  translate(x_trans, skyHeight+100);
  rotate(0.0);
  fill(10, 20, 10);
  arc(0, 0, quad_width+shadow, quad_width+shadow, 0, PI);
  pop();
}

function drawquad(i, j, x_trans)
{
  var c1=color(90, 50, 50);
  var c2=color(180, 90, 50);
  setGradient(x_trans-(quad_width/2)+i,
    skyHeight+93-j,
    quad_width, 5, c1, c2, 2);
}


function drawCicle(x_trans, angle, c1, c2, c3, i)
{
  push();
  noStroke();
  fill(c1, c2, c3);
  translate(x_trans-i+7, skyHeight+70+i*3);
  rotate(angle);
  arc(0, 0, 50, 50, 0, PI/2);
  pop();
}

function drawCicle_all(x_trans)
{
  for (var i=0; i<8; i++)
  {
    drawCicle(x_trans+quad_width-8, 24.5, 100, 10, 10, i);
    drawCicle(x_trans+quad_width-8, -2.2, 130, 110, 90, i);
    drawCicle(x_trans+quad_width-8, 1, 70, 20, 10, i);
    drawCicle(x_trans+quad_width-8, -3.5, 200, 160, 80, i);
  }
  stroke(50, 10, 10);
  fill(140, 100, 50);
  ellipse(x_trans+60, skyHeight+95, 50, 50);
  fill(80, 60, 20);
  ellipse(x_trans+60, skyHeight+95, 35, 35);
}

function drawWuYan4()
{
  for (var x_trans=50; x_trans<Width; x_trans++)
  {
    drawPIdwon_shadow(x_trans+10, 10);
    drawPIdwon(x_trans);
    for (var i=0; i<5; i++)
    {
      yp=i*5;
      drawquad(i, yp, x_trans);
    }
    drawCicle_all(x_trans);
    x_trans=x_trans+120;
  }
}

function YinxingTree()
{
  push();
  drawtree(220, 180, 0, -20, 20, random(0.6));
  drawtree(120, 60, 0, -100, 100, random(0.01));
  drawtree(120, 60, 0, -50, 160, random(0.01));
  drawtree(180, 160, 0, 40, 160, random(0.05));
  drawtree(200, 100, 0, -20, 100, random(1));
  drawtree(200, 160, 0, 0, 120, random(0.5));
  drawtree(220, 160, 0, 55, 160, random(0.1));
  drawtree(240, 200, 0, 50, 100, random(0.3));
  drawtree(240, 200, 0, 50, 180, random(0.3));
  drawtree(240, 200, 0, 80, 190, random(1));
  drawtree(220, 180, 0, -50, 80, random(0.1));
  translate(150, 90);
  drawtree(220, 180, 0, -50, 150, random(0.5));
  translate(-100, -150);
  drawtree(240, 200, 120, -100, 100, random(0.01));
  pop();
}

function drawtree(c1, c2, c3, pos_x, pos_y, pos_angle)
{
  push();
  rotate(pos_angle);
  var trans_x;
  var trans_y;
  var trans_angle;

  fill(c1, c2, c3);
  for (var i=0; i<20; i++)
  {
    trans_x=random(50);
    trans_y=random(20);
    trans_angle=random(-0.5);
    push();
    translate(trans_x, trans_y);
    rotate(trans_angle);
    drawYinXing(pos_x, pos_y);
    pop();
  }
  pop();
}

function drawYinXing(pos_x, pos_y)
{
  stroke(200, 150, 60);
  push();
  translate(pos_x, pos_y);
  rotate(0.0);
  arc(0, 0, 30, 30, 0, PI/2);
  pop();
}

function drawsky()
{
  var c1 = color(90, 150, 205);
  var c2 = color(190, 200, 220);
  noStroke();
  setGradient(0, 0, Width, skyHeight, c1, c2, 1);
}

function setGradient(x, y, w, h, c1, c2, axis)
{
  noFill();
  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (var i = y; i <= y+h; i++) {
      var inter = map(i, y, y+h, 0, 1);
      var c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  } else if (axis == X_AXIS) {  // Left to right gradient
    for (var k = x; k <= x+w; k++) {
      var interk = map(k, x, x+w, 0, 1);
      var ck = lerpColor(c1, c2, interk);
      stroke(ck);
      line(k, y, k, y+h);
    }
  }
}

// save jpg
let lapse = 0;    // mouse timer
function mousePressed() {
  if (millis() - lapse > 400) {
    save("img_" + month() + '-' + day() + '_' + hour() + '-' + minute() + '-' + second() + ".jpg");
    lapse = millis();
  }
}

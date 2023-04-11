// こちらがオリジナルです。
// 【作者】さん
// 【作品名】Windy Sea
// https://openprocessing.org/sketch/1877690

int a = 0;
int b = 300;
int ln = 0;
int delai = 0;
int often = 100;

void setup() {

  size(1112, 834);
  background(14, 60, 100);
  float r = random(-50, 50); // I ended up not using this
  smooth();
}

void draw() {
  background(14, 60, random(95, 105), 255); //flashing background

  if (frameCount%often == 0) {
    ln = 1;
    delai = frameCount;
  }
  if (frameCount - delai > 10) {
    ln = 0;
  }
  //water backgroundcolor and rects
  noStroke();
  //background lightning flash
  if (mousePressed || ln != 0) {
    background(255);
  }

  //moon
  fill(255);
  if (mousePressed || ln != 0) {
    fill(a);
  }                          //I used some variables for the color vv
  ellipse(150, b-150, 100, 100);
  //color for water
  fill(#DEE5FA, 50); //right behind boat
  //rect(a,600,b,400);

  // ocean
  fill(#7884A7, 50);//left under behind boat
  rotate(sin(frameCount * .009)*-.11);
    rect(width/2-100, 550, width*1.3, b);

  fill(#0F1F50, 200);
  if (mousePressed || ln != 0) {
    fill(#F6FFB4);
  }
  //quad(350,500,280,600,600,850,700,850);

  fill(255, 140);
  //quad(random(400, 405),450,350,500,700,850,800,800);

  //see here for some variables^^

  //rain

  //I randomized the ends of them so it would look like it was
  //actually raining. I think it turned out pretty well.
  strokeWeight(3);
  stroke(150, 10);
  for (int i=0; i <width; i += random(11, 30)) {
    line(i, 0, i+i/2, random(600, 800));
  }

  strokeWeight(2);
  stroke(255, 25);
  for (int i=-300; i <width; i += random(11, 30)) {
    line(i, 0, i+370, random(600, 800));
  }

  strokeWeight(1);
  stroke(0, 50);
  for (int i=-700; i <width; i += random(11, 30)) {
    line(i, 0, i+700, random(600, 800));
  }

  //water lines

  //I did the same as I did with the rain to the ends of
  //the water lines to make it seem like it was moving
  //and/or the rain was hitting the water.
  strokeWeight(4);
  stroke(40);

  for (int i = 300; i <800; i += 15) {
    //line(i, 800, i, random(700-i/12, 704-i/12));
  }

  fill(#020936);
  for (int i=0; i <600; i += 10) {
    //line(i,800,i -i/2, random (595,600));
  }
  fill(#020936);
  for (int i=450; i <800; i += 10) {
    //line(i,800,i -i/2, random(850-i/2,845-i/2));
  }

  fill(#020936);
  for (int i=300; i <550; i += 10) {
    //line(i,800,i -i/2, random(670-i/6, 665-i/6));
  }

  //fill(#020936);
  //for (int i=0; i <800; i -= 10){
  //line(i,800,i -i/2, 850-i/2);
  //}

  fill(#020936);
  for (int i=300; i <550; i += 10) {
    //line(i,800,i -i/2, random(665-i/6, 670-i/6));
  }


  //lightning strike
  if (mousePressed || ln != 0) { //turn on when click
    strokeWeight(10);

    //lightningbackground
    pushMatrix();
    translate(1, 1);
    strokeWeight(10);
    line(500, 0, 600, 120);
    strokeWeight(9);
    line(600, 120, 530, 150);
    strokeWeight(7);
    line(530, 150, 570, 200);
    strokeWeight(5);
    line(570, 200, 490, 300);
    strokeWeight(3);
    line(490, 300, 520, 350);
    strokeWeight(2);
    line(520, 350, 380, 500);

    popMatrix();
    //lightning main
    stroke(#F6FFB4);
    strokeWeight(10);
    line(500, 0, 600, 120);
    strokeWeight(9);
    line(600, 120, 530, 150);
    strokeWeight(7);
    line(530, 150, 570, 200);
    strokeWeight(5);
    line(570, 200, 490, 300);
    strokeWeight(3);
    line(490, 300, 520, 350);
    strokeWeight(2);
    line(520, 350, 380, 500);
  }


  strokeWeight(4);
  //boat function/variable
  pushMatrix();
  rotate(radians(-20));
  boat(350, 590);
  popMatrix();

  //splashes
  //same random effect on the splashes up on the boat
  pushMatrix();
  rotate(radians(-20));
  strokeWeight(2);
  stroke(230);

  for (int i=0; i <270; i +=20) {
    //line(i,random(690,700),i+40, 710);
  }
  stroke(160);
  for (int i=0; i <270; i +=20) {
    //line(i,random(640+i, 645+i),i+40, 710);
  }

  popMatrix();
}

void boat(int x, int y) {
  pushMatrix();

  translate(x+100, y+40);
  // rock the ship!
  rotate(.35+sin(frameCount*.01)*.14);
  // mostly all of the if (mousePressed)'s are used to change
  //the stroke/fill colors to black or white to make a
  //silhouette of the ship

  if (mousePressed || ln != 0) {
    fill(255);
  }

  stroke(#482103);
  if (mousePressed || ln != 0) {
    stroke(0);
  }

  //bow
  for (int i=0; i <100; i += 4) {
    line(i, 0, i, 100-i);
  }
  //middle
  for (int i=-300; i <0; i += 4) {
    line(i, 0, i, 100);
  }
  //poop deck
  for (int i=-360; i <-200; i += 5) {
    line(i-25, -40, i/2, 50);
  }
  stroke(#482103);
  if (mousePressed || ln != 0) {
    stroke(0);
  }
  //cap. quarters
  for (int i=-350; i <-280; i += 5) {
    line(i, -30, i, 50-i/20);
  }
  stroke(#B79E8B);
  if (mousePressed || ln != 0) {
    stroke(0);
  }
  //middle sail
  for (int i=-200; i <100; i +=10) {
    line(-120, -100 +i/2, -50, -150+ i);
  }
  //back sail
  for (int i=-150; i <80; i +=10) {
    line(-210, -100 +i/2, -150, -150+ i);
  }
  //front sail
  for (int i=-70; i <120; i +=10) {
    line(-40, -100 +i/2, 20, -150+ i);
  }
  //triangle sail
  for (int i=30; i <100; i += 10) {
    line(i, -30, i, -120+i);
  }
  //poop deck sail
  for (int i=-350; i <-220; i += 10) {
    line(i, -70, i, -180-i/5);
  }

  //cannon holes
  strokeWeight(2);
  for (int i=-240; i <-10; i += 25) {
    rect(i, 40, 10, 15);
  }

  //cap. quart. windows
  strokeWeight(2);
  for (int i=-350; i <-260; i += 25) {
    rect(i, -20, 20, 40);
  }


  //masts (front, back, middle)
  strokeWeight(4);
  stroke(#482103);
  if (mousePressed || ln != 0) {
    stroke(0);
  }
  line(-30, 0, -30, -130);
  line(-190, 0, -190, -200);
  line(-100, 0, -100, -265);

  stroke(#B79E8B);
  if (mousePressed || ln != 0) {
    stroke(0);
  }
  //poop deck railing
  for (int i=-380; i <-220; i += 10) {
    line(i, -50, i, -50);
  }
  //railing
  for (int i=-170; i <100; i += 10) {
    line(i, -10, i, -10);
  }

  popMatrix();
  rotate(.35+sin(frameCount*.02)*.05);
  fill(#485487, 230);//left under behind boat
  noStroke();
  rectMode(CENTER);
  rect(width/2-100, 710, width*1.4, height/2);
  //rectMode(CORNER);
}

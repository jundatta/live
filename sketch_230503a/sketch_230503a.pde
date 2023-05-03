// こちらがオリジナルです。
// 【作者】Ty Carpenterさん
// 【作品名】Camp Fire
// https://openprocessing.org/sketch/336291

//CLASSES

Ember[] fire = new Ember[15];
Flower[] pedal = new Flower[30];




float fx, fy;
float flickerW;
float easing = .05;
void setup() {


  smooth();


  size(1000, 600);
  background (60, 30, 120);

  //more classes

  for (int i = 0; i <fire.length; i++) {
    fire[i] = new Ember(width/2 + random (-10, 10), height/2 + random(-100, 100));
  }

  for (int j = 0; j <pedal.length; j++) {
    pedal[j] = new Flower(width/2 + random (-10, 10), height/2 + random(-100, 100));
  }
}

void draw() {

  background (60, 30, 120);
  // BACKGROUND AND GRASS COLORING
  noStroke();
  //BACKGROUND
  fill(#0E0CC1);
  rect(0, 0, width, 470);
  fill(#1110AD);
  rect(0, 0, width, 360);
  fill(#110F98);
  rect(0, 0, width, 260);
  fill(#080786);
  rect(0, 0, width, 210);
  fill(#090871);
  rect(0, 0, width, 140);
  fill(#07065D);
  rect(0, 0, width, 90);
  fill(#050440);
  rect(0, 0, width, 60);

  strokeWeight(1);

  //MOON
  fill(#E8E8F7, 30);
  ellipse(280, 180, 130, 130);
  fill(#E8E8F7);
  ellipse(280, 180, 100, 100);


  //STARS
  fill (250, 265, 265);
  ellipse (250, 250, 5, 5);
  ellipse (470, 200, 5, 5);
  ellipse (780, 60, 5, 5);
  ellipse (100, 30, 5, 5);
  ellipse (600, 380, 5, 5);
  ellipse (360, 300, 5, 5);
  ellipse (400, 20, 5, 5);
  ellipse (550, 150, 10, 10);
  ellipse (500, 100, 10, 10);
  ellipse (300, 20, 10, 10);
  ellipse (660, 370, 10, 10);
  ellipse (750, 260, 10, 10);
  ellipse (10, 240, 10, 10);
  ellipse (490, 320, 10, 10);
  ellipse (170, 280, 10, 10);

  fill(#087621);
  rect(0, 425, width, height);


  //Grass shadows (leftside)
  fill(#003E0E);
  rect(0, 425, 30, height);
  fill(#034612);
  rect(30, 425, 60, height);
  fill(#035816);
  rect(90, 425, 20, height);
  fill(#066A1D);
  rect(110, 425, 50, height);
  fill(#03831F);
  rect(160, 425, 80, height);
  fill(#049324);
  rect(240, 425, 110, height);
  //Grass shadows (rightside)
  fill(#11A532);
  rect(350, 425, 140, height);
  fill(#049324);
  rect(490, 425, 110, height);
  fill(#03831F);
  rect(600, 425, 80, height);
  fill(#066A1D);
  rect(680, 425, 50, height);
  fill(#035816);
  rect(720, 425, 20, height);
  fill(#034612);
  rect(740, 425, 60, height);
  fill(#003E0E);
  rect(800, 425, 45, height);
  fill(#022C0B);
  rect(845, 425, 100, height);
  fill(#002408);
  rect(945, 425, 55, height);



  // calling tree function
  tree(130, 120, 1, 1);
  tree(550, 210, -.7, .7);

  noStroke();
  //shadow
  fill(255, 255, 0, random( 60, 80));
  ellipse(418, 487, random(200, 260), 100);
  stroke(1);

  //displaying and calling fire and pedal classes
  for (int i = 0; i <fire.length; i++) {


    fire[i].update();

    fire[i].display();




    println(mouseX, mouseY);
  }


  firewood(413, 476);


  tent(744, 373, 1);

  for (int j = 0; j <pedal.length; j++) {


    pedal[j].update();

    pedal[j].display();
  }


  tree(900, 100, 2, 2);
}
class Ember {  //basically setup

  float locX;
  float locXF;
  float locY;
  float locYF;
  float diameter = 10;
  float diameterF = diameter;




  float dirX =1;
  float dirY = 1;


  float speedX =3;
  float speedY =3;

  float red = 0;
  float green = 0;
  float blue = 0;

  float redE = red;

  float grey = 0;
  float greyE = grey;



  Ember(float tx, float ty) {

    locX = tx;
    locY = ty;

    locXF= locX;
    locYF= locY;
  }
  void update() {              //mathy stuff

    locYF += (locY - locYF) * .3;
    locXF += (locX - locXF) * .3;
    redE += (red - redE) *.1;
    diameterF += (diameter - diameterF) * .1;
    //formula for X velocity
    locX += dirX * speedX;
    //formula for Y velocity
    locY += dirY * speedY;
    if (locY < 300 - diameter/2 ) {
      dirY = 1;
      speedX= random (6, 15);
      //   fill(random(0,255));
      diameter= random(6, 15);
      //grey = random(255);
      red = random(230, 255);
    }
    if (locX > 475 - diameter/2 ) {
      dirX = -1;
      speedX= random (6, 15);
      //   fill(random(0,255));
      diameter= random(6, 14);
      red = random(210, 255);
    }
    if (locX < 350 - diameter/2 ) {
      dirX = 1;
      speedX= random (6, 15);
      //   fill(random(0,255));
      diameter= random(3, 18);

      red = random(180, 255);
      //grey = random(255);
    }
    if (locY > 470 - diameter/2 ) {
      dirY = -1;
      speedX= random (6, 15);
      //   fill(random(0,255));
      diameter= random(6, 15);
      red = random(230, 255);
      //grey = random(255);
    }
  }

  void display() {
    fill(redE, 100, 100);
    //strokeWeight(.5);
    //stroke(255,255,0);
    ellipse(locXF, locYF, diameterF, diameterF);
  }
}



void firewood(float fx, float fy) {
  pushMatrix();

  translate(fx, fy);

  //ellipse(0,0,70,70);


  fill(#6F2F2F);
  quad(-30, -5, 40, 25, 45, 15, -35, -25);
  fill(#894D4D);
  quad(-25, 25, 35, 0, 30, -20, -40, 0);


  popMatrix();
}


class Flower {

  float Fx = random(width);
  float Fy = random (-600, 0);
  float x1, angle1, angle2;
  float locX, locY, diameterFW, diameterFH;
  float direcX, direcY;
  float speedFX, speedFY;
  float scalar = random(14, 20);
  float  diameter;


  Flower (float Fx, float Fy) {



    diameterFW = 20;
    diameterFH =10;
    // Fx = random(1000);
    speedFX =random (.3, .5);
    speedFY =random (.3, .5);
  }

  void update() {



    float ang1 = radians(angle1);
    x1 = 0 + (scalar * cos(ang1));

    Fx += speedFX;
    Fy += speedFY;

    if (Fx + x1 >= 1000 + scalar) {
      Fx = 0 - scalar/2;
    }
    if (Fy  >= 600 + scalar) {
      Fy = 0 - scalar/2;
    }

    //if( Fx + scalar/2 == locX + diameter/2 && Fy +scalar/2 == locY + diameter/2){
    // Fy = 0 - scalar;

    // println("noice");
    // }
  }

  void display() {

    strokeWeight(1);

    fill(#F58181);
    stroke(0, 255);
    ellipse(Fx + x1, Fy, scalar, scalar);

    angle1 += random(1, 6);
  }
}
void tent(float tentx, float tenty, float scalar) {

  pushMatrix();

  translate(tentx, tenty);
  fill(#5F2323);
  triangle(-100, 70, -10, 90, -50, -30);
  quad(-50, -30, -10, 90, 100, 60, 80, -10);
  fill(#481111);
  triangle(-50, -30, -60, 80, -65, 82);

  line(-50, -33, 10, 100);
  line(-50, -33, -120, 70);
  line(80, -10, 110, 70);

  //MOUSEPRESSED TO READ!
  if (mousePressed) {

    pushMatrix();
    strokeWeight(0);
    fill(#FFFBC9, random(40, 60));
    ellipse(37, 30, 90, 60);

    strokeWeight(10);
    stroke(0, 40);
    line(50, 30, 55, 40);
    line(55, 40, 55, 52);
    strokeWeight(6);
    line(53, 32, 45, 45);
    line(45, 45, 35, 40);

    strokeWeight(3);
    line(50, 30, 48, 28);
    fill(0, 40);
    ellipse(40, 20, 18, 19);
    ellipse(31, 28, 5, 5);
    ellipse(35, 15, 15, 5);
    ellipse(46, 15, 5, 10);

    // line(40, 40, 30, 42);
    // line(30,42, 30, 35);

    quad(40, 40, 30, 42, 25, 40, 20, 30);
    popMatrix();
  }


  popMatrix();
}


void tree(float treeX, float treeY, float sx, float sy) {




  pushMatrix();


  translate(treeX, treeY);
  scale(sx, sy);

  strokeWeight(1);
  stroke(0, 255);
  beginShape();
  fill(#6F2F2F, 255);

  vertex(0, -10);
  vertex(-20, 40);
  vertex(-15, 80);
  vertex(0, 140);
  vertex(-5, 250);
  vertex(15, 300);
  vertex(80, 350);
  vertex(20, 330);
  vertex(-10, 360);
  vertex(-20, 310);
  vertex(-50, 355);
  vertex(-25, 300);
  vertex(-40, 240);
  vertex(-20, 180);
  vertex(-45, 70);
  vertex(-70, 0);

  endShape();


  beginShape();
  fill(#F58181);
  vertex(-200, -60);
  vertex(-250, -20);
  vertex(-215, 60);
  vertex(-180, 80);
  vertex(-100, 55);
  vertex(-50, 65);
  vertex(0, 100);
  vertex(40, 80);
  vertex(90, 60);
  vertex(70, 20);
  vertex(100, 0);
  vertex(170, -30);
  vertex(180, -60);
  vertex(190, -70);
  vertex(80, -80);
  vertex(30, -100);
  vertex(0, -130);
  vertex(-80, -80);
  vertex(-120, -90);
  vertex(-150, -80);

  endShape();



  popMatrix();
}

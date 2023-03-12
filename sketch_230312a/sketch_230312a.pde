// オリジナルはこちらです。
// 【作者】Richard Bourneさん
// 【作品名】Timmy the Train
// https://openprocessing.org/sketch/1864134

Train timmy;
Track[] trax=new Track[15];
Bugs[] bugsy=new Bugs[10];
int trans;
int sliderX;
int bounds=15;
boolean light;

void setup() {
  size(1112, 834);
  timmy=new Train();
  for (int i=0; i<trax.length; i++) {
    trax[i]=new Track(20+i*75, 418);
  }//end trax setup

  for (int i=0; i<bugsy.length; i++) {
    bugsy[i]=new Bugs();
  }//end bugsy setup
  sliderX=20;
}//end setup()

void draw() {
  background(255);

  fill(50, 140, 200);
  rect(0, 600, width, 275);//river
  fill(43, 234, 76);
  rect(0, 425, width, 275);//grass
  fill(54, 244, 252);
  rect(0, 0, width, 425);//sky
  fill(185, 122, 87);
  rect(0, 489, width, 10);//rail

  for (int i=0; i<trax.length; i++) {
    trax[i].update();
    trax[i].display();
  }//end trax setup

  pushMatrix();
  translate(150, 240);
  //scale(0.7);//drew train too big in design, didn't want to redraw
  timmy.display();
  popMatrix();

  fill(0, trans);
  rect(0, 0, width, height);//"day" rectangle

  //creates light from lantern, on top of "day" rectangle to be seen as a light at night
  if (light) {
    pushMatrix();
    //same translation as train so i don't have to find scaled coordinates of lantern
    translate(334, 260);
    scale(0.7);
    //using the stroke of the arc so it doesn't also cover up the lantern
    noFill();
    stroke(250, 255, 0);
    strokeWeight(30);
    strokeCap(SQUARE);
    //creating rings of light, getting more transparent as the light goes out (3 levels of transparency)
    for (int i=0; i<7; i++) {
      arc(585, 67, 70+i*50, 70+i*50, radians(-25), radians(25));
    }
    stroke(250, 255, 0, 200);
    for (int i=0; i<7; i++) {
      arc(585, 67, 370+i*59, 370+i*59, radians(-25), radians(25));
    }
    stroke(250, 255, 0, 140);
    for (int i=0; i<7; i++) {
      arc(585, 67, 784+i*59, 784+i*59, radians(-25), radians(25));
    }//end light arcs

    popMatrix();

    stroke(0);
    strokeWeight(1);
    strokeCap(ROUND);
  }//end light check

  //bugs are only displayed at a certain brightness
  if (trans>150) {
    for (int i=0; i<bugsy.length; i++) {
      bugsy[i].update();
      bugsy[i].display();
    }//end bugsy display for
  }//end night check

  dayTime();
  lightSwitch();
}//end draw()



void dayTime() {
  float checkD=dist(mouseX, mouseY, sliderX, 33);

  if (mousePressed && checkD<=bounds/2) {//allows user to grab slider, which affects day time
    sliderX=mouseX;
    bounds=width;
  } else {
    bounds=15;
  }//end slider grab check

  sliderX=constrain(sliderX, 20, 120);//constrains slider to slide bar

  trans=int(map(sliderX, 20, 120, 0, 200));//maps transparency of "day" rectangle to slider position

  fill(128);
  textSize(24);
  text("Time", 35, 3, 100, 40);

  fill(0, 0, 255);
  rect(20, 30, 100, 6);

  fill(255, 0, 0);
  ellipse(sliderX, 33, 15, 15);
}//end dayTime()


void lightSwitch() {
  float checkOn=dist(mouseX, mouseY, 700, 50);
  float checkOff=dist(mouseX, mouseY, 770, 50);

  //two buttons to toggle train light on/off
  if (mousePressed & checkOn<40) {
    light=true;
  }
  if (mousePressed & checkOff<40) {
    light=false;
  }//end mouse check

  fill(128);
  textSize(24);
  text("Lights", 705, 3, 100, 40);

  fill(0, 255, 0);
  ellipse(700, 50, 40, 40);

  fill(255, 0, 0);
  ellipse(770, 50, 40, 40);
}//end lightSwitch

class Beam {
  int x, y, recAngle;
  float recX, recY;

  Beam(int tx, int ty) {
    x=tx;
    y=ty;
  }//end constructor

  void update() {
    //rotates main beam around origin (x, y)
    recAngle+=8;
    recX=(70/2)*cos(radians(recAngle));
    recY=(70/2)*sin(radians(recAngle));
  }//end update()

  void display() {
    fill(200);
    pushMatrix();
    translate(x, y);
    rect(recX, recY, 150, 10);//entire rect rotates around point
    beginShape();
    //only a portion rotates
    vertex(recX+150, recY);
    vertex(recX+150, recY+10);
    //part is grounded to train
    vertex(262, 10);
    vertex(262, 0);
    vertex(recX+150, recY);
    endShape();
    // rect(512, 0, 10, 10);
    popMatrix();
  }//end display()
}//end class Beam
class Bugs {
  int x, y;

  Bugs() {
    x=int(random(width));
    y=int(random(height));
  }//end constructor

  void update() {
    //bugs just kinda jitter
    x=int(random(x-3, x+4));
    y=int(random(y-3, y+4));
    //they stay on screen
    x=constrain(x, 0+5, width-5);
    y=constrain(y, 0+5, height-5);
  }//end update()

  void display() {
    noStroke();
    fill(250, 255, 0, 128);
    ellipse(x, y, 10, 10);
    fill(255);
    ellipse(x, y, 5, 5);
    stroke(0);
    strokeWeight(1);
  }//end display()
}//end class Bugs
class Smoke {
  int grayCol;
  int size;
  int x, y;

  Smoke(int tx) {
    grayCol=int(random(150, 165));//random color
    size=int(random(10, 29));//random size
    x=int(random(tx+33, tx+42));//slightly random x position, the starting position is scattered so it doesn't clump in the beginning
    y=37-int(map(tx, 0, 500, 100, 0));//y is mapped to different heights so they don't start in a straight line
    grayCol=int(random(150, 165));//random color
  }//end constructor

  void update() {
    if (y-size/2<17) {//x only changes once it leaves the smoke stack
      x-=random(5, 10);//x decreases by a random amount, but is always moving
    }//end out of stack check
    y-=random(5);//y decreases by a random amount

    if (x+size/2<-0) {
      x=int(random(533, 542));
      y=37;
    }//end out of bound check
  }//end update()

  void display() {
    noStroke();
    fill(grayCol, 140 + y);
    ellipse(x, y-20, size, size);
    stroke(0);
    strokeWeight(1);
  }//end display()
}//end class Smoke

class Track {
  int x, y;

  Track(int tx, int ty) {
    x=tx;
    y=ty;
  }//end constructor

  void update() {
    x-=5;
    if (x<0) {
      x=1130;
    }//end x bound
  }//end update()

  void display() {
    fill(230);
    pushMatrix();
    translate(x, y+80);
    rect(0, 0, 25, 7);
    popMatrix();
  }//end display()
}//end class Track
class Train {

  Wheel[] wheelz=new Wheel[4];
  Wheel tiny;
  Beam bob;
  Smoke[] sam=new Smoke[500];

  Train() {
    for (int i=0; i<wheelz.length; i++) {
      wheelz[i]=new Wheel(250+i*75, 212, 75);
    }//end wheelz for
    tiny=new Wheel(615, 227, 45);
    bob=new Beam(248, 208);
    for (int i=0; i<sam.length; i++) {
      sam[i]=new Smoke(i);
    }//end sam setup for
  }//end constructor

  void display() {

    //engineer
    fill(220, 160, 160);
    // neck
    rect(190, 102, 9, 20);
    // nose
    ellipse(198, 102, 15, 5);
    // head
    ellipse(195, 99, 15, 20);
    // eye
    fill(30);
    ellipse(200, 98, 2, 2);
    // body
    fill(80, 140, 170);
    rect(188, 110, 14, 50);
    // cap
    rect(187, 86, 15, 8);
    // peak
    rect(187, 92, 22, 2);
    // arm
    pushMatrix();
    translate(-10, 64);
    rotate(-.3);
    rect(178, 104, 8, 25);
    popMatrix();

    //cab area
    fill(0);
    rect(55, 190, 175, 25);
    // hitch
    rect(10, 216, 80, 10);
    rect(0, 214, 20, 14);
    fill(31, 219, 41);
    rect(75, 25, 25, 165);
    rect(250, 25, 25, 165);
    rect(100, 25, 150, 25);
    rect(100, 125, 150, 65);
    fill(0);
    rect(45, 10, 230, 20);

    //tank
    fill(28, 250, 40);
    rect(275, 100, 300, 75);
    fill(220, 255, 0);
    rect(575, 105, 5, 65);
    rect(580, 110, 5, 55);
    rect(585, 115, 5, 45);

    //back whistle
    fill(220);
    beginShape();
    vertex(287, 100);
    vertex(287, 85);
    vertex(300, 75);
    vertex(340, 75);
    vertex(353, 85);
    vertex(353, 100);
    endShape();
    fill(0);
    beginShape();
    vertex(300, 75);
    vertex(300, 40);
    vertex(315, 25);
    vertex(325, 25);
    vertex(340, 40);
    vertex(340, 75);
    endShape();
    fill(220);
    beginShape();
    vertex(315, 25);
    vertex(320, 15);
    vertex(325, 25);
    endShape();

    //bell
    fill(220, 255, 0);
    ellipse(412, 62, 20, 20);
    beginShape();
    vertex(396, 78);
    vertex(402, 72);
    vertex(402, 62);
    vertex(422, 62);
    vertex(422, 72);
    vertex(428, 78);
    vertex(396, 78);
    endShape();
    fill(220);
    rect(410, 50, 4, 45);
    fill(0);
    rect(390, 95, 44, 5);

    //front whistle
    fill(220);
    beginShape();
    vertex(460, 100);
    vertex(460, 85);
    vertex(465, 80);
    vertex(505, 80);
    vertex(510, 85);
    vertex(510, 100);
    endShape();
    fill(0);
    rect(465, 45, 40, 35);
    fill(220);
    beginShape();
    vertex(465, 45);
    vertex(475, 35);
    vertex(495, 35);
    vertex(505, 45);
    endShape();
    fill(255);
    beginShape();
    vertex(475, 35);
    vertex(485, 20);
    vertex(495, 35);
    endShape();

    for (int i=0; i<sam.length; i++) {
      sam[i].update();
      sam[i].display();
    }//end sam updating

    //smokestack
    fill(100);
    rect(525, 50, 25, 50);
    fill(50);
    beginShape();
    vertex(525, 50);
    vertex(512, 37);
    vertex(525, 20);
    vertex(550, 20);
    vertex(563, 37);
    vertex(550, 50);
    endShape();
    fill(100);
    rect(523, 17, 29, 3);

    //lantern
    fill(0);
    rect(550, 50, 20, 3);
    rect(550, 85, 20, 3);
    fill(31, 219, 41);
    rect(570, 43, 30, 50);
    fill(220, 255, 0);
    rect(570, 93, 30, 3);
    fill(0);
    beginShape();
    vertex(570, 43);
    vertex(575, 37);
    vertex(595, 37);
    vertex(600, 43);
    endShape();
    fill(220, 255, 0);
    rect(575, 32, 20, 5);
    rect(600, 50, 5, 35);

    //bottom thingy
    fill(50);
    rect(525, 175, 50, 25);
    fill(20);
    rect(575, 185, 63, 25);
    fill(0);
    rect(638, 185, 12, 25);
    rect(512, 200, 75, 25);
    fill(100);
    rect(587, 210, 25, 5);
    fill(185, 122, 87);
    beginShape();
    vertex(650, 185);
    vertex(650, 225);
    vertex(710, 225);
    vertex(650, 185);
    endShape();
    fill(0);
    beginShape();
    vertex(570, 130);
    vertex(570, 135);
    vertex(645, 190);
    vertex(650, 190);
    vertex(570, 130);
    endShape();

    //wheels/beam
    for (int i=0; i<wheelz.length; i++) {
      wheelz[i].update();
      wheelz[i].display();
    }//end wheelz update for
    tiny.update();
    tiny.display();
    bob.update();
    bob.display();
  }//end display()
}//end class Train

class Wheel {
  int wheelRot;
  int x, y, size;

  Wheel(int tx, int ty, int tsize) {
    x=tx;
    y=ty;
    size=tsize;
  }//end constructor

  void update() {
    wheelRot-=3;// sets rotation
  }//end update

  void display() {
    pushMatrix();
    translate(x, y);//translates it to where it needs to go
    rotate(wheelRot);//rotates it
    fill(100);
    ellipse(0, 0, size, size);//wheel
    fill(185, 122, 87);
    rectMode(CENTER);//makes it easier to draw
    //toggles
    rect(0, 0, size/7, size);
    rect(0, 0, size, size/7);
    rectMode(CORNER);//so it doesn't f with the rest of the sketch
    popMatrix();
  }//end display()
}//end class Wheel

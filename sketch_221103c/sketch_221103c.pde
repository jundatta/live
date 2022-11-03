// こちらがオリジナルです。
// 【作者】 Skyeさん
// 【作品名】Stars
// https://openprocessing.org/sketch/609209

float opacity = 255;
star[] stars = new star[400];
float turn;

void setup() {
  size(700, 700);
  background(0);
  fill(120, 232, 255);
  rect(0, 0, width, height);

  for (var i=0; i<stars.length; i++) {
    stars[i] = new star(random(-width, width), random(-height, height), random(1, 4), int(random(3, 9)));
  }

  turn = PI*2/3.0f;
}

void draw() {
  noStroke();
  fill(120, 232, 255);
  rect(0, 0, width, height);
  //Night Sky
  for (var i = 0; i<800; i++) {
    opacity-=(255/800.0f);
    stroke(37, 9, 99, opacity);
    line(0, i, width, i);
  }
  opacity = 255;
  for (var i = 550; i>200; i--) {
    opacity-=(255/350.0f);
    stroke(255, 92, 215, opacity);
    line(0, i, width, i);
  }
  opacity = 255;

  //Stars
  fill(255);
  push();
  translate(width/2, height*5/6.0f);
  rotate(turn);
  for (var i=0; i<stars.length; i++) {
    stars[i].display();
  }
  turn+=PI/3000.0f;
  pop();

  //Hills And Trees
  fill(0);
  stroke(0);
  triangle(0, 550, width, 450, width, height);
  for (var i=.25; i<10; i++) {
    drawTree(width-(i*70), 450+(i*10), 60);
  }
  fill(15);
  stroke(15);
  triangle(width, 650, 0, 500, 0, height);
  for (var i=.25; i<10; i++) {
    drawTree(0+(i*70), 500+(i*15), 80);
  }
  fill(25);
  stroke(25);
  triangle(0, height, width, 550, width, height);
  for (var i=.25; i<10; i++) {
    drawTree(width-(i*70), 550+(i*15), 100);
  }
  noStroke();


  //Moon
  fill(255);
  push();

  beginShape();
  vertex(200, 100);
  bezierVertex(120, 100, 120, 200, 200, 200);
  bezierVertex(160, 200, 160, 100, 200, 100);
  endShape();
  pop();
}

//------ FUNCTIONS ----------------------------------------------------------------------------------------------------------------
class star {
  float x, y;
  float radius;
  int points;
  float w;
  
  star(float x, float y, float r, int p) {
    this.x = x;
    this.y = y;
    this.radius = r;
    this.points = p;
    this.w = this.radius/13.0f*this.points;
  }

  void display() {
    noStroke();
    push();
    translate(this.x, this.y);
    for (var i=0; i<this.points; i++) {
      rotate(radians(360/this.points));
      triangle(0, 0, this.w, this.radius/2+1, -this.w, this.radius/2+1);
      triangle(0, this.radius, this.w, this.radius/2, -this.w, this.radius/2);
    }
    pop();
  }
}

void drawTree(float x, float y, float h) {
  var t = 1; //toggle
  push();
  strokeWeight(3);
  translate(x, y-h);
  line(0, 0, 0, h);
  for (var loopTwice=0; loopTwice<2; loopTwice++) {
    for (var i=0; i<7; i++) {
      line(0, (i*h/8.0f), t*((h/20.0f)+(h/33.33*i)), (i*h/8.0f)+(h/40.0f)+(h/33.33/2.0f*i));
    }
    t*=-1;
  }
  pop();
}

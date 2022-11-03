var opacity = 255;
var stars =[];
var turn;

function setup() {
  createCanvas(700, 700);
  background(0);
  fill(120, 232, 255);
  rect(0, 0, width, height);

  for (var i=0; i<400; i++) {
    stars.push(new star(random(-width, width), random(-height, height), random(1, 4), int(random(3, 9))));
  }

  turn = PI*2/3;
}

function draw() {
  noStroke();
  fill(120, 232, 255);
  rect(0, 0, width, height);
  //Night Sky
  for (var i = 0; i<800; i++) {
    opacity-=(255/800);
    stroke(37, 9, 99, opacity);
    line(0, i, width, i);
  }
  opacity = 255;
  for (var i = 550; i>200; i--) {
    opacity-=(255/350);
    stroke(255, 92, 215, opacity);
    line(0, i, width, i);
  }
  opacity = 255;

  //Stars
  fill(255);
  push();
  translate(width/2, height*5/6);
  rotate(turn);
  for (var i=0; i<stars.length; i++) {
    stars[i].display();
  }
  turn+=PI/3000
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

function star(x, y, r, p) {
  this.x = x;
  this.y = y;
  this.radius = r;
  this.points = p;
  this.w = this.radius/13*this.points;

  this.display = function() {
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

function drawTree(x, y, h) {

  var t = 1; //toggle
  push();
  strokeWeight(3);
  translate(x, y-h);
  line(0, 0, 0, h);
  for (var loopTwice=0; loopTwice<2; loopTwice++) {
    for (var i=0; i<7; i++) {
      line(0, (i*h/8), t*((h/20)+(h/33.33*i)), (i*h/8)+(h/40)+(h/33.33/2*i));
    }
    t*=-1;
  }
  pop();
}

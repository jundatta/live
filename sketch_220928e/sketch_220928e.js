// https://openprocessing.org/sketch/1462828

/*
  references:
 for the dragon curve: https://openprocessing.org/sketch/847651
 for the sierpinski carpet: https://breaksome.tech/coding-the-sierpinski-carpet-in-p5js/
 */

var t = [[320, 0],
  [528, 360],
  [112, 360]
];
let Px, Py;
let max_iter = 90000;
let theta, N, size_;
let size=267;
let angle = 45;
let rand = 0.66;
var l;
var ints;
let s_carpet_colors = ["#1a62ff", "#80a8ff", "#99b9ff", "#3374ff"];
function setup() {
  initializeFields();
  createCanvas(800, 800, P2D);
  background(77, 77, 255);
  noStroke();
  //noFill();

  // sierpinski carpet
  translate(width / 2 - size / 2, height / 2 - size / 2);
  generateSierpinskiCarpet(size);

  //fractal tree
  stroke(random(0, 110), 255, random(10, 200));
  strokeWeight(random(1, 2));
  push();
  translate(width/2, height);
  drawFractalTree(500);
  translate(width/2, height/2);
  drawFractalTree(500);
  translate(width, height/2);
  drawFractalTree(random(400, 500));

  pop();

  //dragon curve
  stroke(255, random(10, 102), 255);
  strokeWeight(random(0.5, 2));
  turn_left(l, ints);
  turn_right(l, ints);
  translate(width, height/2);

  turn_left(l, ints);
  turn_right(l, ints);

  stroke(254, 80, 0);
  strokeWeight(random(0, 2));
  noFill();
  translate(width / 2, height / 1.8);
  ellipse(0, 0, size, size);

  stroke(254, 80, 0);
  strokeWeight(random(0.7, 1.5));

  draw_colors = ["#FDDA16", "#6158c4", "#a70310", "#CCFF00"];
}

function draw() {

  noLoop();
  generateSierpinskiCircles(size_);
  stroke("#C15EF2");
  generateSierpinskiCircles(size_*2);
  stroke("#ECE81A");
  sierpinskiTriangle(random(100));
  stroke(254, 80, 0);
  generateSierpinskiCircles(size_/5);
  generateSierpinskiCircles(size_*3);
  generateSierpinskiCircles(size_*4);


  strokeWeight(1);

  stroke("#ECE81A");
  push();
  translate(width/2, height);
  drawFractalTree(500);
  stroke(random(draw_colors))
    sierpinskiTriangle(random(100));
  translate(width/2, height/2);
  stroke(random(draw_colors));
  sierpinskiTriangle(random(100));
  generateSierpinskiCircles(size_*4);
  translate(width/2, height/2);
  stroke(255);
  sierpinskiTriangle(random(200));
  stroke(0);
  generateSierpinskiCircles(size_*8);

  pop();
}

function generateSierpinskiCarpet(size) {

  if (size > 4) {

    main_sq = ["#4d88ff", "#3377ff", "#1a66ff", "#0055ff"];

    //fill(26, 102, 255);
    fill(random(main_sq));
    rect(0, 0, size, size);

    size /= 3;

    //Left
    fill(random(s_carpet_colors));
    push()
      translate(0 - size * 3 + size, 0 + size);
    rect(0, 0, size, size);
    generateSierpinskiCarpet(size);
    pop();

    //Right
    fill(random(s_carpet_colors));
    push()
      translate(0 + size * 5 - size, 0 + size);
    rect(0, 0, size, size);
    generateSierpinskiCarpet(size);
    pop();

    //Top
    fill(random(s_carpet_colors));
    push()
      translate(0 + size, 0 - size * 3 + size);
    rect(0, 0, size, size);
    generateSierpinskiCarpet(size);
    pop();

    //Bottom
    fill(random(s_carpet_colors));
    push()
      translate(0 + size, 0 + size * 5 - size);
    rect(0, 0, size, size);
    generateSierpinskiCarpet(size);
    pop();

    //Top Left
    fill(random(s_carpet_colors));
    push()
      translate(0 - size * 3 + size, 0 - size * 3 + size);
    rect(0, 0, size, size);
    generateSierpinskiCarpet(size);
    pop();

    //Top Right
    fill(random(s_carpet_colors));
    push()
      translate(0 + size * 5 - size, 0 - size * 3 + size);
    rect(0, 0, size, size);
    generateSierpinskiCarpet(size);
    pop();

    //Bottom Left
    fill(random(s_carpet_colors));
    push()
      translate(0 - size * 3 + size, 0 + size * 5 - size);
    rect(0, 0, size, size);
    generateSierpinskiCarpet(size);
    pop();

    //Bottom Right
    fill(random(s_carpet_colors));
    push()
      translate(0 + size * 5 - size, 0 + size * 5 - size);
    rect(0, 0, size, size);
    generateSierpinskiCarpet(size);
    pop();
  }
}
//************
function turn_right(l, ints) {
  if (ints == 0) {
    line(0, 0, 0, -l);
    translate(0, -l);
  } else {
    turn_left(l, ints - 1);
    rotate(radians(90));
    turn_right(l, ints - 1);
  }
}

function turn_left(l, ints) {
  if (ints == 0) {
    line(0, 0, 0, -l);
    translate(0, -l);
  } else {
    turn_left(l, ints - 1);
    rotate(radians(-90));
    turn_right(l, ints - 1);
  }
}
function drawFractalTree(len) {


  if (len <3) {
    return;
  }

  line(0, 0, 0, -len);

  translate(0, -len);

  push();
  rotate(angle);
  drawFractalTree(len*0.66);
  pop();

  push();
  rotate(-angle);
  drawFractalTree(len*0.66);
  pop();
}

function generateSierpinskiCircles(size) {

  size /= 2;

  if (size > 2) {

    //Top
    push();
    translate(0, -size * 2);
    ellipse(0, 0, size, size);
    generateSierpinskiCircles(size);
    pop();

    //Right
    push();
    rotate(120);
    translate(0, -size * 2);
    ellipse(0, 0, size, size);
    generateSierpinskiCircles(size);
    pop();

    //Left
    push();
    rotate(240);
    translate(0, -size * 2);
    ellipse(0, 0, size, size);
    generateSierpinskiCircles(size);
    pop();
  }

  if (size <= 2) size = 300;
}


function sierpinskiTriangle() {
  //stroke(128,49,167);
  stroke(random(draw_colors))
    strokeWeight(0.3);
  for (let i = 0; i < max_iter; i++)
  {
    let r=int(random(0, 3));
    Px=Px + (t[r][0]-Px)/2;
    Py=Py + (t[r][1]-Py)/2;
    point(Px, Py);
  }
}


function initializeFields() {
  //l=random(5, 10);
  l =5;
  ints = 13;
  angle = random(45, 180);
  rand = random(0, 1);
  size_=random(300, 500);
  Px = random(200, 500);
  Py = random(1, 100);
}
function mousePressed() {
  saveCanvas("savedImage.png");
}

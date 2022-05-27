// https://openprocessing.org/sketch/1369981

PShape cylinder5_10;

void setup() {
  size(1112, 834, P3D);
  background(100);
  noStroke();

  cylinder5_10 = createCan(5, 10);
}

void draw() {
  background(180, 220, 255);
  lights();
  push();                    // ground
  fill(50, 200, 50);
  translate(0, 200, 0);
  rotateX(PI/2.0f);
  //  plane(width*2.4, height*2);
  box(width*2.4, height*2, 1);
  pop();
  //  orbitControl();
  translate(0, -100, -50);
  rotateY(frameCount/100.0f);

  rotateX(PI/2.5);
  //  ellipsoid(130, 130, 50);
  sphere(130);
  push();                   // drone camera
  translate(-140, 0, -20);
  //  specularMaterial(0);
  box(20);
  translate(20, 0, 0);
  box(40, 24, 4);
  translate(-30, 0, 0);
  rotateX(PI/2.0f);
  rotateZ(PI/2.0f);
  //  cylinder(5, 10);
  shape(cylinder5_10);
  pop();
  push();
  translate(0, 0, -20);
  push();
  rotate(PI/4.0f);
  box(600, 20, 10);
  rotate(PI/2.0f);
  box(600, 20, 10);
  pop();
  push();
  translate(-215, -215, -10);
  rotateX(PI/2.0f);
  cylinder(30, 30);
  cylinder(4, 45);
  translate(0, -40, 0);
  rotateX(PI);
  cone(15, 60);
  cylinder(5, 60);
  pop();
  pop();
  translate(-200, -200);
  push();
  fill(255, 20);
  noStroke();
  ellipsoid(140, 140, 3);
  pop();
  torus(160, 10);
  translate(0, 400);
  push();
  translate(0, 0, -30);
  rotateX(PI/2);
  cylinder(30, 30);
  cylinder(4, 45);
  translate(0, -40, 0);
  rotateX(PI);
  cone(15, 60);
  cylinder(5, 60);
  pop();
  push();
  fill(255, 20);
  noStroke();
  ellipsoid(140, 140, 3);
  pop();
  torus(160, 10);
  translate(400, 0);
  push();
  translate(10, 10, -30);
  rotateX(PI/2);
  cylinder(30, 30);
  cylinder(4, 45);
  translate(0, -40, 0);
  rotateX(PI);
  cone(15, 60);
  cylinder(5, 60);
  pop();
  push();
  fill(255, 30);
  noStroke();
  ellipsoid(140, 140, 3);
  pop();
  torus(160, 10);
  translate(0, -400);
  push();
  translate(0, 0, -30);
  rotateX(PI/2);
  cylinder(30, 30);
  cylinder(4, 45);
  translate(0, -40, 0);
  rotateX(PI);
  cone(15, 60);
  cylinder(5, 60);
  pop();
  push();
  fill(255, 30);
  noStroke();
  ellipsoid(140, 140, 3);
  pop();
  torus(160, 10);
}

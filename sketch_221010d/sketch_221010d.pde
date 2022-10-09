// こちらがオリジナルです。
// 【作者】Neill Bogieさん
// 【作品名】Tiny planet with trees (3D) (simplest)
// https://openprocessing.org/sketch/1022491

//This is a naive approach to placing trees by generating random angles for rotation on two axes.
// Trees clump at the poles because the angles are uniformly distributed.
//
//See the parent sketch for a more even distribution of trees:
// https://www.openprocessing.org/sketch/1020962

class Tree {
  float height;
  float zRot, yRot;
  color colour;
  Tree(float height, float zRot, float yRot, color colour) {
    this.height = height;
    this.zRot = zRot;
    this.yRot = yRot;
    this.colour = colour;
  }
}
Tree[] trees; // this will store an array of information about trees to be drawn

void setup() {
  P5JS.setup(this);
  size(800, 800, P3D);

  createTrees();
}

void draw() {
  translate(width/2, height/2);

  //Set up a non-default camera position and facing.  You *can* delete these and accept the defaults
  camera(0, 10, 300, 0, 0, 0, 0, 1, 0);

  background(60);
  noStroke();

  //turn the earth slowly.  You can also use the mouse.
  rotateY(frameCount / 100.0f);

  directionalLight(150, 100, 0, -1, -0.5, 0.2);
  directionalLight(150, 100, 0, -1, -0.5, 0.2);
  ambientLight(180, 150, 150);
  ambient(100, 255, 100);

  //the basic world sphere
  sphere(100);

  //draw the trees!
  for (var tree : trees) {
    drawTree(tree);
  }
}

void drawTree(Tree tree) {
  push();
  rotateY(tree.yRot);
  rotateZ(tree.zRot);
  translate(100, 0, 0);
  colorMode(HSB);

  fill(11, 40, 32);
  noStroke();
  translate(tree.height / 2, 0, 0);
  box(tree.height, 3, 3);

  translate(tree.height / 2, 0, 0);
  //sphere(10, 5, 5);
  tex.set(0, 0, tree.colour);
  sphere.setTexture(tex);
  shape(sphere);
  pop();
}

//generate information about each tree that we will eventually display.
//what height and colour is it?  What angles will we have to rotate by before translating to put it in place?

PShape sphere;
PImage tex;
void createTrees() {
  push();
  colorMode(HSB);
  trees = new Tree[200];
  for (int i = 0; i < trees.length; i++) {
    float h = random(13, 23);
    float zRot = random(TWO_PI);
    float yRot = random(TWO_PI);
    color colour = color(P5JS.random(50, 100), random(80, 100), random(70, 100));
    Tree tree = new Tree(h, zRot, yRot, colour);
    trees[i] = tree;
  }
  pop();

  sphereDetail(5, 5);
  sphere = createShape(SPHERE, 10);
  sphereDetail(30);
  sphere.setStroke(false);
  sphere.setFill(#ffffff);
  tex = createImage(1, 1, ARGB);
}

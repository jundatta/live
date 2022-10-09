//This is a naive approach to placing trees by generating random angles for rotation on two axes.
// Trees clump at the poles because the angles are uniformly distributed.
//
//See the parent sketch for a more even distribution of trees:
// https://www.openprocessing.org/sketch/1020962

let myCamera;
let trees; // this will store an array of information about trees to be drawn

function setup() {
  createCanvas(800, 800, WEBGL);

  //optional
  debugMode(AXES); // Add an axes guide.  RGB indicate XYZ, respectively (so Red is X axis. Direction of the stick outward indicates +ve on that axis.)

  //Set up a non-default camera position and facing.  You *can* delete these and accept the defaults
  myCamera = createCamera();
  myCamera.setPosition(0, 10, 300);
  myCamera.lookAt(0, 0, 0);

  createTrees();
}


function draw() {
  background(60);
  noStroke();
  orbitControl(5, 5);

  //turn the earth slowly.  You can also use the mouse.
  rotateY(frameCount / 100);

  directionalLight(color(150, 100, 0), createVector(-1, -0.5, 0.2));
  ambientLight(180, 150, 150);
  ambientMaterial(color(100, 255, 100));

  //the basic world sphere
  sphere(100);

  //draw the trees!
  for (let tree of trees) {
    drawTree(tree);
  }
}

function drawTree(tree) {
  push();
  rotateY(tree.yRot);
  rotateZ(tree.zRot);
  translate(100, 0, 0);
  colorMode(HSB);

  fill(11, 40, 32);
  noStroke();
  translate(tree.height / 2, 0, 0);
  box(tree.height, 3, 3);

  fill(tree.colour);
  translate(tree.height / 2, 0, 0);
  sphere(10, 5, 5);
  pop();
}

//generate information about each tree that we will eventually display.
//what height and colour is it?  What angles will we have to rotate by before translating to put it in place?
function createTrees() {
  push();
  colorMode(HSB);
  trees = [];
  const numberOfTreesToCreate = 200;
  for (let i = 0; i < numberOfTreesToCreate; i++) {
    const tree = {
    height:
    random(13, 23),
    zRot:
    random(TWO_PI),
    yRot:
    random(TWO_PI),
    colour:
    color(random([50, 100]), random(80, 100), random(70, 100))
  };
  trees.push(tree);
}
pop();
}

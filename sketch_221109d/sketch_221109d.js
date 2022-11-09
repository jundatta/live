var earth, clouds, moon;

function preload() {
  earth = loadImage('earth-hires.jpg');
  clouds = loadImage('earth-clouds.png');
  moon = loadImage('moon.png');
}

function setup() {
  createCanvas(windowWidth, windowHeight, WEBGL);
  smooth();
}

function draw() {
  background(0);

  //   Representing the sun
  directionalLight(255, 255, 255, 1, 1, -1);
  directionalLight(50, 50, 50, -1, -1, -1);

  rotateY(millis()/2000);

  texture(earth);
  sphere(200);

  rotateY(millis()/10000);

  texture(clouds);
  sphere(204);

  translate(500, 0, 0);
  texture(moon);
  sphere(20);
}

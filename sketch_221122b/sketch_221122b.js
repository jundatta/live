
let theShader;

function preload() {
  //theShader = new p5.Shader(this._renderer, vert, frag);
  theShader = new p5.Shader(this._renderer, vert, frag);
}

function setup() {
  createCanvas(1112, 834, WEBGL);
  noStroke();
}

function draw() {
  background(0);
  shader(theShader);

  theShader.setUniform("uFrameCount", frameCount);


  //rotateX(frameCount * 0.002);
  //rotateY(frameCount * 0.001);

  //sphere(height / 2.8, 800, 500);
  rect(0, 0, width, height);
  //print(frameRate());
}

function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
}

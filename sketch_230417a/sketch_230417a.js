setup=_=> {
  createCanvas(800, 600, WEBGL);
  noStroke();
  n=0;
}
draw=_=> {
  background(0);
  //spotLight(200, 200, 200, 0, 0, 1000, 0, 0, -1);
  spotLight(200, 200, 200, 0, 0, 1000, sin(n), 0, cos(n), PI/3.0, 20);
  box(600, 500, 10);
  n+=0.02;
}

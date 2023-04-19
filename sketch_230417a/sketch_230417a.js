setup=_=> {
  createCanvas(800, 600, WEBGL);
  noStroke();
}
draw=_=> {
  background(0);
  spotLight(200, 200, 200, 0, 0, 1000, 0, 0, -1);
  box(600, 500, 10);
}

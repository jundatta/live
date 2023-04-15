let f=0;
setup=_=> {
  createCanvas(W=400, W, WEBGL);
  noStroke();
}
draw=_=> {
  background(0);
  rotateY(1);
  //[-1, -1, 1].map(i=>spotLight(200, 200, 200, -400, 400*i, 100, 1, -i, -.2));
  [-1, -1, 1].map(i=>spotLight(200, 200, 200, -400, 400*i, 100, 1, -i, -.2));
  push();
  translate(0, 30-abs(cos(f/31.8))*200);
  sphere(30);
  pop();
  for (i=-200; i<1000; i+=100) {
    push();
    translate(i-f%100-50, 200-i+f%100);
    box(100, 200, 1000);
    pop();
  }
  f-=1.8;
}

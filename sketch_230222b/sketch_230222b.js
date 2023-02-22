f = 0
  draw = _ => {
  f++ || (createCanvas(W = 400, W, WEBGL), g = createGraphics(w = 512, w))
    rotate(PI/2)
    noStroke()
    orbitControl()
    background(0)
    g.background(0)
    g.stroke(W)
    for (i = 0; i < 1024; i += 10) {
    g.line(-w, 0, w, i - (f) % 10)
      g.line(0, -w, i, w)
  };
  [2, 1, -2, -2].map(i => spotLight(W, W, W, i * W, i * W, 0, -i, -i, 0))
    push()
    rotate(PI / 2)
    translate(400, 0, 0)
    //rotateY(f / 99)
    rotateY(-1)
    translate(-300, 0, 0)
    for (y = -W; y <= W; y += 100) {
    push()
      translate(0, 0, y - f % 100)
      torus(abs(y - f % 100) / 2 + 40, (W - abs(y - f % 100)) / 77, 64, 4)
      pop()
  }
  texture(g)
    torus(-400, -300, 32, 64) //170
    pop()
    translate(0, -120 + noise(f/22)*30, 0)
    sphere(50)
}

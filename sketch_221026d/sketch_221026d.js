t=0
  draw=_=> {
  t||createCanvas(W=720, W)
    t+=.03
    background(0, 50)
    noFill()
    for (j=0; j++<9; )for (i=0; i++<200; ) {
    stroke(W, i/3)
      beginShape()
      X=noise(j, I=i/99+t)*W
      Y=noise(j, I, 9)*W
      for (d=0; d<20; d++)vertex(X+=cos(R=noise(I+d)*99)*(D=(200-i)/9), Y+=sin(R)*D+D)
      endShape()
  }
}

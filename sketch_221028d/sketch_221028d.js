// こちらがオリジナルです。
// 【作者】はぅ君さん
// 【作品名】つぶやきCoding | 2022/10/20
// https://0000.studio/haukun/broadcasts/cabc0564-f8bd-4e33-bdac-d3f60972403e/archive
// https://twitter.com/Hau_kun

t=0
  draw=_=> {
  t||createCanvas(W=720, W)
    t+=.05
    background(0, 50)
    noFill()
    stroke(W, 50)
    F=1
    for (r=0; r<TAU; r+=.01) {
    F=-F
      beginShape()
      X=Y=360
      for (d=0; d<80; d++)vertex(X+=cos(R=r+(noise(tan(r*4)/50, d/9-t)-.5)*d/6*F)*d/7, Y+=sin(R)*d/7)
      endShape()
  }
}

// こちらがオリジナルです。
// 【作者】はぅ君さん
// 【作品名】つぶやきCoding | 2022/03/21 by はぅ君
// https://twitter.com/Hau_kun/status/1505872956488314881

function setup() {
}
t=0
  draw=_=> {
  t||createCanvas(W=720, W)
    t+=.01
    colorMode(HSB)
    background(0)
    P=PI/6
    for (d=520; d; d-=40)for (r=d; r<6+d; r+=P) {
    fill(noise(d/99+t, r)*W%360, 60, W)+beginShape()
      for (i=0; i<P*2; i+=.05)vertex(cos(R=r+(P-abs(i-P)))*(D=i<P?d:d-30)+360, sin(R)*D+360)
      endShape()
  }
}


function draw() {
}

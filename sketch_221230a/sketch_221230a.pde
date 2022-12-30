// こちらがオリジナルです。
// 【作者】はぅ君さん
// 【作品名】つぶやきCoding | 2022/07/12
// https://twitter.com/Hau_kun/status/1546817561828167680

t=0
  draw=_=> {
  t||createCanvas(W=720, W)
    t+=.01
    noStroke()
    colorMode(HSB)
    background(F=0)
    beginShape(TRIANGLE_STRIP)
    for (r=0; r<80; r+=.0393)fill((N=noise(A=r+t, t)*W)%360, 30, N/4)+vertex(!(R=F%2?r:r-6)+cos(A)*(D=F++%8>3?R*R/9:R*R/9-R/2)+360, sin(A)*D+360)
    endShape()
}

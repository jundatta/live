// こちらがオリジナルです。
// 【作者】はぅ君さん
// 【作品名】SpiritFlow
// https://twitter.com/Hau_kun/status/1401187413808979968

t=0
  draw=_=> {
  t||createCanvas(720, 720)
    t+=.001
    colorMode(HSB)
    blendMode(BLEND)
    background(0, .1)
    noStroke()
    blendMode(ADD)
    for (r=0; r<6; r+=.005) {
    fill(r*60, 80, 99, T=tan(r*4+t*9)/2)
      circle(cos(R=r*r-t)*360*sin(A=r+t*3+sin(R+t))+360, sin(R)*360*cos(A)+360, 4/T)
  }
}

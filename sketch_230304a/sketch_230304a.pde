// オリジナルはこちらです。
// 【作者】はぅ君さん
// 【作品名】つぶやきCoding | 2023/03/02 by はぅ君
// https://https://twitter.com/Hau_kun/status/1631295483539849219

t=0
  draw=_=> {
  t||createCanvas(W=720, W)
    t+=.05
    colorMode(HSB)
    noStroke()
    background(0)
    for (y=0; y<W; y+=89)for (x=0; x<W; x+=2)fill(y/2, 70+(S=sin(R=x/17*PI+t*4)*30), 70-S)+square(X=x*2%W, 360+sin(X/99+y/9+t/y*150)/5*y+(noise(X/99+t/2, y))**5*99, sin(R/2)*(y/90+12))
}

// こちらがオリジナルです。
// 【作者】はぅ君さん
// 【作品名】trophy
// https://twitter.com/Hau_kun/status/1420362864888475653

t=0
  draw=_=> {
  t||createCanvas(W=720, W)
    t+=.01
    colorMode(HSB)
    blendMode(BLEND)
    background(r=0)
    blendMode(ADD)
    strokeWeight(5)
    for (; r<TAU; r+=.01)stroke((r*60+t*99)%360, W, W, .1)+line(cos(r*6-t)*360+360, atan(9)*360+360, atan(cos(r+t))*360+360, atan(sin(r+t))*360+360)
}

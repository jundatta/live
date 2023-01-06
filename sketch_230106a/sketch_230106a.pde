// こちらがオリジナルです。
// 【作者】はぅ君さん
// 【作品名】DailyCodingChallenge_Sky
// https://twitter.com/Hau_kun/status/1361310464114712591

t=0
  draw=_=> {
  t||createCanvas(W=720, W)+noStroke()
    for (y=0; y<W; y+=9)+fill(Y=y/6, Y, y/2)+rect(0, y, W, 9)
    t+=.01
    for (i=0; i<999; i++)fill(W, T=tan(t+(int(i/99))*.3)*30)+
    circle(sin(t)*50+cos(noise(i)*9)*T*9+360, sin(t*2)*50+sin(noise(i/9))*T*5+360, T*2)
}

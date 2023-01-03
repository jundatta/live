// こちらがオリジナルです。
// 【作者】はぅ君さん
// 【作品名】つぶやきCoding | 2022/12/27 by はぅ君 | 00:00 Studioで配信中
// https://twitter.com/Hau_kun/status/1607739155131551745

t=0
  draw=_=> {
  t||createCanvas(W=720, W)
    t+=.01
    background(0)
    noStroke()
    for (r=0; r<56; r+=.1-r/W)push()+translate(cos(r)*(D=r*(9+sin(r*9+t)))+360, sin(r)*D+360)+rotate(r*5+t)+fill(W, T=tan(r/45-t)**8*50)+rect(W/T, 0, 40+W/T, 3+W/T)+pop()
}

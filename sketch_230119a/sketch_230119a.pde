// こちらがオリジナルです。
// 【作者】はぅ君さん
// 【作品名】午前0:14 2023年1月17日のツイート
// https://twitter.com/Hau_kun/status/1615004669029543941

setup=_=> {
  createCanvas(W=720, W)
    background(W)
    strokeWeight(3)
    rectMode(CENTER)
    for (y=0; y<=W; y+=20)for (x=y/20%2*20; x<=W; x+=40)noStroke()+circle(x+cos(R=(0|random(9))*PI/2)*20, y+sin(R)*20, 9)+stroke(0)+line(x, y, x+cos(R)*33, y+sin(R)*33)+square(x, y, R>9?9:13, R)
}

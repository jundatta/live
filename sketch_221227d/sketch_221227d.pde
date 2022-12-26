// こちらがオリジナルです。
// 【作者】はぅ君さん
// 【作品名】（午前11:39 · 2021年1月1日のツイート）
// https://haukun.projectroom.jp/archives/1661
// （Processingとの2021年の歩み）

t=0;
setup=_=> {
  createCanvas(720, 720);
  colorMode(HSB, 360);
}
draw=_=> {
  t+=.005;
  blendMode(BLEND);
  background(0, 9);
  blendMode(ADD);
  for (r=0; r<TAU; r+=.03) {
    fill(r*57, 180, T=300-(sq(tan(t+r*4))*99)%360, 360-T);
    circle(cos(r+(N=noise(r, t)-.5))*T+360, sin(r+N)*T+360, 999/T);
  }
}

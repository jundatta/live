// こちらがオリジナルです。
// 【作者】はぅ君さん
// 【作品名】2022年2月12日 午後3:52 ツイートの「つぶやきProcessing」
// はぅ君プロジェクト＼(^_^)／「型くりこ／Tangent Cross/タンジェントクロス」
// https://twitter.com/Hau_kun/status/1492391109422575621

t=0
  draw=_=> {
  t||createCanvas(W=720, W)
    t+=.02
    colorMode(HSB)
    B=blendMode
    B(BLEND)
    background(0, .1)
    B(ADD)
    for (i=48; i--; ) {
    beginShape()
      for (r=0; r<1; r+=.2)fill((R=r+i/4+t)*60%360, 80, W, .1)
      +vertex(cos(R+i)*(D=i%6*60)+360, tan(-R)*D+360)
      endShape()
  }
}

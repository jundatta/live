// 【作者】へいへい📫１人前のプログラマ＆脱引きこもり目指す🔥
// 【作品名】randomMoveDot
// https://0000.studio/shoheyhey

t=0
  dts=[]
  c=["#eebb00", "#77ddaa", "#ee99dd"]
  draw=_=> {
  t||createCanvas(W=600, W)
    clear()
    d=random(TWO_PI)
    dts.push( {
  x:
    random(W), y:
    random(W), vx:
    2*random(0.11, 1.5)*cos(d), vy:
    2*random(0.11, 1.5)*cos(d), l:
  100, c:
    random(c), s:
    random(40)
  }
  )
  dts=dts.filter((dt)=>(dt.l>0))
    for (dt of dts) {
    dt.x+=dt.vx
      dt.y+=dt.vy
      dt.l-=1
      push()
      noStroke()
      o=(dt.l>9)?Math.ceil(dt.l*2.55).toString(16):'00'
      fill(dt.c+o)
      ellipse(dt.x, dt.y, dt.s)
      pop()
  }
  t++
}

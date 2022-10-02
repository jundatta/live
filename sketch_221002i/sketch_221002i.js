// 【作者】へいへい📫１人前のプログラマ＆脱引きこもり目指す🔥
// 【作品名】randomMoveDotRandomMoveMarvelDots
// https://0000.studio/shoheyhey
// 【NEORT】へいへい📬リモートで生活＆月収20万円めざす(脱引きこもりも
// https://neort.io/art/ccsgafc3p9f4hhfti9eg

function setup() {
  t = 0
    dts = []
    colorCode = ["#eebb00", "#77ddaa", "#ee99dd"]
    createCanvas(Width=600, Width)
    //falsy(false,null,0,undifind...)ならcreateCanvas
}//end setup

function draw() {

  clear()
    d = random(TWO_PI)
    dts.push( { //配列作成追加
  x:
    random(Width),
    y:
    random(Width),
    vx:
    2*random(0.11, 1.5)*cos(d),
    vy:
    2*random(0.11, 1.5)*cos(d),
    transparent:
    100,
    color:
    random(colorCode),
    size:
    random(40)
  }
  )
  dts = dts.filter(
    (dt) => ( dt.transparent > 0 )　//無名関数
    )

    for (dt of dts) {
    dt.x += dt.vx
      dt.y += dt.vy
      dt.transparent -= 1

      push()
      noStroke()

      if (dt.transparent > 9)
      opacity = Math.ceil(dt.transparent*2.55).toString(16)
  else if (dt.transparent <= 9)
  opacity = '00'

    fill(dt.color + opacity)
    ellipse(dt.x, dt.y, dt.size)
    pop()
}//end for

t++
} //end draw

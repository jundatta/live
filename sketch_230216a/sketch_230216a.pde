// こちらがオリジナルです。
// 【作者】Richard Bourneさん
// 【作品名】Wave
// https://openprocessing.org/sketch/1833308

let pg;
let S = 1112;

function setup() {
  w = 834
    createCanvas(v=1112, w);

  pg = createGraphics(v, w)

    pad = 20

    gX = 32
    gY = 24

    gsx = (S - pad * 2 ) / gX
    gsy = (w - pad * 2 ) / gY

    loopLength = 200
    speed = 200
}

function makeWave() {

  pg.background(0, 0, 50, 20);



  for (let x = pad; x < S-pad+1; x+=gsx ) {
    for (let y = pad; y < w-pad+1; y+=gsy ) {

      var d = dist(x, y, x, x)/2

        var modulator = sin(sinput + x + y + sin(sinput + d))
        pg.strokeWeight(15 + 15 * modulator)


        var colorMod = (togg, mod1, mod2) => sin(sinput + x*mod1 + y*mod2)*togg + cos(sinput + x*mod1 + y*mod2)*(1 - togg)

        var mod1 = 15
        var mod2 = 15

        pg.stroke(127.5 + 127.5 * colorMod(1, mod1, mod2),
        127.5 + 127.5 * colorMod(0, mod1, mod2),
        127.5 - 127.5 * colorMod(map(sin(sinput), -1, 1, 0, 1), mod1, mod2))


        var posMod = sin(sinput + x*1 + y*1 + sin(sinput + x + y))

        pg.point(x, y )
    }
  }
}

function draw() {
  background(0, 0, 50, 40);

  t = (frameCount%loopLength)/speed
    sinput = map(t, 0, 1, 0, TAU)

    makeWave()
    image(pg, 0, 0, v, w)
}

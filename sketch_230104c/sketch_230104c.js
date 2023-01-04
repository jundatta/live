// こちらがオリジナルです。
// 【作者】Sayamaさん
// 【作品名】200621
// https://openprocessing.org/sketch/919601

let palette =[
  createCols("https://coolors.co/0e6245-f9e54d-18302b"),
  createCols("https://coolors.co/b10b0b-fc995f-3f1732"),
  createCols("https://coolors.co/393232-f3e4af-000000"),
];
const UNIT = 10;
let bgCol, lineCol, holeCol;
let partsGra, holerGra;

function setup() {
  console.log(palette);
  createCanvas(windowWidth, windowHeight);
  holerGra = createGraphics(width, height);
  partsGra = createGraphics(width, height);
  noLoop();
  let cols = random(palette);
  bgCol = cols[0];
  lineCol = cols[1];
  holeCol = cols[2];
}

function draw() {
  background(bgCol);
  let noff = random(100);
  let sw = UNIT/5;
  let miconSpan = UNIT*20;

  //line
  for (let i = 0; i < 30; i++) drawLine(unitNum(random(width)), unitNum(random(height)), noff, sw*2);

  //parts
  for (let y = 0; y < height; y += miconSpan) {
    for (let x = 0; x < width; x += miconSpan) {
      let cx = unitNum(x + random(miconSpan*0.3));
      let cy = unitNum(y + random(miconSpan*0.3));
      if (random() > 0.2)micon(cx, cy, int(random(1, 15)), noff, sw);
      else {
        drawLine(cx, cy, noff, sw);
        drawLine(cx, cy + UNIT, noff, sw);
        partsGra.noStroke();
        partsGra.fill(holeCol);
        partsGra.ellipse(cx, cy, int(random(1, 5))*UNIT);
      }
    }
  }

  //line
  for (let i = 0; i < 1000; i++) drawLine(unitNum(random(width)), unitNum(random(height)), noff, sw);

  //layer
  image(holerGra, 0, 0);
  image(partsGra, 0, 0);

  //noise
  noStroke();
  fill(255, 20);
  for (let i = 0; i < width*height; i++) {
    let x = random(width);
    let y = random(height);
    let s = noise(x*0.01, y*0.01)*1 + 0.5;
    rect(x, y, s, s);
  }
}

/////////////

function createCols(_url)
{
  let slash_index = _url.lastIndexOf('/');
  let pallate_str = _url.slice(slash_index + 1);
  let arr = pallate_str.split('-');
  for (let i = 0; i < arr.length; i++) {
    arr[i] = '#' + arr[i];
  }
  return arr;
}

/////////////

function unitNum(num) {
  return floor(num/UNIT)*UNIT;
}

/////////////

function drawLine(x, y, noiseoff, w) {
  let col = this.get(x, y);
  if (abs(brightness(col) - brightness(lineCol)) < 5)return false;
  //setting
  let c = 50;
  let px = x;
  let py = y;
  let t = random(1);
  let reverse = random() > 0.5 ? true : false;
  let scl = 0.01;
  stroke(lineCol);
  strokeWeight(w);
  noFill();
  //draw
  hole(x, y, UNIT*0.8);
  for (let i = 0; i < c; i++)
  {
    let angle = map(int(noise(x* scl +noiseoff, y * scl + noiseoff, t)*9), 0, 8, 0, TAU, true);
    if (reverse)angle  = PI-angle;
    line(x, y, px, py);
    px = x;
    py = y;
    x += round(cos(angle)) * UNIT;
    y += round(sin(angle)) * UNIT;
    //線に当たったら終了
    let col = this.get(x, y);
    if (abs(brightness(col) - brightness(lineCol)) < 5) {
      line(x, y, px, py);
      circle(x, y, UNIT*0.2);
      break;
    }
    //最後までいったら
    if (i == c-1)hole(px, py, UNIT*0.8);
  }
}

function micon(cox, coy, pinNum, noff, sw)
{
  let rot = random() > 0.5 ? true : false;
  let x = unitNum(cox);
  let y = unitNum(coy);
  let h = pinNum * UNIT;
  let w = max(UNIT, unitNum(h * random(0.2, 0.6)));

  //きたねえ分岐
  if (rot ==false) {
    for (let p = y; p <= y + h; p += UNIT) {
      drawLine(x, p, noff, sw);
      hole(x, p, UNIT*0.8);
      drawLine(x + w, p, noff, sw);
      hole(x + w, p, UNIT*0.8);
    }
    partsGra.noStroke();
    partsGra.fill(holeCol);
    partsGra.rect(x + UNIT*0.1, y, w-UNIT*0.2, h);
  } else {
    for (let p = x; p <= x + h; p += UNIT) {
      drawLine(p, y, noff, sw);
      hole(p, y, UNIT*0.8);
      drawLine(p, y+w, noff, sw);
      hole(p, y+w, UNIT*0.8);
    }
    partsGra.noStroke();
    partsGra.fill(holeCol);
    partsGra.rect(x, y + UNIT*0.1, h, w-UNIT*0.2);
  }
}


function hole(x, y, dia) {
  holerGra.noStroke();
  holerGra.fill(lineCol);
  holerGra.circle(x, y, dia);
  holerGra.fill(holeCol);
  holerGra.circle(x, y, dia-UNIT*0.4);
}

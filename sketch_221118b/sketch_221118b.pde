// こちらがオリジナルです。
// 【作者】Okazzさん
// 【作品名】拡大解釈
// https://neort.io/art/ccu38jk3p9f4hhftihc0

let minSize = 1;
let colors = ['#f71735', '#ff9f1c', '#067bc2', '#ecc30b', '#8c7aa9', '#444444', '#ffffff'];
let SEED = Math.floor(Math.random() * 100000);

function setup() {
  createCanvas(900, 900);
  background(0);
  noStroke();
}

function draw() {
  randomSeed(SEED);
  translate(width/2, height/2);
  scale(0.95);
  translate(-width/2, -height/2);
  tiling();
}

function tiling() {
  let gridCountW = 20;
  let gridCountH = 20;
  let gridW = (width) / gridCountW;
  let gridH = (height) / gridCountH;
  let emp = gridCountW * gridCountH;
  let grids = [];
  let rects = [];

  for (let j = 0; j < gridCountW; j++) {
    let arr = []
      for (let i = 0; i < gridCountH; i++) {
      arr[i] = false;
    }
    grids[j] = arr;
  }

  while (emp > 0) {
    let w = int(random(1, gridCountW/2));
    // let h = int(random(1, gridCountH));
    let h = w;
    let x = int(random(gridCountW - w + 1));
    let y = int(random(gridCountH - h + 1));
    let lap = true;
    for (let j = 0; j < h; j++) {
      for (let i = 0; i < w; i++) {
        if (grids[x + i][y + j]) {
          lap = false;
          break;
        }
      }
    }

    if (lap) {
      for (let j = 0; j < h; j++) {
        for (let i = 0; i < w; i++) {
          grids[x + i][y + j] = true;
        }
      }
      let xx = x * gridW;
      let yy = y * gridH;
      let ww = w * gridW;
      let hh = h * gridH;
      rects.push([xx, yy, ww, hh]);
      emp -= w * h;
    }
  }
  for (let i = 0; i < rects.length; i++) {
    let off = 5;
    fill(random(colors));
    rect(rects[i][0] + off, rects[i][1] + off, rects[i][2] - off, rects[i][3] - off);
    divideRect(rects[i][0] + off, rects[i][1] + off, rects[i][2] - off, rects[i][3] - off, min(rects[i][2], rects[i][3]) / int(random(3, 10)));
  }
}

function divideRect(x, y, w, h, l) {
  let rnd = int(random(2));
  let w1 = random() < 0.5 ? l : w - l;
  let w2 = w - w1;
  let h1 = random() < 0.5 ? l : h - l;
  let h2 = h - h1;
  let arr = [w1, w2, h1, h2];
  if (min(arr) > minSize) {
    if (rnd == 0) {
      divideRect(x, y, w1, h, l);
      divideRect(x + w1, y, w2, h, l);
    }
    if (rnd == 1) {
      divideRect(x, y, w, h1, l);
      divideRect(x, y + h1, w, h2, l);
    }
  } else {
    let off = 1;
    fill(5, 255 * map(sin(random(0.1) * frameCount), -1, 1, 0, 1));
    rect(x + off, y + off, w - off * 2, h - off * 2);
  }
}

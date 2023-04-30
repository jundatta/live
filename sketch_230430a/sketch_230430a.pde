// こちらがオリジナルです。
// 【作者】Richard Bourneさん
// 【作品名】Windy
// https://openprocessing.org/sketch/1891974

let img;
let imx = 10;
let imy = 20;


function preload() {
  img = loadImage('./download.png');
}

function setup() {
  createCanvas(1112, 834);
  img.resize(width, height);
  background(100);
}

function draw() {
  for (let i = 0; i < 1000; i++) {
    let x = int(random(width));
    let y = int(random(height));
    let col = img.get(x, y);
    noStroke();
    let rotation
      = map(saturation(col), 0, 255, 0, 360);
    let length
      = map(brightness(col), 0, 255, 0, 100);
    fill(red(col), green(col), blue(col), 128);
    push();
    translate(x, y);
    rotate(radians(rotation));
    rect(0, 0, imx, imy);
    imx *= .999997;
    imy *= .999997;
    pop();
  }
}

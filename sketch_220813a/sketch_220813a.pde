// https://neort.io/art/c83roh43p9f3k6tgvn1g

let n = 0;
let a, c;
let palette = ["#A789AA", "#DDD4E5", "#B7D6F5", "#8396CB", "#404C70"];
let pg;
let s;
let pgFrame;
let bgColor, lineColor;

function setup() {
  createCanvas(windowWidth, windowHeight);
  imageMode(CENTER);

  shuffle(palette, true);

  bgColor = palette[0];
  lineColor = palette[1];

  s = min(width, height);
  pg = createGraphics(100, 100);

  pgFrame = createGraphics(width, height);
  pgFrame.background(bgColor);
  pgFrame.erase();
  pgFrame.circle(width / 2, height / 2, s * 0.9);
  pgFrame.noErase();

  strokeWeight(12);
  stroke(lineColor);
  noFill();
}

function draw() {
  pg.loadPixels();
  for (let i = 0; i < pg.width; i++) {
    for (let j = 0; j < pg.height; j++) {
      n = noise(0.01002503 * i, 0.01003463 * j);
      a = map(n + frameCount * 0.0005, 0, 1, 0, 100);
      c = palette[floor(a % 13) % palette.length];
      pg.set(i, j, color(c));
    }
  }
  pg.updatePixels();

  image(pg, width / 2, height / 2, s, s);

  image(pgFrame, width / 2, height / 2);

  circle(width / 2, height / 2, s * 0.9);
}

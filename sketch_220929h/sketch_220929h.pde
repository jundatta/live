// https://neort.io/art/c8m5k8s3p9f0i94dfr80

/**
 * color pallet
 */
// let curl = "https://coolors.co/dd7373-3b3561-ead94c-d1d1d1-51a3a3";
//let curl = "https://coolors.co/ff595e-ffca3a-8ac926-1982c4-6a4c93";
color[] curl = {#ff595e, #ffca3a, #8ac926, #1982c4, #6a4c93};
IntList pal;
color bgColor;
// let curl = "https://coolors.co/88498f-779fa1-e0cba8-ff6542-564154";

PFont font;
float fSize; // font size
String msg; // text to write
PVector[] pts; // store path data
float angle;  // rotate angle
float begin_r, end_r;  // begin / end rotate angle

void preload() {
  // preload OTF font file
  //font = loadFont('https://stat.neort.io/externalResource/c8m5f1c3p9f0i94dfr70.ttf');
  font = createFont("HuiFont29.ttf", 50, true);
}

void setup() {
  // createCanvas(600, 600);
  size(1112, 834, P3D);
  // colorMode(HSB, 360, 100, 100, 100);
  angleMode(DEGREES);
  // noLoop();

  //pal = createPallete(curl);
  pal = curl.clone();
  float cid = int(random(pal.length));
  bgColor = pal.get(cid);
  //pal.splice(cid, 1);
  pal.remove(cid);
  //pal = shuffle(pal);
  pal.shuffle();

  background(bgColor);
  // bgColor = color(15, 20, 30);

  /** Camera **/
  //cam = createCamera();

  /** Init parameters **/
  angle = 90;
  // angle = int(random(30, 150));
  begin_r = 0;
  end_r = begin_r + angle;

  /** Font **/
  fSize = 100;

  textFont(font);
  textSize(fSize);
  // textAlign(CENTER, CENTER);
  textLeading(110);

  //genTextToPoints();
}

function draw() {
  background(bgColor);

  if (frameCount%200==0) {
    begin_r += angle;
    angle = int(random(30, 150));
    end_r = begin_r + angle;
    genTextToPoints();
  }

  cam.lookAt(0, 0, 0);
  cam.setPosition(0, -300, 600);
  cam.ortho(-width/2, width/2, -height/2, height/2, -4000, 4000);

  /** Fitting to browser scale **/
  push();
  scale(min(width, height) / 600);

  // directionalLight(color(125, 10), 0, 0, -1);
  // directionalLight(pal[0], 0, 1, 0);
  // directionalLight(pal[1], -1, 0, 0);
  // directionalLight(color(125, 10), 0, 1, 0);

  push();
  translate(0, 500, -1000);
  rotateX(90);
  noFill();
  strokeWeight(2);
  stroke(255);
  circle(0, 0, 100);
  pop();

  push();
  translate(0, 500, -1000);
  if (int(frameCount/100)%2==0) {
    expand();
  } else {
    shrink();
  }
  pop();

  push();
  rotateX(-atan(-300/600));
  directionalLight(color(255), 0, 0, -1);
  translate(-300, -300);
  specularMaterial(255);
  genWindow();
  pop();

  pop();
}

function expand() {
  let e = easeInQuart(map(frameCount%100, 0, 100, 0, 1));
  let r = map(e, 0, 1, begin_r, end_r);

  noFill();
  strokeWeight(2);
  stroke(255);
  line(0, 0, 0, cos(-begin_r)*1e+4, 0, sin(-begin_r)*1e+4);
  line(0, 0, 0, cos(-r)*1e+4, 0, sin(-r)*1e+4);

  noFill();
  strokeWeight(2);
  stroke(255);
  for (let j = begin_r; j <= r; j+=10) {
    beginShape();
    for (let i = 0; i < pts.length; i++) {
      let p = pts[i];
      let x = p.x + 50;
      let y = p.y;
      vertex(x*cos(-j), y, x*sin(-j));
    }
    endShape();
  }

  noFill();
  strokeWeight(2);
  stroke(255);
  // noStroke();  fill(250);
  for (let i = 0; i < pts.length; i+=5) {
    beginShape();
    let p = pts[i];
    let x = p.x + 50;
    let y = p.y;
    for (let j = begin_r; j <= r; j+=10) {
      vertex(x*cos(-j), y, x*sin(-j));
    }
    vertex(x*cos(-r), y, x*sin(-r));
    endShape();
  }

  push();
  rotateY(begin_r);
  noStroke();
  fill(250);
  text(msg, 50, 0);
  pop();
  push();
  rotateY(r);
  noStroke();
  fill(250);
  text(msg, 50, 0);
  pop();
}

function shrink() {
  let e = easeInOutQuart(map(frameCount%100, 0, 100, 0, 1));
  let r = map(e, 0, 1, begin_r, end_r);

  noFill();
  strokeWeight(2);
  stroke(255);
  line(0, 0, 0, cos(-r)*1e+4, 0, sin(-r)*1e+4);
  line(0, 0, 0, cos(-end_r)*1e+4, 0, sin(-end_r)*1e+4);

  noFill();
  strokeWeight(2);
  stroke(255);
  for (let j = r; j <= end_r; j+=10) {
    beginShape();
    for (let i = 0; i < pts.length; i++) {
      let p = pts[i];
      let x = p.x + 50;
      let y = p.y;
      vertex(x*cos(-j), y, x*sin(-j));
    }
    endShape();
  }

  noFill();
  strokeWeight(2);
  stroke(255);
  // noStroke();  fill(250);
  for (let i = 0; i < pts.length; i+=5) {
    beginShape();
    let p = pts[i];
    let x = p.x + 50;
    let y = p.y;
    for (let j = r; j <= end_r; j+=10) {
      vertex(x*cos(-j), y, x*sin(-j));
    }
    vertex(x*cos(-end_r), y, x*sin(-end_r));
    endShape();
  }

  push();
  rotateY(end_r);
  noStroke();
  fill(250);
  text(msg, 50, 0);
  pop();
  push();
  rotateY(r);
  noStroke();
  fill(250);
  text(msg, 50, 0);
  pop();
}

function genTextToPoints() {
  // msg = 'vertex';
  // msg = 'rotate';
  msg = String(angle);
  pts = font.textToPoints(msg, 0, 0, fSize, {
  sampleFactor:
    0.1, // increase for more points
    simplifyThreshold:
    0.0 // increase to remove collinear points
  }
  );
}

function createPallete(_url) {
  let slash_index = _url.lastIndexOf('/');
  let pallate_str = _url.slice(slash_index + 1);
  let arr = pallate_str.split('-');
  for (let i = 0; i < arr.length; i++) {
    arr[i] = color('#' + arr[i]);
  }
  return arr;
}

function genWindow() {
  let w = 600 / 30;
  noStroke();
  fill(255);
  rect(0, 0, 600, w);
  rect(0, 600 - w, 600, w);
  rect(0, 0, w, 600);
  rect(600 - w, 0, w, 600);
}

function keyPressed() {
  if (keyCode == ENTER) {
    save('screenshot.png');
  }
}

function easeInQuart(t) {
  return 1 + (--t) * t * t * t * t;
}
function easeInOutQuart(t) {
  return t < 0.5 ? 8 * t * t * t * t : 1 - 8 * (--t) * t * t * t;
}
function easeInElastic(t) {
  return (0.01 - 0.01 / t) * Math.sin(60 * t) + 1;
}
function normDist(x, mu, sigma) {
  return (exp(-pow(x - mu, 2) / (2 * pow(sigma, 2)))) / sqrt(2 * PI * sigma);
}

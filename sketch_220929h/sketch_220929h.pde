// こちらがオリジナルです
// https://neort.io/art/c8m5k8s3p9f0i94dfr80
// こちらを参考にしています
// https://wcs.hatenablog.com/entry/2014/08/02/184622

import java.awt.Font;
import java.awt.font.FontRenderContext;
import java.awt.image.BufferedImage;
import java.awt.geom.PathIterator;

String fontName = "HuiFont29.ttf";
int fontSize = 500;

PathIterator iter;
PathIterator createOutline(String text) {
  FontRenderContext frc =
    new BufferedImage(1, 1, BufferedImage.TYPE_INT_ARGB)
    .createGraphics()
    .getFontRenderContext();

  Font font = new Font(fontName, Font.PLAIN, fontSize);

  PathIterator iter = font.createGlyphVector(frc, text)
    .getOutline(0, 0)
    .getPathIterator(null);

  return iter;
}
void drawNormally() {
  noFill();
  float coords[] = new float[6];
  while (!iter.isDone()) {
    int type = iter.currentSegment(coords);
    switch (type) {
    case PathIterator.SEG_MOVETO: // beginning of new path
      beginShape();
      vertex(coords[0], coords[1]);
      break;
    case PathIterator.SEG_LINETO:
      vertex(coords[0], coords[1]);
      break;
    case PathIterator.SEG_CLOSE: // back to last MOVETO point.
      endShape();
      break;
    case PathIterator.SEG_QUADTO:
      quadraticVertex(coords[0], coords[1], coords[2], coords[3]);
      break;
    case PathIterator.SEG_CUBICTO:
      bezierVertex(coords[0], coords[1], coords[2], coords[3], coords[4], coords[5]);
      break;
    default:
      throw new RuntimeException("should not reach here");
    }
    iter.next();
  }
}

/**
 * color pallet
 */
//let curl = "https://coolors.co/ff595e-ffca3a-8ac926-1982c4-6a4c93";
color[] curl = {#ff595e, #ffca3a, #8ac926, #1982c4, #6a4c93};
IntList pal;
color bgColor;

PFont font;
float fSize; // font size
String msg; // text to write
ArrayList<PVector> pts; // store path data
float angle;  // rotate angle
float begin_r, end_r;  // begin / end rotate angle



void preload() {
  // preload OTF font file
  //font = loadFont('https://stat.neort.io/externalResource/c8m5f1c3p9f0i94dfr70.ttf');
  font = createFont(fontName, 50, true);
}

void setup() {
  preload();

  // createCanvas(600, 600);
  size(1112, 834, P3D);
  //angleMode(DEGREES);

  //pal = createPallete(curl);
  pal = new IntList();
  for (int n : curl) {
    pal.append(n);
  }
  int cid = int(random(pal.size()));
  bgColor = pal.get(cid);
  //pal.splice(cid, 1);
  pal.remove(cid);
  //pal = shuffle(pal);
  pal.shuffle();

  background(bgColor);

  /** Camera **/
  //cam = createCamera();

  /** Init parameters **/
  angle = 90;
  // angle = int(random(30, 150));
  begin_r = 0;
  end_r = begin_r + angle;

  /** Font **/
  fSize = 500;

  textFont(font);
  textSize(fontSize);
  textLeading(110);

  genTextToPoints();
}

void draw() {
  translate(width/2, height/2);

  background(bgColor);

  if (frameCount%200==0) {
    begin_r += angle;
    angle = int(random(30, 150));
    end_r = begin_r + angle;
    genTextToPoints();
  }

  //cam.lookAt(0, 0, 0);
  //cam.setPosition(0, -300, 600);
  //cam.ortho(-width/2, width/2, -height/2, height/2, -4000, 4000);

  /** Fitting to browser scale **/
  push();
  scale(min(width, height) / 600);

  push();
  translate(0, 500, -1000);
  rotateX(radians(90));
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
  rotateX(radians(-atan(-300/600)));
  //directionalLight(color(255), 0, 0, -1);
  translate(-300, -300);
  //specularMaterial(255);
  genWindow();
  pop();

  pop();
}

void expand() {
  float e = easeInQuart(map(frameCount%100, 0, 100, 0, 1));
  float r = map(e, 0, 1, begin_r, end_r);

  noFill();
  strokeWeight(2);
  stroke(255);
  line(0, 0, 0, cos(radians(-begin_r))*1e+4, 0, sin(radians(-begin_r))*1e+4);
  line(0, 0, 0, cos(radians(-r))*1e+4, 0, sin(radians(-r))*1e+4);

  noFill();
  strokeWeight(2);
  stroke(255);
  for (int j = (int)begin_r; j <= r; j+=10) {
    //beginShape();
    //for (let i = 0; i < pts.length; i++) {
    //  let p = pts[i];
    //  let x = p.x + 50;
    //  let y = p.y;
    //  vertex(x*cos(-j), y, x*sin(-j));
    //}
    //endShape();
  }

  noFill();
  strokeWeight(2);
  stroke(255);
  //for (int i = 0; i < pts.length; i+=5) {
  //beginShape();
  //let p = pts[i];
  //let x = p.x + 50;
  //let y = p.y;
  //for (let j = begin_r; j <= r; j+=10) {
  //  vertex(x*cos(-j), y, x*sin(-j));
  //}
  //vertex(x*cos(-r), y, x*sin(-r));
  //endShape();
  //}

  push();
  rotateY(radians(begin_r));
  noStroke();
  fill(250);
  text(msg, 50, 0);
  pop();
  push();
  rotateY(radians(r));
  noStroke();
  fill(250);
  text(msg, 50, 0);
  pop();
}

void shrink() {
  float e = easeInOutQuart(map(frameCount%100, 0, 100, 0, 1));
  float r = map(e, 0, 1, begin_r, end_r);

  noFill();
  strokeWeight(2);
  stroke(255);
  line(0, 0, 0, cos(radians(-r))*1e+4, 0, sin(radians(-r))*1e+4);
  line(0, 0, 0, cos(radians(-end_r))*1e+4, 0, sin(radians(-end_r))*1e+4);

  noFill();
  strokeWeight(2);
  stroke(255);
  for (int j = (int)r; j <= end_r; j+=10) {
    //beginShape();
    //for (let i = 0; i < pts.length; i++) {
    //  let p = pts[i];
    //  let x = p.x + 50;
    //  let y = p.y;
    //  vertex(x*cos(-j), y, x*sin(-j));
    //}
    //endShape();
  }

  noFill();
  strokeWeight(2);
  stroke(255);
  //for (int i = 0; i < pts.length; i+=5) {
  //beginShape();
  //let p = pts[i];
  //let x = p.x + 50;
  //let y = p.y;
  //for (let j = r; j <= end_r; j+=10) {
  //  vertex(x*cos(-j), y, x*sin(-j));
  //}
  //vertex(x*cos(-end_r), y, x*sin(-end_r));
  //endShape();
  //}

  push();
  rotateY(radians(end_r));
  noStroke();
  fill(250);
  text(msg, 50, 0);
  pop();
  push();
  rotateY(radians(r));
  noStroke();
  fill(250);
  text(msg, 50, 0);
  pop();
}

void genTextToPoints() {
  msg = str(int(angle));
  //pts = font.textToPoints(msg, 0, 0, fSize, {
  //sampleFactor:
  //  0.1, // increase for more points
  //  simplifyThreshold:
  //  0.0 // increase to remove collinear points
  //}
  //);
  iter = createOutline(msg);
}

void genWindow() {
  float w = 600 / 30.0f;
  noStroke();
  fill(255);
  rect(0, 0, 600, w);
  rect(0, 600 - w, 600, w);
  rect(0, 0, w, 600);
  rect(600 - w, 0, w, 600);
}

float easeInQuart(float t) {
  return 1 + (--t) * t * t * t * t;
}
float easeInOutQuart(float t) {
  return t < 0.5 ? 8 * t * t * t * t : 1 - 8 * (--t) * t * t * t;
}

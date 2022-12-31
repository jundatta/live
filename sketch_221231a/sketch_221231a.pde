// こちらがオリジナルです。
// 【作者】Jenni Hutsonさん
// 【作品名】4a
// https://openprocessing.org/sketch/838280

PGraphics pg;

final int ORGW = 600;
final int ORGH = 600;

void setup() {
  size(500, 800, P3D);

  pg = createGraphics(ORGW, ORGH);
  pg.beginDraw();
  pg.noStroke();

  for (int i = 0; i<=600; i+=1) {
    pg.stroke(156+i*.2, 188+i*.2, 255+i*.2);
    pg.line(0, i, 600, i);
  }

  pg.fill(255, 248, 48, 200);
  pg.ellipse(300, 600, 600, 600);

  pg.stroke(251, 215, 241);
  pg.strokeWeight(6);
  pg.strokeJoin(ROUND);
  pg.strokeCap(ROUND);
  pg.fill(174, 196, 245);
  for (int x=0; x<600; x+=50) {
    pg.beginShape();
    pg.vertex(0, 600);
    if ((x<=200) && (x%200==0)) {
      pg.vertex(x, 600);
      pg.line(x, 600, 100, 400);
      pg.vertex(100, 400);
    }
    if ((x==100) || (x==500)) {
      pg.vertex(x, 600);
      pg.line(x, 600, 300, 100);
      pg.vertex(300, 100);
    }
    if ((x==350)|| (x==550)) {
      pg.vertex(x, 600);
      pg.line(x, 600, 450, 300);
      pg.vertex(450, 300);
    }
    pg.vertex(550, 600);
    pg.endShape();
  }
  pg.noStroke();
  pg.fill(255, 255, 255, 255);
  int i = 200;
  for (int x =0; x<=600; x+=50) {
    if ((x>=50) && (x<150)) {
      pg.ellipse(x, i+275, 60, 60);
      pg.ellipse(x+25, i+250, 60, 60);
      pg.ellipse(x+25, i+300, 60, 60);
    }
    if (x==150) {
      pg.ellipse(x, i+275, 60, 60);
    }
    if ((x>200) && (x<425)) {
      pg.ellipse(x, i, 60, 60);
      i-=25;
      pg.ellipse(x+25, i, 60, 60);
      i+=40;
      pg.ellipse(x+10, i, 80, 80);
      i-=15;
      if (x == 350) {
        pg.ellipse(x-15, 175, 110, 100);
      }
    }
    if ((x>=425) && (x<600)) {
      if (i == 200) {
        i+=200;
      }
      if (x==450) {
        pg.ellipse(x, 200, 60, 60);
      }
      if (x==500) {
        pg.ellipse(x, i, 100, 100);
      }
      if (x==550) {
        pg.ellipse(x-10, i-25, 100, 100);
      }
      pg.ellipse(x, i, 60, 60);
      pg.ellipse(x+30, i-30, 60, 60);
      if (x==550) {
        pg.ellipse(x+25, i, 60, 60);
      }
    } else {
      continue;
    }
  }
  pg.endDraw();
}
void draw() {
  image(pg, 0, 0, width, height);
}

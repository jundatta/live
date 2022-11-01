// こちらがオリジナルです。
// 【作者】Jenni Hutsonさん
// 【作品名】4b
// https://openprocessing.org/sketch/838061

void setup() {
  size(800, 450);

  background(255);
  i = 0;
  for (int y = 0; y<=450; y+=1) {
    stroke(13+i, 2+i, 52+i);
    line(0, y, 800, y);
    i+=.25;
  }
  stroke(220, 176, 51, 100);
  for (int i = 0; i<1000; i+=1) {
    point(random(800), random(410));
  }
  stroke(255, 255, 255, 100);
  for (int i = 0; i<1000; i+=1) {
    point(random(800), random(410));
  }
  fill(0);
  strokeWeight(1);
  stroke(0);
  rect(350, 370, 100, 40, 7);
  triangle(350, 373, 450, 373, 400, 340);
  noStroke();
  fill(233, 182, 37);
  triangle(365, 405, 435, 405, 400, 370);
  stroke(0);
  strokeWeight(1);
  line(300, 410, 350, 373);
  line(450, 373, 500, 410);

  noStroke();
  fill(0);
  rect(0, 410, 800, 450);
  stroke(0);
  for (int i = 0; i<5000; i+=1) {
    x = random(800);
    y = 405 - 2*randomGaussian();
    line(x, y, x, 420);
  }
  //line(275,90,525,35);
  //line(150,150,400,40);
  x1 = 60;
  y1 = 100;
  x2 = 300;
  y2 = 55;
  for (int i = 0; i <6; i+=1) {
    strokeWeight(1);
    stroke(255, 255, 255, 200);
    if (y2 > 35) {
      x1 += 60;
      x2 += 60;
      y1 -= 40;
      y2 -= 40;
    } else {
      x1+= 80;
      x2+= 80;
      y1 += 100;
      y2 += 100;
    }
    line(x1, y1, x2, y2);
    strokeWeight(3);
    stroke(255);
    point(x1, y1);
  }
}
void draw() {
}

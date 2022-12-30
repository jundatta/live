// こちらがオリジナルです。
// 【作者】Jenni Hutsonさん
// 【作品名】4a
// https://openprocessing.org/sketch/838280

size(600, 600);
noStroke();

for (int i = 0; i<=600; i+=1) {
  stroke(156+i*.2, 188+i*.2, 255+i*.2);
  line(0, i, 600, i);
}

fill(255, 248, 48, 200);
ellipse(300, 600, 600, 600);

stroke(251, 215, 241);
strokeWeight(6);
strokeJoin(ROUND);
strokeCap(ROUND);
fill(174, 196, 245);
beginShape();
for (int x=0; x<600; x+=50) {
  beginShape();
  vertex(0, 600);
  if ((x<=200) && (x%200==0)) {
    vertex(x, 600);
    line(x, 600, 100, 400);
    vertex(100, 400);
  }
  if ((x==100) || (x==500)) {
    vertex(x, 600);
    line(x, 600, 300, 100);
    vertex(300, 100);
  }
  if ((x==350)|| (x==550)) {
    vertex(x, 600);
    line(x, 600, 450, 300);
    vertex(450, 300);
  }
  vertex(550, 600);
  endShape();
}
noStroke();
fill(255, 255, 255, 255);
int i = 200;
for (int x =0; x<=600; x+=50) {
  if ((x>=50) && (x<150)) {
    ellipse(x, i+275, 60, 60);
    ellipse(x+25, i+250, 60, 60);
    ellipse(x+25, i+300, 60, 60);
  }
  if (x==150) {
    ellipse(x, i+275, 60, 60);
  }
  if ((x>200) && (x<425)) {
    ellipse(x, i, 60, 60);
    i-=25;
    ellipse(x+25, i, 60, 60);
    i+=40;
    ellipse(x+10, i, 80, 80);
    i-=15;
    // ellipse(x+15,230,80,80);
    if (x == 350) {
      ellipse(x-15, 175, 110, 100);
    }
  }
  if ((x>=425) && (x<600)) {
    if (i == 200) {
      i+=200;
    }
    if (x==450) {
      ellipse(x, 200, 60, 60);
    }
    if (x==500) {
      ellipse(x, i, 100, 100);
    }
    if (x==550) {
      ellipse(x-10, i-25, 100, 100);
    }
    ellipse(x, i, 60, 60);
    ellipse(x+30, i-30, 60, 60);
    if (x==550) {
      ellipse(x+25, i, 60, 60);
    }
  } else {
    continue;
  }
}

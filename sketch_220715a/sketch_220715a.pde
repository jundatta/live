// https://openprocessing.org/sketch/1274942

Shape shape1, shape2, shape3, shape4, shape5;
Zodiac[] lis;
int ang;

void setup() {
  size(1112, 834);
  background(100);

  shape1 = new Shape(0, 255, 3, 255, 215, 0, 255, false, 8);
  shape2 = new Shape(0, 270, 10, 255, 215, 0, 255, false, 8);
  shape3 = new Shape(0, 280, 10, 255, 215, 0, 255, false, 8);
  shape4 = new Shape(0, 340, 3, 255, 215, 0, 255, false, 4);
  shape5 = new Shape(0, 425, 3, 255, 215, 0, 255, false, 4);

  lis = new Zodiac[8];
  int c = 0;
  for (int i=0; i<lis.length; i++) {
    c += 1;
    if (c>8) {
      c -= 8;
    }
    lis[i] = new Zodiac(c, 2, 20, 255, 255, 255);
  }

  ang = 0;
}

void draw() {
  background(0);
  translate(width/2, height/2);
  rotate(radians(ang));

  taigy(120);

  noFill();
  stroke(255, 215, 0);
  strokeWeight(10);
  ellipse(0, 0, 200, 200);
  stroke(255);
  ellipse(0, 0, 230, 230);
  stroke(255, 215, 0);

  stroke(255, 215, 0);
  strokeWeight(5);
  ellipse(0, 0, 300, 300);

  strokeWeight(2);
  int amount = 60;
  float a = 360/(float)amount;
  for (int j=0; j<amount; j++) {
    float an = radians(a*j);
    float x = 150 * cos(an);
    float y = 150 * sin(an);
    float X = 65 * cos(an);
    float Y = 65 * sin(an);
    line(x, y, X, Y);
  }

  stroke(255, 215, 0);
  re(185, 8, 70, 50, false);

  stroke(255);
  ellipse(0, 0, 320, 320);
  re(160, 4, 30, 30, false);

  stroke(255, 215, 0);
  strokeWeight(10);
  ellipse(0, 0, 380, 380);

  shape1.show(22.5, 0);
  shape2.show(22.5, 0);
  shape3.show(22.5, 0);

  re(250, 8, 70, 50, true);

  int rune_num = lis.length;
  final float w = 60;
  final float h = 8;
  for (int j=0; j<rune_num; j++) {
    float an = radians(45*j);
    rotate(an);
    taicy(j+1, 0, 275, w, h);
    rotate(-an);
  }

  for (int i=0; i<rune_num; i++) {
    float ang = 360/(float)rune_num*i;
    lis[i].show(210, ang);
  }

  for (int i=0; i<rune_num; i++) {
    float ang = 180+360/(float)rune_num*i;
    lis[i].show(380, ang);
  }

  shape4.show(0, 0);
  shape4.show(45, 0);
  shape5.show(0, 0);
  shape5.show(45, 0);

  ang +=1;
}

void re(float r, int amount, float w, float h, boolean fi) {
  strokeWeight(2);
  if (fi) {
    fill(0);
  } else {
    noFill();
  }

  for (int j=0; j<amount; j++) {
    float an = radians(360/(float)amount*j);
    rotate(an);
    rect(-w/2, -r-h, w, h);
    rotate(-an);
  }
}

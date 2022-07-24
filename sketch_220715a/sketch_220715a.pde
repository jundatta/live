// https://openprocessing.org/sketch/1274942

function setup() {
  createCanvas(windowWidth, windowHeight);
  background(100);

  shape1 = new Shape(0, 0, 0, 255, 3, 0, 255, 215, 0, 255, 0, 8);
  shape2 = new Shape(0, 0, 0, 270, 10, 0, 255, 215, 0, 255, 0, 8);
  shape3 = new Shape(0, 0, 0, 280, 10, 0, 255, 215, 0, 255, 0, 8);
  shape4 = new Shape(0, 0, 0, 340, 3, 0, 255, 215, 0, 255, 0, 4);
  shape5 = new Shape(0, 0, 0, 425, 3, 0, 255, 215, 0, 255, 0, 4);

  lis = [];
  c = 0;
  rune_num = 8;
  for (i=0; i<rune_num; i++) {
    c += 1;
    if (c>8) {
      c -= 8;
    }
    zodiac = new Zodiac(c, 0, 0, 2, 20, 255, 255, 255);
    append(lis, zodiac);
  }

  ang = 0;
}

function draw() {
  background(0);
  translate(width/2, height/2);
  rotate(radians(ang));

  taigy(120);

  noFill();
  stroke(255, 215, 0);
  strokeWeight(10);
  ellipse(0, 0, 200);
  stroke(255);
  ellipse(0, 0, 230);
  stroke(255, 215, 0);

  stroke(255, 215, 0);
  strokeWeight(5);
  ellipse(0, 0, 300);

  strokeWeight(2)
    amount = 60;
  a = 360/amount;
  r = 140;
  for (j=0; j<amount; j++) {
    an = radians(a*j);
    x = 150 * cos(an);
    y = 150 * sin(an);
    X = 65 * cos(an);
    Y = 65 * sin(an);
    line(x, y, X, Y);
  }

  stroke(255, 215, 0);
  re(185, 8, 70, 50, 0);

  stroke(255);
  ellipse(0, 0, 320);
  re(160, 4, 30, 30, 0);

  stroke(255, 215, 0);
  strokeWeight(10);
  ellipse(0, 0, 380);

  shape1.show(22.5, 0);
  shape2.show(22.5, 0);
  shape3.show(22.5, 0);

  re(250, 8, 70, 50, 1);

  w = 60;
  h = 8;
  for (j=0; j<8; j++) {
    an = radians(45*j);
    rotate(an);
    taicy(j+1, 0, 275)
      rotate(-an);
  }

  for (i=0; i<rune_num; i++) {
    lis[i].Rotate(210, 360/rune_num*i);
    lis[i].show();
  }

  for (i=0; i<rune_num; i++) {
    lis[i].Rotate(380, 180+360/rune_num*i);
    lis[i].show();
  }

  shape4.show(0, 0);
  shape4.show(45, 0);
  shape5.show(0, 0);
  shape5.show(45, 0);

  ang +=1;
}

function re(r, amount, w, h, fi) {
  strokeWeight(2);
  if (fi == 1) {
    fill(0);
  } else {
    noFill();
  }

  for (j=0; j<amount; j++) {
    an = radians(360/amount*j);
    rotate(an);
    rect(-w/2, -r-h, w, h);
    rotate(-an);
  }
}

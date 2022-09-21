// https://openprocessing.org/sketch/1257463

function setup() {
  w = windowWidth;
  h = windowHeight;
  createCanvas(w, h, WEBGL);
  background(0);


  a = 0;
  ang = 0;
  dis = 300;
  num = 0;

  lis = [];
  c = 0;
  rune_num = 40;

  for (i=0; i<rune_num; i++) {
    c += 1;
    if (c>29) {
      c -= 29;
    }
    rune = new Rune(c, 0, 0, 2, 30, 105, 255, 255, 0);
    append(lis, rune);
  }
}

function draw() {
  background(0);


  h = 60;
  w = 5;
  num = 0;
  angl = 360/rune_num;

  rotateX(radians(25));
  for (i=0; i<360; i++) {
    an = radians(i);

    rotateY(ang+an);
    translate(0, 0, dis);

    if (i%angl==0) {
      lis[num].move(0, 0);
      lis[num].show(0);
      num+=1
    }

    rect(0-w/2, 0-h/2, w, h/10);
    rect(0-w/2, 0+h/2, w, h/10);

    translate(0, 0, -dis);
    rotateY(-an-ang);
  }


  a +=1;
  ang = radians(a);
}

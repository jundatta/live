// https://openprocessing.org/sketch/1257463

float a;
float ang;
float dis;
int num;

Rune[] lis;
int rune_num;

void setup() {
  size(1112, 834, P3D);
  background(0);

  a = 0;
  ang = 0;
  dis = 300;
  num = 0;

  int c = 0;
  rune_num = 40;
  lis = new Rune[rune_num];

  for (int i=0; i<rune_num; i++) {
    c += 1;
    if (c>29) {
      c -= 29;
    }
    lis[i] = new Rune(c, 0, 0, 2, 30, 105, 255, 255, 0);
  }
}

void draw() {
  translate(width/2, height/2);
  
  background(0);

  int h = 60;
  int w = 5;
  int num = 0;
  int angl = 360/rune_num;

  rotateX(radians(25));
  for (int i=0; i<360; i++) {
    float an = radians(i);

    rotateY(ang+an);
    translate(0, 0, dis);

    if (i%angl==0) {
      lis[num].move(0, 0);
      lis[num].show();
      num+=1;
    }

    rect(0-w/2.0f, 0-h/2.0f, w, h/10.0f);
    rect(0-w/2.0f, 0+h/2.0f, w, h/10.0f);

    translate(0, 0, -dis);
    rotateY(-an-ang);
  }

  a +=1;
  ang = radians(a);
}

// こちらがオリジナルです。
// 【作者】KomaTebeさん
// 【作品名】DarkCity21
// https://openprocessing.org/sketch/1405250

float c = 0;
float z = 0;
class Cloud {
  float x, y, zinc, w, h, z;
  Cloud(float x, float y, float zinc, float w, float h, float z) {
    this.x = x;
    this.y = y;
    this.zinc = zinc;
    this.w = w;
    this.h = h;
    this.z = z;
  }
}
Cloud[] clouds = new Cloud[10];

void setup() {
  size(500, 500, P3D);
  for (int i = 0; i < clouds.length; i++) {
    clouds[i] = new Cloud(random(-300, 300), random(-10, -200),
      random(2) + 0.2, random(50, 200), random(100, 400), -300.0f);
  }
}
void draw() {
  translate(width * 0.5f, height * 0.5f);
  
  background(0);
  noStroke();
  for (int j = 0; j < 100; j++) {
    for (int i = -20; i < 20; i++) {
      push();
      float h = noise(2 + i * 0.5, (z + j) * 0.5) * 250;
      fill(j * 2.55);
      translate(10 + i * 20, -h / 2.0f + 250, -j * 20 + 330 - c);
      box(20, h, 20);
      pop();
    }
  }

  for (int i = 0; i < clouds.length; i++) {
    push();
    translate(clouds[i].x, clouds[i].y, clouds[i].z);
    rotateX(HALF_PI);
    fill(80);
    stroke(100);
    // ちらつくのです...orz
    // （こういうときに8001さんがいたらなぁ。。。）
    //push();
    //scale(1, 1, 10000);
    rect(0, 0, clouds[i].w, clouds[i].h);
    //pop();
    clouds[i].z += clouds[i].zinc;
    if (clouds[i].z > 400) {
      clouds[i].z = -300;
      clouds[i].zinc = random(2) + 0.2;
    }
    pop();
  }

  fill(255);
  translate(0, -500, -3000);
  //sphere(1000, 20, 20);
  sphere(1000);
  blendMode(ADD);
  c = (c - 2) % 20;
  if (c == 0) z++;
}

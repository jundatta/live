// こちらがオリジナルです。
// 【作者】KomaTebeさん
// 【作品名】DarkCity21
// https://openprocessing.org/sketch/1405250

// TN8001さんから「ちらつくのです」について、対策頂きました＼(^_^)／

//random(-10, -200)は常に-10になります。
//すべての板（雲？）が同じ高さにあるためチラついています。

//random(-200, -10)にしなければなりません（かなりいやらしい仕様だなぁ^^;
//processing4/PApplet.java#L4759 · processing/processing4

//偶然同じ高さになればチラつきが出るとは思いますが、そうそうないと思うのでいいでしょうｗ
//（hint()なんかで抑え込めますが別の問題が出ますorz）

//中央の低い位置に板が出ると、手前側の描画が途切れます（元p5.jsコードでも再現します）
//perspectiveをちょっといじったほうがいいかもしれません。


int c;
int z;
Cloud[] clouds = new Cloud[10];

void setup() {
  size(500, 500, P3D);
  noStroke();
  blendMode(ADD);
  perspective(PI / 3, 1, 1, 4000);

  for (var i = 0; i < clouds.length; i++) {
    clouds[i] = new Cloud();
  }
}

void draw() {
  background(0);
  translate(width/2, height/2);

  for (var j = 0; j < 100; j++) {
    for (var i = -20; i < 20; i++) {
      push();
      var h = noise(2 + i * 0.5, (z + j) * 0.5) * 250;
      fill(j * 2.55);
      translate(10 + i * 20, -h / 2 + 250, -j * 20 + 330 - c);
      box(20, h, 20);
      pop();
    }
  }

  for (var cloud : clouds) {
    cloud.draw();
  }

  fill(255);
  translate(0, -500, -3000);
  sphere(1000);

  c = (c - 2) % 20;
  if (c == 0) z++;
}

class Cloud {
  final float x = random(-300, 300);
  //final float y = random(-10, -200); // always -10
  final float y = random(-200, -10);
  final float w = random(50, 200);
  final float h = random(100, 400);
  float z = -300;
  float zinc = random(2) + 0.2;

  void draw() {
    push();
    translate(x, y, z);
    rotateX(HALF_PI);
    fill(80);
    stroke(100);
    rect(0, 0, w, h);
    pop();

    z += zinc;
    if (400 < z) {
      z = -300;
      zinc = random(2) + 0.2;
    }
  }
}

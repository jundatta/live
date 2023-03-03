// こちらがオリジナルです。
// 【作者】Sayamaさん
// 【作品名】SeasonalSnowDome
// https://openprocessing.org/sketch/803047

PGraphics gra;
ArrayList<P> lists = new ArrayList();
float power = 0;
float pNum = 150;//パーティクルの数
boolean touching = false;
int size;

//画像
PImage maskImg;
PImage bgImg;
PImage partImg;
PImage[] partImgs = new PImage[4*4];
PImage bgColorImg;

//季節
float season = 0;//春 = 0,夏 = 1,秋　 = 2, 冬 = 3

void preload() {
  maskImg = loadImage("mask.png");//マスク画像●1000*1000px
  bgImg = loadImage("background.png");//背景画像●1000*1000px
  partImg = loadImage("particle.png");//パーティクル画像●1080*1080px 4*4
  
  int partW = partImg.width / 4;
  int partH = partImg.height / 4;
  for (int season = 0; season < 4; season++) {
    for (int index = 0; index < 4; index++) {
      PImage pImg = createImage(partW, partH, ARGB);
      for (int dy = 0; dy < partH; dy++) {
        for (int dx = 0; dx < partW; dx++) {
          int sx = index * partW + dx;
          int sy = season * partH + dy;
          color c = partImg.get(sx, sy);
          pImg.set(dx, dy, c);
        }
      }
      partImgs[season * 4 + index] = pImg;
    }
  }
  
  bgColorImg = loadImage("bgColor.png");//背景色指定画像●適当なサイズ 0-24時の背景の色を横方向のグラデーションで指定
}

void setup() {
  preload();
  size(1112, 834);
  size = floor(min(width, height)*0.9);
  gra = createGraphics(size, size);

  noStroke();
  imageMode(CENTER);
  rectMode(CENTER);

  for (float i = 0; i < pNum; i++) {
    P p = new P(size);
    lists.add(p);
  }
}

void draw() {
  //月を取得
  float m = month();
  //条件分岐で季節を設定●
  if (m >=3 && m <= 5) {
    season = 0;
  } else if (m >= 6 && m <= 8) {
    season = 1;
  } else if (m >= 9 && m <= 11) {
    season = 2;
  } else {
    season = 3;
  }
  //season = 0;//コメントアウトを外して任意の季節を指定●

  gra.beginDraw();
  gra.clear();
  background(0, 0, 0); //背景色(マスク画像と色を合わせる)●
  if (touching && power < 3) {
    power +=0.1;
  }

  partImg.loadPixels();
  for (int i = 0; i < lists.size(); i++) {
    lists.get(i).act();
  }
  partImg.updatePixels();
  gra.endDraw();

  //時間情報の整理
  float sec = second() ;
  float min = minute() + sec /60;//分（小数点以下も含）
  float ho = hour() + min/60;//時間（小数点以下も含）

  //空の色の設定
  color bgColor;
  bgColor = bgColorImg.get(int(ho/24.0f * bgColorImg.width), 10); //24時間で一周
  fill(bgColor);//空の色
  stroke(0);//境界線対策 マスク画像と色を合わせる●
  float x = floor(width/2.0f);
  float y = floor(height/2.0f);
  rect(x, y, size, size);//空
  image(bgImg, x, y, size, size);//　　背景画像
  image(gra, x, y);//パーティクル
  image(maskImg, x, y, size, size);//マスク
}

void mousePressed() {
  touching = true;
}

void mouseReleased() {
  touching = false;
  for (int i = 0; i < lists.size(); i++) {
    lists.get(i).jump(power);
  }
  power = 0;
}

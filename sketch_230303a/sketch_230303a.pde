// こちらがオリジナルです。
// 【作者】Sayamaさん
// 【作品名】SeasonalSnowDome
// https://openprocessing.org/sketch/803047

let gra;
let lists = [];
let power = 0;
let pNum = 150;//パーティクルの数
let touching = false;
let size;

//画像
let maskImg;
let bgImg;
let partImg;
let bgColorImg;

//季節
let season = 0;//春 = 0,夏 = 1,秋　 = 2, 冬 = 3

function preload() {
  maskImg = loadImage('./mask.png');//マスク画像●1000*1000px
  bgImg = loadImage('./background.png');//背景画像●1000*1000px
  partImg = loadImage('./particle.png');//パーティクル画像●1080*1080px 4*4
  bgColorImg = loadImage('./bgColor.png');//背景色指定画像●適当なサイズ 0-24時の背景の色を横方向のグラデーションで指定
}

function setup() {
  createCanvas(windowWidth, windowHeight);
  size = Math.floor(min(windowWidth, windowHeight)*0.9);
  gra = createGraphics(size, size);

  noStroke();
  imageMode(CENTER);
  rectMode(CENTER);

  for (let i = 0; i < pNum; i++) {
    p = new P();
    lists.push(p);
  }
}

function draw() {
  //月を取得
  let m = month();
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

  gra.clear();
  background(0, 0, 0); //背景色(マスク画像と色を合わせる)●
  if (touching && power < 3) {
    power +=0.1;
  }

  for (let i = 0; i < lists.length; i++) {
    lists[i].act();
  }

  //時間情報の整理
  let sec = second() ;
  let min = minute() + sec /60;//分（小数点以下も含）
  let ho = hour() + min/60;//時間（小数点以下も含）

  //空の色の設定
  let bgColor;
  bgColor = bgColorImg.get(ho/24 * bgColorImg.width, 10); //24時間で一周
  //bgColor = bgColorImg.get(sec/60 * bgColorImg.width,10); //このコメントアウトを外すと、1分で１周する●
  fill(bgColor);//空の色
  stroke(0);//境界線対策 マスク画像と色を合わせる●
  let x = Math.floor(width/2);
  let y = Math.floor(height/2);
  rect(x, y, size, size);//空
  image(bgImg, x, y, size, size);//　　背景画像
  image(gra, x, y);//パーティクル
  image(maskImg, x, y, size, size);//マスク
}



function touchStarted() {
  touching = true;
}

function touchEnded() {
  touching = false;
  for (let i = 0; i < lists.length; i++) {
    lists[i].jump(power);
  }
  power = 0;
}

//環境に　よってうごくかも。。？？
function deviceShaken() {
  for (let i = 0; i < lists.length; i++) {
    lists[i].jump(random(3));
  }
}

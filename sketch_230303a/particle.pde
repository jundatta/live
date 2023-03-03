//  パーティクルクラス
class P {
  float x, y, yA;
  float spinX, spinY;
  float rot;
  float size;
  float index;

  float xV, yV;
  float spinXV, spinYV;
  float rotV;

  P() {
    //ポジション
    this.x = random(gra.width);
    this.y = random(gra.height);
    this.yA = random(0.009);//加速度●

    //スピン
    this.spinX = random(360);
    this.spinY = random(360);

    //回転
    this.rot = random(360);
    this.setV(1);

    //サイズ
    this.size = size/50.0f+random(size/60.0f);//数字を変えると大きさが変わる●

    //画像インデックス
    this.index = floor(random(3.99));
  }

  //スピードをセット
  void setV(float s) {
    //ポジション
    this.xV = (random(1)-0.5)*s/2.0f;
    this.yV = (random(1)*-1 - 0.1)*s;
    //スピン
    this.spinXV = random(2) + 1;
    this.spinYV = random(2) + 1;
    //回転
    this.rotV = random(1) + 0.5;
  }


  void jump(float s) {
    this.y -= random(5)+0.5;
    this.setV(s);
  }

  //  描画
  void act() {
    //  各種パラメータ計算
    this.spinX += this.spinXV+ abs(this.yV);
    this.spinY += this.spinYV+ abs(this.yV);
    this.rot += this.rotV + abs(this.yV)*2;
    this.x += this.xV;
    this.yV += this.yA;
    this.y += this.yV;


    //  雪の描画
    gra.push();
    gra.translate(this.x, this.y);
    gra.scale(sin(radians(this.spinX)), sin(radians(this.spinY)));
    gra.rotate(radians(this.rot));
    //gra.image(partImg, 0, 0, this.size, this.size, this.index*partImg.width/4, season*partImg.height/4, partImg.width/4, partImg.height/4 );
    gra.image(partImg, 0, 0, this.size, this.size);
    gra.pop();

    if (this.x >= gra.width || this.x <= 0) {
      this.xV *= -1;
    }

    if (this.y <=0) {
      this.yV *= -0.5;
      this.y += 1;
    }

    if (this.y >= gra.height) {
      //  地面より下の場合は停止
      this.xV = 0;
      this.y = gra.height;
      this.yV = 0;
      this.rotV = 0;
      this.spinXV = 0;
      this.spinYV = 0;
    }
  }
}

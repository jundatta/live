// こちらがオリジナルです。
// 【作者】はぅ君さん
// 【作品名】午前0:14 2023年1月17日のツイート
// https://twitter.com/Hau_kun/status/1615004669029543941

int W, H;
void setup() {
  size(720, 720);
  W = width;
  H = height;
  background(255);
  strokeWeight(3);
  rectMode(CENTER);
  fill(0, 255, 0);  // 線を消してるところを見てみたいｗ
  for (int y=0; y<=H; y+=20) {
    for (int x=(y/20%2)*20; x<=W; x+=40) {
      noStroke();
      // (0|random(9))でfloor(random(9))なのかな。。。？
      //circle(x+cos(R=(0|random(9))*PI/2.0f)*20, y+sin(R)*20, 9);
      float R=(int)random(9)*PI/2.0f;
      circle(x+cos(R)*20, y+sin(R)*20, 9);
      stroke(255,0,0);
      line(x, y, x+cos(R)*33, y+sin(R)*33);
      rect(x, y, R>9?9:13, R>9?9:13, R);
    }
  }
}

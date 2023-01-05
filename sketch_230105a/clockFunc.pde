class TimeStr {
  String preStr;
  String h;
  String m;
  String postStr;
  void setTimeString(String preStr, String h, String m, String postStr) {
    this.preStr = preStr;
    this.h = h;
    this.m = m;
    this.postStr = postStr;
  }
  TimeStr(String preStr, int h, String m, String postStr) {
    String hStr = str(h);
    if (h < 10) {
      hStr = "0" + hStr;
    }
    setTimeString(preStr, hStr, m, postStr);
  }
  TimeStr(String preStr, int h, int m, String postStr) {
    String hStr = str(h);
    if (h < 10) {
      hStr = "0" + hStr;
    }
    String mStr = str(m);
    if (m < 10) {
      mStr = "0" + mStr;
    }
    setTimeString(preStr, hStr, mStr, postStr);
  }
}

//時刻の前に入る言葉●
String[]  preTimeStr = {"たぶん", "だいたい", "およそ"};

//時刻のあとに入る言葉　　現在時刻の前後で変化する文言は配列の中に配列を入れる●
String[][] postTimeStr = {{"あたり"}, {"くらい"}, {"らへん"}, {"ちょっとまえ", "ちょっとすぎ"}, {"ちょいまえ", "ちょいすぎ"}};

//分を省略した時刻のあとに入る言葉 [0] > 0-14分、[1] > 15-29分、[2] > 30-44分、[3] > 45-59分（時間が+1表記に）●
String[][] postQuarterTimeStr = {{"すぎ", "ごろ", "ちょっとすぎ"}, {"ちょっとまえ", "くらい"}, {"すぎ", "ごろ"}, {"ちょいまえ", "まえ", "ちょっとまえ"}};

//時刻の前に入る言葉を使用する
int deletePreTimeStr = 0;//0 : 使う、1 : 使わない

//時刻文字列の配列生成
TimeStr getTimeArray() {
  int step = 5;
  int ho = hour();
  int mi = minute();
  float r = random(1);
  TimeStr out;
  //乱数から２つのメソッドどちらかを使用●
  if (r < 0.5)out = gerRoughTime(step, ho, mi);
  else out = getRoughTimeQuarter(ho, mi);
  return out;
}


//配列生成（分あり）
TimeStr gerRoughTime(int step, int ho, int mi) {
  //getime
  int h = ho;
  int minShift = floor(step/2);
  int m = mi + minShift;
  boolean mae = false;
  if (m%step <= minShift) mae = true;
  m -= m%step;
  if (m >= 60) {
    m = m%60;
    h = (h+1)%24;
  }

  String preStr = preTimeStr[floor(random(preTimeStr.length))];
  String[] postArray = postTimeStr[floor(random(postTimeStr.length))];
  String postStr = postArray[0];
  if (1 < postArray.length) {
    if (!mae)postStr = postArray[1];
  }
  TimeStr out = new TimeStr(preStr, h, m, postStr);
  return out;
}

//配列生成（分なし）
TimeStr getRoughTimeQuarter(int ho, int mi) {
  String preStr = preTimeStr[floor(random(preTimeStr.length))];
  int index = floor(mi/15);
  if (index == 3) ho = (ho+1)%24;
  String postStr = postQuarterTimeStr[index][floor(random(postQuarterTimeStr[index].length))];

  TimeStr out;
  if (index == 0 || index == 3) {
    out = new TimeStr(preStr, ho, "ジ", postStr);
  } else {
    out = new TimeStr(preStr, ho, "ハン", postStr);
  }
  return out;
}

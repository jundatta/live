//時刻の前に入る言葉●
let  preTimeStr = ['たぶん', 'だいたい', 'およそ'];

//時刻のあとに入る言葉　　現在時刻の前後で変化する文言は配列の中に配列を入れる●
let postTimeStr = ['あたり', 'くらい', 'らへん', ['ちょっとまえ', 'ちょっとすぎ'], ['ちょいまえ', 'ちょいすぎ']];

//分を省略した時刻のあとに入る言葉 [0] > 0-14分、[1] > 15-29分、[2] > 30-44分、[3] > 45-59分（時間が+1表記に）●
let postQuarterTimeStr = [['すぎ', 'ごろ', 'ちょっとすぎ'], ['ちょっとまえ', 'くらい'], ['すぎ', 'ごろ'], ['ちょいまえ', 'まえ', 'ちょっとまえ']];

//時刻の前に入る言葉を使用する
let deletePreTimeStr = 0;//0 : 使う、1 : 使わない

//時刻文字列の配列生成
function getTimeArray(step = 5, ho = hour(), mi = minute()) {
  let r = random();
  let out;
  //乱数から２つのメソッドどちらかを使用●
  if (r < 0.5)out = gerRoughTime(step, ho, mi);
  else out = getRoughTimeQuarter(ho, mi);
  return out;
}


//配列生成（分あり）
function gerRoughTime(step = 5, ho = hour(), mi = minute()) {
  //getime
  let h = ho;
  let minShift = Math.floor(step/2);
  let m = mi + minShift;
  let mae = false;
  if (m%step <= minShift) mae = true;
  m -= m%step;
  if (m >= 60) {
    m = m%60;
    h = (h+1)%24;
  }

  if (m < 10) m = '0' + m;
  if (h < 10) h = '0' + h;
  let preStr = preTimeStr[Math.floor(random(preTimeStr.length))];
  let postStr = postTimeStr[Math.floor(random(postTimeStr.length))];
  if (Array.isArray(postStr) == true) {
    if (mae)postStr = postStr[0];
    else postStr = postStr[1];
  }
  let out = [preStr, h, m, postStr];
  return out;
}

//配列生成（分なし）
function getRoughTimeQuarter(ho = hour(), mi = minute()) {
  let preStr = preTimeStr[Math.floor(random(preTimeStr.length))];
  let index = Math.floor(mi/15);
  if (index == 3) ho = (ho+1)%24;
  let postStr = postQuarterTimeStr[index][Math.floor(random(postQuarterTimeStr[index].length))];
  if (ho < 10)ho = '0' + ho;

  let out
    if (index == 0 || index == 3) {
    out = [preStr, ho, 'ジ', postStr];
  } else {
    out = [preStr, ho, 'ハン', postStr];
  }
  return out;
}

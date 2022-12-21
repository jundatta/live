// こちらがオリジナルです。
// 【作者】Kyle Stewartさん
// 【作品名】Clock
// https://openprocessing.org/sketch/1361228

function setup() {
  createCanvas(windowWidth, windowHeight);
  background(100);
  angleMode(DEGREES);
  textAlign(CENTER, CENTER);
  textSize(32);
}

function draw() {
  let x = width / 2,
    y = height / 2;
  let r = min(x, y);

  let weight = 5;
  strokeWeight(weight);
  r -= weight/2;

  let r_m = r * 2 / 3;
  let r_h = r * 1 / 3;
  let r_num = r * 4/5;
  let r_inner = r * 19/20;

  let numerals = ['I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X', 'XI', 'XII']

    const d = new Date();
  let hour = d.getHours();
  let minute = d.getMinutes();
  let second = d.getSeconds();
  let millis = d.getMilliseconds();

  let hourAngle = map(hour + minute/60, 0, 12, -90, 270);
  let minuteAngle = map(minute + second/60, 0, 60, -90, 270);
  let secondAngle = map(second + millis/1000, 0, 60, -90, 270);

  circle(x, y, 2 * r);
  line(x, y, x + r_h * cos(hourAngle), y + r_h * sin(hourAngle));
  line(x, y, x + r_m * cos(minuteAngle), y + r_m * sin(minuteAngle));

  strokeWeight(1);
  line(x, y, x + r_m * cos(secondAngle), y + r_m * sin(secondAngle));

  for (let i = 1; i <= 60; i++) {
    let angle = map(i, 0, 60, -90, 270);

    if (i % 5 == 0) {
      let idx = i / 5 - 1;
      text(numerals[idx], x + r_num * cos(angle), y + r_num * sin(angle));
      strokeWeight(5);
    } else strokeWeight(1);
    line( x + r_inner * cos(angle), y + r_inner * sin(angle), x + r * cos(angle), y + r * sin(angle));
  }
}

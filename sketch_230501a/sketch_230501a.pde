// こちらがオリジナルです。
// 【作者】kari_najさん
// 【作品名】期末
// https://openprocessing.org/sketch/1830303

void setup() {
  size(1120, 678);// middle xaxis- 560 yaxis- 339
  background(31, 31, 39, 255);
  noStroke();

  //gradient SKY
  var Q = 560;
  var Q2 = 510;

  fill(35, 38, 46, 225);
  ellipse(Q, Q2, 1300, 1300);
  fill(195, 200, 203, 40);
  ellipse(Q, Q2, 1120, 1120);
  fill(229, 229, 217, 40);
  ellipse(Q, Q2, 800, 800);
  fill(244, 235, 204, 40);
  ellipse(Q, Q2, 500, 500);

  fill(252, 242, 189, 40);
  ellipse(384, 404, 60, 60);//月
  var w = 15;
  fill(255, 255, 255, 255);
  ellipse(384, 404, w, w);//月

  //ほし
  for ( var i = 0; i<150; i++) {
    stroke(255);
    strokeWeight(2);
    point(random(-5, 1120), random(-5, 510));
  }

  //////////////////////////

  noStroke();
  //left cloud
  var T = random(0, 300);
  var U = random(300, 510);

  fill(64, 67, 60, 150);//雲
  rect(T, U, 150, 200);

  var T2 = random(0, 300);
  var U2 = random(300, 510);
  //雲
  rect(T2, U2, 150, 200);

  var T3 = random(0, 300);
  var U3 = random(300, 510);

  rect(T3, U3, 150, 200);

  var T4 = random(0, 300);
  var U4= random(300, 510);

  rect(T4, U4, 150, 200);

  var T5 = random(0, 300);
  var U5 = random(300, 510);//雲

  rect(T5, U5, 150, 200);
  var T6 = random(0, 300);
  var U6 = random(300, 510);

  rect(T6, U6, 150, 200);

  var T7 = random(0, 300);
  var U7 = random(300, 510);

  rect(T7, U7, 150, 200);

  ////////////////////////////////////////

  //right cloud

  var R = random(600, 1120);
  var S = random(300, 510);

  fill(64, 67, 60, 150);
  rect(R, S, 150, 200);

  var R2 = random(600, 1120);
  var S2 = random(300, 510);


  rect(R2, S2, 150, 200);

  var R3 = random(600, 1120);
  var S3 = random(300, 510);

  rect(R3, S3, 150, 200);

  rect(T4, U4, 150, 200);

  var R5 = random(600, 1120);
  var S5 = random(300, 510);

  rect(R5, S5, 150, 200);

  rect(T6, U6, 150, 200);

  var R7 = random(600, 1120);
  var S7 = random(200, 540);

  rect(R7, S7, 150, 200);

  ////////////////////////////////////

  //top left clouds
  var I = random(170, 400);
  var V = random(13, 200);

  rect(I, V, 70, 50);
  rect(I+30, V+30, 70, 50);
  rect(I+100, V+50, 70, 50);

  var I4 = random(170, 400);
  var V4 = random(13, 200);
  rect(I4, V4, 70, 50);

  ///////////////////////////////////
  //top right clouds
  var C = random(600, 1000);
  var D = random(13, 200);

  rect(C, D, 70, 50);
  rect(C+50, D+20, 70, 50);
  rect(C+70, D+100, 70, 50);

  rect(I4, V4, 70, 50);

  fill(36, 45, 52, 255);//海
  rect(0, 510, 1120, 226);//海
}

float K = 0;
void draw() {
  var X= 112;
  var Y= 113;

  ////////////////////////////////////////////////
  //BACKGROUND

  noStroke();
  //建物
  noStroke();
  fill(25, 34, 40, 255);
  rect(K, 510, random(-3, -15), random(-3, -17));
  K = K + random(3, 13);

  ////////////////////////////////////////////////

  //小さい船

  //小さい船 1
  noStroke();
  fill(25, 34, 40, 255);
  triangle(459, 570, 444, 555, 474, 555);// back
  rect(444, 555, 30, -7);
  //side bottom
  quad(459, 570, 444, 555, 424, 555, 427, 558);
  //side top
  rect(424, 555, 20, -7);

  rect(444, 548, 15, -4);//guy sitting in the boat

  rect(449, 544, 7, -5);

  //小さい 船 2
  strokeWeight(4);
  stroke(25, 34, 40, 255);
  line(80, 530, 80, 360);//v poll
  noStroke();
  triangle(56, 460, 79, 450, 79, 530);// sail
  strokeWeight(1);
  stroke(25, 34, 40, 255);
  line(56, 460, 80, 450);//sail poll
  noStroke();
  quad(35, 5*113-30, 85, 5*113-30, 65, 5*113-50, 20, 5*113-50);//back
  fill(25, 34, 40, 255);
  quad(85, 5*113-30, 65, 5*113-50, 100, 530, 100, 5*113-30);// side

  //small boat 3
  fill(25, 34, 40, 255);
  quad(1028, 576, 988, 566, 1038, 566, 1110, 576);//inside
  strokeWeight(4);
  stroke(25, 34, 40, 255);
  line(1068, 576, 1068, 379);//poll
  noStroke();
  fill(25, 34, 40, 255);
  quad(1070, 409, 1070, 571, 1100, 546, 1090, 400);
  triangle(1070, 379, 1070, 561, 1080, 566);//sail
  rect(1038, 566, 15, 10);//guy sitting in the boat
  rect(1043, 562, 5, 4);

  noStroke();
  quad(1008, 596, 1090, 596, 1110, 576, 1028, 576);
  triangle(1110, 576, 1028, 576, 1080, 566);//back
  quad(1028, 576, 1008, 596, 988, 576, 988, 566);//side

  //back boat
  strokeWeight(2);
  stroke(25, 34, 40, 255);
  line(298, 510, 330, 490);
  noStroke();
  fill(25, 34, 40, 255);
  quad(100, 515, 300, 508, 270, 540, 130, 540);//side boat
  triangle(320, 500, 204, 367, 170, 520);//sail

  //////////////////////////

  ///BOAT 2

  //back sail
  fill(25, 34, 40, 255);
  arc(172, 430, 150, 90, radians(9), radians(183));//bottom sail
  arc(177, 370, 130, 120, radians(7), radians(183));//middle sail
  arc(170, 302, 70, 67, radians(0), radians(180));//top

  //  backpoll
  strokeWeight(4);
  stroke(25, 34, 40, 255);
  line(168, 226, 168, 510);// 　v-poll
  line(100+20, 302, 182+20, 302);// short h-poll
  line(70+20, 374, 234+20, 346+30);//  中　h-poll
  line(X-40, Y*4-30, X*2+56, Y*4-10);//long poll

  //sail
  noStroke();
  fill(25, 34, 40, 255);
  arc(145, 275, 74, 80, radians(355), radians(170));//top sail
  arc(150, 351, 120, 140, radians(355), radians(175));//middle sail


  //front poll
  strokeWeight(4);
  stroke(25, 34, 40, 255);
  line(148, 163, 148, 510);//the longest v-poll#2
  line(100, 282, 182, 272);// short h-poll
  line(70, 360, 234, 343);//  中　h-poll
  line(56, 414, 264, 397);//長い　h-poll
  strokeWeight(2);
  stroke(25, 34, 40, 255);
  line(147, 440, 128, 370);

  noStroke();
  fill(25, 34, 40, 255);
  triangle(147, 440, 128, 370, 147, 480);//sail in the back


  //boat
  noStroke();
  fill(25, 34, 40, 255);
  rect(100, 510, 90, 30);
  quad(100, 540, 190, 540, 210, 560, 120, 560);//back of the boat2
  rect(170, 510, 40, 30);
  quad(170, 540, 210, 540, 210, 560, 190, 560);//side of boat2

  //lights
  fill(252, 242, 189);
  quad(120, 520, 120, 530, 125, 530, 125, 520);
  quad(130, 520, 130, 530, 135, 530, 135, 520);
  quad(140, 520, 140, 530, 145, 530, 145, 520);

  ////////////////////////////

  //BOAT 1
  //poll behind

  strokeWeight(4);
  stroke(25, 34, 40, 255);
  line(714, 477, 724, 87-10);//　v-poll
  line(556, 374-10, 808, 400-10);//longest h
  line(628, 251-10, 794, 267-10);//中 h-poll
  line(648, 188-5, 755, 193-5);//middle top h-poll

  //sail behind

  noStroke();
  fill(25, 34, 40, 255);
  quad(624, 377-5, 642, 469-5, 786, 469-5, 795, 395-5);//bottom sail
  quad(602, 373-5, 715, 370-5, 715, 256-5, 640, 248-5);//bottom middle sail left
  quad(715, 370-5, 715, 256-5, 774, 262-5, 798, 394-5);//middle sail right
  quad(777, 259-5, 715, 246-5, 715, 192-5, 747, 193-5);//bottom middle sail right
  quad(715, 246-5, 715, 192-5, 653, 188-5, 635, 245-5);//middle sail right
  quad(653, 188-5, 714, 186-5, 714, 145-5, 680, 142-5);//top sail left
  quad(714, 186-5, 714, 145-5, 744, 148-5, 750, 193-5);//sail right


  //boat #1 poll

  strokeWeight(4);
  stroke(25, 34, 40, 255);
  line(754, 472, 754, 82);//　v-poll
  line(606, 369, 848, 395);//longest h
  line(668, 246, 834, 262);//中 h-poll
  line(688, 188, 795, 193);//middle top h-poll

  var Z = 628+826-682+30;

  //boat 1 SAIL
  noStroke();
  fill(25, 34, 40, 255);
  quad(664, 377, 682, 469, 826, 469, 835, 395);//bottom sail

  quad(642, 373, 755, 370, 755, 256, 680, 248);//bottom middle sail left
  quad(755, 370, 755, 256, 814, 262, 838, 394);//middle sail right

  quad(817, 259, 755, 246, 755, 192, 787, 193);//bottom middle sail right
  quad(755, 246, 755, 192, 693, 188, 675, 245);//middle sail right

  quad(693, 188, 754, 186, 754, 145, 720, 142);//top sail left
  quad(754, 186, 754, 145, 784, 148, 790, 193);//sail right

  triangle(Z, 457-80, Z-30, 457, 755, 256);

  //boat
  noStroke();
  fill(25, 34, 40, 255);
  quad(672, 550, 682, 472, 630, 472, 640, 550);//side

  quad(784, 550, 672, 550, 682, 472, 826, 472);//back of boat1
  triangle(682, 472, 826, 472, 628+826-682, 457);
  stroke(25, 34, 40, 255);
  strokeWeight(3);
  line(Z-30, 457, Z, 457-80);


  //lights
  fill(252, 242, 189);
  noStroke();
  quad(780, 515, 775, 515, 780, 490, 785, 490);
  quad(768, 515, 762, 515, 767, 490, 773, 490);
  ellipse(658, 500, 5, 15);
  ellipse(668, 500, 5, 15);
}

// こちらがオリジナルです。
// 【作者】Richard Bourneさん
// 【作品名】Candles
// https://openprocessing.org/sketch/1777807

float lightA;
float lightB;
float lightC;
float lightD;

void setup() {
  size (700, 700);
  lightA = 0;
  lightB = 0;
  lightC = 0;
  lightD = 0;
}

void draw() {
  background(0, 0, 0);
  translate(0, -270);
  scale(1.9);
  noStroke();
  rectMode(CORNERS);
  ellipseMode(RADIUS);
  smooth(4);
  translate(-5, 0);

  ////////////////////////////////////////////*left*/
  translate(0, -5);
  fill(200, 80, 38, 30);  /*bot glow*/
  ellipse(98, 251, 55, 55);
  translate(0, 5);

  fill(255, 113, 13);  /*base*/

  rect(40, 280, 160, 500);
  fill(158, 45, 3, 70);
  quad(40, 280, 80, 280, 130, 500, 40, 500);
  quad(40, 310, 60, 310, 120, 500, 40, 500);
  fill(255, 173, 55, 70);
  quad(160, 280, 100, 280, 130, 400, 160, 400);

  fill(230, 92, 9);  /*bronze*/
  ellipse(100, 278, 60, 15);

  fill(255, 167, 73, 120); /*90*/
  ellipse(100, 275, 55, 12);

  fill(255, 216, 61, 150); /*70*/
  ellipse(100, 272, 48, 7);

  fill(253, 229, 77, 150); /*50*/
  ellipse(100, 270, 25, 4);

  /*line*/
  strokeWeight(3);
  stroke(89, 36, 27); /*black red*/
  line(98, 265, 98, 270);

  noStroke(); /*reflection*/
  fill(252, 255, 59, 100);
  ellipse(lightB+130, lightB+305, 1.75, 10);
  ellipse(lightB+130, lightB+330, 1.2, 5);

  /*------------------LIGHT*/
  translate(0, -5);
  fill(200, 80, 38, 50);  /*bot glow*/
  ellipse(98, 251, 35, 35);
  fill(255, 125, 80, 80);  /*bot glow top*/
  ellipse(98, 251, 25, 25);

  fill(224, 148, 0, 140); /*mid glow*/
  ellipse(lightC+98, 251, 12, 15);

  fill(255, 237, 151, 200); /*main*/
  ellipse(98, lightA+251, 7, 20);
  fill(255, 255, 218, 140); /*mainsmall*/
  ellipse(98, lightA+254, 2, 10);

  fill(251, 243, 228, 80); /*top red*/
  ellipse(lightB+98, 251, 18, 17);
  translate(0, +5);

  fill(252, 255, 212, 180);   /*le moving shinez*/
  ellipse(lightB+101, 278, 11, 3);
  /*------------------ END LIGHT*/

  /////////////////////////////////////////////*right*/
  noStroke();
  fill(200, 80, 38, 30);  /*bot glow*/
  ellipse(270, 205, 60, 60);

  fill(216, 92, 0); /*base*/
  rect(204, 240, 336, 500);
  fill(158, 45, 3, 70); /*shadowz*/
  quad(336, 240, 300, 240, 280, 500, 336, 500);
  quad(336, 280, 320, 280, 300, 500, 336, 500);
  fill(255, 152, 28, 90); /*highlight*/
  quad(204, 240, 260, 240, 240, 400, 204, 400);

  fill(216, 92, 0);
  ellipse(270, 240, 66, 17);
  fill(158, 45, 3, 70);/*shadbronze*/
  ellipse(270, 241, 65, 16);

  fill(255, 175, 73, 120); /*90*/
  ellipse(270, 235, 59, 11);
  fill(255, 217, 61, 150); /*70*/
  ellipse(270, 233, 50, 8);
  fill(253, 230, 77, 150); /*50*/
  ellipse(270, 230, 28, 5);

  /*line*/
  strokeWeight(3);
  stroke(89, 36, 27); /*black red*/
  line(270, 225, 270, 230);

  noStroke(); /*reflection*/
  fill(252, 255, 164, 80);
  ellipse(lightC+215, lightC+270, 1.55, 10);
  ellipse(lightB+230, lightB+303, 1.75, 14);

  fill(252, 255, 212, 180);   /*le moving shinez*/
  ellipse(lightB+270, 240, 12, 3);

  /*------------------LIGHT*/
  noStroke();
  fill(200, 80, 38, 50);  /*bot glow*/
  ellipse(270, 205, 35, 35);
  fill(255, 125, 80, 80);  /*bot glow top*/
  ellipse(270, 205, 25, 25);

  fill(224, 148, 0, 140);  /*mid glow*/
  ellipse(lightB+270, 205, 12, 16);

  fill(255, 237, 151, 200); /*main*/
  ellipse(270, lightA+203, 7, 23);
  fill(255, 255, 218, 140); /*mainsmall*/
  ellipse(270, lightA+206, 2, 13);
  fill(251, 243, 228, 80); /*top red*/
  ellipse(lightC+270, 205, 18, 17);
  /*------------------ END LIGHT*/

  //////////////////////////////////////////////*middle*/
  fill(255, 132, 0); /*base*/
  rect(140, 340, 260, 500);
  fill(158, 45, 3, 40); /*shadowz*/
  rect(140, 340, 260, 500);
  rect(140, 365, 260, 500);
  rect(140, 385, 260, 500);
  fill(255, 132, 0); /*base*/
  ellipse(200, 340, 60, 14);

  fill(255, 152, 5, 180);
  ellipse(201, 337, 55, 12);

  fill(255, 216, 61, 150); /*70*/
  ellipse(198, 335, 45, 7);
  fill(253, 229, 77, 150); /*50*/
  ellipse(198, 335, 25, 4);
  strokeWeight(3);
  stroke(89, 36, 27); /*black red*/
  line(198, 331, 198, 336);

  /*------------------LIGHT*/

  noStroke();
  fill(200, 80, 38, 50);  /*bot glow*/
  ellipse(198, 312, 35, 35);
  fill(255, 125, 80, 80);  /*bot glow top*/
  ellipse(198, 312, 25, 25);

  fill(224, 148, 0, 170);  /*mid yellow*/
  ellipse(lightB+198, 312, 12, 17);
  fill(255, 237, 151, 200); /*main*/
  ellipse(198, lightA+312, 7, 20);
  fill(255, 255, 218, 140); /*mainsmall*/
  ellipse(198, lightA+315, 2, 13);
  fill(251, 243, 228, 80); /*top red*/
  ellipse(lightC+198, 312, 18, 17);

  noStroke();
  fill(252, 255, 212, 180);   /*le moving shinez*/
  ellipse(lightB+198, 346, 10, 2);
  /*------------------ END LIGHT*/

  fill(0, 0, 0, 50);
  rect(40, 400, 350, 500);
  fill(0, 0, 0, 100);
  rect(40, 430, 350, 500);
  rect(40, 460, 350, 500);
  rect(40, 480, 350, 500);

  lightA = lightA + random(-0.07, 0.07);
  lightB = lightB + random(-0.2, 0.2);
  lightC = lightC + random(-0.2, 0.2);
  lightD = lightD + random(-0.15, 0.15);
}

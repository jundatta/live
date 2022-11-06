// こちらがオリジナルです。
// 【作者】はぅ君さん
// 【作品名】GenerativeScene(Experimental v2)
// https://openprocessing.org/sketch/1726300

float l = 0;
void setup() {
  size(1920, 1080);
  fill(40, 40, 80);
  rect(0, 0, width, height);

  println("CTEX始まり");
  var CTEX = createTex(width, height /2);
  CTEX.beginDraw();
  println("drawCelestial(CTEX)始まり");
  drawCelestial(CTEX);
  println("drawCelestial(CTEX)終わり");
  CTEX.endDraw();
  image(CTEX, 0, 0);
  println("CTEX終わり");

  println("MTEX始まり");
  var MTEX = createTex(width, height / 2);
  MTEX.beginDraw();
  drawMountain(MTEX);
  MTEX.endDraw();
  //image(MTEX, 0, 0);
  println("MTEX終わり");

  println("PTEX始まり");
  var PTEX = createTex(width, height/2);
  PTEX.beginDraw();
  //drawPond(PTEX);
  PTEX.endDraw();
  //image(PTEX, 0, height/2);
  println("PTEX終わり");

  println("TTEX始まり");
  var TTEX = createTex(width, height);
  TTEX.beginDraw();
  //drawTree(TTEX);
  TTEX.endDraw();
  //image(TTEX, 0, 0);
  println("TTEX終わり");

  print(millis());
}

void drawPond(PGraphics target) {
  target.push();
  target.background(240, 50, 0);
  target.blendMode(ADD);
  for (var z=4; z>1.0; z-=.1) {
    var M=1/pow(3, z-1);
    target.fill(180+random(60), 50-l/2.0f, 30-l/2.0f, .08);
    target.beginShape();
    target.curveVertex(0, 0);
    target.curveVertex(0, 0);
    for (var x=0; x<width+100; x+=200) {
      target.curveVertex(x, noise(x/1000.0f, M)*M*50*height/10*1.5);
    }
    target.vertex(width, 0);
    target.vertex(width, 0);
    target.endShape();

    for (var i=1; i<5; i+=.1) {
      target.fill(180+random(60), 50-l/2.0f, 30-l/2.0f, .1);
      target.ellipse(random(width), height*M+random(100)*M, 1000*M*i/5.0f, 50*M*i/5.0f);
    }
  }
  target.pop();
}

void drawTree(PGraphics target) {
  target.push();
  for (var x=0; x<width; x+=1) {
    target.fill(60+random(120), 50, random(5));
    var Y=noise(x/10.0f)*20;
    target.rect(x, height/2.0f-Y-20+2, 1, 20+Y);
  }

  target.fill(240, 50, 0);
  target.rect(0, height/2, width, 30);

  for (l=0; l<6; l++) {
    for (var z=4; z>1.0; z-=.1) {
      var Z=6-z;
      var M=1/pow(3, z-1);

      for (var x=0; x<width; x+=max(1*Z/3.0f, 2)) {
        var N=noise(x/100.0f, M*5);
        var Y=height/2 + M * height / 2 + noise(x)*100*M + 10;
        switch((int)l) {
        case 0:  //  island
          if (N>(.2+Z*.1)) {
            target.blendMode(BLEND);
            target.fill(240, 50, 0);
            target.beginShape();
            for (var r=0; r<TAU+1; r+=1) {
              var d=noise(x, z, r)*2;
              var iX=x+cos(r)*M*200*d;
              var iY=Y+sin(r)*M*150*d;
              target.curveVertex(iX, iY);
            }
            target.endShape();

            target.fill(240, 50, 0, .2);
            target.beginShape();
            for (var r=0; r<TAU+1; r+=1) {
              var d=noise(x, z, r)*2*1.1;
              var iX=x+cos(r)*M*200*d;
              var iY=Y+sin(r)*M*150*d;
              target.curveVertex(iX, iY+50*M);
            }
            target.endShape();
          }
          break;
        case 1:  //  island foreground
          if (N>(.2+Z*.1)) {
            target.blendMode(BLEND);
            target.fill(60, 50, 10, .2-z/20.0f);
            target. beginShape();
            for (var r=0; r<TAU+1; r+=1) {
              var d=noise(x, z, r)*1.5;
              var iX=x+cos(r)*M*200*d;
              var iY=Y+sin(r)*M*150*d;
              target.curveVertex(iX, iY);
            }
            target.endShape();
          }
          break;
        case 2:  //  plant
          if (N>(.2+Z*.1)  && ((z<2.5) || (N%.02>.01))) {
            target.blendMode(BLEND);
            for (var i=0; i<5+Z; i++) {
              target.fill(60+random(120), 50, 70, .15);
              target.push();
              target.translate(x, Y);
              var R=noise(x, z, i)*PI;
              target.rotate(R+PI);
              var oX = (random(1)-.5) * Z * 10;
              var oY = (random(1)-.5) * Z * 10;
              target.ellipse(M*100*noise(x, z, i)+oX, oY, M*100*noise(x, z, i), M*5);
              if (random(1)>.95) {
                target.fill(random(360), 50, 50, .5);
                target.circle(M*140*noise(x, z, i), 0, M*10);
              }
              target.pop();
            }
          }
          break;
        case 3:  //  branch
          if (N>(.3+Z*.1)) {
            if ((z>=3)) {
              target.push();
              target.blendMode(BLEND);
              target.fill(30, 80, random(10)+5);
              var H=M*3000*noise(x, z);
              target.ellipse(x, Y-H/2, M*30, H);
              target.push();
              target.translate(x, Y-H/4*3);
              target.rotate(random(PI/4.0f)-PI/8.0f);
              target.ellipse(0, 0, M*5, H/2.0f);
              target.pop();
              target.push();
              target.translate(x, Y-H/5*4);
              target.rotate(random(PI/4)-PI/8.0f);
              target.ellipse(0, 0, M*5, H/2.0f);
              target.pop();
              target.pop();
            } else {
              target.blendMode(BLEND);
              for (var i=0; i<3; i++) {
                target.fill(30, 80, random(10)+15, .5);
                target.push();
                target.translate(x, Y);
                var R=noise(x, z, i)*PI;
                target.rotate(R+PI);
                target.ellipse(M*100*noise(x, z, i), 0, M*100*noise(x, z, i), M*5);
                if (random(1)>.9) {
                  target.fill(random(360), 50, 50, .5);
                  target.circle(M*150*noise(x, z, i), 0, M*10);
                }
                target.pop();
              }
            }
          }
          break;
        case 4:  //  base leaf
          if (N>(.3+Z*.1) && (z>=3) && (N%.1>.00)) {
            target.blendMode(BLEND);
            target.fill(60+random(120), 50, random(9)+10);
            target.beginShape();
            for (var r=0; r<TAU; r+=(.5-M*1)) {
              var d=noise(x, r*100)*(M*100);
              target.vertex(x+cos(r)*d*2, Y+sin(r)*d*5-M*3000*noise(x, z));
            }
            target.endShape();
          }
          break;
        }
      }
    }
  }
  target.pop();
}

void drawMountain(PGraphics target) {
  target.push();
  for (var j=0; j<3; j++) {
    for (var i=10; i>0; i--) {
      target.fill(j*30+60+random(60), 60-i*5, j*3+i, i/10.0f);
      target.beginShape();
      target.vertex(0, height);
      target.vertex(0, height);
      for (var x=0; x<width+100; x+=20) {
        target.curveVertex(x, height-pow(noise(x/(float)(400+j*100), j), (j+4))*(1000-j*50)*pow((i/10.0f), 2)+50);
      }
      target.vertex(width, height);
      target.vertex(width, height);
      target.endShape();
    }
  }
  target.pop();
}

void drawCelestial(PGraphics target) {
  println("drawSky(target)始まり");
  drawSky(target);
  println("drawSky(target)終わり");
  println("drawStar(target)始まり");
  //drawStar(target);
  println("drawStar(target)終わり");
  println("drawMoon(target)始まり");
  //  drawMoon(target);
  println("drawMoon(target)終わり");
}

void drawStar(PGraphics target) {
  target.push();
  target.blendMode(ADD);
  for (var i=0; i<100; i++) {
    var X = random(width);
    var Y = random(height - 100);

    //  shine
    var S = random(10)+10;
    target.fill(random(360), 20, 100, .5);
    target.ellipse(X, Y, S, S/4.0f);
    target.ellipse(X, Y, S/4.0f, S);

    //  star
    target.fill(random(360), 20, 100, .5);
    target.circle(X, Y, 3);
  }

  //  shooting star
  var X = random(width);
  var Y = random(height - 200);
  for (var i=0; i<10; i++) {
    target.push();
    var R=-PI/8-random(PI/16.0f);
    target.translate(X, Y);
    target.rotate(R);
    target.fill(random(360), 20, 20, i/20.0f);
    target.ellipse(i*10, 0, i*20, i);
    target.pop();
  }
  target.pop();
}

void drawMoon(PGraphics target) {
  target.push();
  var X=random(width/2)+width/4;
  var Y=height/2;

  //  backlight
  target.push();
  target.blendMode(ADD);
  for (var i=0; i<5; i++) {
    target.fill(180+random(60), 30, 10, .5-i/20.0f);
    target.beginShape();
    for (var r=0; r<TAU+1; r+=.5) {
      var d = i*20 + 200+random(10);
      target.curveVertex(X+cos(r)*d, Y+sin(r)*d);
    }
    target.endShape();
  }
  target.pop();

  //  fullmoon
  //target.fill(60, 20, 100);
  //target.circle(X, Y, 400);
  //drawingContext.clip();

  //  crater
  for (var i=0; i<100; i++) {
    target.fill(6, 10, 30, .03);
    target.beginShape();
    var mX=X-200+random(400);
    var mY=Y-200+random(400);
    var offsetR=random(TAU);
    for (var r=0; r<TAU; r+=.1) {
      var D=pow(noise(r, i), 2)*10*i*sin(r+offsetR);
      target.vertex(mX+cos(r)*D, mY+sin(r)*D);
    }
    target.endShape();
  }
  target.pop();
}

void drawSky(PGraphics target) {
  target.push();
  target.background(240, 50, 0);
  target.blendMode(ADD);
  for (l=0; l<20; l++) {
    target.fill(180+random(60), 50-l, 30-l, .15);
    target.beginShape();
    target.curveVertex(0, target.height);
    target.curveVertex(0, target.height);
    for (var x=0; x<target.width+100; x+=200) {
      target.curveVertex(x, target.height-noise(x/1000.0f, l)*l*target.height/10.0f);
    }
    target.vertex(target.width, target.height);
    target.vertex(target.width, target.height);
    target.endShape();
  }
  target.pop();
}

PGraphics createTex(int w, int h) {
  var TEX = createGraphics(w, h);
  TEX.beginDraw();
  TEX.colorMode(HSB, 360, 100, 100, 1.0f);
  TEX.noStroke();
  TEX.endDraw();
  return TEX;
}

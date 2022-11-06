// こちらがオリジナルです。
// 【作者】はぅ君さん
// 【作品名】GenerativeScene(Experimental)
// https://openprocessing.org/sketch/1725831

function setup() {
  createCanvas(1920, 1080);
  //randomSeed(42)
  //noiseSeed(42)
  //scale(0.4,0.4)
  rect(0, 0, 1920, 1080)

    CTEX=createGraphics(width, height / 2)
    drawCelestial(CTEX);
  image(CTEX, 0, 0)

    BTEX=createGraphics(width, height / 2)
    drawBackground(BTEX);
  image(BTEX, 0, 0)

    DTEX=createGraphics(width, height / 2);
  drawPond(DTEX)
    image(DTEX, 0, height/2)

    TTEX=createGraphics(width, height);
  drawTerrestrial(TTEX)
    image(TTEX, 0, 0)
}


function drawCelestial(target) {
  with(target) {
    colorMode(HSB)
      noStroke();
  }

  drawSky(target)
    drawStar(target)
    drawMoon(target)

    function drawSky(target) {
    with(target) {
      push();

      for (j = 0; j < 10; j++) {
        blendMode(ADD)
          for (i = 0; i < 150; i++) {
          var h = 150 + random(80);
          var s = 80 - random(80)
            var b = random(20)
            fill(h, s, b, .12)
            var x = random(width) * 2 - width / 2;
          var y = random(height * 2)-height / 2 + j * 50
            circle(x, y, random(width / 2 + j * 10))
        }

        blendMode(BLEND)
          for (i = 0; i < 50; i++) {
          fill(240, 100, 20, .05)
            var x = random(width) * 2 - width / 2;
          var y = random(height * 2) - height / 2
            circle(x, y, random(width / 2))
        }
      }

      pop();
      filter(BLUR, 3)
    }
  }

  function drawStar(target) {
    with(target) {
      push();
      noStroke()
        for (i=0; i<150; i++) {
        var x = random(width)
          var y = random(height)
          blendMode(ADD)
          fill(0, 10, 100, .1)
          circle(x, y, random(20))

          blendMode(BLEND)
          fill(0, 10, 100)
          ellipse(x, y, random(5)+5, random(5)+5)
      }
      pop();
    }
  }

  function drawMoon(target) {
    with(target) {
      push();
      noStroke()
        var x = random(width / 2) + width / 4;
      var y = height / 1.5;
      blendMode(ADD)
        fill(60, 50, 100, .005)
        for (r=0; r<TAU; r+=.05) {
        var lx = x+cos(r)*(random(50)+220)
          var ly = y+sin(r)*(random(50)+220)
          circle(lx, ly, random(50)+150)
      }
      blendMode(BLEND)
        fill(60, 10, 100)
        circle(x, y, 500)
        drawingContext.clip()
        for (j=0; j<10; j++) {
        for (i=0; i<10; i++) {
          fill(60, 10, 20, .03)
            var cx = random(500)-250
            var cy = random(500)-250
            circle(x + cx, y+cy, 200)
        }
        fill(60, 20, 100, .03)
          for (i=0; i<10; i++) {
          var cx = random(500)-250
            var cy = random(500)-250
            circle(x + cx, y+cy, 200)
        }
      }
      pop();
    }
  }
}

function drawTerrestrial(target) {
  with(target) {
    colorMode(HSB)
      noStroke();
  }

  with(target) {
    push();

    treeF=0;
    for (j=1; j<7; j*=1.05) {
      Y= height /2 + height/2 / (2**(j-1))-10;
      for (F=-1; F<2; F+=2) {
        for (x=0; F>0?x<width/2*F:x>width/2*F; x+=(10-j)**2*F/4) {
          X=x+width/2
            N=noise(X/400, Y/400)**2
            if (N>.25) {
            treeF++;
            if (treeF%5==0 && N%.2>.1) {
              blendMode(BLEND)
                M=random(100)*N
                fill(90, 50, 10, .2)
                ellipse(X, Y, 9-j, M)
                h=160+random(20)
                for (l=0; l<M; l+=.5) {
                fill(h, 90-j*10-cos(l/M*PI/2)*60, 5+cos(l/M*PI/2)*10, .2)
                  push()
                  translate(X+(noise(l)-.5)*50*cos(l/M*PI/2), Y+l*7/j)
                  rotate(random(TAU))
                  ellipse(0, 0, W=noise(X, Y, l/10)*200/(j/2)*cos(l/M*PI/2), W/4)
                  pop()
              }
            }
            if (treeF%5==0 && N%.2>.05) {
              for (i=0; i<200; i++) {
                fill(90+random(90), random(50+j*5)+50, random(99-j*10), .3-(j/20))
                  push()
                  L=random(10-j)*3
                  translate(X+cos(R=PI+random(PI))*(D=(7-j)/3*L/2)+random(j*4)-j*2, Y+sin(R)*D)
                  rotate(R)
                  ellipse(0, 0, L, (7-j)/3)
                  pop()
              }
            }
          }
        }
      }
    }
    filter(BLUR, 2)
      treeF=0;
    for (j=1; j<6; j*=1.05) {
      J=7-j
        Y= height /2 + height/2 / (2**(J-1))-10;
      for (F=-1; F<2; F+=2) {
        for (x=0; F>0?x<width/2*F:x>width/2*F; x+=(10-j)**2*F/4) {
          X=x+width/2
            N=noise(X/400, Y/400)**2
            if (N>.3) {
            treeF++;
            if (treeF%5==0 && N%.2>.1) {
              blendMode(BLEND)
                M=random(100)*N
                fill(90, 50, 10, .8)
                ellipse(X, Y, 9-J, M*3)
                h=160+random(20)
                fruit = random(.1)+.9
                for (l=0; l<M; l+=.05) {
                push()
                  translate(X+(noise(l)-.5)*50*cos(l/M*PI/2), Y-l*7/J*2)
                  if (l<M/2 && random(1)>fruit) {
                  fill(random(360), 50, 90, .8-J/10)
                    circle(random(30)-15, random(10), random(10-J))
                }

                rotate(random(TAU))
                  fill(h, 90-J*10, random(50)-J*2, .2)
                  ellipse(0, 0, W=noise(X, Y, l/2)**2*200/(J/2)*cos(l/M*PI/2), W/20)
                  pop()
              }
            }
          }
        }
      }
    }
    pop();
  }
}

function drawBackground(target) {
  with(target) {
    colorMode(HSB)
      noStroke();
  }

  with(target) {
    push();
    for (j=0; j<3; j++) {
      fill(190, 90-j*10, 5+j*5)
        beginShape()
        vertex(0, height)
        for (x=-100; x<width+100; x++) {
        vertex(x, height - ((noise(x/(300+j*100), j*9))**(j+1)-.05)*(600-j*100))
      }
      vertex(width, height)
        endShape()
        drawingContext.clip()

        blendMode(ADD)
        for (i=0; i<width; i+=10) {
        fill(150+random(80), 10, 30+random(10), .02)
          circle(i, random(height), 400+j*50)
      }
      blendMode(BLEND)
        for (i=0; i<width; i+=50) {
        fill(190+random(40), 10, 5, .1)
          circle(i, random(height), 500)
      }
    }
    pop();
  }
}

function drawPond(target) {
  with(target) {
    colorMode(HSB)
      noStroke();
    background(190, 50, 10)
  }

  drawWater(target);

  function drawWater(target) {
    with(target) {
      push();
      for (j=1; j<7; j*=1.05) {
        Y= height - (height - height / (2**(j-1)));
        blendMode(ADD)
          for (i=0; i<150; i++) {
          var h = 150+random(80);
          var s = 80 - random(80)
            var b = random(20)
            fill(h, s, b, .3)
            var x = random(width) * 2 - width / 2;
          var y = Y - random(height)
            ellipse(x, y, W = random(width/j/3), W / 4)
        }
        blendMode(BLEND)
          for (i=0; i<50; i++) {
          fill(240, 100, 20, .1)
            var x = random(width) * 2 - width / 2;
          var y = Y - random(height)
            ellipse(x, y, W= random(width/j/3), W / 4)
        }
      }
      pop();
      filter(BLUR, 5)
    }
  }
}

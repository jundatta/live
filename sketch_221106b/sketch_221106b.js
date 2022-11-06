function setup() {
  createCanvas(1920, 1080);
  //scale(0.4,0.4);
  fill(40, 40, 80)
    rect(0, 0, width, height);

  var CTEX = createTex(width, height /2)
    drawCelestial(CTEX)
    image(CTEX, 0, 0)

    var MTEX = createTex(width, height / 2)
    //drawMountain(MTEX)
    //image(MTEX, 0, 0)

    var PTEX = createTex(width, height/2)
    //drawPond(PTEX)
    //image(PTEX, 0, height/2)

    var TTEX = createTex(width, height)
    //drawTree(TTEX)
    //image(TTEX, 0, 0)

    print(millis())
}

function drawPond(target) {
  with(target) {
    push()
      background(240, 50, 0)
      blendMode(ADD)
      for (z=4; z>1.0; z-=.1) {
      M=1/(3**(z-1))
        fill(180+random(60), 50-l/2, 30-l/2, .08)
        beginShape()
        curveVertex(0, 0)
        curveVertex(0, 0)
        for (x=0; x<width+100; x+=200) {
        curveVertex(x, noise(x/1000, M)*M*50*height/10*1.5)
      }
      vertex(width, 0)
        vertex(width, 0)
        endShape()

        for (i=1; i<5; i+=.1) {
        fill(180+random(60), 50-l/2, 30-l/2, .1)
          ellipse(random(width), height*M+random(100)*M, 1000*M*i/5, 50*M*i/5)
      }
    }
    pop()
  }
}

function drawTree(target) {
  with(target) {
    push()
      for (x=0; x<width; x+=1) {
      fill(60+random(120), 50, random(5))
        Y=noise(x/10)*20
        rect(x, height/2-Y-20+2, 1, 20+Y)
    }

    fill(240, 50, 0)
      rect(0, height/2, width, 30)

      for (l=0; l<6; l++) {
      for (z=4; z>1.0; z-=.1) {
        Z=6-z
          M=1/(3**(z-1))

          for (x=0; x<width; x+=max(1*Z/3, 2)) {
          N=noise(x/100, M*5)
            Y=height/2 + M * height / 2 + noise(x)*100*M + 10
            switch(l) {
          case 0:  //  island
            if (N>(.2+Z*.1)) {
              blendMode(BLEND)
                fill(240, 50, 0)
                beginShape()
                for (r=0; r<TAU+1; r+=1) {
                d=noise(x, z, r)*2
                  iX=x+cos(r)*M*200*d
                  iY=Y+sin(r)*M*150*d
                  curveVertex(iX, iY)
              }
              endShape()

                fill(240, 50, 0, .2)
                beginShape()
                for (r=0; r<TAU+1; r+=1) {
                d=noise(x, z, r)*2*1.1
                  iX=x+cos(r)*M*200*d
                  iY=Y+sin(r)*M*150*d
                  curveVertex(iX, iY+50*M)
              }
              endShape()
            }
            break;
          case 1:  //  island foreground
            if (N>(.2+Z*.1)) {
              blendMode(BLEND)
                fill(60, 50, 10, .2-z/20)
                beginShape()
                for (r=0; r<TAU+1; r+=1) {
                d=noise(x, z, r)*1.5
                  iX=x+cos(r)*M*200*d
                  iY=Y+sin(r)*M*150*d
                  curveVertex(iX, iY)
              }
              endShape()
            }
            break;
          case 2:  //  plant
            if (N>(.2+Z*.1)  && ((z<2.5) || (N%.02>.01))) {
              blendMode(BLEND)
                for (i=0; i<5+Z; i++) {
                fill(60+random(120), 50, 70, .15)
                  push()
                  translate(x, Y)
                  R=noise(x, z, i)*PI
                  rotate(R+PI)
                  oX = (random(1)-.5) * Z * 10
                  oY = (random(1)-.5) * Z * 10
                  ellipse(M*100*noise(x, z, i)+oX, oY, M*100*noise(x, z, i), M*5)
                  if (random(1)>.95) {
                  fill(random(360), 50, 50, .5)
                    circle(M*140*noise(x, z, i), 0, M*10)
                }
                pop()
              }
            }
            break;
          case 3:  //  branch
            if (N>(.3+Z*.1)) {
              if ((z>=3)) {
                push();
                blendMode(BLEND)
                  fill(30, 80, random(10)+5)
                  H=M*3000*noise(x, z)
                  ellipse(x, Y-H/2, M*30, H)
                  push()
                  translate(x, Y-H/4*3)
                  rotate(random(PI/4)-PI/8)
                  ellipse(0, 0, M*5, H/2)
                  pop()
                  push()
                  translate(x, Y-H/5*4)
                  rotate(random(PI/4)-PI/8)
                  ellipse(0, 0, M*5, H/2)
                  pop()
                  pop();
              } else {
                blendMode(BLEND)
                  for (i=0; i<3; i++) {
                  fill(30, 80, random(10)+15, .5)
                    push()
                    translate(x, Y)
                    R=noise(x, z, i)*PI
                    rotate(R+PI)
                    ellipse(M*100*noise(x, z, i), 0, M*100*noise(x, z, i), M*5)
                    if (random(1)>.9) {
                    fill(random(360), 50, 50, .5)
                      circle(M*150*noise(x, z, i), 0, M*10)
                  }
                  pop()
                }
              }
            }
            break;
          case 4:  //  base leaf
            if (N>(.3+Z*.1) && (z>=3) && (N%.1>.00)) {
              blendMode(BLEND)
                fill(60+random(120), 50, random(9)+10)
                beginShape()
                for (r=0; r<TAU; r+=(.5-M*1)) {
                d=noise(x, r*100)*(M*100)
                  vertex(x+cos(r)*d*2, Y+sin(r)*d*5-M*3000*noise(x, z))
              }
              endShape()
            }
            break;
          }
        }
      }
    }
    pop()
  }
}

function drawMountain(target) {
  with(target) {
    push()
      for (j=0; j<3; j++) {
      for (i=10; i>0; i--) {
        fill(j*30+60+random(60), 60-i*5, j*3+i, i/10)
          beginShape()
          vertex(0, height)
          vertex(0, height)
          for (x=0; x<width+100; x+=20) {
          curveVertex(x, height-noise(x/(400+j*100), j)**(j+4)*(1000-j*50)*((i/10)**2)+50)
        }
        vertex(width, height)
          vertex(width, height)
          endShape()
      }
    }
    pop()
  }
}

function drawCelestial(target) {

  drawSky(target)
    drawStar(target)
    drawMoon(target)

    function drawStar(target) {
    with(target) {
      push()
        blendMode(ADD)
        for (i=0; i<100; i++) {
        X = random(width)
          Y = random(height - 100)

          //  shine
          S = random(10)+10
          fill(random(360), 20, 100, .5)
          ellipse(X, Y, S, S/4)
          ellipse(X, Y, S/4, S)

          //  star
          fill(random(360), 20, 100, .5)
          circle(X, Y, 3)
      }

      //  shooting star
      X = random(width)
        Y = random(height - 200)
        for (i=0; i<10; i++) {
        push()
          R=-PI/8-random(PI/16)
          translate(X, Y)
          rotate(R)
          fill(random(360), 20, 20, i/20)
          ellipse(i*10, 0, i*20, i)
          pop()
      }
      pop()
    }
  }

  function drawMoon(target) {
    with(target) {
      push();
      X=random(width/2)+width/4
        Y=height/2

        //  backlight
        push();
      blendMode(ADD)
        for (i=0; i<5; i++) {
        fill(180+random(60), 30, 10, .5-i/20)
          beginShape()
          for (r=0; r<TAU+1; r+=.5) {
          d = i*20 + 200+random(10)
            curveVertex(X+cos(r)*d, Y+sin(r)*d)
        }
        endShape()
      }
      pop();

      //  fullmoon
      //fill(60, 20, 100)
      //  circle(X, Y, 400)
      //  drawingContext.clip()

      //  crater
      for (i=0; i<100; i++) {
        fill(6, 10, 30, .03)
          beginShape()
          mX=X-200+random(400)
          mY=Y-200+random(400)
          offsetR=random(TAU)
          for (r=0; r<TAU; r+=.1) {
          D=noise(r, i)**2*10*i*sin(r+offsetR)
            vertex(mX+cos(r)*D, mY+sin(r)*D)
        }
        endShape()
      }
      pop();
    }
  }

  function drawSky(target) {
    with(target) {
      push();
      background(240, 50, 0)
        blendMode(ADD)
        for (l=0; l<20; l++) {
        fill(180+random(60), 50-l, 30-l, .15)
          beginShape()
          curveVertex(0, height)
          curveVertex(0, height)
          for (x=0; x<width+100; x+=200) {
          curveVertex(x, height-noise(x/1000, l)*l*height/10)
        }
        vertex(width, height)
          vertex(width, height)
          endShape()
      }
      pop();
    }
  }
}

function createTex(w, h) {
  var TEX = createGraphics(w, h)
    with(TEX) {
    colorMode(HSB);
    noStroke();
  }
  return TEX;
}

var a, vmax;
function setup() {
  createCanvas(720, 720);

  rectMode(CENTER)
    colorMode(HSB)
    noStroke()

    initialize()

  /* for Debug
   textSize(8)
   for(x=0;x<=72;x++){
   for(y=0;y<=72;y++){
   a[x][y]=abs(a[x][y])
   text(a[x][y],x*10,y*10)
   }
   }
   */
}

function initialize() {
  a=[]
    t=0
    for (x=0; x<=72; x++) {
    a[x]=[]
      for (y=0; y<=72; y++) {
      a[x][y]=0;
    }
  }

  tx = int(random(73))
    ty = int(random(73))
    a[tx][ty]=1;

  while (!fillCell())
  {
  }
  //for(i=0;i<500;i++)fillCell()

  for (x=0; x<=72; x++) {
    for (y=0; y<=72; y++) {
      a[x][y]=abs(a[x][y])
    }
  }
}

mode=1
  t=0
  function draw() {
  blendMode(BLEND)
    background(0)
    blendMode(ADD)
    t+=.5
    for (x=0; x<=72; x++) {
    for (y=0; y<=72; y++) {
      switch(mode) {
      case 1:
        if (a[x][y]<t) {
          s = min(t-a[x][y], 20)
            r=noise(x, y)*9*TAU
            fill(a[x][y]/vmax*360, 80, 100, tan(s/20)*1)
            square(x*10+tan((s-20)/500)*cos(r), y*10+tan((s-20)/500)*sin(r), 15/tan(s/20))
        }
        if ((t-vmax)>10) {
          mode=2;
        }
        break;
      case 2:
        if (a[x][y]<t) {
          s = min(t-a[x][y], 20)
            fill(a[x][y]/vmax*360, 80, 150-(t-vmax)*2, tan(s/20)*1)
            square(x*10, y*10, 15/tan(s/20))
        }
        break;
      }
    }
  }

  if (mode == 2 && t-vmax>100) {
    initialize()
      mode=1;
  }
}


function fillCell() {
  var allFill = true;
  vmax=0
    for (x=0; x<=72; x++) {
    for (y=0; y<=72; y++) {
      if (a[x][y]==0) {
        allFill &= false;
        break;
      } else {
        vmax = max(vmax, a[x][y])
      }
    }
  }

  if (!allFill) {
    for (x=0; x<=72; x++) {
      for (y=0; y<=72; y++) {
        if (a[x][y]>0) {
          v=int(random(1)*2)*2-1
            va=random(1)>.5?v:0
            vb=va==0?v:0
            tx = x + va
            ty = y + vb

            if (tx>=0 && ty >= 0 && tx < 73 && ty < 73) {
            if (a[tx][ty]==0) {
              a[tx][ty]=a[x][y]+1;
              a[x][y]*=-1
            }
          }
        } else if (random(1)<.001) {
          a[x][y]*=-1;
        }
      }
    }
  }

  return allFill;
}

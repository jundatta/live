function taicy(num, cenx, ceny) {
  if (num==1) {
    lin(cenx, ceny-2*h, w, h);
    lin(cenx, ceny, w, h);
    lin(cenx, ceny+2*h, w, h);
  }
  if (num==2) {
    lin(cenx, ceny, w, h);
    dotlin(cenx, ceny-2*h, w, h);
    lin(cenx, ceny+2*h, w, h);
  }
  if (num==3) {
    lin(cenx, ceny-2*h, w, h);
    dotlin(cenx, ceny, w, h);
    lin(cenx, ceny+2*h, w, h);
  }
  if (num==4) {
    dotlin(cenx, ceny-2*h, w, h);
    dotlin(cenx, ceny, w, h);
    lin(cenx, ceny+2*h, w, h);
  }
  if (num==5) {
    lin(cenx, ceny, w, h);
    lin(cenx, ceny-2*h, w, h);
    dotlin(cenx, ceny+2*h, w, h);
  }
  if (num==6) {
    lin(cenx, ceny, w, h);
    dotlin(cenx, ceny-2*h, w, h);
    dotlin(cenx, ceny+2*h, w, h);
  }
  if (num==7) {
    dotlin(cenx, ceny, w, h);
    lin(cenx, ceny-2*h, w, h);
    dotlin(cenx, ceny+2*h, w, h);
  }
  if (num==8) {
    dotlin(cenx, ceny, w, h);
    dotlin(cenx, ceny-2*h, w, h);
    dotlin(cenx, ceny+2*h, w, h);
  }
}

function lin(cenx, ceny, w, h) {
  fill(255);
  x = cenx-w/2;
  y = ceny-h/2;
  rect(x, y, w, h);
}

function dotlin(cenx, ceny, w, h) {
  x = cenx-w/2;
  y = ceny-h/2;
  rect(x, y, w/5*2, h);
  rect(x+w/5*3, y, w/5*2, h);
}

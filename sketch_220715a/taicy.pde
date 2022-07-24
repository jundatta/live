void taicy(int num, float cenx, float ceny, float w, float h) {
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

void lin(float cenx, float ceny, float w, float h) {
  fill(255);
  float x = cenx-w/2;
  float y = ceny-h/2;
  rect(x, y, w, h);
}

void dotlin(float cenx, float ceny, float w, float h) {
  float x = cenx-w/2;
  float y = ceny-h/2;
  rect(x, y, w/5*2, h);
  rect(x+w/5*3, y, w/5*2, h);
}

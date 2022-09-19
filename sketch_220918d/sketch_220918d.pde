// https://openprocessing.org/sketch/754126

/*
setup=_=>{c=createGraphics;w=image;createCanvas(S=500,S);H=S/2;g=c(S,S,WEBGL);g.noStroke();t=0}
 draw=_=>{background(0);b(M=255,100,250);m=c(S,S);m.beginShape();i=200;while(i){m.vertex(cos(j=noise(t+i)*TAU*2)*S+H,sin(j)*S+H);--i}m.endShape();s=g.get();s.mask(m);b(150,200,M);w(g,0,0);w(s,0,0);g.rotate(.005,createVector(1,1,.5));t+=.0002}
 b=(j,k,l)=>{g.clear();g.ambientLight(0,10,50);g.pointLight(M,M,200,0,0,H*0.64);g.ambientMaterial(M,j,k,l);g.box(H*0.8)}
/**/

float S, H, D, R;
PGraphics g, s, m;
PVector v;
float t;

void setup() {
  size(500, 500, P3D);
  S = width;
  H=S/2.0f;
  D=200;
  R=H*0.8;

  g = createGraphics((int)S, (int)S, P3D);
  s = createGraphics((int)S, (int)S, P3D);

  m = createGraphics((int)S, (int)S, P2D);

  v = new PVector(1, 1, 0.5);
  t = 0;
}

void draw() {
  //push();
  //translate(width/2, height/2);
  //lightSpecular(192, 192, 192);
  //pointLight(255, 255, 255, 0, 0, S);
  //pop();

  background(0);

  //setBox(g, 213, 154, 255);
  setBox(g, 220, 160, 255);
  image(g, 0, 0);

  m.beginDraw();
  m.background(0);
  m.noStroke();
  m.beginShape();
  for (float i=0; i<D; ++i) {
    m.vertex(cos(noise(t+i)*TAU*2)*S+H, sin(noise(t+i)*TAU*2)*S+H);
  }
  m.endShape();
  m.endDraw();

  setBox(s, 230, 250, 170);
  s.mask(m);

  image(s, 0, 0);

  //  g.rotate(0.005, v);
  t+=0.0002;
}

void setBox(PGraphics pg, float j, float k, float l) {
  pg.beginDraw();
  pg.background(0);
  pg.translate(width/2, height/2);
  pg.lightSpecular(255, 255, 255);
  pg.pointLight(255, 255, 200, 0, 0, R);
  pg.rotateY(t*25.0f);
  pg.rotateX(t*25.0f);
  pg.rotateZ(t*25.0f);
  pg.noStroke();
  pg.fill(j, k, l);
  pg.box(R);
  pg.endDraw();
}
/**/

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
  g.noStroke();
  s = createGraphics((int)S, (int)S, P3D);
  s.noStroke();

  m = createGraphics((int)S, (int)S, P2D);

  v = new PVector(1, 1, 0.5);
  t = 0;
}

void draw() {
  background(0);
  translate(width/2, height/2);

  setBox(s, 255, 100, 250);

  m.beginDraw();
  m.clear();
  m.beginShape();
  for (float i=0; i<D; ++i) {
    m.vertex(cos(noise(t+i)*TAU*2)*S+H, sin(noise(t+i)*TAU*2)*S+H);
  }
  m.endShape();
  m.endDraw();

  //s = g.get();
  //s.mask(m);

  setBox(g, 150, 200, 255);

  image(g, 0, 0);
  //image(s, 0, 0);

  //  g.rotate(0.005, v);
  t+=0.0002;
}

void setBox(PGraphics pg, float j, float k, float l) {
  pg.beginDraw();
  pg.clear();
  pg.ambientLight(0, 10, 50);
  pg.pointLight(64, 64, 50, 0, 0, R);
  //g.ambientMaterial(255, j, k, l);
  pg.ambient(j, k, l);
  pg.box(R);
  pg.endDraw();
}
/**/

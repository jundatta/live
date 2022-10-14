// こちらがオリジナルです。
// 【作者】Che-Yu Wuさん
// 【作品名】200421 Energetic Bamboo
// https://openprocessing.org/sketch/878972

color[] colors = {#cdf2ba, #77af5b, #76a855, #c4e878, #e8f78a, #dded63, #f1f4e6};
class Particle {
  PVector p, v, a;
  float r, w;
  color col;
  boolean child;
  PVector lastP;
  boolean dead;

  Particle(PVector p, PVector v, float r, float w, color col) {
    this.p = p;
    this.v = v;
    a = new PVector(0, 0);
    this.r = r;
    this.w = w;
    this.col = col;
    child = false;
    lastP = new PVector(0, 0);
    dead = false;
  }
  void draw() {
    push();
    translate(this.p.x, this.p.y);
    rotate(this.v.heading()-PI*1.5);
    fill(this.col);
    rect(0, 0, this.r, this.v.y);
    rectMode(CENTER);
    rect(this.r/2.0f, this.v.y, this.r+2, 2);
    rect(this.r/2.0f, 0, this.r+2, 2);
    if (random(1)>0.7) {
      var count = int(random(2, 4));
      for (var i=0; i<count; i++) {
        push();
        rotate((i*2-1)/1.2* this.v.heading()/(float)(1+random(2))*random(-1, 1)+PI*0.5 );
        fill(P5JS.random(colors));
        beginShape();
        var ww = this.v.y+random(-5, 5);
        vertex(0, 0);
        curveVertex(ww/2.0f, 5);
        vertex(ww, 0);
        curveVertex(ww/2.0f, -5);
        endShape(CLOSE);
        pop();
      }
    }

    for (var o=0; o<this.r; o+=1) {
      color c = color(P5JS.random(colors));
      //c.setAlpha(random(80));
      c = color(red(c), green(c), blue(c), random(80));
      stroke(c);
      line(o, 0, o, this.v.y/random(1.5, 2.5));
    }

    pop();
  }
  void update() {
    this.lastP=this.p.copy();
    this.p.add(this.v);
    this.v.add(this.a);
    this.v.mult(0.99);
    if (this.p.y<-50) {
      this.dead=true;
    }
    if (this.child) {
      this.r-=4;
      if (this.r<1) {
        this.dead=true;
      }
    }
  }
}

ArrayList<Particle> particles = new ArrayList();

void setup() {
  P5JS.setup(this);

  size(800, 800);
  background(50);
  fill(#222222);
  noStroke();
  rect(0, 0, width, height);

  //  drawingContext.shadowColor = color(30, 70, 80, 235);
  //drawingContext.shadowBlur =30;
  for (var i=0; i<1; i++)  generateNewBamboo();
}

void generateNewBamboo() {
  var p = new Particle( new PVector(random(width), height +random(50, 100)),
    new PVector(random(-6, 6), random(-30, -100)),
    random(8, 18), random(20, 30), P5JS.random(colors));
  if (random(1)<0.1) {
    p.v.mult(0.5);
    p.r*=3;
    p.child=true;
    p.col = color(#e5c677);
  }
  particles.add(p);
}

void draw() {
  background(0);
  for (Particle p : particles) {
    p.update();
    p.draw();
  }
  ArrayList<Particle> newPs = new ArrayList();
  for (Particle p : particles) {
    if (p.dead) {
      continue;
    }
    newPs.add(p);
  }
  particles = newPs;
  if (frameCount%20 == 0) {
    fill(0, 1);
    rect(0, 0, width, height);
    for (var i=0; i<2; i++) generateNewBamboo();
  }
}

void mousePressed() {
  for (var i=0; i<5; i++) generateNewBamboo();
}

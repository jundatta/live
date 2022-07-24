class Shape {
  float cen_x, cen_y;
  float d;
  float R;
  float w;
  int ang;
  int r, g, b, alp;
  boolean Fi;
  int num;
  
  Shape(float cen_x, float cen_y, float dis, float R, float w, int ang,
      int r, int g, int b, int alp, boolean Fill, int num) {
    this.cen_x = cen_x  + dis * cos(radians(ang-90));
    this.cen_y = cen_x  + dis * sin(radians(ang-90));
    this.d = dis;
    this.R = R;
    this.w = w;
    this.ang = ang;
    this.r = r;
    this.g = g;
    this.b = b;
    this.alp = alp;
    this.num = num;
    this.Fi = Fill;
  }

  show(float ang, int a) {
    this.ang = ang;
    this.offset = 360/(float)this.num;

    stroke(this.r, this.g, this.b, this.alp);
    strokeWeight(this.w);
    if (this.Fi) {
      fill(this.r, this.g, this.b, this.alp);
    } else {
      noFill();
    }

    this.cen_x = 0 + this.d * cos(radians(a-90));
    this.cen_y = 0 + this.d * sin(radians(a-90));

    beginShape();
    for (int j = 0; j < this.num; j++) {
      float x = this.cen_x + (this.R) * cos(radians(this.ang+this.offset*j));
      float y = this.cen_y + (this.R) * sin(radians(this.ang+this.offset*j));
      vertex(x, y);
    }
    endShape(CLOSE);
  }
}

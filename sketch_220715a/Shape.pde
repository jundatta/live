class Shape {
  float dis;
  float R;
  float w;
  int r, g, b, alp;
  boolean Fi;
  int num;
  float offset;

  Shape(float dis, float R, float w,
    int r, int g, int b, int alp, boolean Fill, int num) {
    this.dis = dis;
    this.R = R;
    this.w = w;
    this.r = r;
    this.g = g;
    this.b = b;
    this.alp = alp;
    this.Fi = Fill;
    this.num = num;
    this.offset = 360/(float)this.num;
  }

  void show(float ang, int a) {
    stroke(this.r, this.g, this.b, this.alp);
    strokeWeight(this.w);
    if (this.Fi) {
      fill(this.r, this.g, this.b, this.alp);
    } else {
      noFill();
    }

    float cen_x = 0 + this.dis * cos(radians(a-90));
    float cen_y = 0 + this.dis * sin(radians(a-90));

    beginShape();
    for (int j = 0; j < this.num; j++) {
      float x = cen_x + (this.R) * cos(radians(ang+this.offset*j));
      float y = cen_y + (this.R) * sin(radians(ang+this.offset*j));
      vertex(x, y);
    }
    endShape(CLOSE);
  }
}

class Zodiac {
  int choice;
  float x_cen, y_cen;
  float w;
  float r;
  int R, g, b;

  Zodiac(int word_choice, float x_cen, float y_cen, float w, float r, int R, int g, int b) {
    this.choice = word_choice;
    this.x_cen = x_cen;
    this.y_cen = y_cen;
    this.r = r;
    this.R = R;
    this.g = g;
    this.b = b;
    this.w = w;
  }

  void Rotate(float r, float a) {
    this.x_cen = r * cos(radians(a-90));
    this.y_cen = r * sin(radians(a-90));
  }

  void move(float x, float y) {
    this.x_cen = x;
    this.y_cen = y;
  }

  void show(float a) {
    strokeWeight(this.w);
    noFill();

    float len = this.r/4;
    float len2 = this.r/2;
    float len3 = this.r/1.5;

    float an = radians(a);
    float an1 = radians(a+180);
    float an2 = radians(a-90);
    float an3 = radians(a+90);
    float an4 = radians(a-45);
    float an5 = radians(a+45);
    float an6 = radians(a-135);
    float an7 = radians(a+135);

    if (this.choice < 1 || 8 < this.choice) {
      println("うぎゃあ");
    }
    
    float k;
    float xp1, xp2, xp3, xp4, xp5, xp6, xp7;
    float yp1, yp2, yp3, yp4, yp5, yp6, yp7;
    if (this.choice == 8) {
      // Virgo  ()
      stroke(this.R, this.g, this.b);

      k = this.r / 2;
      xp1 = this.x_cen -2 * k;
      xp2 = this.x_cen - k;
      xp3 = this.x_cen;
      xp4 = this.x_cen + k;
      xp5 = this.x_cen + k* 2;
      xp6 = this.x_cen + k/2;
      xp7 = this.x_cen + k/2 + k;

      yp2 = this.y_cen - k;
      yp3 = this.y_cen;
      yp4 = this.y_cen + k;
      yp6 = this.y_cen + k/2;
      yp7 = this.y_cen + k/2 + k;

      beginShape();

      curveVertex(xp1, yp2);
      curveVertex(xp1, yp2);
      curveVertex(xp2, yp2);
      curveVertex(xp2, yp4);
      curveVertex(xp2, yp4);
      endShape();

      beginShape();
      curveVertex(xp2, yp2);
      curveVertex(xp2, yp2);
      curveVertex(xp3, yp2);
      curveVertex(xp3, yp4);
      curveVertex(xp3, yp4);
      endShape();

      beginShape();
      curveVertex(xp3, yp2);
      curveVertex(xp3, yp2);
      curveVertex(xp4, yp2);
      curveVertex(xp4, yp4);
      curveVertex(xp5, yp4);
      curveVertex(xp5, yp4);
      endShape();

      beginShape();
      curveVertex(xp5-k/2, yp4-k/2);
      curveVertex(xp5-k/2, yp4-k/2);
      curveVertex(xp5, yp4);
      curveVertex(xp5-k/2, yp4+k/2);
      curveVertex(xp5-k/2, yp4+k/2);
      endShape();
    }

    if (this.choice == 7) {
      // Libra ()

      xp1 = this.x_cen + len * cos(an3);
      yp1 = this.y_cen + len * sin(an3);

      xp2 = xp1 + len3 * cos(an1);
      yp2 = yp1 + len3 * sin(an1);

      xp3 = xp1 + len3 * cos(an);
      yp3 = yp1 + len3 * sin(an);

      xp4 = xp2 + len * cos(an3);
      yp4 = yp2 + len * sin(an3);

      xp5 = xp3 + len * cos(an3);
      yp5 = yp3 + len * sin(an3);


      stroke(this.R, this.g, this.b);
      line(xp3, yp3, xp2, yp2);
      line(xp5, yp5, xp4, yp4);
      arc(this.x_cen, this.y_cen, this.r*0.8, this.r*0.8, an7+radians(15), an5-radians(15));
    }
    if (this.choice == 6) {
      // Virgo  ()
      stroke(this.R, this.g, this.b);

      k = this.r / 2;
      xp1 = this.x_cen -2 * k;
      xp2 = this.x_cen - k;
      xp3 = this.x_cen;
      xp4 = this.x_cen + k;
      xp5 = this.x_cen + k* 2;
      xp6 = this.x_cen + k/2;
      xp7 = this.x_cen + k/2 + k;

      yp2 = this.y_cen - k;
      yp3 = this.y_cen;
      yp4 = this.y_cen + k;
      yp6 = this.y_cen + k/2;
      yp7 = this.y_cen + k/2 + k;

      beginShape();

      curveVertex(xp1, yp2);
      curveVertex(xp1, yp2);
      curveVertex(xp2, yp2);
      curveVertex(xp2, yp4);
      curveVertex(xp2, yp4);
      endShape();

      beginShape();
      curveVertex(xp2, yp2);
      curveVertex(xp2, yp2);
      curveVertex(xp3, yp2);
      curveVertex(xp3, yp4);
      curveVertex(xp3, yp4);
      endShape();

      beginShape();
      curveVertex(xp3, yp2);
      curveVertex(xp3, yp2);
      curveVertex(xp4, yp2);
      curveVertex(xp4, yp4);
      curveVertex(xp5, yp4);
      curveVertex(xp5, yp4);
      endShape();

      beginShape();
      curveVertex(xp6, yp6);
      curveVertex(xp6, yp6);
      curveVertex(xp4, yp3);
      curveVertex(xp7, yp3);
      curveVertex(xp7, yp6);
      curveVertex(xp6, yp7);
      curveVertex(xp6, yp7);
      endShape();
    }
    if (this.choice == 5) {
      // Leo ()

      xp1 = this.x_cen + len2 * cos(an1);
      yp1 = this.y_cen + len2 * sin(an1);

      xp2 = this.x_cen + len2 * cos(radians(a-60));
      yp2 = this.y_cen + len2 * sin(radians(a-60));

      xp3 = this.x_cen + len2 * cos(radians(a+60));
      yp3 = this.y_cen + len2 * sin(radians(a+60));

      xp4 = xp1 + len * cos(an);
      yp4 = yp1 + len * sin(an);

      xp5 = xp2 + len * cos(an1);
      yp5 = yp2 + len * sin(an1);

      xp6 = xp2 + len * cos(an);
      yp6 = yp2 + len * sin(an);

      xp7 = xp3 + len * cos(an1);
      yp7 = yp3 + len * sin(an1);

      stroke(this.R, this.g, this.b);
      ellipse(xp1, yp1, this.r/2);
      line(xp4, yp4, xp5, yp5);
      line(xp6, yp6, xp7, yp7);
      arc(xp2, yp2, this.r/2, this.r/2, an1, an);
      arc(xp3, yp3, this.r/2, this.r/2, an, an1);
    }
    if (this.choice == 4) {
      // Cancer()

      xp1 = this.x_cen + len2 * cos(an);
      yp1 = this.y_cen + len2 * sin(an);

      xp2 = this.x_cen + len2 * cos(an1);
      yp2 = this.y_cen + len2 * sin(an1);

      stroke(this.R, this.g, this.b);
      ellipse(xp1, yp1, this.r/2);
      ellipse(xp2, yp2, this.r/2);
      arc(this.x_cen, this.y_cen, this.r*1.5, this.r, an, an7);
      arc(this.x_cen, this.y_cen, this.r*1.5, this.r, an1, an4);
    }

    if (this.choice == 3) {
      // Gemini()

      xp1 = this.x_cen + this.r*1.5 * cos(an2);
      yp1 = this.y_cen + this.r*1.5 * sin(an2);

      xp2 = this.x_cen + this.r*1.5 * cos(an3);
      yp2 = this.y_cen + this.r*1.5 * sin(an3);

      xp3 = xp1 + this.r * cos(radians(a+70));
      yp3 = yp1 + this.r * sin(radians(a+70));

      xp4 = xp1 + this.r * cos(radians(a+110));
      yp4 = yp1 + this.r * sin(radians(a+110));

      xp5 = xp2 + this.r * cos(radians(a-70));
      yp5 = yp2 + this.r * sin(radians(a-70));

      xp6 = xp2 + this.r * cos(radians(a-110));
      yp6 = yp2 + this.r * sin(radians(a-110));

      stroke(this.R, this.g, this.b);
      // rect(this.x_cen-this.r/2,this.y_cen-this.r/2,this.r);
      line(xp3, yp3, xp5, yp5);
      line(xp4, yp4, xp6, yp6);
      arc(xp1, yp1, this.r*2, this.r*2, an5, an7);
      arc(xp2, yp2, this.r*2, this.r*2, an6, an4);
    }

    if (this.choice == 2) {
      // Taurus  ()

      xp1 = this.x_cen + this.r * cos(an2);
      yp1 = this.y_cen + this.r * sin(an2);

      stroke(this.R, this.g, this.b);
      ellipse(this.x_cen, this.y_cen, this.r);
      arc(xp1, yp1, this.r, this.r, an, an1);
    }

    if (this.choice == 1) {
      // Aries ()
      float gap = this.r / 800;

      xp1 = this.x_cen + len2 * cos(an2);
      yp1 = this.y_cen + len2 * sin(an2);

      xp2 = this.x_cen + len2 * cos(an3);
      yp2 = this.y_cen + len2 * sin(an3);

      xp3 = xp1 + len2 * cos(an);
      yp3 = yp1 + len2 * sin(an);

      xp4 = xp1 + len2 * cos(an1);
      yp4 = yp1 + len2 * sin(an1);

      stroke(this.R, this.g, this.b);
      line(xp2, yp2, xp1, yp1);
      // ellipse(xp4,yp4,this.r);
      float r = this.r/2;
      for (int n=180; n<540; n++) {
        float an = radians( n);
        float x = xp3 + r * cos(an);
        float y = yp3 + r * sin(an);
        point(x, y);
        r -= gap;
      }

      r = this.r/2;
      for (int n=720; n>360; n--) {
        float an = radians( n);
        float x = xp4 + r * cos(an);
        float y = yp4 + r * sin(an);
        point(x, y);
        r -= gap;
      }
    }
  }
}

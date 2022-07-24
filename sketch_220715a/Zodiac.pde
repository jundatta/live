class Zodiac {
  constructor(word_choice, x_cen, y_cen, w, r, R, g, b, a) {
    this.choice = word_choice;
    this.x_cen = x_cen;
    this.y_cen = y_cen;
    this.r = r;
    this.R = R;
    this.g = g;
    this.b = b;
    this.a = a;
    this.w = w;
  }

  Rotate(r, a) {
    this.x_cen = r * cos(radians(a-90));
    this.y_cen = r * sin(radians(a-90));
    this.a = a;
  }

  move(x, y) {
    this.x_cen = x;
    this.y_cen = y;
  }

  show(a, ang) {
    let k = this.a;
    if (a == undefined) {
      this.a = k;
    } else {
      this.a = a;
    }
    strokeWeight(this.w)
      noFill();

    let len = this.r/4;
    let len2 = this.r/2;
    let len3 = this.r/1.5;

    let an = radians(this.a);
    let an1 = radians(this.a+180);
    let an2 = radians(this.a-90);
    let an3 = radians(this.a+90);
    let an4 = radians(this.a-45);
    let an5 = radians(this.a+45);
    let an6 = radians(this.a-135);
    let an7 = radians(this.a+135);

    if (this.choice == 9) {
      // Leo ()

      this.xp1 = this.x_cen + this.r * cos(an4);
      this.yp1 = this.y_cen + this.r * sin(an4);

      this.xp2 = this.x_cen + this.r * cos(an7);
      this.yp2 = this.y_cen + this.r * sin(an7);

      this.xp4 = this.x_cen + len2 * cos(an5);
      this.yp4 = this.y_cen + len2 * sin(an5);

      this.xp5 = this.x_cen + len2 * cos(an6);
      this.yp5 = this.y_cen + len2 * sin(an6);

      this.xp6 = this.xp1 + len2 * cos(an1);
      this.yp6 = this.yp1 + len2 * sin(an1);

      this.xp7 = this.xp1 + len2 * cos(an3);
      this.yp7 = this.yp1 + len2 * sin(an3);

      stroke(this.R, this.g, this.b);
      line(this.xp1, this.yp1, this.xp2, this.yp2);
      line(this.xp4, this.yp4, this.xp5, this.yp5);
      line(this.xp1, this.yp1, this.xp6, this.yp6);
      line(this.xp1, this.yp1, this.xp7, this.yp7);
    }
    if (this.choice == 8) {
      // Virgo  ()
      stroke(this.R, this.g, this.b);

      this.k = this.r / 2;
      this.xp1 = this.x_cen -2 * this.k;
      this.xp2 = this.x_cen - this.k;
      this.xp3 = this.x_cen;
      this.xp4 = this.x_cen + this.k;
      this.xp5 = this.x_cen + this.k* 2;
      this.xp6 = this.x_cen + this.k/2;
      this.xp7 = this.x_cen + this.k/2 + this.k;

      this.yp2 = this.y_cen - this.k;
      this.yp3 = this.y_cen;
      this.yp4 = this.y_cen + this.k;
      this.yp6 = this.y_cen + this.k/2;
      this.yp7 = this.y_cen + this.k/2 + this.k;

      beginShape();

      curveVertex(this.xp1, this.yp2);
      curveVertex(this.xp1, this.yp2);
      curveVertex(this.xp2, this.yp2);
      curveVertex(this.xp2, this.yp4);
      curveVertex(this.xp2, this.yp4);
      endShape();

      beginShape();
      curveVertex(this.xp2, this.yp2);
      curveVertex(this.xp2, this.yp2);
      curveVertex(this.xp3, this.yp2);
      curveVertex(this.xp3, this.yp4);
      curveVertex(this.xp3, this.yp4);
      endShape();

      beginShape();
      curveVertex(this.xp3, this.yp2);
      curveVertex(this.xp3, this.yp2);
      curveVertex(this.xp4, this.yp2);
      curveVertex(this.xp4, this.yp4);
      curveVertex(this.xp5, this.yp4);
      curveVertex(this.xp5, this.yp4);
      endShape();

      beginShape();
      curveVertex(this.xp5-this.k/2, this.yp4-this.k/2);
      curveVertex(this.xp5-this.k/2, this.yp4-this.k/2);
      curveVertex(this.xp5, this.yp4);
      curveVertex(this.xp5-this.k/2, this.yp4+this.k/2);
      curveVertex(this.xp5-this.k/2, this.yp4+this.k/2);
      endShape();
    }

    if (this.choice == 7) {
      // Libra ()

      this.xp1 = this.x_cen + len * cos(an3);
      this.yp1 = this.y_cen + len * sin(an3);

      this.xp2 = this.xp1 + len3 * cos(an1);
      this.yp2 = this.yp1 + len3 * sin(an1);

      this.xp3 = this.xp1 + len3 * cos(an);
      this.yp3 = this.yp1 + len3 * sin(an);

      this.xp4 = this.xp2 + len * cos(an3);
      this.yp4 = this.yp2 + len * sin(an3);

      this.xp5 = this.xp3 + len * cos(an3);
      this.yp5 = this.yp3 + len * sin(an3);


      stroke(this.R, this.g, this.b);
      line(this.xp3, this.yp3, this.xp2, this.yp2);
      line(this.xp5, this.yp5, this.xp4, this.yp4);
      arc(this.x_cen, this.y_cen, this.r*0.8, this.r*0.8, an7+radians(15), an5-radians(15));
    }
    if (this.choice == 6) {
      // Virgo  ()
      stroke(this.R, this.g, this.b);

      this.k = this.r / 2;
      this.xp1 = this.x_cen -2 * this.k;
      this.xp2 = this.x_cen - this.k;
      this.xp3 = this.x_cen;
      this.xp4 = this.x_cen + this.k;
      this.xp5 = this.x_cen + this.k* 2;
      this.xp6 = this.x_cen + this.k/2;
      this.xp7 = this.x_cen + this.k/2 + this.k;

      this.yp2 = this.y_cen - this.k;
      this.yp3 = this.y_cen;
      this.yp4 = this.y_cen + this.k;
      this.yp6 = this.y_cen + this.k/2;
      this.yp7 = this.y_cen + this.k/2 + this.k;

      beginShape();

      curveVertex(this.xp1, this.yp2);
      curveVertex(this.xp1, this.yp2);
      curveVertex(this.xp2, this.yp2);
      curveVertex(this.xp2, this.yp4);
      curveVertex(this.xp2, this.yp4);
      endShape();

      beginShape();
      curveVertex(this.xp2, this.yp2);
      curveVertex(this.xp2, this.yp2);
      curveVertex(this.xp3, this.yp2);
      curveVertex(this.xp3, this.yp4);
      curveVertex(this.xp3, this.yp4);
      endShape();

      beginShape();
      curveVertex(this.xp3, this.yp2);
      curveVertex(this.xp3, this.yp2);
      curveVertex(this.xp4, this.yp2);
      curveVertex(this.xp4, this.yp4);
      curveVertex(this.xp5, this.yp4);
      curveVertex(this.xp5, this.yp4);
      endShape();

      beginShape();
      curveVertex(this.xp6, this.yp6);
      curveVertex(this.xp6, this.yp6);
      curveVertex(this.xp4, this.yp3);
      curveVertex(this.xp7, this.yp3);
      curveVertex(this.xp7, this.yp6);
      curveVertex(this.xp6, this.yp7);
      curveVertex(this.xp6, this.yp7);
      endShape();
    }
    if (this.choice == 5) {
      // Leo ()

      this.xp1 = this.x_cen + len2 * cos(an1);
      this.yp1 = this.y_cen + len2 * sin(an1);

      this.xp2 = this.x_cen + len2 * cos(radians(this.a-60));
      this.yp2 = this.y_cen + len2 * sin(radians(this.a-60));

      this.xp3 = this.x_cen + len2 * cos(radians(this.a+60));
      this.yp3 = this.y_cen + len2 * sin(radians(this.a+60));

      this.xp4 = this.xp1 + len * cos(an);
      this.yp4 = this.yp1 + len * sin(an);

      this.xp5 = this.xp2 + len * cos(an1);
      this.yp5 = this.yp2 + len * sin(an1);

      this.xp6 = this.xp2 + len * cos(an);
      this.yp6 = this.yp2 + len * sin(an);

      this.xp7 = this.xp3 + len * cos(an1);
      this.yp7 = this.yp3 + len * sin(an1);

      stroke(this.R, this.g, this.b);
      ellipse(this.xp1, this.yp1, this.r/2);
      line(this.xp4, this.yp4, this.xp5, this.yp5);
      line(this.xp6, this.yp6, this.xp7, this.yp7);
      arc(this.xp2, this.yp2, this.r/2, this.r/2, an1, an);
      arc(this.xp3, this.yp3, this.r/2, this.r/2, an, an1);
    }
    if (this.choice == 4) {
      // Cancer()

      this.xp1 = this.x_cen + len2 * cos(an);
      this.yp1 = this.y_cen + len2 * sin(an);

      this.xp2 = this.x_cen + len2 * cos(an1);
      this.yp2 = this.y_cen + len2 * sin(an1);

      stroke(this.R, this.g, this.b);
      ellipse(this.xp1, this.yp1, this.r/2);
      ellipse(this.xp2, this.yp2, this.r/2);
      arc(this.x_cen, this.y_cen, this.r*1.5, this.r, an, an7);
      arc(this.x_cen, this.y_cen, this.r*1.5, this.r, an1, an4);
    }

    if (this.choice == 3) {
      // Gemini()

      this.xp1 = this.x_cen + this.r*1.5 * cos(an2);
      this.yp1 = this.y_cen + this.r*1.5 * sin(an2);

      this.xp2 = this.x_cen + this.r*1.5 * cos(an3);
      this.yp2 = this.y_cen + this.r*1.5 * sin(an3);

      this.xp3 = this.xp1 + this.r * cos(radians(this.a+70));
      this.yp3 = this.yp1 + this.r * sin(radians(this.a+70));

      this.xp4 = this.xp1 + this.r * cos(radians(this.a+110));
      this.yp4 = this.yp1 + this.r * sin(radians(this.a+110));

      this.xp5 = this.xp2 + this.r * cos(radians(this.a-70));
      this.yp5 = this.yp2 + this.r * sin(radians(this.a-70));

      this.xp6 = this.xp2 + this.r * cos(radians(this.a-110));
      this.yp6 = this.yp2 + this.r * sin(radians(this.a-110));

      stroke(this.R, this.g, this.b);
      // rect(this.x_cen-this.r/2,this.y_cen-this.r/2,this.r);
      line(this.xp3, this.yp3, this.xp5, this.yp5);
      line(this.xp4, this.yp4, this.xp6, this.yp6);
      arc(this.xp1, this.yp1, this.r*2, this.r*2, an5, an7);
      arc(this.xp2, this.yp2, this.r*2, this.r*2, an6, an4);
    }

    if (this.choice == 2) {
      // Taurus  ()

      this.xp1 = this.x_cen + this.r * cos(an2);
      this.yp1 = this.y_cen + this.r * sin(an2);

      stroke(this.R, this.g, this.b);
      ellipse(this.x_cen, this.y_cen, this.r);
      arc(this.xp1, this.yp1, this.r, this.r, an, an1);
    }

    if (this.choice == 1) {
      // Aries ()
      this.gap = this.r / 800;

      this.xp1 = this.x_cen + len2 * cos(an2);
      this.yp1 = this.y_cen + len2 * sin(an2);

      this.xp2 = this.x_cen + len2 * cos(an3);
      this.yp2 = this.y_cen + len2 * sin(an3);

      this.xp3 = this.xp1 + len2 * cos(an);
      this.yp3 = this.yp1 + len2 * sin(an);

      this.xp4 = this.xp1 + len2 * cos(an1);
      this.yp4 = this.yp1 + len2 * sin(an1);

      stroke(this.R, this.g, this.b);
      line(this.xp2, this.yp2, this.xp1, this.yp1);
      // ellipse(this.xp4,this.yp4,this.r);
      let r = this.r/2;
      for (let n=180; n<540; n++) {
        let an = radians( n);
        let x = this.xp3 + r * cos(an);
        let y = this.yp3 + r * sin(an);
        point(x, y);
        r -= this.gap;
      }

      r = this.r/2;
      for (let n=720; n>360; n--) {
        let an = radians( n);
        let x = this.xp4 + r * cos(an);
        let y = this.yp4 + r * sin(an);
        point(x, y);
        r -= this.gap;
      }
    }
  }
}

class Rune {
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

  show(a) {
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


    if (this.choice == 29) {
      // ear()

      this.xp1 = this.x_cen + len2 * cos(an2);
      this.yp1 = this.y_cen + len2 * sin(an2);

      this.xp2 = this.x_cen + len2 * cos(an3);
      this.yp2 = this.y_cen + len2 * sin(an3);

      this.xp3 = this.x_cen + len2 * cos(an4);
      this.yp3 = this.y_cen + len2 * sin(an4);

      this.xp4 = this.x_cen + len * cos(an4);
      this.yp4 = this.y_cen + len * sin(an4);

      this.xp5 = this.x_cen + len2 * cos(an6);
      this.yp5 = this.y_cen + len2 * sin(an6);

      this.xp6 = this.x_cen + len * cos(an6);
      this.yp6 = this.y_cen + len * sin(an6);

      stroke(this.R, this.g, this.b);
      line(this.xp2, this.yp2, this.xp1, this.yp1);
      line(this.xp4, this.yp4, this.xp1, this.yp1);
      line(this.xp6, this.yp6, this.xp1, this.yp1);
      line(this.xp4, this.yp4, this.xp3, this.yp3);
      line(this.xp6, this.yp6, this.xp5, this.yp5);
    }
    if (this.choice == 28) {
      // ior()

      this.xp1 = this.x_cen + len * cos(radians(this.a-60));
      this.yp1 = this.y_cen + len * sin(radians(this.a-60));

      this.xp2 = this.x_cen + len * cos(radians(this.a+60));
      this.yp2 = this.y_cen + len * sin(radians(this.a+60));

      this.xp3 = this.x_cen + len * cos(radians(this.a-120));
      this.yp3 = this.y_cen + len * sin(radians(this.a-120));

      this.xp4 = this.x_cen + len * cos(radians(this.a+120));
      this.yp4 = this.y_cen + len * sin(radians(this.a+120));

      this.xp5 = this.x_cen + len2 * cos(an2);
      this.yp5 = this.y_cen + len2 * sin(an2);

      this.xp6 = this.x_cen + len2 * cos(an3);
      this.yp6 = this.y_cen + len2 * sin(an3);

      stroke(this.R, this.g, this.b);
      line(this.xp4, this.yp4, this.xp1, this.yp1);
      line(this.xp2, this.yp2, this.xp3, this.yp3);
      line(this.xp5, this.yp5, this.xp6, this.yp6);
    }
    if (this.choice == 27) {
      // yr()

      this.xp1 = this.x_cen + len2 * cos(an2);
      this.yp1 = this.y_cen + len2 * sin(an2);

      this.xp2 = this.x_cen + len2 * cos(an3);
      this.yp2 = this.y_cen + len2 * sin(an3);

      this.xp3 = this.xp2 + len2 * cos(an);
      this.yp3 = this.yp2 + len2 * sin(an);

      this.xp4 = this.xp2 + len/2 * cos(an);
      this.yp4 = this.yp2 + len/2 * sin(an);

      this.xp5 = this.x_cen + len/2 * cos(an);
      this.yp5 = this.y_cen + len/2 * sin(an);


      stroke(this.R, this.g, this.b);
      line(this.xp2, this.yp2, this.xp1, this.yp1);
      line(this.xp1, this.yp1, this.xp3, this.yp3);
      line(this.xp4, this.yp4, this.xp5, this.yp5);
    }
    if (this.choice == 26) {
      // 脱sc()

      this.xp1 = this.x_cen + len2 * cos(an2);
      this.yp1 = this.y_cen + len2 * sin(an2);

      this.xp2 = this.x_cen + len2 * cos(an3);
      this.yp2 = this.y_cen + len2 * sin(an3);

      this.xp4 = this.x_cen + (this.r/4*1.5) * cos(an4);
      this.yp4 = this.y_cen + (this.r/4*1.5) * sin(an4);

      this.xp5 = this.x_cen + len * cos(an2);
      this.yp5 = this.y_cen + len * sin(an2);

      this.xp6 = this.x_cen + len * cos(an);
      this.yp6 = this.y_cen + len * sin(an);

      stroke(this.R, this.g, this.b);
      line(this.xp2, this.yp2, this.xp1, this.yp1);
      line(this.xp1, this.yp1, this.xp4, this.yp4);
      line(this.xp5, this.yp5, this.xp6, this.yp6);
    }
    if (this.choice == 25) {
      // ac()

      this.xp1 = this.x_cen + len2 * cos(an2);
      this.yp1 = this.y_cen + len2 * sin(an2);

      this.xp2 = this.x_cen + len2 * cos(an3);
      this.yp2 = this.y_cen + len2 * sin(an3);

      this.xp3 = this.x_cen + (this.r/2*1.5) * cos(an4);
      this.yp3 = this.y_cen + (this.r/2*1.5) * sin(an4);

      this.xp4 = this.x_cen + (this.r/4*1.5) * cos(an4);
      this.yp4 = this.y_cen + (this.r/4*1.5) * sin(an4);

      this.xp5 = this.x_cen + len * cos(an2);
      this.yp5 = this.y_cen + len * sin(an2);

      this.xp6 = this.x_cen + len * cos(an);
      this.yp6 = this.y_cen + len * sin(an);

      stroke(this.R, this.g, this.b);
      line(this.xp2, this.yp2, this.xp1, this.yp1);
      line(this.xp1, this.yp1, this.xp4, this.yp4);
      line(this.xp4, this.yp4, this.xp3, this.yp3);
      line(this.xp5, this.yp5, this.xp6, this.yp6);
    }
    if (this.choice == 24) {
      // Gyfu()

      this.xp1 = this.x_cen + len2 * cos(radians(this.a-60));
      this.yp1 = this.y_cen + len2 * sin(radians(this.a-60));

      this.xp2 = this.x_cen + len2 * cos(radians(this.a+60));
      this.yp2 = this.y_cen + len2 * sin(radians(this.a+60));

      this.xp3 = this.x_cen + len2 * cos(radians(this.a-120));
      this.yp3 = this.y_cen + len2 * sin(radians(this.a-120));


      this.xp4 = this.x_cen + len2 * cos(radians(this.a+120));
      this.yp4 = this.y_cen + len2 * sin(radians(this.a+120));

      stroke(this.R, this.g, this.b);
      line(this.xp2, this.yp2, this.xp1, this.yp1);
      line(this.xp4, this.yp4, this.xp1, this.yp1);
      line(this.xp2, this.yp2, this.xp3, this.yp3);
      line(this.xp3, this.yp3, this.xp4, this.yp4);
    }
    if (this.choice == 23) {
      // 辿丹el()

      this.xp1 = this.x_cen + len * cos(an);
      this.yp1 = this.y_cen + len * sin(an);

      this.xp2 = this.x_cen + len * cos(an1);
      this.yp2 = this.y_cen + len * sin(an1);

      this.xp3 = this.xp1 + len2 * cos(an3);
      this.yp3 = this.yp1 + len2 * sin(an3);

      this.xp4 = this.xp2 + len2 * cos(an3);
      this.yp4 = this.yp2 + len2 * sin(an3);

      this.xp5 = this.x_cen + len * cos(an2);
      this.yp5 = this.y_cen + len * sin(an2);

      stroke(this.R, this.g, this.b);
      beginShape();
      vertex(this.xp4, this.yp4);
      vertex(this.xp1, this.yp1);
      vertex(this.xp5, this.yp5);
      vertex(this.xp2, this.yp2);
      vertex(this.xp3, this.yp3);
      endShape();
    }
    if (this.choice == 22) {
      // ing()

      this.xp1 = this.x_cen + len * cos(an);
      this.yp1 = this.y_cen + len * sin(an);

      this.xp2 = this.x_cen + len * cos(an1);
      this.yp2 = this.y_cen + len * sin(an1);

      this.xp3 = this.xp1 + len2 * cos(an3);
      this.yp3 = this.yp1 + len2 * sin(an3);

      this.xp4 = this.xp2 + len2 * cos(an3);
      this.yp4 = this.yp2 + len2 * sin(an3);

      this.xp5 = this.xp1 + len2 * cos(an2);
      this.yp5 = this.yp1 + len2 * sin(an2);

      this.xp6 = this.xp2 + len2 * cos(an2);
      this.yp6 = this.yp2 + len2 * sin(an2);

      stroke(this.R, this.g, this.b);
      line(this.xp4, this.yp4, this.xp1, this.yp1);
      line(this.xp3, this.yp3, this.xp2, this.yp2);
      line(this.xp2, this.yp2, this.xp5, this.yp5);
      line(this.xp6, this.yp6, this.xp1, this.yp1);
    }
    if (this.choice == 21) {
      // lagu()

      this.xp1 = this.x_cen + len2 * cos(an2);
      this.yp1 = this.y_cen + len2 * sin(an2);

      this.xp2 = this.x_cen + len2 * cos(an3);
      this.yp2 = this.y_cen + len2 * sin(an3);

      this.xp3 = this.x_cen + this.r/2.5 * cos(an4);
      this.yp3 = this.y_cen + this.r/2.5 * sin(an4);


      stroke(this.R, this.g, this.b);
      line(this.xp2, this.yp2, this.xp1, this.yp1);
      line(this.xp1, this.yp1, this.xp3, this.yp3);
    }
    if (this.choice == 20) {
      // mann()

      this.xp1 = this.x_cen + len * cos(an2);
      this.yp1 = this.y_cen + len * sin(an2);

      this.xp2 = this.xp1 + len * cos(an6);
      this.yp2 = this.yp1 + len * sin(an6);

      this.xp3 = this.xp1 + len * cos(an4);
      this.yp3 = this.yp1 + len * sin(an4);

      this.xp4 = this.xp2 + this.r * cos(an3);
      this.yp4 = this.yp2 + this.r * sin(an3);

      this.xp5 = this.xp3 + this.r * cos(an3);
      this.yp5 = this.yp3 + this.r * sin(an3);

      this.xp6 = this.xp1 + len * cos(an5);
      this.yp6 = this.yp1 + len * sin(an5);

      this.xp7 = this.xp1 + len * cos(an7);
      this.yp7 = this.yp1 + len * sin(an7);

      stroke(this.R, this.g, this.b);
      line(this.xp2, this.yp2, this.xp6, this.yp6);
      line(this.xp7, this.yp7, this.xp3, this.yp3);
      line(this.xp2, this.yp2, this.xp4, this.yp4);
      line(this.xp5, this.yp5, this.xp3, this.yp3);
    }
    if (this.choice == 19) {
      // peor丹()

      this.xp1 = this.x_cen + len * cos(an2);
      this.yp1 = this.y_cen + len * sin(an2);

      this.xp2 = this.xp1 + len * cos(an6);
      this.yp2 = this.yp1 + len * sin(an6);

      this.xp3 = this.xp1 + len * cos(an4);
      this.yp3 = this.yp1 + len * sin(an4);

      this.xp4 = this.xp2 + this.r * cos(an3);
      this.yp4 = this.yp2 + this.r * sin(an3);

      this.xp5 = this.xp3 + this.r * cos(an3);
      this.yp5 = this.yp3 + this.r * sin(an3);

      stroke(this.R, this.g, this.b);
      line(this.xp2, this.yp2, this.xp1, this.yp1);
      line(this.xp1, this.yp1, this.xp3, this.yp3);
      line(this.xp2, this.yp2, this.xp4, this.yp4);
      line(this.xp5, this.yp5, this.xp3, this.yp3);
    }
    if (this.choice == 18) {
      // beorc()

      this.xp1 = this.x_cen + len2 * cos(an2);
      this.yp1 = this.y_cen + len2 * sin(an2);

      this.xp2 = this.x_cen + len2 * cos(an3);
      this.yp2 = this.y_cen + len2 * sin(an3);

      this.xp3 = this.x_cen + this.r/2.5 * cos(an4);
      this.yp3 = this.y_cen + this.r/2.5 * sin(an4);

      this.xp4 = this.x_cen + this.r/2.5 * cos(an5);
      this.yp4 = this.y_cen + this.r/2.5 * sin(an5);

      stroke(this.R, this.g, this.b);

      line(this.xp2, this.yp2, this.xp1, this.yp1);
      line(this.xp1, this.yp1, this.xp3, this.yp3);
      line(this.x_cen, this.y_cen, this.xp3, this.yp3);
      line(this.xp2, this.yp2, this.xp4, this.yp4);
      line(this.x_cen, this.y_cen, this.xp4, this.yp4);
    }
    if (this.choice == 17) {
      // Tiw()

      this.xp1 = this.x_cen + len2 * cos(an2);
      this.yp1 = this.y_cen + len2 * sin(an2);

      this.xp2 = this.x_cen + len2 * cos(an3);
      this.yp2 = this.y_cen + len2 * sin(an3);

      this.xp4 = this.xp1 + len2 * cos(an5);
      this.yp4 = this.yp1 + len2 * sin(an5);

      this.xp5 = this.xp1 + len2 * cos(an7);
      this.yp5 = this.yp1 + len2 * sin(an7);

      stroke(this.R, this.g, this.b);
      line(this.xp2, this.yp2, this.xp1, this.yp1);
      line(this.xp1, this.yp1, this.xp4, this.yp4);
      line(this.xp5, this.yp5, this.xp1, this.yp1);
    }
    if (this.choice == 16) {
      // sigel()

      this.xp2 = this.x_cen + len * cos(an4);
      this.yp2 = this.y_cen + len * sin(an4);

      this.xp3 = this.x_cen + len * cos(an7);
      this.yp3 = this.y_cen + len * sin(an7);

      this.xp4 = this.xp2 + len3 * cos(an3);
      this.yp4 = this.yp2 + len3 * sin(an3);

      this.xp5 = this.xp3 + len3 * cos(an2);
      this.yp5 = this.yp3 + len3 * sin(an2);


      stroke(this.R, this.g, this.b);
      line(this.xp3, this.yp3, this.xp2, this.yp2);
      line(this.xp3, this.yp3, this.xp5, this.yp5);
      line(this.xp2, this.yp2, this.xp4, this.yp4);
    }
    if (this.choice == 15) {
      // eolh()

      this.xp1 = this.x_cen + len2 * cos(an2);
      this.yp1 = this.y_cen + len2 * sin(an2);

      this.xp2 = this.x_cen + len2 * cos(an3);
      this.yp2 = this.y_cen + len2 * sin(an3);

      this.xp3 = this.xp1 + len * cos(an3);
      this.yp3 = this.yp1 + len * sin(an3);

      this.xp4 = this.xp3 + len2 * cos(an4);
      this.yp4 = this.yp3 + len2 * sin(an4);

      this.xp5 = this.xp3 + len2 * cos(an2+an4);
      this.yp5 = this.yp3 + len2 * sin(an2+an4);

      stroke(this.R, this.g, this.b);
      line(this.xp2, this.yp2, this.xp1, this.yp1);
      line(this.xp3, this.yp3, this.xp4, this.yp4);
      line(this.xp5, this.yp5, this.xp3, this.yp3);
    }
    if (this.choice == 14) {
      // peor丹()

      this.xp1 = this.x_cen + len2 * cos(an2);
      this.yp1 = this.y_cen + len2 * sin(an2);

      this.xp2 = this.x_cen + len2 * cos(an3);
      this.yp2 = this.y_cen + len2 * sin(an3);

      this.xp3 = this.xp1 + len * cos(an5);
      this.yp3 = this.yp1 + len * sin(an5);

      this.xp4 = this.xp2 + len * cos(an4);
      this.yp4 = this.yp2 + len * sin(an4);

      this.xp5 = this.xp4 + len * cos(an5);
      this.yp5 = this.yp4 + len * sin(an5);

      this.xp6 = this.xp3 + len * cos(an4);
      this.yp6 = this.yp3 + len * sin(an4);

      stroke(this.R, this.g, this.b);
      line(this.xp2, this.yp2, this.xp1, this.yp1);
      line(this.xp1, this.yp1, this.xp3, this.yp3);
      line(this.xp2, this.yp2, this.xp4, this.yp4);
      line(this.xp6, this.yp6, this.xp3, this.yp3);
      line(this.xp5, this.yp5, this.xp4, this.yp4);
    }
    if (this.choice == 13) {
      // eoh()

      this.xp1 = this.x_cen + len2 * cos(an2);
      this.yp1 = this.y_cen + len2 * sin(an2);

      this.xp2 = this.x_cen + len2 * cos(an3);
      this.yp2 = this.y_cen + len2 * sin(an3);

      this.xp3 = this.xp1 + len * cos(an5);
      this.yp3 = this.yp1 + len * sin(an5);

      this.xp4 = this.xp2 + len * cos( radians(this.a-135));
      this.yp4 = this.yp2 + len * sin( radians(this.a-135));

      stroke(this.R, this.g, this.b);
      line(this.xp2, this.yp2, this.xp1, this.yp1);
      line(this.xp1, this.yp1, this.xp3, this.yp3);
      line(this.xp2, this.yp2, this.xp4, this.yp4);
    }
    if (this.choice == 12) {
      // ger()

      this.xp1 = this.x_cen + len2 * cos(an2);
      this.yp1 = this.y_cen + len2 * sin(an2);

      this.xp2 = this.x_cen + len2 * cos(an3);
      this.yp2 = this.y_cen + len2 * sin(an3);

      this.xp3 = this.x_cen + len * cos(an2);
      this.yp3 = this.y_cen + len * sin(an2);

      this.xp4 = this.x_cen + len * cos(an);
      this.yp4 = this.y_cen + len * sin(an);

      this.xp5 = this.x_cen + len * cos(an3);
      this.yp5 = this.y_cen + len * sin(an3);

      this.xp6 = this.x_cen + len * cos(an1);
      this.yp6 = this.y_cen + len * sin(an1);

      stroke(this.R, this.g, this.b);
      line(this.xp2, this.yp2, this.xp1, this.yp1);
      line(this.xp4, this.yp4, this.xp3, this.yp3);
      line(this.xp4, this.yp4, this.xp5, this.yp5);
      line(this.xp6, this.yp6, this.xp3, this.yp3);
      line(this.xp6, this.yp6, this.xp5, this.yp5);
    }
    if (this.choice == 11) {
      // is()

      this.xp1 = this.x_cen + len2 * cos(an2);
      this.yp1 = this.y_cen + len2 * sin(an2);

      this.xp2 = this.x_cen + len2 * cos(an3);
      this.yp2 = this.y_cen + len2 * sin(an3);

      stroke(this.R, this.g, this.b);
      line(this.xp1, this.yp1, this.xp2, this.yp2)
    }
    if (this.choice == 10) {
      // nyd()

      this.xp1 = this.x_cen + len2 * cos(an2);
      this.yp1 = this.y_cen + len2 * sin(an2);

      this.xp2 = this.x_cen + len2 * cos(an3);
      this.yp2 = this.y_cen + len2 * sin(an3);

      this.xp3 = this.x_cen + len * cos(an5);
      this.yp3 = this.y_cen + len * sin(an5);

      this.xp4 = this.x_cen + len * cos(an2-radians(45));
      this.yp4 = this.y_cen + len * sin(an2-radians(45));

      stroke(this.R, this.g, this.b);
      line(this.xp1, this.yp1, this.xp2, this.yp2);
      line(this.xp3, this.yp3, this.xp4, this.yp4);
    }

    if (this.choice == 9) {
      // Haegl()

      this.xp1 = this.x_cen + len * cos(an);
      this.yp1 = this.y_cen + len * sin(an);

      this.xp2 = this.x_cen + len * cos(an1);
      this.yp2 = this.y_cen + len * sin(an1);

      this.xp3 = this.xp1 + len2 * cos(an2);
      this.yp3 = this.yp1 + len2 * sin(an2);

      this.xp4 = this.xp1 + len2 * cos(an3);
      this.yp4 = this.yp1 + len2 * sin(an3);

      this.xp5 = this.xp2 + len2 * cos(an2);
      this.yp5 = this.yp2 + len2 * sin(an2);

      this.xp6 = this.xp2 + len2 * cos(an3);
      this.yp6 = this.yp2 + len2 * sin(an3);

      this.xp7 = this.xp1 + len * cos(an3);
      this.yp7 = this.yp1 + len * sin(an3);

      this.xp8 = this.xp2 + len * cos(an2);
      this.yp8 = this.yp2 + len * sin(an2);

      stroke(this.R, this.g, this.b);
      line(this.xp3, this.yp3, this.xp4, this.yp4 );
      line(this.xp5, this.yp5, this.xp6, this.yp6);
      line(this.xp1, this.yp1, this.xp8, this.yp8);
      line(this.xp2, this.yp2, this.xp7, this.yp7);
    }

    if (this.choice == 1) {
      // Feoh()

      this.xp1 = this.x_cen + len2 * cos(an2);
      this.yp1 = this.y_cen + len2 * sin(an2);

      this.xp2 = this.x_cen + len2 * cos(an3);
      this.yp2 = this.y_cen + len2 * sin(an3);

      this.xp3 = this.x_cen + len2 * cos(an4);
      this.yp3 = this.y_cen + len2 * sin(an4);

      this.xp4 = this.x_cen + len * cos(an2);
      this.yp4 = this.y_cen + len * sin(an2);

      this.xp5 = this.xp4 + len2 * cos(an4);
      this.yp5 = this.yp4 + len2 * sin(an4);

      stroke(this.R, this.g, this.b);
      line(this.xp2, this.yp2, this.xp1, this.yp1);
      line(this.x_cen, this.y_cen, this.xp3, this.yp3);
      line(this.xp4, this.yp4, this.xp5, this.yp5);
    }
    if (this.choice == 2) {
      // Ur()

      this.xp1 = this.x_cen + len2 * cos(an2);
      this.yp1 = this.y_cen + len2 * sin(an2);

      this.xp2 = this.x_cen + len2 * cos(an3);
      this.yp2 = this.y_cen + len2 * sin(an3);

      this.xp3 = this.x_cen + len2 * cos(an5);
      this.yp3 = this.y_cen + len2 * sin(an5);

      stroke(this.R, this.g, this.b);
      line(this.xp2, this.yp2, this.xp1, this.yp1);
      line(this.xp1, this.yp1, this.xp3, this.yp3);
    }
    if (this.choice == 3) {
      // Born()

      this.xp1 = this.x_cen + len2 * cos(an2);
      this.yp1 = this.y_cen + len2 * sin(an2);

      this.xp2 = this.x_cen + len2 * cos(an3);
      this.yp2 = this.y_cen + len2 * sin(an3);

      this.xp3 = this.x_cen + len * cos(an2);
      this.yp3 = this.y_cen + len * sin(an2);

      this.xp4 = this.x_cen + len * cos(an);
      this.yp4 = this.y_cen + len * sin(an);

      this.xp5 = this.x_cen + len * cos(an3);
      this.yp5 = this.y_cen + len * sin(an3);


      stroke(this.R, this.g, this.b);
      line(this.xp2, this.yp2, this.xp1, this.yp1);
      line(this.xp4, this.yp4, this.xp3, this.yp3);
      line(this.xp4, this.yp4, this.xp5, this.yp5);
    }
    if (this.choice == 4) {
      // Os()

      this.xp1 = this.x_cen + len2 * cos(an2);
      this.yp1 = this.y_cen + len2 * sin(an2);

      this.xp2 = this.x_cen + len2 * cos(an3);
      this.yp2 = this.y_cen + len2 * sin(an3);

      this.xp3 = this.x_cen + (this.r/2*1.5) * cos(an4);
      this.yp3 = this.y_cen + (this.r/2*1.5) * sin(an4);

      this.xp4 = this.x_cen + (this.r/4*1.5) * cos(an4);
      this.yp4 = this.y_cen + (this.r/4*1.5) * sin(an4);

      this.xp5 = this.x_cen + len * cos(an2);
      this.yp5 = this.y_cen + len * sin(an2);

      this.xp6 = this.x_cen + len * cos(an);
      this.yp6 = this.y_cen + len * sin(an);

      this.xp7 = this.xp6 + (this.r/4*1.5) * cos(an4);
      this.yp7 = this.yp6 + (this.r/4*1.5) * sin(an4);


      stroke(this.R, this.g, this.b);
      line(this.xp2, this.yp2, this.xp1, this.yp1);
      line(this.xp1, this.yp1, this.xp4, this.yp4);
      line(this.xp4, this.yp4, this.xp3, this.yp3);
      line(this.xp5, this.yp5, this.xp6, this.yp6);
      line(this.xp7, this.yp7, this.xp6, this.yp6);
    }
    if (this.choice == 5) {
      // Rad()

      this.xp1 = this.x_cen + len2 * cos(an2);
      this.yp1 = this.y_cen + len2 * sin(an2);

      this.xp2 = this.x_cen + len2 * cos(an3);
      this.yp2 = this.y_cen + len2 * sin(an3);

      this.xp3 = this.x_cen + len2 * cos(an5);
      this.yp3 = this.y_cen + len2 * sin(an5);

      this.xp4 = this.x_cen + len2 * cos(an4);
      this.yp4 = this.y_cen + len2 * sin(an4);

      this.xp5 = this.x_cen + len * cos(an);
      this.yp5 = this.y_cen + len * sin(an);

      stroke(this.R, this.g, this.b);
      line(this.xp2, this.yp2, this.xp1, this.yp1);
      line(this.xp1, this.yp1, this.xp4, this.yp4);
      line(this.xp5, this.yp5, this.xp4, this.yp4);
      line(this.xp5, this.yp5, this.xp3, this.yp3);
    }

    if (this.choice == 6) {
      // Cen()

      this.xp1 = this.x_cen + len2 * cos(an2);
      this.yp1 = this.y_cen + len2 * sin(an2);

      this.xp2 = this.x_cen + len2 * cos(an3);
      this.yp2 = this.y_cen + len2 * sin(an3);

      this.xp3 = this.x_cen + len2 * cos(an5);
      this.yp3 = this.y_cen + len2 * sin(an5);

      stroke(this.R, this.g, this.b);
      line(this.xp2, this.yp2, this.xp1, this.yp1);
      line(this.x_cen, this.y_cen, this.xp3, this.yp3)
    }


    if (this.choice == 7) {
      // Gyfu()

      this.xp1 = this.x_cen + len2 * cos(radians(this.a-60));
      this.yp1 = this.y_cen + len2 * sin(radians(this.a-60));

      this.xp2 = this.x_cen + len2 * cos(radians(this.a+60));
      this.yp2 = this.y_cen + len2 * sin(radians(this.a+60));

      this.xp3 = this.x_cen + len2 * cos(radians(this.a-120));
      this.yp3 = this.y_cen + len2 * sin(radians(this.a-120));


      this.xp4 = this.x_cen + len2 * cos(radians(this.a+120));
      this.yp4 = this.y_cen + len2 * sin(radians(this.a+120));

      stroke(this.R, this.g, this.b);
      line(this.xp4, this.yp4, this.xp1, this.yp1);
      line(this.xp2, this.yp2, this.xp3, this.yp3);
    }
    if (this.choice == 8) {
      // Wynn()

      this.xp1 = this.x_cen + len2 * cos(an2);
      this.yp1 = this.y_cen + len2 * sin(an2);

      this.xp2 = this.x_cen + len2 * cos(an3);
      this.yp2 = this.y_cen + len2 * sin(an3);

      this.xp3 = this.x_cen + this.r/2.5 * cos(an4);
      this.yp3 = this.y_cen + this.r/2.5 * sin(an4);


      stroke(this.R, this.g, this.b);
      line(this.xp2, this.yp2, this.xp1, this.yp1);
      line(this.xp1, this.yp1, this.xp3, this.yp3);
      line(this.x_cen, this.y_cen, this.xp3, this.yp3);
    }
  }
}

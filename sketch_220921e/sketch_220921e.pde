ScoreCircle[] c;

void setup() {
  size(720, 720);
  textSize(70);
  for (int i = 0; i < 6; i++) {
    c[i] = new ScoreCircle(i, random(720), random(720));
  }
}


void draw() {
  background(255);

  for (int i = 0; i < 6; i++) {
    c[i].draw();
    if (!c[i].live()) {
      randomSeed(frameCount);
      c[i].init(random(999), random(720), random(720));
    }
  }
}

class ScoreCircle {
  float index;
  float x, y;
  float c;
  float f;
  float s;
  
  ScoreCircle(int i, float x, float y) {
    this.init((float)i, x, y);
  }

  void init(float i, float x, float y) {
    this.index = i;
    this.x = x;
    this.y = y;
    this.c = -random(60);
    this.f = random(120) + 120;
    this.s = random(1) + .5;
  }

  void draw() {
    randomSeed((long)this.index);

    this.c++;

    //  Circle Size
    float ratio = this.s;
    if (this.c < 0) {
      return;
    } else if (this.c < 60) {
      ratio *= sin(this.c / 60.0f * PI / 2.0f);
    } else if (this.c > this.f - 60) {
      ratio *= sin((this.f - this.c) / 60.0f * PI / 2.0f);
    }

    push();

    //  Score
    noFill();
    translate(this.x, this.y);
    scale(ratio, ratio);
    for (float i = 5; i > 0; i--) {
      circle(0, 0, i * 28 + 50);
    }
    fill(0);

    //  Score Fin
    push();
    rotate(this.index + PI / 2.0f - this.c * .01);
    text(String.fromCodePoint(0x1D102), -15, -40);
    pop();

    //  Score Start
    push();
    rotate(this.index + PI / 2.0f + PI / 8.0f - this.c * .01);
    text(String.fromCodePoint(random(1) < .5 ? 0x1D11E : 0x1D122), -15, -45);
    pop();

    //  Objects
    for (float r = this.index + PI / 3.0f; r < TAU + this.index - PI / 8.0f; r += PI / 8.0f) {
      push();
      rotate(r + PI / 2.0f - this.c * .01);

      switch(int(random(5)))
      {
        //  Note
      case 0:
      case 1:
      case 2:
        var base = int(random(4));
        for (var i = 0; i < random(2); i++) {
          text(String.fromCodePoint(0x1D15E + int(random(3))), -15, -25 - base * 7 - i * 14);

          //  Accidental
          if (random(1)<.1) {
            push();
            textSize(30);
            text(String.fromCodePoint(random(1) < .5 ? 0x266F : 0x266D), -35, -25 - base * 7 - i * 14);
            pop();
          }
        }
        break;
      case 3:  //  Rest
        text(String.fromCodePoint(0x1D13D + int(random(3))), -15, -36);
        break;
      case 4:  //  Space
        break;
      }
      pop();
    }
    pop();
  }

  boolean live() {
    return this.c < this.f;
  }
}

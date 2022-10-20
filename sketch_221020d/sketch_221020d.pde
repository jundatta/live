PImage pg;
int lastMSec;
void setup() {
  size(640, 480);
  pg = loadImage("IMG_0103.JPG");
  lastMSec = millis();
}
final int CYCLE = (int)(2.5 * 1000);  // [ms]
class Ease {
  float ease(float t) {
    return t;
  }
  Ease next() {
    return new Ease();
  }
}
class UpEase extends Ease {
  float ease(float t) {
    return easeInQuart(t);
  }
  Ease next() {
    return new BetweenEase();
  }
}
class BetweenEase extends Ease {
  float ease(float t) {
    return 1.0f;
  }
  Ease next() {
    return new DownEase();
  }
}
class DownEase extends Ease {
  float ease(float t) {
    return 1.0f - easeOutQuart(t);
  }
  Ease next() {
    return new UpEase();
  }
}
Ease ease = new UpEase();
void draw() {
  int mSec = millis();
  if (lastMSec + CYCLE < mSec) {
    lastMSec = mSec;
    ease = ease.next();
  }
  float t = map(mSec - lastMSec, 0, CYCLE, 0, 1.0);
  float r = ease.ease(t);
  background(0);
  tint(255, 255 * r);
  image(pg, 0, 0, width, height);
}

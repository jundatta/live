// こちらがオリジナルです。
// 【作者】Richard Bourneさん
// 【作品名】Day/Night Cycle
// https://openprocessing.org/sketch/1810553

CosmoObject sun, moon;
Star[] stars;
float star_alpha;
float cycle_length = 500 * 60;

void setup() {
  size(1112, 834);

  sun = new CosmoObject(1);
  moon = new CosmoObject(-1);
  moon.get_pos(0);
  stars = new Star[500];
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
    stars[i].get_pos(0);
    if (dist(stars[i].x, stars[i].y, moon.x, moon.y) < 250) {
      stars[i].renew();
    }
  }
}

void draw() {
  //Date today = new Date();
  //float t = today.getTime() % cycle_length;
  float t = millis() % cycle_length;
  sky_box_cycle(t);

  star_alpha = do_cycle_stars(t);
  for (int i = 0; i < stars.length; i++) {
    stars[i].get_pos(2 * PI * t / cycle_length);
    stars[i].draw(color(255, 255, 255, 255 * star_alpha));
  }
  sun.get_pos(2 * PI * t / (cycle_length));
  sun.draw();
  moon.get_pos(2 * PI * t / (cycle_length));
  moon.draw();
}

float do_cycle_stars(float time_point) {
  float cycle_point;
  if (time_point > 0.8 * cycle_length) {
    time_point += -cycle_length;
  }
  cycle_point = pow(4 * time_point / cycle_length - 0.95, 8);
  cycle_point = 1 - 0.75 * cycle_point;
  return cycle_point;
}

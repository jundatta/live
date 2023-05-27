// こちらがオリジナルです。
// 【作者】Richard Bourneさん
// 【作品名】Day/Night Cycle
// https://openprocessing.org/sketch/1810553

let sun, moon;
let stars, star_alpha;
let cycle_length = 500 * 60;

function setup() {
  createCanvas(1112, 834);

  sun = new CosmoObject(1);
  moon = new CosmoObject(-1);
  moon.get_pos(0);
  stars = [];
  for (let i = 0; i < 500; i++) {
    stars.push(new Star());
    stars[i].get_pos(0);
    if (dist(stars[i].x, stars[i].y, moon.x, moon.y) < 250) {
      stars[i].renew();
    }
  }
}

function keyPressed() {
  if (keyCode == ENTER)
    createCanvas(windowWidth, windowHeight);
}

function draw() {
  today = new Date();
  t = today.getTime() % cycle_length;
  sky_box_cycle(t);

  star_alpha = do_cycle_stars(t);
  for (let i = 0; i < stars.length; i++) {
    stars[i].get_pos(2 * PI * t / cycle_length);
    stars[i].draw(color(255, 255, 255, 255 * star_alpha));
  }
  sun.get_pos(2 * PI * t / (cycle_length));
  sun.draw();
  moon.get_pos(2 * PI * t / (cycle_length));
  moon.draw();



  function do_cycle_stars(time_point) {
    let cycle_point;
    if (time_point > 0.8 * cycle_length) {
      time_point += -cycle_length;
    }
    cycle_point = pow(4 * time_point / cycle_length - 0.95, 8);
    cycle_point = 1 - 0.75 * cycle_point;
    return cycle_point;
  }

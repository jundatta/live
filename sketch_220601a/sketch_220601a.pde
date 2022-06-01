// https://junkiyoshi.com/2022/02/11/

//--------------------------------------------------------------
void setup() {
  size(720, 720);
}

//--------------------------------------------------------------
void update() {
  //  randomSeed(39);
}

//--------------------------------------------------------------
void draw() {
  update();

  background(0);

  translate(width/2, height/2);

  var radius = 150;
  var span = 1;
  for (var deg = 0; deg < 360; deg += 36) {
    var location = new PVector(radius * cos(deg * DEG_TO_RAD), radius * sin(deg * DEG_TO_RAD));
    var left = new PVector(radius * cos((deg + span * 0.5) * DEG_TO_RAD), radius * sin((deg + span * 0.5) * DEG_TO_RAD));
    var right = new PVector(radius * cos((deg - span * 0.5) * DEG_TO_RAD), radius * sin((deg - span * 0.5) * DEG_TO_RAD));
    var loc3 = new PVector(location.x * 0.1, location.y * 0.1, frameCount * 0.025);
    var noise = openFrameworks.ofNoise(loc3.x, loc3.y, loc3.z);
    var noise_radius = map(noise,
      0, 1, radius * 0.2, radius * 0.8);
    println(deg + ":" + noise_radius + " [" + noise + "] " + loc3 + ", " + frameCount);
    var noise_location = new PVector(noise_radius * cos(deg * DEG_TO_RAD), noise_radius * sin(deg * DEG_TO_RAD));

    stroke(255);

    beginShape();
    vertex(left.x, left.y);
    vertex(noise_location.x + left.x, noise_location.y + left.y);
    vertex(noise_location.x + right.x, noise_location.y + right.y);
    vertex(right.x, right.y);
    endShape(CLOSE);

    var circle_radius = map(openFrameworks.ofNoise(location.x * 0.1, location.y * 0.1, frameCount * 0.025),
      0, 1, 0, radius * 0.8);
    var prev_circle_radius = map(openFrameworks.ofNoise(location.x * 0.1, location.y * 0.1, (frameCount - 3) * 0.025),
      0, 1, 0, radius * 0.8);
    var gap = abs(prev_circle_radius - circle_radius);
    var alpha = gap < 0.5 ? 0 : map(gap, 0.5, 6, 0, 255);

    stroke(255, alpha);
    circle(circle_radius * cos(deg * DEG_TO_RAD), circle_radius * sin(deg * DEG_TO_RAD), 2);
  }
  println();
}

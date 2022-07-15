// https://openprocessing.org/sketch/1180918

var sphere_radius = 200;
var num_rings = 10;
var delta_angle = 180 / num_rings;
var gap = 2.5;
// var num_lines = 20;

var num_lines_arr = [];

var line_rings = [];

function setup() {
  createCanvas(windowWidth, windowHeight, WEBGL);
  angleMode(DEGREES);
  background(0);
  // blendMode(ADD);

  for (var n=-90 + delta_angle; n<= 90 - 2 * delta_angle; n+=delta_angle) {
    // var num_lines = random(10, 20);
    // num_lines_arr.push(num_lines);

    var angle1 = n + gap;
    var angle2 = n + delta_angle - gap;
    // var min_n_lines = floor(random(5, 10));
    // var max_n_lines = floor(random(50, 150));

    var min_n_lines = 5;
    var max_n_lines = 60;


    var inc_t = random(0.1, 1);
    var phase = random(0, 360);
    var c = color(255);
    c.setAlpha(255);

    line_rings.push(new line_ring(angle1, angle2, min_n_lines, max_n_lines, inc_t, phase, c));
  }
}

function draw() {
  background(0);
  orbitControl(3, 3, 0.01);

  push();
  stroke(255, 255, 255);
  strokeWeight(2);
  noFill();
  rotateX(0.2 * frameCount);
  rotateY(1 * frameCount);
  rotateZ(0.3 * frameCount);
  sphere(80, 6, 4);
  pop();


  push();
  rotateX(- 0.1 * frameCount);
  rotateY(- 0.4 * frameCount);
  rotateZ(0.15 * frameCount);
  for (var ring of line_rings) {
    ring.draw();
  }
  pop();
}

class line_ring {
  constructor(angle1, angle2, min_n_lines, max_n_lines, inc_t, phase, c) {
    this.angle1 = angle1;
    this.angle2 = angle2;
    this.min_n_lines = min_n_lines;
    this.max_n_lines = max_n_lines;
    this.inc_t = inc_t;
    this.phase = phase;
    this.c = c;
  }

  draw() {
    var n_lines = map(sin(0.2 * this.inc_t * frameCount + this.phase), -1, 1, this.min_n_lines, this.max_n_lines);
    // var n_lines = this.max_n_lines;
    var a_inc = 360 / n_lines;

    for (var a=0; a<360; a+= a_inc) {

      var y1 = sphere_radius * sin(this.angle1);
      var y2 = sphere_radius * sin(this.angle2);

      // var factor = map(noise(frameCount * 0.005 + this.phase), 0.3, 0.7, 0.5, 1.5);
      var factor = map(sin(frameCount + this.angle1 * 2.5), -1, 1, 0.5, 1.5);
      // var factor = 1;

      var radius1 = sphere_radius * cos(this.angle1) * factor;
      var radius2 = sphere_radius * cos(this.angle2) * factor;

      var x1 = radius1 * cos(a);
      var x2 = radius2 * cos(a);

      var z1 = radius1 * sin(a);
      var z2 = radius2 * sin(a);

      push();
      rotateY(map(noise(0.002 * (frameCount) + this.phase), 0.3, 0.7, -180, 180));
      stroke(this.c);
      strokeWeight(a%8);
      noFill();
      line(x1, y1, z1, x2, y2, z2);
      // translate(x1, y1, z1);
      // rotateX(0.5 * frameCount + this.phase);
      // rotateY(0.2 * frameCount + this.phase);
      // rotateZ(0.7 * frameCount + this.phase)
      // sphere(20, 3, 2);
      // line(x1, y1, z1, x1, y2, z1);
      pop();
    }
  }
}

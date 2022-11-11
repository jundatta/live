t=0
  function setup() {
  createCanvas(720, 720, WEBGL);
}

function draw() {
  t+=.02
    _systemInit()
    background(0)
    noStroke()
    ambientLight(0)
    lightFalloff(0, 0, 0.0001)
    setShadowNormalVector(createVector(0, -1, 0))

    camera(cos(t/2)*300, -200+sin(t*.5)*200-100, sin(t/2)*300, 0, 0, 0, 0, 1, 0)

    addLight(255, 255, 255, createVector(cos(-t)*50, -100 + 50*sin(t/2), sin(-t)*50))
    addLight(255, 64, 64, createVector(cos(t)*200, -100, sin(t)*200))
    addLight(32, 32, 128, createVector(cos(t)*200, -10-abs(sin(t*5))*50, cos(t)*200))

    //  drawGround
    F=0
    for (x=-900; x<900; x+=100) {
    F++
      for (z=-900; z<900; z+=100) {
      F++
        push()
        translate(x, .1, z)
        rotateX(PI/2)
        fill((F%2)*192, 64, 192)
        square(0, 0, 100)
        pop()
    }
  }

  //  drawWall
  for (r=-PI/8; r<TAU+PI/8; r+=PI/4) {
    drawWall(cos(r)*150, 0-tan(sin(t*.5+r/2)/1.2)**8*50, sin(r)*150, 50, r+PI/2+(t%(TAU*2)>TAU?sin(t):0))
  }

  //  draw light wall
  drawLightGround()
}

function drawWall(x, y, z, l, rot) {
  push()
    ox = sin(-rot+PI)*0.1
    oz = cos(-rot+PI)*0.1
    quad(x+l*cos(rot)+ox, y, z+l*sin(rot)+oz,
    x+l*cos(rot)+ox, y-l*2, z+l*sin(rot)+oz,
    x-l*cos(rot)+ox, y-l*2, z-l*sin(rot)+oz,
    x-l*cos(rot)+ox, y, z-l*sin(rot)+oz, 2)

    rot+=PI
    　quad(x+l*cos(rot), y, z+l*sin(rot),
    x+l*cos(rot), y-l*2, z+l*sin(rot),
    x-l*cos(rot), y-l*2, z-l*sin(rot),
    x-l*cos(rot), y, z-l*sin(rot), 2)

    //  draw shadow
    fill(0, 128)
    for (i=0; i<_lights.length; i++) {
    push()
      shadowMatrix(_lights[i], _normalVector, createVector(0, -_wallCount/100, 0))
      _wallCount++

      quad(x+l*cos(rot), y, z+l*sin(rot),
      x+l*cos(rot), y-l*2, z+l*sin(rot),
      x-l*cos(rot), y-l*2, z-l*sin(rot),
      x-l*cos(rot), y, z-l*sin(rot), 2)
      pop()
  }
  pop()
}

var _wallCount = 0;
var _lights = [];
var _normalVector = 0;
function _systemInit() {
  _wallCount = 0;
  _lights=[];
}
function addLight(r, g, b, vector) {
  pointLight(r, g, b, vector)
    _lights.push(vector);

  push()
    noStroke()
    emissiveMaterial(r, g, b);
  fill(r, g, b)
    translate(vector)
    sphere(5)
    pop()
}
function setShadowNormalVector(normalVector) {
  _normalVector = normalVector;
}
function drawLightGround() {
  push()
    blendMode(ADD)
    fill(64)
    translate(0, -1, 0)
    rotateX(PI/2)
    plane(1000, 1000)
    pop()
}

// l : light position
// n : normal vector
// p : target point position
function shadowMatrix(l, n, p) {
  applyMatrix(getShadowMatrix(l, n, p));
}

// from @tercel_s
//  https://twitter.com/tercel_s/status/1589937810626469888
//  Thanks ;)
function getShadowMatrix(l, n, p) {
  var d = n.dot(createVector(l.x, l.y, l.z).sub(p));
  var np = n.dot(p);
  var nl = n.dot(l);

  return [-n.x * l.x + d, -n.x * l.y, -n.x * l.z, -n.x,
    -n.y * l.x, -n.y * l.y + d, -n.y * l.z, -n.y,
    -n.z * l.x, -n.z * l.y, -n.z * l.z + d, -n.z,
    np*l.x, np*l.y, np*l.z, nl];
}

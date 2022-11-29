// こちらがオリジナルです。
// 【作者】Richard Bourneさん
// 【作品名】Dark City
// https://openprocessing.org/sketch/1380184

let buildings = []
  let buildingCount = 150
  let v1
  let angle = 180
  var gradient = 100

  function setup() {
  createCanvas(1112, 834);
  isScale = width <= 1112
    buildingCount = max(floor(width/15), 100)
    pixelDensity(2);
  rotate(PI);
  translate(-width, -height);
  background(0);
  rectMode(CENTER)
    colorMode(HSB, 360, 100, 100)
    noStroke();
  background(220, 60, 70, 1)
    push()
    fill('red')
  d = {x:
width/2, y:
  height
}
v0 = createVector(d.x, d.y)
  v1 = createVector(0, height)
  translate(width, height)
  rotate(PI)
  // scale(0.5)

  for (let i=0; i<buildingCount; i++) {

  size = 1

    // w = 50*random(size*2.5, size*4)
    w = 45*random(size*2.5, size*3.5)
    h = 60*random(size*3, size*15)
    x = random(width)

    // outer lower
    y = height - h*0.25 + (abs(width*0.5-x)/width)*100
    v2 = createVector(x, y)

    buildings.push(new Building(v2, w, h, size))
}
buildings = buildings.sort((b1, b2)=> {
}
)
bgGradient(width/2, height*0.6)
  drawMoon(width*0.5, height*0.5)
  buildings.forEach(b=> {
  b.update()
    b.draw()
}
)

pop()
  }

function draw() {
  rotate(PI);
}

class Building {
  constructor(p, w, h, size) {
    this.x = p.x;
    this.y = p.y;
    this.size = size||1;
    this.w = w;
    this.h = h;
    this.wBtn = this.w*0.8
      this.mBtn = (this.w-this.wBtn)/2
      this.color = color(random(360), 50, 50)
      this.m = 5
      this.deg = 10
      this.inclination = random(
      -TWO_PI * this.deg/360,
      TWO_PI * this.deg/360
      )
      this.offset = this.inclination*360/2
      this.inclineDir = abs(this.inclination) === this.inclination
      this.color=random(180, 270)
      this.v = createVector(this.x - width/2, this.y + height)
      this.ang = v1.angleBetween(this.v);
  }

  update() {
    this.v = createVector(this.x - width/2, this.y + height)
      this.ang = v1.angleBetween(this.v)
      this.inclination = max(min(this.ang *1, 0.2), -0.2)
      this.offset = this.inclination > 0? max(this.inclination*360, 5): min(this.inclination*360, -5)
      this.inclineDir = abs(this.inclination) === this.inclination ? 1 : -1
  }
  draw() {
    let n = (this.w/150) * 0.85

      push()

      translate(this.x, this.y)
      if (isScale)scale(0.5)
      translate(0, this.h)
      rotate(-this.ang)
      translate(0, -this.h)

      shearX(this.inclination)

      // outline
      if (random()>0) {
      fill(0, 0.5)
        let borderW = 0.3
        quad(
        -this.w/2-borderW, -this.h/2-borderW,
        this.w/2+borderW, -this.h/2-borderW,
        this.w/2-this.mBtn+borderW, this.h/2+borderW,
        -this.w/2+this.mBtn-borderW, this.h/2+borderW,
        )
        quad(
        -this.w/2-this.offset-borderW, -this.h/2-abs(this.offset*n)-borderW,
        this.w/2-this.offset+borderW, -this.h/2-abs(this.offset*n)-borderW,
        this.w/2-this.offset-this.mBtn*2+borderW, this.h/2-abs(this.offset*n)+borderW,
        -this.w/2-this.offset+this.mBtn*2-borderW, this.h/2-abs(this.offset*n)+borderW,
        )
        quad(
        -this.w/2-this.offset-borderW, -this.h/2 -abs(this.offset*n)-borderW,
        this.w/2 - this.offset+borderW, -this.h/2 -abs(this.offset*n)-borderW,
        this.w/2 +borderW, -this.h/2-borderW,
        -this.w/2-borderW, -this.h/2-borderW,
        )
    }

    // side and bottomback
    fill(this.color, 35, 30)
      quad(
      -this.w/2-this.offset, -this.h/2-abs(this.offset*n),
      this.w/2-this.offset, -this.h/2-abs(this.offset*n),
      this.w/2-this.offset-this.mBtn*2, this.h/2-abs(this.offset*n),
      -this.w/2-this.offset+this.mBtn*2, this.h/2-abs(this.offset*n),
      )

      quad(
      -this.w/2-this.offset+this.mBtn*2, this.h/2-abs(this.offset*n)-1,
      this.w/2-this.offset-this.mBtn*2, this.h/2-abs(this.offset*n)-1,
      this.w/2-this.mBtn, this.h/2,
      -this.w/2+this.mBtn, this.h/2
      )

      // top
      fill(this.color, 35, 50)
      quad(
      -this.w/2-this.offset, -this.h/2 -abs(this.offset*n),
      this.w/2 - this.offset, -this.h/2 -abs(this.offset*n),
      this.w/2, -this.h/2,
      -this.w/2, -this.h/2,
      )

      //body
      fill(this.color, 30, 20)
      quad(
      -this.w/2, -this.h/2,
      this.w/2, -this.h/2,
      this.w/2-this.mBtn, this.h/2,
      -this.w/2+this.mBtn, this.h/2,
      )

      drawBtnDarkLayer(0, 0, 0.000005)

      //windows
      let windowClr = color(random(30, 65), 100, 100)
      let oft = 0
      for (let i=30; i<this.w-this.m*4; i+=20) {
      let h = random(4, 8)
        for (let j=20; j<this.h-this.m*6; j+=15) {
        random()>0.8 ? fill(windowClr): fill(0, 60, 10)
          rect(
          i - this.w/2 + this.inclineDir*this.m + 2,
          j - this.h/2 + this.inclineDir*this.m + 2*j/(this.w-this.m*6),
          10, h)
      }
      oft+=2
    }

    shearX(-this.inclination)
      pop()
  }
}

function drawArrow(base, vec, myColor) {
  push();
  stroke(myColor);
  strokeWeight(3);
  fill(myColor);
  translate(base.x, base.y);
  line(0, 0, vec.x, vec.y);
  rotate(vec.heading());
  let arrowSize = 7;
  translate(vec.mag() - arrowSize, 0);
  triangle(0, arrowSize / 2, 0, -arrowSize / 2, arrowSize, 0);
  pop();
}
function drawMoon(x, y) {
  push()
    translate(x, y)
    for (var moonlight = gradient; moonlight > 0; moonlight = moonlight - 1) {
    var moonlightSize = map(moonlight, gradient*1, 0, min(width*0.8, 800), 10); //size of moonlight
    moonlightSize += sin(frameCount/100)*50
      noStroke();
    fill(60, 60, 85, 1 - moonlight / gradient)
      ellipse(0, 0, moonlightSize, moonlightSize); //position of moonlight
  } //moonlight
  pop()
}
function bgGradient(x, y) {
  push()
    translate(x, y)
    scale(2)

    for (var moonlight = gradient; moonlight > 0; moonlight = moonlight - 1) {
    var moonlightSize = map(moonlight*1.5, gradient*1, 0, width/2, 100); //size of moonlight
    noStroke();
    fill(220, 60, 85, 1 - moonlight / gradient)
      ellipse(0, 0, moonlightSize, moonlightSize); //position of moonlight
  } //moonlight
  pop()
}

function drawBtnDarkLayer(x, y, fade) {
  push()
    translate(x, y)
    scale(2)
    let a = 1
    for (var moonlight = gradient; moonlight > 0; moonlight = moonlight - 1) {
    var moonlightSize = map(moonlight*1.5, gradient*1, 0, 100, width); //size of moonlight
    noStroke();
    fill(5, fade*a)
      ellipse(0, 0, moonlightSize*2, moonlightSize); //position of moonlight
    a+=3
  } //moonlight
  pop()
}

function drawGradientLayer(x, y) {
  push()
    translate(x, y)
    scale(2)
    let a = 1
    for (var moonlight = gradient; moonlight > 0; moonlight = moonlight - 1) {
    var moonlightSize = map(moonlight*1.5, gradient*1, 0, 100, max(height, width)); //size of moonlight
    noStroke();
    fill(100, 0.00003*a)
      ellipse(0, 0, moonlightSize, moonlightSize); //position of moonlight
    a+=3
  } //moonlight
  pop()
}

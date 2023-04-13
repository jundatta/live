// こちらがオリジナルです。
// 【作者】KomaTebeさん
// 【作品名】DarkCity21
// https://openprocessing.org/sketch/1405250

t = 0
  let c = 0
  let z = 0
  let clouds = []
  setup = _ => {
  createCanvas(W = 500, 500, WEBGL)
    for (let i = 0; i < 10; i++) {
    clouds.push( {
    x:
      random(-300, 300),
      y:
      random(-10, -200),
      zinc:
      random(2) + 0.2,
      w:
      random(50, 200),
      h:
      random(100, 400),
      z:
      -300
    }
    );
  }
}
draw = _ => {
  background(0);
  noStroke()
    for (j = 0; j < 100; j++) {
    for (i = -20; i < 20; i++) {
      push()
        let h = noise(2 + i * 0.5, (z + j) * 0.5) * 250
        fill(j * 2.55)
        translate(10 + i * 20, -h / 2 + 250, -j * 20 + 330 - c)
        box(20, h, 20)
        pop()
    }
  }

  for (let i = 0; i < 10; i++) {
    push();
    translate(clouds[i].x, clouds[i].y, clouds[i].z);
    rotateX(HALF_PI);
    fill(80);
    stroke(100);
    rect(0, 0, clouds[i].w, clouds[i].h);
    clouds[i].z += clouds[i].zinc;
    if (clouds[i].z > 400) {
      clouds[i].z = -300;
      clouds[i].zinc = random(2) + 0.2;
    }
    pop();
  }

  t++
    fill(255)
    translate(0, -500, -3000)
    sphere(1000, 20, 20)
    blendMode(ADD)
    c = (c - 2) % 20
    if (c == 0) z++
}

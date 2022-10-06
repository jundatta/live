// こちらがオリジナルです。
// 【作者】KomaTebeさん
// 【作品名】noPersp03
// https://openprocessing.org/sketch/1276293

//document.querySelector('body').style.backgroundColor = '#003d4e';

let g;
function setup() {
  g = createCanvas((w = 600), w, WEBGL).GL;
  camera(0, 300, -500, 0, 0, 0, 0, 1, 0);
}

function draw() {
  background(0, 61, 78);
  orbitControl(2, 2, 0);
  rotateY(frameCount * 0.01);
  rotateX(frameCount * 0.005);
  rotateZ(frameCount * 0.02);
  ambientLight(0, 10, 0);
  specularMaterial(255, 255, 255);
  pointLight(100, 255, 10, -500, 1000, -500);
  pointLight(0, 77, 125, 500, -1000, 500);
  strokeWeight(3);
  stroke(130);
  noStroke();
  frustum(width, -width, height, -height, -1000, 10);
  g.enable(g.CULL_FACE);
  g.cullFace(g.BACK);

  box(100);
  translate(-100, -100, -100)
    box(100);
  translate(200, 0, 0)
    box(100);
  translate(0, 0, 200)
    box(100);
  translate(-200, 0, 0)
    box(100);
  //
  translate(0, 200, -200)
    box(100);
  translate(200, 0, 0)
    box(100);
  translate(0, 0, 200)
    box(100);
  translate(-200, 0, 0)
    box(100);
}

let models = {};
let arch = {};
let ui = {
  shading:
0,
  isLineJittering:
true,
  isLineExtended:
true
  }; // 0: shaded, 1: filled, 2: lines only, 3: darker
let materials;
let bgCol = [
  [234, 219, 200],
  [234, 219, 200],
  [234, 219, 200],
  [37, 73, 99]
];
let strCol = [0, 0, 0, 255];
let gui;

function setup() {
  createCanvas(windowWidth, windowHeight, WEBGL);
  cam = createCamera();
  cam.perspective(PI * 0.48, width / height);
  cam.setPosition(0, -50, 500);
  cam.lookAt(0, -200, 0);
  frameRate(12);

  gui = new dat.gui.GUI();
  gui.add(ui, 'shading', {
  shaded:
    0,
    white:
    1,
    "lines only":
    2,
    inverted:
    3
  }
  );
  gui.add(ui, 'isLineExtended');
  gui.add(ui, 'isLineJittering');
  gui.add(ui, 'generate');

  models.floor = getFloorData();
  models.trees = getTreesData();
  models.base = getBaseData();
  models.door = getBasedoorData();
  models.win = getBasewinsData();
  models.roof = getRoofData();
  models.roofaddon = getRoofaddonData();
  models.top = getTopData();
  materials = getMaterialsData();

  ui.generate();
}

ui.generate = function() {
  arch = {};

  arch.floor = 0; //Math.floor(Math.random() * models.floor.length);

  if (models.floor[arch.floor].next) {
    for (let key in models.floor[arch.floor].next) {
      arch[key] = getNext(models.floor[arch.floor].next[key], key);
    }
  }

  arch.base = Math.floor(Math.random() * models.base.length);

  if (models.base[arch.base].next) {
    for (let key in models.base[arch.base].next) {
      arch[key] = getNext(models.base[arch.base].next[key], key);
      console.log("baseのnextのメンバー:" + key + "値: " + arch[key]);
    }
  }

  if (models.roof[arch.roof].next) {
    for (let key in models.roof[arch.roof].next) {
      arch[key] = getNext(models.roof[arch.roof].next[key], key);
      console.log("roofのnextのメンバー:" + key + "値: " + arch[key]);
    }
  }
}

function getNext(pArray, pKey) {
  let myName = pArray[Math.floor(Math.random() * pArray.length)];
  let myIdx = 1000;
  for (let i = 0; i < models[pKey].length; i += 1) {
    if (models[pKey][i].id === myName) {
      myIdx = i;
      break;
    }
  }
  return myIdx;
}

function draw() {
  // background(234, 219, 200);
  background(bgCol[ui.shading][0], bgCol[ui.shading][1], bgCol[ui.shading][2]);
  orbitControl(3, 2, 0);
  if (arch.floor < 1000) drawShape(models.floor[arch.floor]);
  if (arch.trees < 1000) drawShape(models.trees[arch.trees]);
  if (arch.base < 1000) drawShape(models.base[arch.base]);
  if (arch.door < 1000) drawShape(models.door[arch.door]); // drawShape(xbasedoor[1]);
  if (arch.win < 1000) drawShape(models.win[arch.win]); // drawShape(xbasewins[3]);
  if (arch.roof < 1000) drawShape(models.roof[arch.roof]); // drawShape(xroof[0]);
  if (arch.roofaddon < 1000) drawShape(models.roofaddon[arch.roofaddon]); // drawShape(xroofaddon[0]);
  if (arch.top < 1000) drawShape(models.top[arch.top]); // drawShape(xtop[1]);
}

function drawShape(pShape) {
  let m = 70;
  noStroke();
  for (let i = 0; i < pShape.data.length; i += 1) {
    pShape.data[i].tess ? beginShape(TESS) : beginShape();
    for (let j = 0; j < pShape.data[i].vertices.length; j += 1) {
      let myMat = materials[ui.shading][pShape.data[i].mat];
      fill(myMat[0], myMat[1], myMat[2], myMat[3]);
      if (!pShape.data[i].mat) noFill();
      vertex(pShape.data[i].vertices[j][0] * m, pShape.data[i].vertices[j][1] * m, pShape.data[i].vertices[j][2] * m);
    }
    endShape();
  }

  for (let i = 0; i < pShape.data.length; i += 1) {
    pShape.data[i].vertices.push(pShape.data[i].vertices[0]);
    for (let j = 0; j < pShape.data[i].vertices.length - 1; j += 1) {
      push();
      strokeWeight(3);
      stroke(strCol[ui.shading]);
      let p1 = createVector(pShape.data[i].vertices[j][0] * m, pShape.data[i].vertices[j][1] * m, pShape.data[i].vertices[j][2] * m);
      let p2 = createVector(pShape.data[i].vertices[j + 1][0] * m, pShape.data[i].vertices[j + 1][1] * m, pShape.data[i].vertices[j + 1][2] * m);
      let p3 = p5.Vector.sub(p2, p1);
      let rnd = 0.15;
      if (ui.isLineJittering) {
        rnd = Math.random() * 0.15;
        let prnd1 = createVector(Math.random() * 2 - 1, Math.random() * 2 - 1, Math.random() * 2 - 1);
        let prnd2 = createVector(Math.random() * 2 - 1, Math.random() * 2 - 1, Math.random() * 2 - 1);

        p1.add(prnd1);
        p2.add(prnd2);
      }
      let r1 = createVector(rnd, rnd, rnd);
      p3.mult(r1);
      if (ui.isLineExtended) {
        p2.add(p3);
        p1.sub(p3);
      }

      line(p1.x, p1.y, p1.z, p2.x, p2.y, p2.z);
      pop();
    }
    pShape.data[i].vertices.pop();
  }
}

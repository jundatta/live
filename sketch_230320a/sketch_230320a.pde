// オリジナルはこちらです。
// 【作者】Richard Bourneさん
// 【作品名】Cone Spheres
// https://openprocessing.org/sketch/1782503

class Triangle {
  PVector t[3];
  Triangle(float x1, float y1, float z1,
    float x2, float y2, float z2, float x3, float y3, float z3) {
    t[0] = new PVector(x1, y1, z1);
    t[1] = new PVector(x2, y2, z2);
    t[2] = new PVector(x3, y3, z3);
  }
}
float _count;
final float _limitCount = 3;
final int _numSphere = 5;
BaseTriangle _bt[] = new BaseTriangle[_numSphere];
PVector _InitRot = new PVector();
PVector _InitNoiseXYZ = new PVector();
PVector _NoiseRangeXYZ = new PVector();

final float _noiseStepT = 0.008f;
float _sphereR;
float _maxAreaR;
float _maxSphereR;

void setup() {
  size(1112, 834, WEBGL);
  colorMode(HSB, 255, 255, 255, 255);
  noStroke();

  _maxAreaR = width/2.5f;
  _maxSphereR = width/5.0f;
  for (int i = 0; i < _numSphere; i++) {
    float maxCentX = _maxAreaR - _maxSphereR;
    float maxCentY = _maxAreaR - _maxSphereR;
    float maxCentZ = _maxAreaR - _maxSphereR;
    PVector sphereCenter = new PVector(maxCentX*random(-1, 1), maxCentY*random(-1, 1), maxCentZ*random(-1, 1));
    _bt[i] = new BaseTriangle(_maxSphereR, sphereCenter);
  }

  for (let i = 0; i < 3; i++) {
    _aryInitNoiseXYZ[i] = random(100);
    _aryInitRot[i] = random(360);
  }
  _aryNoiseRangeXYZ[0] = 1.0/1.5/2;
  _aryNoiseRangeXYZ[1] = 1.0/1.5/2;
  _aryNoiseRangeXYZ[2] = 1.0/1.5/2;

  _sphereR = width/1000;

  _count = 0;
}

function draw() {
  //background(200);
  background(0);
  directionalLight(105, 0, 150, -1, 1, -1);
  specularMaterial(0);

  rotateX(_aryInitRot[0] + _count/300);
  rotateY(_aryInitRot[1] + _count/100);
  rotateZ(_aryInitRot[2] + _count/200);
  let freq = 4;
  let d = 2;
  for (let j = 0; j < _numSphere; j++) {
    for (let i = 0; i < _aryTriangle[j].length; i++) {
      let noiseVal = sin(freq * 2*PI * noise(
        _aryInitNoiseXYZ[0] + _aryNoiseRangeXYZ[0] * _aryTriCenter[j][i][0] / _maxAreaR,
        _aryInitNoiseXYZ[1] + _aryNoiseRangeXYZ[1] * _aryTriCenter[j][i][1] / _maxAreaR - _noiseStepT * _count,
        _aryInitNoiseXYZ[2] + _aryNoiseRangeXYZ[2] * _aryTriCenter[j][i][2] / _maxAreaR
        ))**d * 1 + 0;

      let threshold = 0.1;
      let ratio = (noiseVal-threshold)/(1-threshold);
      if (noiseVal > threshold) {
        push();
        translate(_arySphereCenter[j][0], _arySphereCenter[j][1], _arySphereCenter[j][2]);
        rotateZ(-PI/2);
        rotateX(_aryCentRotYZ[j][i][0]);
        rotateZ(_aryCentRotYZ[j][i][1]);
        let coneRatio = 0.07;
        let coneHeight = _sphereR * ratio;
        translate(0, _maxSphereR, 0);
        translate(0, coneHeight/2, 0);
        fill(i%255, 255, 255);
        cone(coneHeight / coneRatio, coneHeight);
        pop();
      }
    }
  }

  _count ++;
}

class BaseTriangle {
  ArrayList<Triangle> _aryTriangle;
  ArrayList<PVector> _aryTriCenter;
  ArrayList<PVector> _aryCentRotYZ;
  PVector _SphereCenter;
  BaseTriangle(float r, PVector aryCentXYZ) {
    _aryTriangle = new ArrayList();
    _aryTriCenter = new ArrayList();
    _aryCentRotYZ = new ArrayList();
    _SphereCenter = aryCentXYZ;
    Triangle[] triangles = new Triangle[8];
    triangles[0] = new Triangle(r+aryCentXYZ.x, 0+aryCentXYZ.y, 0+aryCentXYZ.z, 0+aryCentXYZ.x, 0+aryCentXYZ.y, r+aryCentXYZ.z, 0+aryCentXYZ.x, -r+aryCentXYZ.y, 0+aryCentXYZ.z);
    triangles[1] = new Triangle(-r+aryCentXYZ.x, 0+aryCentXYZ.y, 0+aryCentXYZ.z, 0+aryCentXYZ.x, 0+aryCentXYZ.y, r+aryCentXYZ.z, 0+aryCentXYZ.x, -r+aryCentXYZ.y, 0+aryCentXYZ.z);
    triangles[2] = new Triangle(r+aryCentXYZ.x, 0+aryCentXYZ.y, 0+aryCentXYZ.z, 0+aryCentXYZ.x, 0+aryCentXYZ.y, -r+aryCentXYZ.z, 0+aryCentXYZ.x, -r+aryCentXYZ.y, 0+aryCentXYZ.z);
    triangles[3] = new Triangle(-r+aryCentXYZ.x, 0+aryCentXYZ.y, 0+aryCentXYZ.z, 0+aryCentXYZ.x, 0+aryCentXYZ.y, -r+aryCentXYZ.z, 0+aryCentXYZ.x, -r+aryCentXYZ.y, 0+aryCentXYZ.z);
    triangles[4] = new Triangle(r+aryCentXYZ.x, 0+aryCentXYZ.y, 0+aryCentXYZ.z, 0+aryCentXYZ.x, 0+aryCentXYZ.y, r+aryCentXYZ.z, 0+aryCentXYZ.x, r+aryCentXYZ.y, 0+aryCentXYZ.z);
    triangles[5] = new Triangle(-r+aryCentXYZ.x, 0+aryCentXYZ.y, 0+aryCentXYZ.z, 0+aryCentXYZ.x, 0+aryCentXYZ.y, r+aryCentXYZ.z, 0+aryCentXYZ.x, r+aryCentXYZ.y, 0+aryCentXYZ.z);
    triangles[6] = new Triangle(r+aryCentXYZ.x, 0+aryCentXYZ.y, 0+aryCentXYZ.z, 0+aryCentXYZ.x, 0+aryCentXYZ.y, -r+aryCentXYZ.z, 0+aryCentXYZ.x, r+aryCentXYZ.y, 0+aryCentXYZ.z);
    triangles[7] = new Triangle(-r+aryCentXYZ.x, 0+aryCentXYZ.y, 0+aryCentXYZ.z, 0+aryCentXYZ.x, 0+aryCentXYZ.y, -r+aryCentXYZ.z, 0+aryCentXYZ.x, r+aryCentXYZ.y, 0+aryCentXYZ.z);
    let countObj = 0;
    for (let i = 0; i < triangles.length; i++) {
      let newSubTriangle = new SubTriangle(triangles[i], countObj + 1, r, index);
    }
  }
}

class SubTriangle {
  constructor(triangle, countObj, r, index) { //triangle = [[x1, y1, z1], [x2, y2, z2], [x3, y3, z3]]
    this.countObj = countObj;
    if (this.countObj <= _limitCount) {
      this.XYZ1 = triangle[0];
      this.XYZ2 = triangle[1];
      this.XYZ3 = triangle[2];
      this.divide(this.XYZ1, this.XYZ2, this.XYZ3, r, index);
      let newTriangle1 = [this.XYZ1, this.newMidXYZ_1_2, this.newMidXYZ_3_1];
      let newTriangle2 = [this.newMidXYZ_1_2, this.XYZ2, this.newMidXYZ_2_3];
      let newTriangle3 = [this.newMidXYZ_3_1, this.newMidXYZ_2_3, this.XYZ3];
      let newTriangle4 = [this.newMidXYZ_1_2, this.newMidXYZ_2_3, this.newMidXYZ_3_1];
      this.triangles = [newTriangle1, newTriangle2, newTriangle3, newTriangle4];
      for (let i = 0; i < this.triangles.length; i++) {
        let newSubTriangle = new SubTriangle(this.triangles[i], this.countObj + 1, r, index);
      }
    } else {
      this.addCenter(triangle, index); //[[x1, y1, z1], [x2, y2, z2], [x3, y3, z3]] -> [ave.x, ave.y, ave.z]
      this.addCentRotYZ(index); //angle X-Z plane, angle X-Y plane
      _aryTriangle[index].push(triangle);
    }
  }
  addCenter(triangle, index) {
    let centX = 0;
    let centY = 0;
    let centZ = 0;
    for (let i = 0; i < triangle.length; i++) {
      centX += triangle[i][0];
      centY += triangle[i][1];
      centZ += triangle[i][2];
    }
    centX /= triangle.length;
    centY /= triangle.length;
    centZ /= triangle.length;
    _aryTriCenter[index].push([centX, centY, centZ]);
  }
  addCentRotYZ(index) {
    for (let i = 0; i < _aryTriCenter[index].length; i++) {
      let rotY = atan2(
        _aryTriCenter[index][i][2] - _arySphereCenter[index][2],
        _aryTriCenter[index][i][0] - _arySphereCenter[index][0]);
      let rx = (
        (_aryTriCenter[index][i][2] - _arySphereCenter[index][2])**2 +
        (_aryTriCenter[index][i][0] - _arySphereCenter[index][0])**2
        )**0.5;
      let ry = _aryTriCenter[index][i][1] - _arySphereCenter[index][1];
      let rotZ = atan2(ry, rx);
      _aryCentRotYZ[index][i] = [rotY, rotZ];
    }
  }
  divide(XYZ1, XYZ2, XYZ3, r, index) {
    let midXYZ_1_2 = [
      (XYZ1[0] + XYZ2[0])/2,
      (XYZ1[1] + XYZ2[1])/2,
      (XYZ1[2] + XYZ2[2])/2
    ];
    let midXYZ_2_3 = [
      (XYZ2[0] + XYZ3[0])/2,
      (XYZ2[1] + XYZ3[1])/2,
      (XYZ2[2] + XYZ3[2])/2
    ];
    let midXYZ_3_1 = [
      (XYZ3[0] + XYZ1[0])/2,
      (XYZ3[1] + XYZ1[1])/2,
      (XYZ3[2] + XYZ1[2])/2
    ];
    let distMid_1_2 = (
      (midXYZ_1_2[0] - _arySphereCenter[index][0])**2 +
      (midXYZ_1_2[1] - _arySphereCenter[index][1])**2 +
      (midXYZ_1_2[2] - _arySphereCenter[index][2])**2)**0.5;
    let distMid_2_3 = (
      (midXYZ_2_3[0] - _arySphereCenter[index][0])**2 +
      (midXYZ_2_3[1] - _arySphereCenter[index][1])**2 +
      (midXYZ_2_3[2] - _arySphereCenter[index][2])**2)**0.5;
    let distMid_3_1 = (
      (midXYZ_3_1[0] - _arySphereCenter[index][0])**2 +
      (midXYZ_3_1[1] - _arySphereCenter[index][1])**2 +
      (midXYZ_3_1[2] - _arySphereCenter[index][2])**2)**0.5;
    this.newMidXYZ_1_2 = [
      (midXYZ_1_2[0] - _arySphereCenter[index][0]) / distMid_1_2 * r + _arySphereCenter[index][0],
      (midXYZ_1_2[1] - _arySphereCenter[index][1]) / distMid_1_2 * r + _arySphereCenter[index][1],
      (midXYZ_1_2[2] - _arySphereCenter[index][2]) / distMid_1_2 * r + _arySphereCenter[index][2]
    ];
    this.newMidXYZ_2_3 = [
      (midXYZ_2_3[0] - _arySphereCenter[index][0]) / distMid_2_3 * r + _arySphereCenter[index][0],
      (midXYZ_2_3[1] - _arySphereCenter[index][1]) / distMid_2_3 * r + _arySphereCenter[index][1],
      (midXYZ_2_3[2] - _arySphereCenter[index][2]) / distMid_2_3 * r + _arySphereCenter[index][2]
    ];
    this.newMidXYZ_3_1 = [
      (midXYZ_3_1[0] - _arySphereCenter[index][0]) / distMid_3_1 * r + _arySphereCenter[index][0],
      (midXYZ_3_1[1] - _arySphereCenter[index][1]) / distMid_3_1 * r + _arySphereCenter[index][1],
      (midXYZ_3_1[2] - _arySphereCenter[index][2]) / distMid_3_1 * r + _arySphereCenter[index][2]
    ];
  }
}

function mouseReleased() {
  _aryTriangle = [];
  _aryTriCenter = [];
  _aryInitRot = [];
  _aryCentRotYZ = [];
  _arySphereCenter = [];
  _aryInitNoiseXYZ = [];
  _aryNoiseRangeXYZ = [];

  for (let i = 0; i < _numSphere; i++) {
    let maxCentX = _maxAreaR - _maxSphereR;
    let maxCentY = _maxAreaR - _maxSphereR;
    let maxCentZ = _maxAreaR - _maxSphereR;
    _arySphereCenter[i] = [maxCentX*random(-1, 1), maxCentY*random(-1, 1), maxCentZ*random(-1, 1)];
    let createTriangle = new BaseTriangle(_maxSphereR, i, _arySphereCenter[i]);
  }

  for (let i = 0; i < 3; i++) {
    _aryInitNoiseXYZ[i] = random(100);
    _aryInitRot[i] = random(360);
  }
  _aryNoiseRangeXYZ[0] = 1.0/1.5/2;
  _aryNoiseRangeXYZ[1] = 1.0/1.5/2;
  _aryNoiseRangeXYZ[2] = 1.0/1.5/2;

  _count = 0;
}

// https://openprocessing.org/sketch/1251077

class Models {
  ArrayList<Floor> floor;
  ArrayList<Trees> trees;
  ArrayList<Base> base;
  ArrayList<Door> door;
  ArrayList<Win> win;
  ArrayList<Roof> roof;
  ArrayList<Roofaddon> roofaddon;
  ArrayList<Top> top;
}
Models models = new Models();

class Arch {
  int floor;
  int trees;
  int base;
  int door;
  int win;
  int roof;
  int roofaddon;
  int top;
}
Arch arch;

ArrayList<IntList> materials;
color bgCol = color(234, 219, 200);
color strCol = color(0);

void setup() {
  size(1112, 834, P3D);

  models.floor = getFloorData();
  models.trees = getTreesData();
  models.base = getBaseData();
  models.door = getBasedoorData();
  models.win = getBasewinsData();
  models.roof = getRoofData();
  models.roofaddon = getRoofaddonData();
  models.top = getTopData();
  materials = getMaterialsData();

  generate();
}

void generate() {
  arch = new Arch();

  arch.floor = 0; //Math.floor(Math.random() * models.floor.length);

  arch.trees = 1000;
  if (0 < models.floor.get(arch.floor).next.trees.size()) {
    arch.trees = getNextTrees(models.floor.get(arch.floor).next.trees, models.trees);
  }

  arch.base = (int)Math.floor(Math.random() * models.base.size());

  arch.door = 1000;
  if (0 < models.base.get(arch.base).next.door.size()) {
    arch.door = getNextDoor(models.base.get(arch.base).next.door, models.door);
  }
  arch.win = 1000;
  if (0 < models.base.get(arch.base).next.win.size()) {
    arch.win = getNextWin(models.base.get(arch.base).next.win, models.win);
  }
  arch.roof = 1000;
  if (0 < models.base.get(arch.base).next.roof.size()) {
    arch.roof = getNextRoof(models.base.get(arch.base).next.roof, models.roof);
  }

  arch.roofaddon = 1000;
  if (0 < models.roof.get(arch.roof).next.roofaddon.size()) {
    arch.roofaddon = getNextRoofaddon(models.roof.get(arch.roof).next.roofaddon, models.roofaddon);
  }
  arch.top = 1000;
  if (0 < models.roof.get(arch.roof).next.top.size()) {
    arch.top = getNextTop(models.roof.get(arch.roof).next.top, models.top);
  }
}

int getNextTrees(ArrayList<String> pArray, ArrayList<Trees> model) {
  String myName = pArray.get((int)Math.floor(Math.random() * pArray.size()));
  int myIdx = 1000;
  for (int i = 0; i < model.size(); i += 1) {
    if (model.get(i).id.equals(myName)) {
      myIdx = i;
      break;
    }
  }
  return myIdx;
}
int getNextDoor(ArrayList<String> pArray, ArrayList<Door> model) {
  String myName = pArray.get((int)Math.floor(Math.random() * pArray.size()));
  int myIdx = 1000;
  for (int i = 0; i < model.size(); i += 1) {
    if (model.get(i).id.equals(myName)) {
      myIdx = i;
      break;
    }
  }
  return myIdx;
}
int getNextWin(ArrayList<String> pArray, ArrayList<Win> model) {
  String myName = pArray.get((int)Math.floor(Math.random() * pArray.size()));
  int myIdx = 1000;
  for (int i = 0; i < model.size(); i += 1) {
    if (model.get(i).id.equals(myName)) {
      myIdx = i;
      break;
    }
  }
  return myIdx;
}
int getNextRoof(ArrayList<String> pArray, ArrayList<Roof> model) {
  String myName = pArray.get((int)Math.floor(Math.random() * pArray.size()));
  int myIdx = 1000;
  for (int i = 0; i < model.size(); i += 1) {
    if (model.get(i).id.equals(myName)) {
      myIdx = i;
      break;
    }
  }
  return myIdx;
}
int getNextRoofaddon(ArrayList<String> pArray, ArrayList<Roofaddon> model) {
  String myName = pArray.get((int)Math.floor(Math.random() * pArray.size()));
  int myIdx = 1000;
  for (int i = 0; i < model.size(); i += 1) {
    if (model.get(i).id.equals(myName)) {
      myIdx = i;
      break;
    }
  }
  return myIdx;
}
int getNextTop(ArrayList<String> pArray, ArrayList<Top> model) {
  String myName = pArray.get((int)Math.floor(Math.random() * pArray.size()));
  int myIdx = 1000;
  for (int i = 0; i < model.size(); i += 1) {
    if (model.get(i).id.equals(myName)) {
      myIdx = i;
      break;
    }
  }
  return myIdx;
}

void draw() {
  translate(width/2, height/2);

  rotateX(-PI/6.0f);
  rotateY(PI/6.0f);

  background(bgCol);
  //orbitControl(3, 2, 0);
  if (arch.floor < 1000) drawShape(models.floor.get(arch.floor).data);
  if (arch.trees < 1000) drawShape(models.trees.get(arch.trees).data);
  if (arch.base < 1000) drawShape(models.base.get(arch.base).data);
  if (arch.door < 1000) drawShape(models.door.get(arch.door).data);
  if (arch.win < 1000) drawShape(models.win.get(arch.win).data);
  if (arch.roof < 1000) drawShape(models.roof.get(arch.roof).data);
  if (arch.roofaddon < 1000) drawShape(models.roofaddon.get(arch.roofaddon).data);
  if (arch.top < 1000) drawShape(models.top.get(arch.top).data);
}

void drawShape(ArrayList<Data> pShape) {
  float m = 70;
  noStroke();
  for (int i = 0; i < pShape.size(); i += 1) {
    beginShape();
    for (int j = 0; j < pShape.get(i).vertices.size(); j += 1) {
      color myMat = materials.get(0).get(pShape.get(i).mat);
      fill(myMat);
      if (pShape.get(i).mat == 0) noFill();
      PVector v = pShape.get(i).vertices.get(j);
      vertex(v.x * m, v.y * m, v.z * m);
    }
    endShape();
  }

  for (int i = 0; i < pShape.size(); i += 1) {
    Data data = pShape.get(i);
    data.vertices.add(data.vertices.get(0));
    for (int j = 0; j < data.vertices.size() - 1; j += 1) {
      push();
      strokeWeight(3);
      stroke(strCol);
      PVector vj0 = data.vertices.get(j);
      PVector p1 = new PVector(vj0.x * m, vj0.y * m, vj0.z * m);
      PVector vj1 = data.vertices.get(j+1);
      PVector p2 = new PVector(vj1.x * m, vj1.y * m, vj1.z * m);
      PVector p3 = PVector.sub(p2, p1);
      float rnd = 0.15;
      rnd = random(1) * 0.15;
      PVector prnd1 = new PVector(random(1) * 2 - 1, random(1) * 2 - 1, random(1) * 2 - 1);
      PVector prnd2 = new PVector(random(1) * 2 - 1, random(1) * 2 - 1, random(1) * 2 - 1);

      p1.add(prnd1);
      p2.add(prnd2);
      p3.mult(rnd);
      p2.add(p3);
      p1.sub(p3);

      line(p1.x, p1.y, p1.z, p2.x, p2.y, p2.z);
      pop();
    }
    data.vertices.remove(0);
  }
}
void mousePressed() {
  generate();
}

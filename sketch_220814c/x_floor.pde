class Next {
  ArrayList<String> trees;
  Next(ArrayList<String> trees) {
    this.trees = trees;
  }
}

class Data {
  String name;
  float mat;
  ArrayList<PVector> vertices;
  Data(String name, float mat, ArrayList<PVector> vertices) {
    this.name = name;
    this.mat = mat;
    this.vertices = vertices;
  }
}

class Floor {
  String id;
  Next next;
  ArrayList<Data> data;
  Floor(String id, Next next, ArrayList<Data> data) {
    this.id = id;
    this.next = next;
    this.data = data;
  }
}

ArrayList<Floor> getFloorData() {
  ArrayList<Floor> p = new ArrayList();

  // [floor-0]
  ArrayList<String> t = new ArrayList();
  //["trees-0", "trees-1", "trees-2", "trees-3", "trees-4", "trees-5", "empty", "empty", "empty", "empty"]
  t.add("trees-0");
  t.add("trees-1");
  t.add("trees-2");
  t.add("trees-3");
  t.add("trees-4");
  t.add("trees-5");
  t.add("empty");
  t.add("empty");
  t.add("empty");
  t.add("empty");
  Next n = new Next(t);

  ArrayList<Data> dd = new ArrayList();

  ArrayList<PVector> v = new ArrayList();
  //[-5.992014, 0.013097, -5.030954],
  //  [5.992014, 0.013097, -5.030954],
  //  [5.992014, 0.013099, 5.030954],
  //  [-5.992014, 0.013099, 5.030954]
  v.add(new PVector(-5.992014, 0.013097, -5.030954));
  v.add(new PVector(5.992014, 0.013097, -5.030954));
  v.add(new PVector(5.992014, 0.013099, 5.030954));
  v.add(new PVector(-5.992014, 0.013099, 5.030954));
  Data d = new Data("floor-0_Cube.018", 0, v);
  dd.add(d);

  Floor f = new Floor("floor-0", n, dd);
  p.add(f);


  // [floor-1]
  t = new ArrayList();
  //["trees-0", "trees-1", "trees-2", "trees-3", "trees-4", "trees-5", "empty", "empty", "empty", "empty"]
  t.add("trees-0");
  t.add("trees-1");
  t.add("trees-2");
  t.add("trees-3");
  t.add("trees-4");
  t.add("trees-5");
  t.add("empty");
  t.add("empty");
  t.add("empty");
  t.add("empty");
  n = new Next(t);

  dd = new ArrayList();

  v = new ArrayList();
  //[5.992014, 1.27413, -5.030954],
  //  [-5.992014, 0.101938, -5.030954],
  //  [-5.992014, 0.10194, 5.030954],
  //  [5.992014, 1.274132, 5.030954]
  v.add(new PVector(5.992014, 1.27413, -5.030954));
  v.add(new PVector(-5.992014, 0.101938, -5.030954));
  v.add(new PVector(-5.992014, 0.10194, 5.030954));
  v.add(new PVector(5.992014, 1.274132, 5.030954));
  d = new Data("floor-1_Cube.019", 0, v);
  dd.add(d);

  f = new Floor("floor-1", n, dd);
  p.add(f);


  // [floor-2]
  t = new ArrayList();
  //["trees-0", "trees-1", "trees-2", "trees-3", "trees-4", "trees-5", "empty", "empty", "empty", "empty"]
  t.add("trees-0");
  t.add("trees-1");
  t.add("trees-2");
  t.add("trees-3");
  t.add("trees-4");
  t.add("trees-5");
  t.add("empty");
  t.add("empty");
  t.add("empty");
  t.add("empty");
  n = new Next(t);

  dd = new ArrayList();

  v = new ArrayList();
  //[-5.992015, 1.274132, 5.030952],
  //  [5.992013, 0.10194, 5.030957],
  //  [5.992015, 0.101938, -5.030952],
  //  [-5.992013, 1.27413, -5.030957]
  v.add(new PVector(-5.992015, 1.274132, 5.030952));
  v.add(new PVector(5.992013, 0.10194, 5.030957));
  v.add(new PVector(5.992015, 0.101938, -5.030952));
  v.add(new PVector(-5.992013, 1.27413, -5.030957));
  d = new Data("floor-2_Cube.022", 0, v);
  dd.add(d);

  v = new ArrayList();
  //[5.992013, 0.013099, 5.030957],
  //  [-5.992015, 0.013099, 5.030952],
  //  [-5.992013, 0.013097, -5.030957],
  //  [5.992015, 0.013097, -5.030952]
  v.add(new PVector(5.992013, 0.013099, 5.030957));
  v.add(new PVector(-5.992015, 0.013099, 5.030952));
  v.add(new PVector(-5.992013, 0.013097, -5.030957));
  v.add(new PVector(5.992015, 0.013097, -5.030952));
  d = new Data("floor-2.001_Cube.001", 0, v);
  dd.add(d);

  f = new Floor("floor-2", n, dd);
  p.add(f);


  return p;
}

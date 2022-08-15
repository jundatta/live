class FloorNext {
  ArrayList<String> trees;
  FloorNext(ArrayList<String> trees) {
    this.trees = trees;
  }
}

class Data {
  String name;
  int mat;
  ArrayList<PVector> vertices;
  Data(String name, int mat, ArrayList<PVector> vertices) {
    this.name = name;
    this.mat = mat;
    this.vertices = vertices;
  }
}

class Floor {
  String id;
  FloorNext next;
  ArrayList<Data> data;
  Floor(String id, FloorNext next, ArrayList<Data> data) {
    this.id = id;
    this.next = next;
    this.data = data;
  }
}


ArrayList<Floor> getFloorData() {
  ArrayList<String> t;
  ArrayList<Data> dd;
  FloorNext n;
  ArrayList<PVector> v;
  Data d;
  Floor f;

  ArrayList<Floor> p = new ArrayList();

  t = new ArrayList();
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
  n = new FloorNext(t);

  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(-5.992014, 0.013097, -5.030954));
  v.add(new PVector(5.992014, 0.013097, -5.030954));
  v.add(new PVector(5.992014, 0.013099, 5.030954));
  v.add(new PVector(-5.992014, 0.013099, 5.030954));
  d = new Data("floor-0_Cube.018", 0, v);
  dd.add(d);

  f = new Floor("floor-0", n, dd);
  p.add(f);


  t = new ArrayList();
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
  n = new FloorNext(t);

  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(5.992014, 1.27413, -5.030954));
  v.add(new PVector(-5.992014, 0.101938, -5.030954));
  v.add(new PVector(-5.992014, 0.10194, 5.030954));
  v.add(new PVector(5.992014, 1.274132, 5.030954));
  d = new Data("floor-1_Cube.019", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-5.992014, 0.013097, -5.030954));
  v.add(new PVector(5.992014, 0.013097, -5.030954));
  v.add(new PVector(5.992014, 0.013099, 5.030954));
  v.add(new PVector(-5.992014, 0.013099, 5.030954));
  d = new Data("floor-1.001_Cube.001", 0, v);
  dd.add(d);

  f = new Floor("floor-1", n, dd);
  p.add(f);


  t = new ArrayList();
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
  n = new FloorNext(t);

  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(-5.992015, 1.274132, 5.030952));
  v.add(new PVector(5.992013, 0.10194, 5.030957));
  v.add(new PVector(5.992015, 0.101938, -5.030952));
  v.add(new PVector(-5.992013, 1.27413, -5.030957));
  d = new Data("floor-2_Cube.022", 0, v);
  dd.add(d);

  v = new ArrayList();
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

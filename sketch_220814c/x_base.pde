class BaseNext {
  ArrayList<String> door;
  ArrayList<String> win;
  ArrayList<String> roof;
  BaseNext(ArrayList<String> door, ArrayList<String> win, ArrayList<String> roof) {
    this.door = door;
    this.win = win;
    this.roof = roof;
  }
}

class Base {
  String id;
  BaseNext next;
  ArrayList<Data> data;
  Base(String id, BaseNext next, ArrayList<Data> data) {
    this.id = id;
    this.next = next;
    this.data = data;
  }
}

ArrayList<Base> getBaseData() {
  ArrayList<String> door;
  ArrayList<String> win;
  ArrayList<String> roof;
  ArrayList<Data> dd;
  BaseNext n;
  ArrayList<PVector> v;
  Data d;
  Base base;

  ArrayList<Base> p = new ArrayList();

  door = new ArrayList();
  door.add("basedoor-0"); 
  door.add("basedoor-1"); 
  door.add("basedoor-2"); 
  door.add("basedoor-3"); 
  door.add("basedoor-4"); 
  door.add("basedoor-5"); 
  win = new ArrayList();
  win.add("basewins-0"); 
  win.add("basewins-1"); 
  win.add("basewins-2"); 
  win.add("basewins-3"); 
  win.add("basewins-4"); 
  roof = new ArrayList();
  roof.add("roof-0"); 
  roof.add("roof-1"); 
  roof.add("roof-2"); 
  roof.add("roof-3"); 
  roof.add("roof-4"); 
  n = new BaseNext(door, win, roof);

  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(2.0, -0.0, -2.0));
  v.add(new PVector(-2.0, -0.0, -2.0));
  v.add(new PVector(-2.0, 0.0, 2.0));
  v.add(new PVector(2.0, 0.0, 2.0));
  d = new Data("base-0_Cube.005", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.0, -2.0, -2.0));
  v.add(new PVector(2.0, -2.0, -2.0));
  v.add(new PVector(2.0, -2.0, 2.0));
  v.add(new PVector(-2.0, -2.0, 2.0));
  d = new Data("base-0.001_Cube.001", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.0, 0.0, 2.0));
  v.add(new PVector(2.0, -2.0, 2.0));
  v.add(new PVector(2.0, -2.0, -2.0));
  v.add(new PVector(2.0, -0.0, -2.0));
  d = new Data("base-0.002_Cube.002", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.0, -0.0, -2.0));
  v.add(new PVector(2.0, -2.0, -2.0));
  v.add(new PVector(-2.0, -2.0, -2.0));
  v.add(new PVector(-2.0, -0.0, -2.0));
  d = new Data("base-0.003_Cube.003", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.0, 0.0, 2.0));
  v.add(new PVector(-2.0, -2.0, 2.0));
  v.add(new PVector(2.0, -2.0, 2.0));
  v.add(new PVector(2.0, 0.0, 2.0));
  d = new Data("base-0.004_Cube.004", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.0, -0.0, -2.0));
  v.add(new PVector(-2.0, -2.0, -2.0));
  v.add(new PVector(-2.0, -2.0, 2.0));
  v.add(new PVector(-2.0, 0.0, 2.0));
  d = new Data("base-0.005_Cube.006", 4, v);
  dd.add(d);

  base = new Base("base-0", n, dd);
  p.add(base);


  door = new ArrayList();
  door.add("basedoor-0"); 
  door.add("basedoor-1"); 
  door.add("basedoor-2"); 
  door.add("basedoor-3"); 
  door.add("basedoor-4"); 
  door.add("basedoor-5"); 
  win = new ArrayList();
  win.add("basewins-0"); 
  win.add("basewins-1"); 
  win.add("basewins-2"); 
  win.add("basewins-3"); 
  win.add("basewins-4"); 
  roof = new ArrayList();
  roof.add("roof-0"); 
  roof.add("roof-1"); 
  roof.add("roof-2"); 
  roof.add("roof-3"); 
  n = new BaseNext(door, win, roof);

  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(-1.719448, 0.0, 1.99702));
  v.add(new PVector(-1.719448, -1.719448, 1.99702));
  v.add(new PVector(1.719448, -1.719448, 1.99702));
  v.add(new PVector(1.719448, 0.0, 1.99702));
  d = new Data("base-1_Cube.001", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.0, -0.0, -1.565068));
  v.add(new PVector(2.0, -2.0, -2.044687));
  v.add(new PVector(-2.0, -2.0, -2.044687));
  v.add(new PVector(-2.0, -0.0, -1.565068));
  d = new Data("base-1.001_Cube.002", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.0, -0.0, -1.565068));
  v.add(new PVector(-2.0, -2.0, -2.044687));
  v.add(new PVector(-2.0, -2.0, 2.518059));
  v.add(new PVector(-2.0, 0.0, 2.109744));
  d = new Data("base-1.002_Cube.003", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.0, 0.0, 2.109744));
  v.add(new PVector(2.0, -2.0, 2.518059));
  v.add(new PVector(2.0, -2.0, -2.044687));
  v.add(new PVector(2.0, -0.0, -1.565068));
  d = new Data("base-1.003_Cube.004", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.0, -0.0, -1.565068));
  v.add(new PVector(-2.0, -0.0, -1.565068));
  v.add(new PVector(-2.0, 0.0, 2.109744));
  v.add(new PVector(-1.719448, 0.0, 2.109744));
  v.add(new PVector(-1.719448, 0.0, 1.99702));
  v.add(new PVector(1.719448, 0.0, 1.99702));
  v.add(new PVector(1.719448, 0.0, 2.109744));
  v.add(new PVector(2.0, 0.0, 2.109744));
  d = new Data("base-1.004_Cube.005", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.719448, 0.0, 1.99702));
  v.add(new PVector(1.719448, -1.719448, 1.99702));
  v.add(new PVector(1.719448, -1.719448, 2.460782));
  v.add(new PVector(1.719448, 0.0, 2.109744));
  d = new Data("base-1.005_Cube.006", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.719448, -1.719448, 2.460782));
  v.add(new PVector(-1.719448, -1.719448, 1.99702));
  v.add(new PVector(-1.719448, 0.0, 1.99702));
  v.add(new PVector(-1.719448, 0.0, 2.109744));
  d = new Data("base-1.006_Cube.007", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.719448, -0.0, -1.989295));
  v.add(new PVector(-1.719448, -0.0, -1.583288));
  v.add(new PVector(-1.719448, -1.719448, -1.989295));
  d = new Data("base-1.007_Cube.008", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.719448, -0.0, -1.989295));
  v.add(new PVector(1.719448, -1.719448, -1.989295));
  v.add(new PVector(1.719448, -0.0, -1.583288));
  d = new Data("base-1.008_Cube.009", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.719448, -0.0, -1.989295));
  v.add(new PVector(-1.719448, -1.719448, -1.989295));
  v.add(new PVector(1.719448, -1.719448, -1.989295));
  v.add(new PVector(1.719448, -0.0, -1.989295));
  d = new Data("base-1.009_Cube.010", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.719448, -0.0, -1.583288));
  v.add(new PVector(-1.719448, -0.0, -1.583288));
  v.add(new PVector(-1.719448, -0.0, -1.989295));
  v.add(new PVector(1.719448, -0.0, -1.989295));
  d = new Data("base-1.010_Cube.011", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.719448, -1.719448, 1.99702));
  v.add(new PVector(-1.719448, -1.719448, 2.460782));
  v.add(new PVector(1.719448, -1.719448, 2.460782));
  v.add(new PVector(1.719448, -1.719448, 1.99702));
  d = new Data("base-1.012_Cube.013", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.0, -2.0, -2.044687));
  v.add(new PVector(2.0, -2.0, -2.044687));
  v.add(new PVector(2.0, -2.0, 2.518059));
  v.add(new PVector(-2.0, -2.0, 2.518059));
  d = new Data("base-1.014_Cube.015", 1, v);
  dd.add(d);

  base = new Base("base-1", n, dd);
  p.add(base);


  door = new ArrayList();
  door.add("basedoor-0"); 
  door.add("basedoor-1"); 
  door.add("basedoor-2"); 
  door.add("basedoor-3"); 
  door.add("basedoor-4"); 
  door.add("basedoor-5"); 
  win = new ArrayList();
  win.add("basewins-0"); 
  win.add("basewins-1"); 
  win.add("basewins-2"); 
  win.add("basewins-3"); 
  win.add("basewins-4"); 
  roof = new ArrayList();
  roof.add("roof-0"); 
  roof.add("roof-1"); 
  roof.add("roof-2"); 
  roof.add("roof-3"); 
  roof.add("roof-4"); 
  n = new BaseNext(door, win, roof);

  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(1.5, -0.0, -2.0));
  v.add(new PVector(1.5, -2.0, -2.0));
  v.add(new PVector(-1.5, -2.0, -2.0));
  v.add(new PVector(-1.5, -0.0, -2.0));
  d = new Data("base-2_Cube.004", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.5, -2.0, -1.5));
  v.add(new PVector(-1.5, -2.0, -2.0));
  v.add(new PVector(1.5, -2.0, -2.0));
  v.add(new PVector(1.5, -2.0, -1.5));
  v.add(new PVector(2.0, -2.0, -1.5));
  v.add(new PVector(2.0, -2.0, 1.5));
  v.add(new PVector(1.5, -2.0, 1.5));
  v.add(new PVector(1.5, -2.0, 2.0));
  v.add(new PVector(-1.5, -2.0, 2.0));
  v.add(new PVector(-1.5, -2.0, 1.5));
  v.add(new PVector(-2.0, -2.0, 1.5));
  v.add(new PVector(-2.0, -2.0, -1.5));
  d = new Data("base-2.001_Cube.001", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.5, -2.0, -1.5));
  v.add(new PVector(1.5, -0.0, -1.5));
  v.add(new PVector(2.0, -0.0, -1.5));
  v.add(new PVector(2.0, -2.0, -1.5));
  d = new Data("base-2.002_Cube.002", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.5, -2.0, -1.5));
  v.add(new PVector(-1.5, -0.0, -1.5));
  v.add(new PVector(-1.5, -0.0, -2.0));
  v.add(new PVector(-1.5, -2.0, -2.0));
  d = new Data("base-2.003_Cube.003", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.0, -0.0, -1.5));
  v.add(new PVector(-2.0, -2.0, -1.5));
  v.add(new PVector(-2.0, -2.0, 1.5));
  v.add(new PVector(-2.0, 0.0, 1.5));
  d = new Data("base-2.004_Cube.005", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.5, -2.0, 1.5));
  v.add(new PVector(-1.5, 0.0, 1.5));
  v.add(new PVector(-2.0, 0.0, 1.5));
  v.add(new PVector(-2.0, -2.0, 1.5));
  d = new Data("base-2.005_Cube.006", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.5, 0.0, 1.5));
  v.add(new PVector(-1.5, -2.0, 1.5));
  v.add(new PVector(-1.5, -2.0, 2.0));
  v.add(new PVector(-1.5, 0.0, 2.0));
  d = new Data("base-2.006_Cube.007", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.5, -2.0, 1.5));
  v.add(new PVector(1.5, 0.0, 1.5));
  v.add(new PVector(1.5, 0.0, 2.0));
  v.add(new PVector(1.5, -2.0, 2.0));
  d = new Data("base-2.007_Cube.008", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.5, 0.0, 2.0));
  v.add(new PVector(-1.5, -2.0, 2.0));
  v.add(new PVector(1.5, -2.0, 2.0));
  v.add(new PVector(1.5, 0.0, 2.0));
  d = new Data("base-2.008_Cube.010", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.0, 0.0, 1.5));
  v.add(new PVector(2.0, -2.0, 1.5));
  v.add(new PVector(2.0, -2.0, -1.5));
  v.add(new PVector(2.0, -0.0, -1.5));
  d = new Data("base-2.009_Cube.011", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.5, -0.0, -1.5));
  v.add(new PVector(1.5, -2.0, -1.5));
  v.add(new PVector(1.5, -2.0, -2.0));
  v.add(new PVector(1.5, -0.0, -2.0));
  d = new Data("base-2.010_Cube.012", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.5, -0.0, -1.5));
  v.add(new PVector(1.5, -0.0, -2.0));
  v.add(new PVector(-1.5, -0.0, -2.0));
  v.add(new PVector(-1.5, -0.0, -1.5));
  v.add(new PVector(-2.0, -0.0, -1.5));
  v.add(new PVector(-2.0, 0.0, 1.5));
  v.add(new PVector(-1.5, 0.0, 1.5));
  v.add(new PVector(-1.5, 0.0, 2.0));
  v.add(new PVector(1.5, 0.0, 2.0));
  v.add(new PVector(1.5, 0.0, 1.5));
  v.add(new PVector(2.0, 0.0, 1.5));
  v.add(new PVector(2.0, -0.0, -1.5));
  d = new Data("base-2.011_Cube.013", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.5, -0.0, -1.5));
  v.add(new PVector(-1.5, -2.0, -1.5));
  v.add(new PVector(-2.0, -2.0, -1.5));
  v.add(new PVector(-2.0, -0.0, -1.5));
  d = new Data("base-2.012_Cube.014", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.5, 0.0, 1.5));
  v.add(new PVector(1.5, -2.0, 1.5));
  v.add(new PVector(2.0, -2.0, 1.5));
  v.add(new PVector(2.0, 0.0, 1.5));
  d = new Data("base-2.013_Cube.015", 1, v);
  dd.add(d);

  base = new Base("base-2", n, dd);
  p.add(base);


  door = new ArrayList();
  door.add("basedoor-0"); 
  door.add("basedoor-1"); 
  door.add("basedoor-2"); 
  door.add("basedoor-3"); 
  door.add("basedoor-4"); 
  door.add("basedoor-5"); 
  win = new ArrayList();
  win.add("basewins-1"); 
  win.add("basewins-3"); 
  win.add("basewins-5"); 
  win.add("basewins-6"); 
  roof = new ArrayList();
  roof.add("roof-0"); 
  roof.add("roof-1"); 
  roof.add("roof-2"); 
  roof.add("roof-3"); 
  roof.add("roof-4"); 
  roof.add("roof-5"); 
  n = new BaseNext(door, win, roof);

  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(-2.0, 0.0, 2.0));
  v.add(new PVector(-2.0, -2.0, 2.0));
  v.add(new PVector(2.0, -2.0, 2.0));
  v.add(new PVector(2.0, 0.0, 2.0));
  d = new Data("base-3_Cube.010", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.0, -2.0, 0.0));
  v.add(new PVector(2.0, -2.0, 2.0));
  v.add(new PVector(-2.0, -2.0, 2.0));
  v.add(new PVector(-2.0, -2.0, 0.0));
  v.add(new PVector(-4.0, -2.0, 0.0));
  v.add(new PVector(-4.0, -2.0, -2.0));
  v.add(new PVector(-2.0, -2.0, -2.0));
  v.add(new PVector(2.0, -2.0, -2.0));
  d = new Data("base-3.001_Cube.001", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.0, -0.0, -2.0));
  v.add(new PVector(2.0, -2.0, -2.0));
  v.add(new PVector(-2.0, -2.0, -2.0));
  v.add(new PVector(-4.0, -2.0, -2.0));
  v.add(new PVector(-4.0, -0.0, -2.0));
  v.add(new PVector(-2.0, -0.0, -2.0));
  d = new Data("base-3.002_Cube.002", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.0, -2.0, 0.0));
  v.add(new PVector(2.0, -2.0, -2.0));
  v.add(new PVector(2.0, -0.0, -2.0));
  v.add(new PVector(2.0, 0.0, 0.0));
  v.add(new PVector(2.0, 0.0, 2.0));
  v.add(new PVector(2.0, -2.0, 2.0));
  d = new Data("base-3.003_Cube.003", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.0, -2.0, 0.0));
  v.add(new PVector(-2.0, 0.0, 0.0));
  v.add(new PVector(-4.0, 0.0, 0.0));
  v.add(new PVector(-4.0, -2.0, 0.0));
  d = new Data("base-3.004_Cube.005", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.0, 0.0, 0.0));
  v.add(new PVector(-2.0, 0.0, 2.0));
  v.add(new PVector(2.0, 0.0, 2.0));
  v.add(new PVector(2.0, 0.0, 0.0));
  v.add(new PVector(2.0, -0.0, -2.0));
  v.add(new PVector(-2.0, -0.0, -2.0));
  v.add(new PVector(-4.0, -0.0, -2.0));
  v.add(new PVector(-4.0, 0.0, 0.0));
  d = new Data("base-3.005_Cube.006", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.0, 0.0, 0.0));
  v.add(new PVector(-2.0, -2.0, 0.0));
  v.add(new PVector(-2.0, -2.0, 2.0));
  v.add(new PVector(-2.0, 0.0, 2.0));
  d = new Data("base-3.006_Cube.007", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-4.0, -0.0, -2.0));
  v.add(new PVector(-4.0, -2.0, -2.0));
  v.add(new PVector(-4.0, -2.0, 0.0));
  v.add(new PVector(-4.0, 0.0, 0.0));
  d = new Data("base-3.007_Cube.008", 4, v);
  dd.add(d);

  base = new Base("base-3", n, dd);
  p.add(base);


  door = new ArrayList();
  door.add("basedoor-0"); 
  door.add("basedoor-1"); 
  door.add("basedoor-2"); 
  door.add("basedoor-3"); 
  door.add("basedoor-4"); 
  door.add("basedoor-5"); 
  win = new ArrayList();
  win.add("basewins-1"); 
  win.add("basewins-3"); 
  win.add("basewins-7"); 
  win.add("basewins-8"); 
  roof = new ArrayList();
  roof.add("roof-0"); 
  roof.add("roof-1"); 
  roof.add("roof-2"); 
  roof.add("roof-3"); 
  roof.add("roof-4"); 
  roof.add("roof-5"); 
  n = new BaseNext(door, win, roof);

  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(2.0, 0.0, 2.0));
  v.add(new PVector(2.0, -2.0, 2.0));
  v.add(new PVector(-2.0, -2.0, 2.0));
  v.add(new PVector(-2.0, 0.0, 2.0));
  d = new Data("base-4_Cube.001", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.0, -2.0, 0.0));
  v.add(new PVector(-2.0, -2.0, 2.0));
  v.add(new PVector(2.0, -2.0, 2.0));
  v.add(new PVector(2.0, -2.0, 0.0));
  v.add(new PVector(4.0, -2.0, 0.0));
  v.add(new PVector(4.0, -2.0, -2.0));
  v.add(new PVector(2.0, -2.0, -2.0));
  v.add(new PVector(-2.0, -2.0, -2.0));
  d = new Data("base-4.001_Cube.002", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.0, -0.0, -2.0));
  v.add(new PVector(-2.0, -2.0, -2.0));
  v.add(new PVector(2.0, -2.0, -2.0));
  v.add(new PVector(4.0, -2.0, -2.0));
  v.add(new PVector(4.0, -0.0, -2.0));
  v.add(new PVector(2.0, -0.0, -2.0));
  d = new Data("base-4.002_Cube.003", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.0, -2.0, 0.0));
  v.add(new PVector(-2.0, -2.0, -2.0));
  v.add(new PVector(-2.0, -0.0, -2.0));
  v.add(new PVector(-2.0, 0.0, 0.0));
  v.add(new PVector(-2.0, 0.0, 2.0));
  v.add(new PVector(-2.0, -2.0, 2.0));
  d = new Data("base-4.003_Cube.004", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.0, -2.0, 0.0));
  v.add(new PVector(2.0, 0.0, 0.0));
  v.add(new PVector(4.0, 0.0, 0.0));
  v.add(new PVector(4.0, -2.0, 0.0));
  d = new Data("base-4.004_Cube.005", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.0, 0.0, 0.0));
  v.add(new PVector(2.0, 0.0, 2.0));
  v.add(new PVector(-2.0, 0.0, 2.0));
  v.add(new PVector(-2.0, 0.0, 0.0));
  v.add(new PVector(-2.0, -0.0, -2.0));
  v.add(new PVector(2.0, -0.0, -2.0));
  v.add(new PVector(4.0, -0.0, -2.0));
  v.add(new PVector(4.0, 0.0, 0.0));
  d = new Data("base-4.005_Cube.006", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.0, 0.0, 0.0));
  v.add(new PVector(2.0, -2.0, 0.0));
  v.add(new PVector(2.0, -2.0, 2.0));
  v.add(new PVector(2.0, 0.0, 2.0));
  d = new Data("base-4.006_Cube.007", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(4.0, -0.0, -2.0));
  v.add(new PVector(4.0, -2.0, -2.0));
  v.add(new PVector(4.0, -2.0, 0.0));
  v.add(new PVector(4.0, 0.0, 0.0));
  d = new Data("base-4.007_Cube.008", 2, v);
  dd.add(d);

  base = new Base("base-4", n, dd);
  p.add(base);


  door = new ArrayList();
  door.add("basedoor-0"); 
  door.add("basedoor-1"); 
  door.add("basedoor-2"); 
  door.add("basedoor-3"); 
  door.add("basedoor-4"); 
  door.add("basedoor-5"); 
  win = new ArrayList();
  win.add("basewins-1"); 
  win.add("basewins-3"); 
  win.add("basewins-9"); 
  win.add("basewins-10"); 
  roof = new ArrayList();
  roof.add("roof-0"); 
  roof.add("roof-1"); 
  roof.add("roof-2"); 
  roof.add("roof-3"); 
  roof.add("roof-4"); 
  roof.add("roof-5"); 
  n = new BaseNext(door, win, roof);

  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(2.0, 0.0, 0.0));
  v.add(new PVector(4.0, 0.0, 0.0));
  v.add(new PVector(4.0, -0.0, -2.0));
  v.add(new PVector(-4.0, -0.0, -2.0));
  v.add(new PVector(-4.0, 0.0, 0.0));
  v.add(new PVector(-2.0, 0.0, 0.0));
  v.add(new PVector(-2.0, 0.0, 2.0));
  v.add(new PVector(2.0, 0.0, 2.0));
  d = new Data("base-5_Cube.013", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.0, 0.0, 2.0));
  v.add(new PVector(2.0, -2.0, 2.0));
  v.add(new PVector(2.0, -2.0, 0.0));
  v.add(new PVector(2.0, 0.0, 0.0));
  d = new Data("base-5.001_Cube.001", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.0, -2.0, 0.0));
  v.add(new PVector(-4.0, -2.0, 0.0));
  v.add(new PVector(-4.0, -2.0, -2.0));
  v.add(new PVector(4.0, -2.0, -2.0));
  v.add(new PVector(4.0, -2.0, 0.0));
  v.add(new PVector(2.0, -2.0, 0.0));
  v.add(new PVector(2.0, -2.0, 2.0));
  v.add(new PVector(-2.0, -2.0, 2.0));
  d = new Data("base-5.002_Cube.002", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.0, 0.0, 0.0));
  v.add(new PVector(2.0, -2.0, 0.0));
  v.add(new PVector(4.0, -2.0, 0.0));
  v.add(new PVector(4.0, 0.0, 0.0));
  d = new Data("base-5.003_Cube.003", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.0, -2.0, 0.0));
  v.add(new PVector(-2.0, 0.0, 0.0));
  v.add(new PVector(-4.0, 0.0, 0.0));
  v.add(new PVector(-4.0, -2.0, 0.0));
  d = new Data("base-5.004_Cube.004", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-4.0, -0.0, -2.0));
  v.add(new PVector(4.0, -0.0, -2.0));
  v.add(new PVector(4.0, -2.0, -2.0));
  v.add(new PVector(-4.0, -2.0, -2.0));
  d = new Data("base-5.005_Cube.005", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(4.0, 0.0, 0.0));
  v.add(new PVector(4.0, -2.0, 0.0));
  v.add(new PVector(4.0, -2.0, -2.0));
  v.add(new PVector(4.0, -0.0, -2.0));
  d = new Data("base-5.006_Cube.006", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.0, 0.0, 2.0));
  v.add(new PVector(-2.0, -2.0, 2.0));
  v.add(new PVector(2.0, -2.0, 2.0));
  v.add(new PVector(2.0, 0.0, 2.0));
  d = new Data("base-5.007_Cube.007", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.0, 0.0, 0.0));
  v.add(new PVector(-2.0, -2.0, 0.0));
  v.add(new PVector(-2.0, -2.0, 2.0));
  v.add(new PVector(-2.0, 0.0, 2.0));
  d = new Data("base-5.008_Cube.008", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-4.0, -0.0, -2.0));
  v.add(new PVector(-4.0, -2.0, -2.0));
  v.add(new PVector(-4.0, -2.0, 0.0));
  v.add(new PVector(-4.0, 0.0, 0.0));
  d = new Data("base-5.009_Cube.010", 4, v);
  dd.add(d);

  base = new Base("base-5", n, dd);
  p.add(base);


  return p;
}

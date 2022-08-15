class RoofNext {
  ArrayList<String> roofaddon;
  ArrayList<String> top;
  RoofNext(ArrayList<String> roofaddon, ArrayList<String> top) {
    this.roofaddon = roofaddon;
    this.top = top;
  }
}

class Roof {
  String id;
  RoofNext next;
  ArrayList<Data> data;
  Base(String id, RoofNext next, ArrayList<Data> data) {
    this.id = id;
    this.next = next;
    this.data = data;
  }
}

ArrayList<Roof> getRoofData() {
  ArrayList<String> roofaddon;
  ArrayList<String> top;
  ArrayList<Data> dd;
  RoofNext n;
  ArrayList<PVector> v;
  Data d;
  Roof roof;

  ArrayList<Roof> p = new ArrayList();

  roofaddon = new ArrayList();
  roofaddon.add("roofaddon-0"); 
  roofaddon.add("roofaddon-2"); 
  top = new ArrayList();
  top.add("top-0"); 
  top.add("top-1"); 
  top.add("empty"); 
  top.add("empty"); 
  n = new RoofNext(roofaddon, top);

  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(2.5, -2.025001, -2.5));
  v.add(new PVector(-2.5, -2.025001, -2.5));
  v.add(new PVector(-2.5, -2.025, 2.5));
  v.add(new PVector(2.5, -2.025, 2.5));
  d = new Data("roof-0_Cube.029", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.5, -3.025001, -2.5));
  v.add(new PVector(2.5, -3.025001, -2.5));
  v.add(new PVector(2.5, -3.025, 2.5));
  v.add(new PVector(-2.5, -3.025, 2.5));
  d = new Data("roof-0.001_Cube.001", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.0, -3.06008, 2.0));
  v.add(new PVector(-2.0, -3.997572, 2.000001));
  v.add(new PVector(2.0, -3.997572, 2.000001));
  v.add(new PVector(2.0, -3.06008, 2.0));
  d = new Data("roof-0.002_Cube.002", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.0, -3.06008, -2.0));
  v.add(new PVector(2.0, -3.997572, -1.999999));
  v.add(new PVector(-2.0, -3.997572, -1.999999));
  v.add(new PVector(-2.0, -3.06008, -2.0));
  d = new Data("roof-0.003_Cube.003", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.0, -3.06008, -2.0));
  v.add(new PVector(-2.0, -3.997572, -1.999999));
  v.add(new PVector(-2.0, -3.997572, 2.000001));
  v.add(new PVector(-2.0, -3.06008, 2.0));
  d = new Data("roof-0.004_Cube.004", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.5, -4.030653, -2.499999));
  v.add(new PVector(-2.5, -4.030653, -2.499999));
  v.add(new PVector(-2.5, -4.030652, 2.500001));
  v.add(new PVector(2.5, -4.030652, 2.500001));
  d = new Data("roof-0.005_Cube.005", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.5, -5.030653, -2.499999));
  v.add(new PVector(2.5, -5.030653, -2.499999));
  v.add(new PVector(2.5, -5.030652, 2.500001));
  v.add(new PVector(-2.5, -5.030652, 2.500001));
  d = new Data("roof-0.006_Cube.006", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.5, -2.025, 2.5));
  v.add(new PVector(2.5, -3.025, 2.5));
  v.add(new PVector(2.5, -3.025001, -2.5));
  v.add(new PVector(2.5, -2.025001, -2.5));
  d = new Data("roof-0.007_Cube.007", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.5, -2.025001, -2.5));
  v.add(new PVector(2.5, -3.025001, -2.5));
  v.add(new PVector(-2.5, -3.025001, -2.5));
  v.add(new PVector(-2.5, -2.025001, -2.5));
  d = new Data("roof-0.008_Cube.008", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.5, -2.025, 2.5));
  v.add(new PVector(-2.5, -3.025, 2.5));
  v.add(new PVector(2.5, -3.025, 2.5));
  v.add(new PVector(2.5, -2.025, 2.5));
  d = new Data("roof-0.009_Cube.010", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.5, -2.025001, -2.5));
  v.add(new PVector(-2.5, -3.025001, -2.5));
  v.add(new PVector(-2.5, -3.025, 2.5));
  v.add(new PVector(-2.5, -2.025, 2.5));
  d = new Data("roof-0.010_Cube.011", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.0, -3.06008, 2.0));
  v.add(new PVector(2.0, -3.997572, 2.000001));
  v.add(new PVector(2.0, -3.997572, -1.999999));
  v.add(new PVector(2.0, -3.06008, -2.0));
  d = new Data("roof-0.011_Cube.012", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.5, -4.030652, 2.500001));
  v.add(new PVector(2.5, -5.030652, 2.500001));
  v.add(new PVector(2.5, -5.030653, -2.499999));
  v.add(new PVector(2.5, -4.030653, -2.499999));
  d = new Data("roof-0.012_Cube.013", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.5, -4.030653, -2.499999));
  v.add(new PVector(2.5, -5.030653, -2.499999));
  v.add(new PVector(-2.5, -5.030653, -2.499999));
  v.add(new PVector(-2.5, -4.030653, -2.499999));
  d = new Data("roof-0.013_Cube.014", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.5, -4.030652, 2.500001));
  v.add(new PVector(-2.5, -5.030652, 2.500001));
  v.add(new PVector(2.5, -5.030652, 2.500001));
  v.add(new PVector(2.5, -4.030652, 2.500001));
  d = new Data("roof-0.014_Cube.015", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.5, -4.030653, -2.499999));
  v.add(new PVector(-2.5, -5.030653, -2.499999));
  v.add(new PVector(-2.5, -5.030652, 2.500001));
  v.add(new PVector(-2.5, -4.030652, 2.500001));
  d = new Data("roof-0.015_Cube.016", 0, v);
  dd.add(d);

  roof = new Roof("roof-0", n, dd);
  p.add(roof);


  roofaddon = new ArrayList();
  roofaddon.add("roofaddon-1"); 
  roofaddon.add("roofaddon-3"); 
  top = new ArrayList();
  top.add("top-0"); 
  top.add("top-1"); 
  top.add("empty"); 
  top.add("empty"); 
  n = new RoofNext(roofaddon, top);

  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(2.5, -2.025001, -2.5));
  v.add(new PVector(-2.5, -2.025001, -2.5));
  v.add(new PVector(-2.5, -2.025, 2.5));
  v.add(new PVector(2.5, -2.025, 2.5));
  d = new Data("roof-1_Cube.030", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.5, -2.653097, -2.5));
  v.add(new PVector(2.5, -2.653097, -2.5));
  v.add(new PVector(2.5, -2.653096, 2.5));
  v.add(new PVector(-2.5, -2.653096, 2.5));
  d = new Data("roof-1.001_Cube.001", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.0, -2.688177, 2.0));
  v.add(new PVector(-2.0, -3.418348, 2.0));
  v.add(new PVector(2.0, -3.418348, 2.0));
  v.add(new PVector(2.0, -2.688177, 2.0));
  d = new Data("roof-1.002_Cube.002", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.0, -2.688177, -2.0));
  v.add(new PVector(2.0, -3.418348, -1.999999));
  v.add(new PVector(-2.0, -3.418348, -1.999999));
  v.add(new PVector(-2.0, -2.688177, -2.0));
  d = new Data("roof-1.003_Cube.003", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.0, -2.688177, -2.0));
  v.add(new PVector(-2.0, -3.418348, -1.999999));
  v.add(new PVector(-2.0, -3.418348, 2.0));
  v.add(new PVector(-2.0, -2.688177, 2.0));
  d = new Data("roof-1.004_Cube.004", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.5, -3.451427, -2.5));
  v.add(new PVector(-2.5, -3.451427, -2.5));
  v.add(new PVector(-2.5, -3.451427, 2.5));
  v.add(new PVector(2.5, -3.451427, 2.5));
  d = new Data("roof-1.005_Cube.005", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.5, -5.030653, -2.499999));
  v.add(new PVector(2.5, -5.030653, -2.499999));
  v.add(new PVector(2.5, -5.030652, 2.500001));
  v.add(new PVector(-2.5, -5.030652, 2.500001));
  d = new Data("roof-1.006_Cube.006", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.5, -2.025, 2.5));
  v.add(new PVector(2.5, -2.653096, 2.5));
  v.add(new PVector(2.5, -2.653097, -2.5));
  v.add(new PVector(2.5, -2.025001, -2.5));
  d = new Data("roof-1.007_Cube.007", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.5, -2.025001, -2.5));
  v.add(new PVector(2.5, -2.653097, -2.5));
  v.add(new PVector(-2.5, -2.653097, -2.5));
  v.add(new PVector(-2.5, -2.025001, -2.5));
  d = new Data("roof-1.008_Cube.008", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.5, -2.025, 2.5));
  v.add(new PVector(-2.5, -2.653096, 2.5));
  v.add(new PVector(2.5, -2.653096, 2.5));
  v.add(new PVector(2.5, -2.025, 2.5));
  d = new Data("roof-1.009_Cube.010", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.5, -2.025001, -2.5));
  v.add(new PVector(-2.5, -2.653097, -2.5));
  v.add(new PVector(-2.5, -2.653096, 2.5));
  v.add(new PVector(-2.5, -2.025, 2.5));
  d = new Data("roof-1.010_Cube.011", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.0, -2.688177, 2.0));
  v.add(new PVector(2.0, -3.418348, 2.0));
  v.add(new PVector(2.0, -3.418348, -1.999999));
  v.add(new PVector(2.0, -2.688177, -2.0));
  d = new Data("roof-1.011_Cube.012", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.5, -3.451427, 2.5));
  v.add(new PVector(2.5, -5.030652, 2.500001));
  v.add(new PVector(2.5, -5.030653, -2.499999));
  v.add(new PVector(2.5, -3.451427, -2.5));
  d = new Data("roof-1.012_Cube.013", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.5, -3.451427, -2.5));
  v.add(new PVector(2.5, -5.030653, -2.499999));
  v.add(new PVector(-2.5, -5.030653, -2.499999));
  v.add(new PVector(-2.5, -3.451427, -2.5));
  d = new Data("roof-1.013_Cube.014", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.5, -3.451427, 2.5));
  v.add(new PVector(-2.5, -5.030652, 2.500001));
  v.add(new PVector(2.5, -5.030652, 2.500001));
  v.add(new PVector(2.5, -3.451427, 2.5));
  d = new Data("roof-1.014_Cube.015", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.5, -3.451427, -2.5));
  v.add(new PVector(-2.5, -5.030653, -2.499999));
  v.add(new PVector(-2.5, -5.030652, 2.500001));
  v.add(new PVector(-2.5, -3.451427, 2.5));
  d = new Data("roof-1.015_Cube.016", 0, v);
  dd.add(d);

  roof = new Roof("roof-1", n, dd);
  p.add(roof);


  roofaddon = new ArrayList();
  roofaddon.add("roofaddon-0"); 
  roofaddon.add("roofaddon-2"); 
  top = new ArrayList();
  top.add("top-0"); 
  top.add("top-1"); 
  top.add("empty"); 
  top.add("empty"); 
  n = new RoofNext(roofaddon, top);

  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(2.5, -2.025001, -2.5));
  v.add(new PVector(-2.5, -2.025001, -2.5));
  v.add(new PVector(-2.5, -2.025, 2.5));
  v.add(new PVector(2.5, -2.025, 2.5));
  d = new Data("roof-2_Cube.031", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.5, -3.025001, -2.5));
  v.add(new PVector(2.5, -3.025001, -2.5));
  v.add(new PVector(2.5, -3.025, 2.5));
  v.add(new PVector(-2.5, -3.025, 2.5));
  d = new Data("roof-2.001_Cube.001", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.358359, -3.06008, 2.35836));
  v.add(new PVector(-2.358359, -3.997571, 2.35836));
  v.add(new PVector(2.358359, -3.997571, 2.35836));
  v.add(new PVector(2.358359, -3.06008, 2.35836));
  d = new Data("roof-2.002_Cube.002", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.358359, -3.060081, -2.358359));
  v.add(new PVector(2.358359, -3.997572, -2.358358));
  v.add(new PVector(-2.358359, -3.997572, -2.358358));
  v.add(new PVector(-2.358359, -3.060081, -2.358359));
  d = new Data("roof-2.003_Cube.003", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.358359, -3.060081, -2.358359));
  v.add(new PVector(-2.358359, -3.997572, -2.358358));
  v.add(new PVector(-2.358359, -3.997571, 2.35836));
  v.add(new PVector(-2.358359, -3.06008, 2.35836));
  d = new Data("roof-2.004_Cube.004", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.5, -4.030653, -2.499999));
  v.add(new PVector(-2.5, -4.030653, -2.499999));
  v.add(new PVector(-2.5, -4.030652, 2.500001));
  v.add(new PVector(2.5, -4.030652, 2.500001));
  d = new Data("roof-2.005_Cube.005", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.5, -5.030653, -2.499999));
  v.add(new PVector(2.5, -5.030653, -2.499999));
  v.add(new PVector(2.5, -5.030652, 2.500001));
  v.add(new PVector(-2.5, -5.030652, 2.500001));
  d = new Data("roof-2.006_Cube.006", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.5, -2.025, 2.5));
  v.add(new PVector(2.5, -3.025, 2.5));
  v.add(new PVector(2.5, -3.025001, -2.5));
  v.add(new PVector(2.5, -2.025001, -2.5));
  d = new Data("roof-2.007_Cube.007", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.5, -2.025001, -2.5));
  v.add(new PVector(2.5, -3.025001, -2.5));
  v.add(new PVector(-2.5, -3.025001, -2.5));
  v.add(new PVector(-2.5, -2.025001, -2.5));
  d = new Data("roof-2.008_Cube.008", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.5, -2.025, 2.5));
  v.add(new PVector(-2.5, -3.025, 2.5));
  v.add(new PVector(2.5, -3.025, 2.5));
  v.add(new PVector(2.5, -2.025, 2.5));
  d = new Data("roof-2.009_Cube.010", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.5, -2.025001, -2.5));
  v.add(new PVector(-2.5, -3.025001, -2.5));
  v.add(new PVector(-2.5, -3.025, 2.5));
  v.add(new PVector(-2.5, -2.025, 2.5));
  d = new Data("roof-2.010_Cube.011", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.358359, -3.06008, 2.35836));
  v.add(new PVector(2.358359, -3.997571, 2.35836));
  v.add(new PVector(2.358359, -3.997572, -2.358358));
  v.add(new PVector(2.358359, -3.060081, -2.358359));
  d = new Data("roof-2.011_Cube.012", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.5, -4.030652, 2.500001));
  v.add(new PVector(2.5, -5.030652, 2.500001));
  v.add(new PVector(2.5, -5.030653, -2.499999));
  v.add(new PVector(2.5, -4.030653, -2.499999));
  d = new Data("roof-2.012_Cube.013", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.5, -4.030653, -2.499999));
  v.add(new PVector(2.5, -5.030653, -2.499999));
  v.add(new PVector(-2.5, -5.030653, -2.499999));
  v.add(new PVector(-2.5, -4.030653, -2.499999));
  d = new Data("roof-2.013_Cube.014", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.5, -4.030652, 2.500001));
  v.add(new PVector(-2.5, -5.030652, 2.500001));
  v.add(new PVector(2.5, -5.030652, 2.500001));
  v.add(new PVector(2.5, -4.030652, 2.500001));
  d = new Data("roof-2.014_Cube.015", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.5, -4.030653, -2.499999));
  v.add(new PVector(-2.5, -5.030653, -2.499999));
  v.add(new PVector(-2.5, -5.030652, 2.500001));
  v.add(new PVector(-2.5, -4.030652, 2.500001));
  d = new Data("roof-2.015_Cube.016", 0, v);
  dd.add(d);

  roof = new Roof("roof-2", n, dd);
  p.add(roof);


  roofaddon = new ArrayList();
  roofaddon.add("roofaddon-0"); 
  roofaddon.add("roofaddon-1"); 
  roofaddon.add("roofaddon-2"); 
  roofaddon.add("empty"); 
  top = new ArrayList();
  top.add("top-0"); 
  top.add("top-1"); 
  top.add("empty"); 
  top.add("empty"); 
  n = new RoofNext(roofaddon, top);

  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(0.013126, -2.99202, 1.993377));
  v.add(new PVector(0.013126, -4.99202, 1.993378));
  v.add(new PVector(2.013126, -4.99202, 1.993378));
  v.add(new PVector(2.013126, -2.99202, 1.993377));
  d = new Data("roof-3_Cube.008", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.013126, -4.992021, -1.993375));
  v.add(new PVector(2.013126, -4.992021, -1.993375));
  v.add(new PVector(2.013126, -4.99202, 1.993378));
  v.add(new PVector(0.013126, -4.99202, 1.993378));
  d = new Data("roof-3.001_Cube.001", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.013126, -2.99202, -1.993376));
  v.add(new PVector(2.013126, -4.992021, -1.993375));
  v.add(new PVector(0.013126, -4.992021, -1.993375));
  v.add(new PVector(0.013126, -2.99202, -1.993376));
  d = new Data("roof-3.002_Cube.002", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.013126, -2.99202, -1.993376));
  v.add(new PVector(0.013126, -4.992021, -1.993375));
  v.add(new PVector(0.013126, -4.99202, 1.993378));
  v.add(new PVector(0.013126, -2.99202, 1.993377));
  d = new Data("roof-3.003_Cube.003", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.35, 0.0, 2.35));
  v.add(new PVector(-2.65, 0.0, 2.35));
  v.add(new PVector(-2.65, 0.0, 2.65));
  v.add(new PVector(-2.35, 0.0, 2.65));
  d = new Data("roof-3.004_Cube.004", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.65, 0.0, 2.65));
  v.add(new PVector(-2.65, -2.0, 2.65));
  v.add(new PVector(-2.35, -2.0, 2.65));
  v.add(new PVector(-2.35, 0.0, 2.65));
  d = new Data("roof-3.005_Cube.005", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.35, 0.0, 2.35));
  v.add(new PVector(-2.35, -2.0, 2.35));
  v.add(new PVector(-2.65, -2.0, 2.35));
  v.add(new PVector(-2.65, 0.0, 2.35));
  d = new Data("roof-3.006_Cube.006", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.65, 0.0, 2.35));
  v.add(new PVector(-2.65, -2.0, 2.35));
  v.add(new PVector(-2.65, -2.0, 2.65));
  v.add(new PVector(-2.65, 0.0, 2.65));
  d = new Data("roof-3.007_Cube.007", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.35, -0.0, -2.65));
  v.add(new PVector(-2.65, -0.0, -2.65));
  v.add(new PVector(-2.65, -0.0, -2.35));
  v.add(new PVector(-2.35, -0.0, -2.35));
  d = new Data("roof-3.008_Cube.010", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.65, -0.0, -2.35));
  v.add(new PVector(-2.65, -2.0, -2.35));
  v.add(new PVector(-2.35, -2.0, -2.35));
  v.add(new PVector(-2.35, -0.0, -2.35));
  d = new Data("roof-3.009_Cube.011", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.35, -0.0, -2.65));
  v.add(new PVector(-2.35, -2.0, -2.65));
  v.add(new PVector(-2.65, -2.0, -2.65));
  v.add(new PVector(-2.65, -0.0, -2.65));
  d = new Data("roof-3.010_Cube.012", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.65, -0.0, -2.65));
  v.add(new PVector(-2.65, -2.0, -2.65));
  v.add(new PVector(-2.65, -2.0, -2.35));
  v.add(new PVector(-2.65, -0.0, -2.35));
  d = new Data("roof-3.011_Cube.013", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.65, -0.0, -2.65));
  v.add(new PVector(2.35, -0.0, -2.65));
  v.add(new PVector(2.35, -0.0, -2.35));
  v.add(new PVector(2.65, -0.0, -2.35));
  d = new Data("roof-3.012_Cube.014", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.35, -0.0, -2.35));
  v.add(new PVector(2.35, -2.0, -2.35));
  v.add(new PVector(2.65, -2.0, -2.35));
  v.add(new PVector(2.65, -0.0, -2.35));
  d = new Data("roof-3.013_Cube.015", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.65, -0.0, -2.65));
  v.add(new PVector(2.65, -2.0, -2.65));
  v.add(new PVector(2.35, -2.0, -2.65));
  v.add(new PVector(2.35, -0.0, -2.65));
  d = new Data("roof-3.014_Cube.016", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.35, -0.0, -2.65));
  v.add(new PVector(2.35, -2.0, -2.65));
  v.add(new PVector(2.35, -2.0, -2.35));
  v.add(new PVector(2.35, -0.0, -2.35));
  d = new Data("roof-3.015_Cube.017", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.65, 0.0, 2.35));
  v.add(new PVector(2.35, 0.0, 2.35));
  v.add(new PVector(2.35, 0.0, 2.65));
  v.add(new PVector(2.65, 0.0, 2.65));
  d = new Data("roof-3.016_Cube.018", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.35, 0.0, 2.65));
  v.add(new PVector(2.35, -2.0, 2.65));
  v.add(new PVector(2.65, -2.0, 2.65));
  v.add(new PVector(2.65, 0.0, 2.65));
  d = new Data("roof-3.017_Cube.019", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.65, 0.0, 2.35));
  v.add(new PVector(2.65, -2.0, 2.35));
  v.add(new PVector(2.35, -2.0, 2.35));
  v.add(new PVector(2.35, 0.0, 2.35));
  d = new Data("roof-3.018_Cube.020", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.35, 0.0, 2.35));
  v.add(new PVector(2.35, -2.0, 2.35));
  v.add(new PVector(2.35, -2.0, 2.65));
  v.add(new PVector(2.35, 0.0, 2.65));
  d = new Data("roof-3.019_Cube.021", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(3.0, -2.025001, -3.0));
  v.add(new PVector(-3.0, -2.025001, -3.0));
  v.add(new PVector(-3.0, -2.025, 3.0));
  v.add(new PVector(3.0, -2.025, 3.0));
  d = new Data("roof-3.020_Cube.022", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-3.0, -3.025001, -3.0));
  v.add(new PVector(3.0, -3.025001, -3.0));
  v.add(new PVector(3.0, -3.025, 3.0));
  v.add(new PVector(-3.0, -3.025, 3.0));
  d = new Data("roof-3.021_Cube.023", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.529465, -2.992019, 1.993377));
  v.add(new PVector(-0.529465, -4.99202, 1.993378));
  v.add(new PVector(-0.151691, -4.99202, 1.993378));
  v.add(new PVector(-0.151691, -2.992019, 1.993377));
  d = new Data("roof-3.022_Cube.024", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.529465, -4.992021, -1.993375));
  v.add(new PVector(-0.151691, -4.992021, -1.993375));
  v.add(new PVector(-0.151691, -4.99202, 1.993378));
  v.add(new PVector(-0.529465, -4.99202, 1.993378));
  d = new Data("roof-3.023_Cube.025", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.151691, -2.992019, -1.993376));
  v.add(new PVector(-0.151691, -4.992021, -1.993375));
  v.add(new PVector(-0.529465, -4.992021, -1.993375));
  v.add(new PVector(-0.529465, -2.992019, -1.993376));
  d = new Data("roof-3.024_Cube.026", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.529465, -2.992019, -1.993376));
  v.add(new PVector(-0.529465, -4.992021, -1.993375));
  v.add(new PVector(-0.529465, -4.99202, 1.993378));
  v.add(new PVector(-0.529465, -2.992019, 1.993377));
  d = new Data("roof-3.025_Cube.027", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.176194, -2.931927, -1.540372));
  v.add(new PVector(-2.176194, -4.442422, -1.540372));
  v.add(new PVector(-2.176194, -4.442422, -0.029876));
  v.add(new PVector(-2.176194, -2.931927, -0.029877));
  d = new Data("roof-3.026_Cube.028", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.834792, -4.442422, -1.540371));
  v.add(new PVector(0.834792, -4.442422, -0.029876));
  v.add(new PVector(-2.176194, -4.442422, -0.029876));
  v.add(new PVector(-2.176194, -4.442422, -1.540372));
  d = new Data("roof-3.027_Cube.029", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.176194, -2.931927, -0.029877));
  v.add(new PVector(-2.176194, -4.442422, -0.029876));
  v.add(new PVector(0.834792, -4.442422, -0.029876));
  v.add(new PVector(0.834792, -2.931927, -0.029877));
  d = new Data("roof-3.028_Cube.030", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.834792, -2.931927, -1.540372));
  v.add(new PVector(0.834792, -4.442422, -1.540371));
  v.add(new PVector(-2.176194, -4.442422, -1.540372));
  v.add(new PVector(-2.176194, -2.931927, -1.540372));
  d = new Data("roof-3.029_Cube.031", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.177929, -2.88115, 0.429368));
  v.add(new PVector(-2.177929, -4.440162, 0.429369));
  v.add(new PVector(0.643022, -4.440162, 0.429369));
  v.add(new PVector(0.643022, -2.88115, 0.429368));
  d = new Data("roof-3.030_Cube.032", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.177929, -4.440162, 0.205023));
  v.add(new PVector(0.643022, -4.440162, 0.205023));
  v.add(new PVector(0.643022, -4.440162, 0.429369));
  v.add(new PVector(-2.177929, -4.440162, 0.429369));
  d = new Data("roof-3.031_Cube.033", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.643022, -2.88115, 0.205022));
  v.add(new PVector(0.643022, -4.440162, 0.205023));
  v.add(new PVector(-2.177929, -4.440162, 0.205023));
  v.add(new PVector(-2.177929, -2.88115, 0.205022));
  d = new Data("roof-3.032_Cube.034", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.177929, -2.88115, 0.205022));
  v.add(new PVector(-2.177929, -4.440162, 0.205023));
  v.add(new PVector(-2.177929, -4.440162, 0.429369));
  v.add(new PVector(-2.177929, -2.88115, 0.429368));
  d = new Data("roof-3.033_Cube.035", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.177929, -2.88115, 0.884854));
  v.add(new PVector(-2.177929, -4.440162, 0.884855));
  v.add(new PVector(0.643022, -4.440162, 0.884855));
  v.add(new PVector(0.643022, -2.88115, 0.884854));
  d = new Data("roof-3.034_Cube.036", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.177929, -4.440162, 0.660508));
  v.add(new PVector(0.643022, -4.440162, 0.660508));
  v.add(new PVector(0.643022, -4.440162, 0.884855));
  v.add(new PVector(-2.177929, -4.440162, 0.884855));
  d = new Data("roof-3.035_Cube.037", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.643022, -2.88115, 0.660508));
  v.add(new PVector(0.643022, -4.440162, 0.660508));
  v.add(new PVector(-2.177929, -4.440162, 0.660508));
  v.add(new PVector(-2.177929, -2.88115, 0.660508));
  d = new Data("roof-3.036_Cube.038", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.177929, -2.88115, 0.660508));
  v.add(new PVector(-2.177929, -4.440162, 0.660508));
  v.add(new PVector(-2.177929, -4.440162, 0.884855));
  v.add(new PVector(-2.177929, -2.88115, 0.884854));
  d = new Data("roof-3.037_Cube.039", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.177929, -2.88115, 1.347647));
  v.add(new PVector(-2.177929, -4.440162, 1.347648));
  v.add(new PVector(0.643022, -4.440162, 1.347648));
  v.add(new PVector(0.643022, -2.88115, 1.347647));
  d = new Data("roof-3.038_Cube.040", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.177929, -4.440162, 1.123301));
  v.add(new PVector(0.643022, -4.440162, 1.123301));
  v.add(new PVector(0.643022, -4.440162, 1.347648));
  v.add(new PVector(-2.177929, -4.440162, 1.347648));
  d = new Data("roof-3.039_Cube.041", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.643022, -2.88115, 1.1233));
  v.add(new PVector(0.643022, -4.440162, 1.123301));
  v.add(new PVector(-2.177929, -4.440162, 1.123301));
  v.add(new PVector(-2.177929, -2.88115, 1.1233));
  d = new Data("roof-3.040_Cube.042", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.177929, -2.88115, 1.1233));
  v.add(new PVector(-2.177929, -4.440162, 1.123301));
  v.add(new PVector(-2.177929, -4.440162, 1.347648));
  v.add(new PVector(-2.177929, -2.88115, 1.347647));
  d = new Data("roof-3.041_Cube.043", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.013126, -2.99202, 1.993377));
  v.add(new PVector(2.013126, -4.99202, 1.993378));
  v.add(new PVector(2.013126, -4.992021, -1.993375));
  v.add(new PVector(2.013126, -2.99202, -1.993376));
  d = new Data("roof-3.042_Cube.044", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.35, 0.0, 2.65));
  v.add(new PVector(-2.35, -2.0, 2.65));
  v.add(new PVector(-2.35, -2.0, 2.35));
  v.add(new PVector(-2.35, 0.0, 2.35));
  d = new Data("roof-3.043_Cube.045", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.35, -0.0, -2.35));
  v.add(new PVector(-2.35, -2.0, -2.35));
  v.add(new PVector(-2.35, -2.0, -2.65));
  v.add(new PVector(-2.35, -0.0, -2.65));
  d = new Data("roof-3.044_Cube.046", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.65, -0.0, -2.35));
  v.add(new PVector(2.65, -2.0, -2.35));
  v.add(new PVector(2.65, -2.0, -2.65));
  v.add(new PVector(2.65, -0.0, -2.65));
  d = new Data("roof-3.045_Cube.047", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.65, 0.0, 2.65));
  v.add(new PVector(2.65, -2.0, 2.65));
  v.add(new PVector(2.65, -2.0, 2.35));
  v.add(new PVector(2.65, 0.0, 2.35));
  d = new Data("roof-3.046_Cube.048", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(3.0, -2.025, 3.0));
  v.add(new PVector(3.0, -3.025, 3.0));
  v.add(new PVector(3.0, -3.025001, -3.0));
  v.add(new PVector(3.0, -2.025001, -3.0));
  d = new Data("roof-3.047_Cube.049", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(3.0, -2.025001, -3.0));
  v.add(new PVector(3.0, -3.025001, -3.0));
  v.add(new PVector(-3.0, -3.025001, -3.0));
  v.add(new PVector(-3.0, -2.025001, -3.0));
  d = new Data("roof-3.048_Cube.050", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-3.0, -2.025, 3.0));
  v.add(new PVector(-3.0, -3.025, 3.0));
  v.add(new PVector(3.0, -3.025, 3.0));
  v.add(new PVector(3.0, -2.025, 3.0));
  d = new Data("roof-3.049_Cube.051", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-3.0, -2.025001, -3.0));
  v.add(new PVector(-3.0, -3.025001, -3.0));
  v.add(new PVector(-3.0, -3.025, 3.0));
  v.add(new PVector(-3.0, -2.025, 3.0));
  d = new Data("roof-3.050_Cube.052", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.151691, -2.992019, 1.993377));
  v.add(new PVector(-0.151691, -4.99202, 1.993378));
  v.add(new PVector(-0.151691, -4.992021, -1.993375));
  v.add(new PVector(-0.151691, -2.992019, -1.993376));
  d = new Data("roof-3.051_Cube.053", 0, v);
  dd.add(d);

  roof = new Roof("roof-3", n, dd);
  p.add(roof);


  roofaddon = new ArrayList();
  top = new ArrayList();
  n = new RoofNext(roofaddon, top);

  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(2.324165, -2.039428, -2.324165));
  v.add(new PVector(-2.324165, -2.039428, -2.324165));
  v.add(new PVector(-2.324165, -2.039428, 2.324165));
  v.add(new PVector(2.324165, -2.039428, 2.324165));
  d = new Data("roof-4_Cube.007", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.324165, -2.420842, -2.324165));
  v.add(new PVector(2.324165, -2.420842, -2.324165));
  v.add(new PVector(2.324165, -2.420841, 2.324166));
  v.add(new PVector(-2.324165, -2.420841, 2.324166));
  d = new Data("roof-4.001_Cube.001", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.0, -2.47035, 2.0));
  v.add(new PVector(-0.237761, -3.407842, 0.886606));
  v.add(new PVector(0.237761, -3.407842, 0.886606));
  v.add(new PVector(2.0, -2.47035, 2.0));
  d = new Data("roof-4.002_Cube.002", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.237761, -3.407842, 0.886606));
  v.add(new PVector(-0.237761, -3.407842, 0.886606));
  v.add(new PVector(-0.237761, -3.407842, -0.886604));
  v.add(new PVector(0.237761, -3.407842, -0.886604));
  d = new Data("roof-4.003_Cube.003", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.0, -2.47035, -2.0));
  v.add(new PVector(0.237761, -3.407842, -0.886604));
  v.add(new PVector(-0.237761, -3.407842, -0.886604));
  v.add(new PVector(-2.0, -2.47035, -2.0));
  d = new Data("roof-4.004_Cube.004", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.0, -2.47035, -2.0));
  v.add(new PVector(-0.237761, -3.407842, -0.886604));
  v.add(new PVector(-0.237761, -3.407842, 0.886606));
  v.add(new PVector(-2.0, -2.47035, 2.0));
  d = new Data("roof-4.005_Cube.005", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.324165, -2.039428, 2.324165));
  v.add(new PVector(2.324165, -2.420841, 2.324166));
  v.add(new PVector(2.324165, -2.420842, -2.324165));
  v.add(new PVector(2.324165, -2.039428, -2.324165));
  d = new Data("roof-4.006_Cube.006", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.324165, -2.039428, -2.324165));
  v.add(new PVector(2.324165, -2.420842, -2.324165));
  v.add(new PVector(-2.324165, -2.420842, -2.324165));
  v.add(new PVector(-2.324165, -2.039428, -2.324165));
  d = new Data("roof-4.007_Cube.008", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.324165, -2.039428, 2.324165));
  v.add(new PVector(-2.324165, -2.420841, 2.324166));
  v.add(new PVector(2.324165, -2.420841, 2.324166));
  v.add(new PVector(2.324165, -2.039428, 2.324165));
  d = new Data("roof-4.008_Cube.010", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.324165, -2.039428, -2.324165));
  v.add(new PVector(-2.324165, -2.420842, -2.324165));
  v.add(new PVector(-2.324165, -2.420841, 2.324166));
  v.add(new PVector(-2.324165, -2.039428, 2.324165));
  d = new Data("roof-4.009_Cube.011", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.0, -2.47035, 2.0));
  v.add(new PVector(0.237761, -3.407842, 0.886606));
  v.add(new PVector(0.237761, -3.407842, -0.886604));
  v.add(new PVector(2.0, -2.47035, -2.0));
  d = new Data("roof-4.010_Cube.012", 0, v);
  dd.add(d);

  roof = new Roof("roof-4", n, dd);
  p.add(roof);


  roofaddon = new ArrayList();
  top = new ArrayList();
  n = new RoofNext(roofaddon, top);

  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(2.791437, -2.011514, -2.535235));
  v.add(new PVector(0.791437, -2.011514, -2.535235));
  v.add(new PVector(0.791437, -2.011514, -1.195796));
  v.add(new PVector(2.791437, -2.011514, -1.195796));
  d = new Data("roof-5_Cube.021", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.791437, -4.011516, -2.535234));
  v.add(new PVector(2.791437, -4.011516, -2.535234));
  v.add(new PVector(2.791437, -4.011515, -1.195795));
  v.add(new PVector(0.791437, -4.011515, -1.195795));
  d = new Data("roof-5.001_Cube.001", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.791437, -2.011514, -1.0));
  v.add(new PVector(0.791437, -2.011514, -1.0));
  v.add(new PVector(0.791437, -2.011514, 1.0));
  v.add(new PVector(2.791437, -2.011514, 1.0));
  d = new Data("roof-5.002_Cube.002", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.791437, -4.011515, -0.999999));
  v.add(new PVector(2.791437, -4.011515, -0.999999));
  v.add(new PVector(2.791437, -4.011515, 1.000001));
  v.add(new PVector(0.791437, -4.011515, 1.000001));
  d = new Data("roof-5.003_Cube.003", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.577114, -2.011514, -1.0));
  v.add(new PVector(-2.416701, -2.011514, -1.0));
  v.add(new PVector(-2.416701, -2.011513, 2.351919));
  v.add(new PVector(0.577114, -2.011513, 2.351919));
  d = new Data("roof-5.004_Cube.004", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.416701, -2.425868, -1.0));
  v.add(new PVector(0.577114, -2.425868, -1.0));
  v.add(new PVector(0.577114, -2.425868, 2.351919));
  v.add(new PVector(-2.416701, -2.425868, 2.351919));
  d = new Data("roof-5.005_Cube.005", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.420701, -2.440247, 2.16487));
  v.add(new PVector(0.350245, -2.440247, 2.16487));
  v.add(new PVector(0.350245, -2.9514, 2.16487));
  v.add(new PVector(0.420701, -2.9514, 2.16487));
  d = new Data("roof-5.006_Cube.006", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.284348, -2.440247, 2.16487));
  v.add(new PVector(0.213891, -2.440247, 2.16487));
  v.add(new PVector(0.213891, -2.9514, 2.16487));
  v.add(new PVector(0.284348, -2.9514, 2.16487));
  d = new Data("roof-5.007_Cube.007", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.137819, -2.440247, 2.16487));
  v.add(new PVector(0.067362, -2.440247, 2.16487));
  v.add(new PVector(0.067362, -2.9514, 2.16487));
  v.add(new PVector(0.137819, -2.9514, 2.16487));
  d = new Data("roof-5.008_Cube.008", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.002605, -2.440247, 2.16487));
  v.add(new PVector(-0.073062, -2.440247, 2.16487));
  v.add(new PVector(-0.073062, -2.9514, 2.16487));
  v.add(new PVector(-0.002605, -2.9514, 2.16487));
  d = new Data("roof-5.009_Cube.010", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.143029, -2.440247, 2.16487));
  v.add(new PVector(-0.213486, -2.440247, 2.16487));
  v.add(new PVector(-0.213486, -2.9514, 2.16487));
  v.add(new PVector(-0.143029, -2.9514, 2.16487));
  d = new Data("roof-5.010_Cube.011", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.283453, -2.440247, 2.16487));
  v.add(new PVector(-0.353909, -2.440247, 2.16487));
  v.add(new PVector(-0.353909, -2.9514, 2.16487));
  v.add(new PVector(-0.283453, -2.9514, 2.16487));
  d = new Data("roof-5.011_Cube.012", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.423877, -2.440247, 2.16487));
  v.add(new PVector(-0.494333, -2.440247, 2.16487));
  v.add(new PVector(-0.494333, -2.9514, 2.16487));
  v.add(new PVector(-0.423877, -2.9514, 2.16487));
  d = new Data("roof-5.012_Cube.013", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.56023, -2.440247, 2.16487));
  v.add(new PVector(-0.630686, -2.440247, 2.16487));
  v.add(new PVector(-0.630686, -2.9514, 2.16487));
  v.add(new PVector(-0.56023, -2.9514, 2.16487));
  d = new Data("roof-5.013_Cube.014", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.698619, -2.440247, 2.16487));
  v.add(new PVector(-0.769075, -2.440247, 2.16487));
  v.add(new PVector(-0.769075, -2.9514, 2.16487));
  v.add(new PVector(-0.698619, -2.9514, 2.16487));
  d = new Data("roof-5.014_Cube.015", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.834972, -2.440247, 2.16487));
  v.add(new PVector(-0.905429, -2.440247, 2.16487));
  v.add(new PVector(-0.905429, -2.9514, 2.16487));
  v.add(new PVector(-0.834972, -2.9514, 2.16487));
  d = new Data("roof-5.015_Cube.016", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.973361, -2.440247, 2.16487));
  v.add(new PVector(-1.043817, -2.440247, 2.16487));
  v.add(new PVector(-1.043817, -2.9514, 2.16487));
  v.add(new PVector(-0.973361, -2.9514, 2.16487));
  d = new Data("roof-5.016_Cube.017", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.093433, -2.440247, 2.16487));
  v.add(new PVector(-1.16389, -2.440247, 2.16487));
  v.add(new PVector(-1.16389, -2.9514, 2.16487));
  v.add(new PVector(-1.093433, -2.9514, 2.16487));
  d = new Data("roof-5.017_Cube.018", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.211313, -2.440247, 2.154233));
  v.add(new PVector(-2.211313, -2.440247, 2.083776));
  v.add(new PVector(-2.211313, -2.9514, 2.083776));
  v.add(new PVector(-2.211313, -2.9514, 2.154233));
  d = new Data("roof-5.018_Cube.019", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.211313, -2.440247, 2.017879));
  v.add(new PVector(-2.211313, -2.440247, 1.947422));
  v.add(new PVector(-2.211313, -2.9514, 1.947423));
  v.add(new PVector(-2.211313, -2.9514, 2.017879));
  d = new Data("roof-5.019_Cube.020", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.211313, -2.440247, 1.871349));
  v.add(new PVector(-2.211313, -2.440247, 1.800893));
  v.add(new PVector(-2.211313, -2.9514, 1.800893));
  v.add(new PVector(-2.211313, -2.9514, 1.871349));
  d = new Data("roof-5.020_Cube.022", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.211313, -2.440247, 1.730925));
  v.add(new PVector(-2.211313, -2.440247, 1.660469));
  v.add(new PVector(-2.211313, -2.9514, 1.66047));
  v.add(new PVector(-2.211313, -2.9514, 1.730925));
  d = new Data("roof-5.021_Cube.023", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.211313, -2.440247, 1.590502));
  v.add(new PVector(-2.211313, -2.440247, 1.520045));
  v.add(new PVector(-2.211313, -2.9514, 1.520046));
  v.add(new PVector(-2.211313, -2.9514, 1.590503));
  d = new Data("roof-5.022_Cube.024", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.211313, -2.440247, 1.450078));
  v.add(new PVector(-2.211313, -2.440247, 1.379621));
  v.add(new PVector(-2.211313, -2.9514, 1.379622));
  v.add(new PVector(-2.211313, -2.9514, 1.450078));
  d = new Data("roof-5.023_Cube.025", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.211313, -2.440247, 1.309654));
  v.add(new PVector(-2.211313, -2.440247, 1.239197));
  v.add(new PVector(-2.211313, -2.9514, 1.239197));
  v.add(new PVector(-2.211313, -2.9514, 1.309654));
  d = new Data("roof-5.024_Cube.026", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.211313, -2.440247, 1.173301));
  v.add(new PVector(-2.211313, -2.440247, 1.102844));
  v.add(new PVector(-2.211313, -2.9514, 1.102844));
  v.add(new PVector(-2.211313, -2.9514, 1.173301));
  d = new Data("roof-5.025_Cube.027", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.211313, -2.440247, 1.034912));
  v.add(new PVector(-2.211313, -2.440247, 0.964455));
  v.add(new PVector(-2.211313, -2.9514, 0.964455));
  v.add(new PVector(-2.211313, -2.9514, 1.034912));
  d = new Data("roof-5.026_Cube.028", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.211313, -2.440247, 0.898559));
  v.add(new PVector(-2.211313, -2.440247, 0.828102));
  v.add(new PVector(-2.211313, -2.9514, 0.828102));
  v.add(new PVector(-2.211313, -2.9514, 0.898559));
  d = new Data("roof-5.027_Cube.029", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.211313, -2.440247, 0.76017));
  v.add(new PVector(-2.211313, -2.440247, 0.689713));
  v.add(new PVector(-2.211313, -2.9514, 0.689713));
  v.add(new PVector(-2.211313, -2.9514, 0.76017));
  d = new Data("roof-5.028_Cube.030", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.211313, -2.440247, 0.640097));
  v.add(new PVector(-2.211313, -2.440247, 0.569641));
  v.add(new PVector(-2.211313, -2.9514, 0.569641));
  v.add(new PVector(-2.211313, -2.9514, 0.640097));
  d = new Data("roof-5.029_Cube.031", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.58623, -2.011514, -1.819418));
  v.add(new PVector(-1.41377, -2.011514, -1.819418));
  v.add(new PVector(-1.41377, -2.011514, -1.206297));
  v.add(new PVector(0.58623, -2.011514, -1.206297));
  d = new Data("roof-5.030_Cube.032", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.41377, -3.350716, -1.819417));
  v.add(new PVector(0.58623, -3.350716, -1.819417));
  v.add(new PVector(0.58623, -3.350716, -1.206296));
  v.add(new PVector(-1.41377, -3.350716, -1.206296));
  d = new Data("roof-5.031_Cube.033", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.58623, -3.426471, -1.819417));
  v.add(new PVector(-1.41377, -3.426471, -1.819417));
  v.add(new PVector(-1.41377, -3.426471, 2.392937));
  v.add(new PVector(0.58623, -3.426471, 2.392937));
  d = new Data("roof-5.032_Cube.034", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.41377, -3.604734, -1.819417));
  v.add(new PVector(0.58623, -3.604734, -1.819417));
  v.add(new PVector(0.58623, -3.604733, 2.392937));
  v.add(new PVector(-1.41377, -3.604733, 2.392937));
  d = new Data("roof-5.033_Cube.035", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.581399, -2.022456, 1.009937));
  v.add(new PVector(2.510942, -2.022456, 1.009937));
  v.add(new PVector(2.510942, -4.003615, 1.009938));
  v.add(new PVector(2.581399, -4.003615, 1.009938));
  d = new Data("roof-5.034_Cube.036", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.445045, -2.022456, 1.009937));
  v.add(new PVector(2.374589, -2.022456, 1.009937));
  v.add(new PVector(2.374589, -4.003615, 1.009938));
  v.add(new PVector(2.445045, -4.003615, 1.009938));
  d = new Data("roof-5.035_Cube.037", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.298516, -2.022456, 1.009937));
  v.add(new PVector(2.22806, -2.022456, 1.009937));
  v.add(new PVector(2.22806, -4.003615, 1.009938));
  v.add(new PVector(2.298516, -4.003615, 1.009938));
  d = new Data("roof-5.036_Cube.038", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.158092, -2.022456, 1.009937));
  v.add(new PVector(2.087636, -2.022456, 1.009937));
  v.add(new PVector(2.087636, -4.003615, 1.009938));
  v.add(new PVector(2.158092, -4.003615, 1.009938));
  d = new Data("roof-5.037_Cube.039", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.017669, -2.022456, 1.009937));
  v.add(new PVector(1.947212, -2.022456, 1.009937));
  v.add(new PVector(1.947212, -4.003615, 1.009938));
  v.add(new PVector(2.017669, -4.003615, 1.009938));
  d = new Data("roof-5.038_Cube.040", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.791437, -2.011514, -1.195796));
  v.add(new PVector(2.791437, -4.011515, -1.195795));
  v.add(new PVector(2.791437, -4.011516, -2.535234));
  v.add(new PVector(2.791437, -2.011514, -2.535235));
  d = new Data("roof-5.039_Cube.041", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.791437, -2.011514, -2.535235));
  v.add(new PVector(2.791437, -4.011516, -2.535234));
  v.add(new PVector(0.791437, -4.011516, -2.535234));
  v.add(new PVector(0.791437, -2.011514, -2.535235));
  d = new Data("roof-5.040_Cube.042", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.791437, -2.011514, -1.195796));
  v.add(new PVector(0.791437, -4.011515, -1.195795));
  v.add(new PVector(2.791437, -4.011515, -1.195795));
  v.add(new PVector(2.791437, -2.011514, -1.195796));
  d = new Data("roof-5.041_Cube.043", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.791437, -2.011514, -2.535235));
  v.add(new PVector(0.791437, -4.011516, -2.535234));
  v.add(new PVector(0.791437, -4.011515, -1.195795));
  v.add(new PVector(0.791437, -2.011514, -1.195796));
  d = new Data("roof-5.042_Cube.044", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.791437, -2.011514, 1.0));
  v.add(new PVector(2.791437, -4.011515, 1.000001));
  v.add(new PVector(2.791437, -4.011515, -0.999999));
  v.add(new PVector(2.791437, -2.011514, -1.0));
  d = new Data("roof-5.043_Cube.045", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.791437, -2.011514, -1.0));
  v.add(new PVector(2.791437, -4.011515, -0.999999));
  v.add(new PVector(0.791437, -4.011515, -0.999999));
  v.add(new PVector(0.791437, -2.011514, -1.0));
  d = new Data("roof-5.044_Cube.046", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.791437, -2.011514, 1.0));
  v.add(new PVector(0.791437, -4.011515, 1.000001));
  v.add(new PVector(2.791437, -4.011515, 1.000001));
  v.add(new PVector(2.791437, -2.011514, 1.0));
  d = new Data("roof-5.045_Cube.047", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.791437, -2.011514, -1.0));
  v.add(new PVector(0.791437, -4.011515, -0.999999));
  v.add(new PVector(0.791437, -4.011515, 1.000001));
  v.add(new PVector(0.791437, -2.011514, 1.0));
  d = new Data("roof-5.046_Cube.048", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.577114, -2.011513, 2.351919));
  v.add(new PVector(0.577114, -2.425868, 2.351919));
  v.add(new PVector(0.577114, -2.425868, -1.0));
  v.add(new PVector(0.577114, -2.011514, -1.0));
  d = new Data("roof-5.047_Cube.049", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.577114, -2.011514, -1.0));
  v.add(new PVector(0.577114, -2.425868, -1.0));
  v.add(new PVector(-2.416701, -2.425868, -1.0));
  v.add(new PVector(-2.416701, -2.011514, -1.0));
  d = new Data("roof-5.048_Cube.050", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.416701, -2.011513, 2.351919));
  v.add(new PVector(-2.416701, -2.425868, 2.351919));
  v.add(new PVector(0.577114, -2.425868, 2.351919));
  v.add(new PVector(0.577114, -2.011513, 2.351919));
  d = new Data("roof-5.049_Cube.051", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.416701, -2.011514, -1.0));
  v.add(new PVector(-2.416701, -2.425868, -1.0));
  v.add(new PVector(-2.416701, -2.425868, 2.351919));
  v.add(new PVector(-2.416701, -2.011513, 2.351919));
  d = new Data("roof-5.050_Cube.052", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.58623, -2.011514, -1.206297));
  v.add(new PVector(0.58623, -3.350716, -1.206296));
  v.add(new PVector(0.58623, -3.350716, -1.819417));
  v.add(new PVector(0.58623, -2.011514, -1.819418));
  d = new Data("roof-5.051_Cube.053", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.58623, -2.011514, -1.819418));
  v.add(new PVector(0.58623, -3.350716, -1.819417));
  v.add(new PVector(-1.41377, -3.350716, -1.819417));
  v.add(new PVector(-1.41377, -2.011514, -1.819418));
  d = new Data("roof-5.052_Cube.054", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.41377, -2.011514, -1.206297));
  v.add(new PVector(-1.41377, -3.350716, -1.206296));
  v.add(new PVector(0.58623, -3.350716, -1.206296));
  v.add(new PVector(0.58623, -2.011514, -1.206297));
  d = new Data("roof-5.053_Cube.055", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.41377, -2.011514, -1.819418));
  v.add(new PVector(-1.41377, -3.350716, -1.819417));
  v.add(new PVector(-1.41377, -3.350716, -1.206296));
  v.add(new PVector(-1.41377, -2.011514, -1.206297));
  d = new Data("roof-5.054_Cube.056", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.58623, -3.426471, 2.392937));
  v.add(new PVector(0.58623, -3.604733, 2.392937));
  v.add(new PVector(0.58623, -3.604734, -1.819417));
  v.add(new PVector(0.58623, -3.426471, -1.819417));
  d = new Data("roof-5.055_Cube.057", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.58623, -3.426471, -1.819417));
  v.add(new PVector(0.58623, -3.604734, -1.819417));
  v.add(new PVector(-1.41377, -3.604734, -1.819417));
  v.add(new PVector(-1.41377, -3.426471, -1.819417));
  d = new Data("roof-5.056_Cube.058", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.41377, -3.426471, 2.392937));
  v.add(new PVector(-1.41377, -3.604733, 2.392937));
  v.add(new PVector(0.58623, -3.604733, 2.392937));
  v.add(new PVector(0.58623, -3.426471, 2.392937));
  d = new Data("roof-5.057_Cube.059", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.41377, -3.426471, -1.819417));
  v.add(new PVector(-1.41377, -3.604734, -1.819417));
  v.add(new PVector(-1.41377, -3.604733, 2.392937));
  v.add(new PVector(-1.41377, -3.426471, 2.392937));
  d = new Data("roof-5.058_Cube.060", 0, v);
  dd.add(d);

  roof = new Roof("roof-5", n, dd);
  p.add(roof);


  return p;
}

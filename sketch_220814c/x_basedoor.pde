class Door {
  String id;
  ArrayList<Data> data;
  Door(String id, ArrayList<Data> data) {
    this.id = id;
    this.data = data;
  }
}

ArrayList<Door> getBasedoorData() {
  ArrayList<Data> dd;
  ArrayList<PVector> v;
  Data d;
  Door door;

  ArrayList<Door> p = new ArrayList();

  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(-1.000001, -0.000574, 2.013742));
  v.add(new PVector(0.999999, -0.000574, 2.013742));
  v.add(new PVector(0.999999, -1.54063, 2.013742));
  v.add(new PVector(-1.000001, -1.54063, 2.013742));
  d = new Data("basedoor-0_Plane.004", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.029073, -0.040897, 2.026572));
  v.add(new PVector(0.944677, -0.040897, 2.026572));
  v.add(new PVector(0.944677, -1.490588, 2.026572));
  v.add(new PVector(0.029073, -1.490588, 2.026572));
  d = new Data("basedoor-0.001_Plane.001", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.945348, -0.040897, 2.026572));
  v.add(new PVector(-0.029744, -0.040897, 2.026572));
  v.add(new PVector(-0.029744, -1.490588, 2.026572));
  v.add(new PVector(-0.945348, -1.490588, 2.026572));
  d = new Data("basedoor-0.002_Plane.002", 2, v);
  dd.add(d);

  door = new Door("basedoor-0", dd);
  p.add(door);


  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(1.0, 0.0, 2.014716));
  v.add(new PVector(-1.0, 0.0, 2.014716));
  v.add(new PVector(-1.0, 0.0, 2.688803));
  v.add(new PVector(1.0, 0.0, 2.688803));
  d = new Data("basedoor-1_Cube.002", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.0, -0.1, 2.014716));
  v.add(new PVector(1.0, -0.1, 2.014716));
  v.add(new PVector(1.0, -0.1, 2.688803));
  v.add(new PVector(-1.0, -0.1, 2.688803));
  d = new Data("basedoor-1.001_Cube.001", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.0, 0.0, 2.014716));
  v.add(new PVector(-1.0, -0.1, 2.014716));
  v.add(new PVector(-1.0, -0.1, 2.688803));
  v.add(new PVector(-1.0, 0.0, 2.688803));
  d = new Data("basedoor-1.002_Cube.003", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.843642, -1.426263, 2.007854));
  v.add(new PVector(0.843642, -1.426263, 2.548479));
  v.add(new PVector(0.643642, -1.694169, 2.007854));
  d = new Data("basedoor-1.003_Cube.004", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.643642, -1.694173, 2.00785));
  v.add(new PVector(0.643642, -1.694169, 2.007854));
  v.add(new PVector(0.843642, -1.426263, 2.548479));
  v.add(new PVector(-0.843642, -1.426263, 2.548479));
  d = new Data("basedoor-1.004_Cube.005", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.843642, -1.426263, 2.007854));
  v.add(new PVector(-0.843642, -1.426263, 2.007854));
  v.add(new PVector(-0.843642, -1.426263, 2.548479));
  v.add(new PVector(0.843642, -1.426263, 2.548479));
  d = new Data("basedoor-1.005_Cube.006", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.843642, -1.426263, 2.007854));
  v.add(new PVector(-0.643642, -1.694173, 2.00785));
  v.add(new PVector(-0.843642, -1.426263, 2.548479));
  d = new Data("basedoor-1.006_Cube.007", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.589526, -0.108107, 2.148788));
  v.add(new PVector(-0.589526, -1.419787, 2.148788));
  v.add(new PVector(-0.455698, -1.419787, 2.148788));
  v.add(new PVector(-0.455698, -0.108107, 2.148788));
  d = new Data("basedoor-1.007_Cube.008", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.455698, -0.108107, 2.148788));
  v.add(new PVector(-0.455698, -1.419787, 2.148788));
  v.add(new PVector(-0.455698, -1.419787, 2.014959));
  v.add(new PVector(-0.455698, -0.108107, 2.014959));
  d = new Data("basedoor-1.008_Cube.010", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.589526, -0.108107, 2.014959));
  v.add(new PVector(-0.589526, -1.419787, 2.014959));
  v.add(new PVector(-0.589526, -1.419787, 2.148788));
  v.add(new PVector(-0.589526, -0.108107, 2.148788));
  d = new Data("basedoor-1.009_Cube.011", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.589526, -0.108107, 2.148788));
  v.add(new PVector(0.589526, -1.419787, 2.148788));
  v.add(new PVector(0.455698, -1.419787, 2.148788));
  v.add(new PVector(0.455698, -0.108107, 2.148788));
  d = new Data("basedoor-1.010_Cube.012", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.455698, -0.108107, 2.148788));
  v.add(new PVector(0.455698, -1.419787, 2.148788));
  v.add(new PVector(0.455698, -1.419787, 2.01496));
  v.add(new PVector(0.455698, -0.108107, 2.01496));
  d = new Data("basedoor-1.011_Cube.013", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.589526, -0.108107, 2.01496));
  v.add(new PVector(0.589526, -1.419787, 2.01496));
  v.add(new PVector(0.589526, -1.419787, 2.148788));
  v.add(new PVector(0.589526, -0.108107, 2.148788));
  d = new Data("basedoor-1.012_Cube.014", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.406754, -0.157001, 2.01052));
  v.add(new PVector(0.352954, -0.157001, 2.01052));
  v.add(new PVector(0.352954, -1.379243, 2.01052));
  v.add(new PVector(0.406754, -1.379243, 2.01052));
  d = new Data("basedoor-1.013_Cube.015", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.299154, -0.157001, 2.01052));
  v.add(new PVector(0.245354, -0.157001, 2.01052));
  v.add(new PVector(0.245354, -1.379243, 2.01052));
  v.add(new PVector(0.299154, -1.379243, 2.01052));
  d = new Data("basedoor-1.014_Cube.016", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.191554, -0.157001, 2.01052));
  v.add(new PVector(0.137754, -0.157001, 2.01052));
  v.add(new PVector(0.137754, -1.379243, 2.01052));
  v.add(new PVector(0.191554, -1.379243, 2.01052));
  d = new Data("basedoor-1.015_Cube.017", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.083954, -0.157001, 2.01052));
  v.add(new PVector(0.030154, -0.157001, 2.01052));
  v.add(new PVector(0.030154, -1.379243, 2.01052));
  v.add(new PVector(0.083954, -1.379243, 2.01052));
  d = new Data("basedoor-1.016_Cube.018", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.023646, -0.157001, 2.01052));
  v.add(new PVector(-0.077446, -0.157001, 2.01052));
  v.add(new PVector(-0.077446, -1.379243, 2.01052));
  v.add(new PVector(-0.023646, -1.379243, 2.01052));
  d = new Data("basedoor-1.017_Cube.019", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.131246, -0.157001, 2.01052));
  v.add(new PVector(-0.185046, -0.157001, 2.01052));
  v.add(new PVector(-0.185046, -1.379243, 2.01052));
  v.add(new PVector(-0.131246, -1.379243, 2.01052));
  d = new Data("basedoor-1.018_Cube.020", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.238845, -0.157001, 2.01052));
  v.add(new PVector(-0.292645, -0.157001, 2.01052));
  v.add(new PVector(-0.292645, -1.379243, 2.01052));
  v.add(new PVector(-0.238845, -1.379243, 2.01052));
  d = new Data("basedoor-1.019_Cube.021", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.346445, -0.157001, 2.01052));
  v.add(new PVector(-0.400245, -0.157001, 2.01052));
  v.add(new PVector(-0.400245, -1.379243, 2.01052));
  v.add(new PVector(-0.346445, -1.379243, 2.01052));
  d = new Data("basedoor-1.020_Cube.022", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.0, 0.0, 2.688803));
  v.add(new PVector(1.0, -0.1, 2.688803));
  v.add(new PVector(1.0, -0.1, 2.014716));
  v.add(new PVector(1.0, 0.0, 2.014716));
  d = new Data("basedoor-1.021_Cube.023", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.0, 0.0, 2.688803));
  v.add(new PVector(-1.0, -0.1, 2.688803));
  v.add(new PVector(1.0, -0.1, 2.688803));
  v.add(new PVector(1.0, 0.0, 2.688803));
  d = new Data("basedoor-1.022_Cube.024", 1, v);
  dd.add(d);

  door = new Door("basedoor-1", dd);
  p.add(door);


  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(-1.000001, -0.000574, 2.013742));
  v.add(new PVector(0.999999, -0.000574, 2.013742));
  v.add(new PVector(0.999999, -1.54063, 2.013742));
  v.add(new PVector(-1.000001, -1.54063, 2.013742));
  d = new Data("basedoor-2_Plane.005", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.029073, -0.040897, 2.026572));
  v.add(new PVector(0.944677, -0.040897, 2.026572));
  v.add(new PVector(0.944677, -0.3371, 2.026572));
  v.add(new PVector(0.029073, -0.3371, 2.026572));
  d = new Data("basedoor-2.001_Plane.001", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.945348, -0.040897, 2.026572));
  v.add(new PVector(-0.029744, -0.040897, 2.026572));
  v.add(new PVector(-0.029744, -0.3371, 2.026572));
  v.add(new PVector(-0.945348, -0.3371, 2.026572));
  d = new Data("basedoor-2.002_Plane.002", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.945348, -1.271753, 2.026572));
  v.add(new PVector(-0.029744, -1.271753, 2.026572));
  v.add(new PVector(-0.029744, -1.476521, 2.026572));
  v.add(new PVector(-0.945348, -1.476521, 2.026572));
  d = new Data("basedoor-2.003_Plane.003", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.029073, -1.271753, 2.026572));
  v.add(new PVector(0.944677, -1.271753, 2.026572));
  v.add(new PVector(0.944677, -1.476521, 2.026572));
  v.add(new PVector(0.029073, -1.476521, 2.026572));
  d = new Data("basedoor-2.004_Plane.004", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.029073, -0.396087, 2.026572));
  v.add(new PVector(0.944677, -0.396087, 2.026572));
  v.add(new PVector(0.944677, -1.212766, 2.026572));
  v.add(new PVector(0.029073, -1.212766, 2.026572));
  d = new Data("basedoor-2.005_Plane.006", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.945348, -0.396087, 2.026572));
  v.add(new PVector(-0.029744, -0.396087, 2.026572));
  v.add(new PVector(-0.029744, -1.212766, 2.026572));
  v.add(new PVector(-0.945348, -1.212766, 2.026572));
  d = new Data("basedoor-2.006_Plane.007", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.476375, -0.396087, 2.026572));
  v.add(new PVector(-1.204332, -0.396087, 2.026572));
  v.add(new PVector(-1.204332, -1.212766, 2.026572));
  v.add(new PVector(-1.476375, -1.212766, 2.026572));
  d = new Data("basedoor-2.007_Plane.008", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.189309, -0.396087, 2.026572));
  v.add(new PVector(1.461351, -0.396087, 2.026572));
  v.add(new PVector(1.461351, -1.212766, 2.026572));
  v.add(new PVector(1.189309, -1.212766, 2.026572));
  d = new Data("basedoor-2.008_Plane.009", 1, v);
  dd.add(d);

  door = new Door("basedoor-2", dd);
  p.add(door);


  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(0.75353, 0.0, 2.014716));
  v.add(new PVector(-0.753531, 0.0, 2.014716));
  v.add(new PVector(-0.753531, 0.0, 2.688803));
  v.add(new PVector(0.753531, 0.0, 2.688803));
  d = new Data("basedoor-3_Cube.003", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.753531, -0.1, 2.014716));
  v.add(new PVector(0.75353, -0.1, 2.014716));
  v.add(new PVector(0.753531, -0.1, 2.688803));
  v.add(new PVector(-0.753531, -0.1, 2.688803));
  d = new Data("basedoor-3.001_Cube.001", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.753531, 0.0, 2.014716));
  v.add(new PVector(-0.753531, -0.1, 2.014716));
  v.add(new PVector(-0.753531, -0.1, 2.688803));
  v.add(new PVector(-0.753531, 0.0, 2.688803));
  d = new Data("basedoor-3.002_Cube.002", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.687845, -1.536244, 2.014716));
  v.add(new PVector(0.687845, -1.536244, 2.014716));
  v.add(new PVector(0.687845, -1.536244, 2.470034));
  v.add(new PVector(-0.687845, -1.536244, 2.470034));
  d = new Data("basedoor-3.003_Cube.004", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.687845, -1.436244, 2.014716));
  v.add(new PVector(-0.687845, -1.436244, 2.014716));
  v.add(new PVector(-0.687845, -1.436244, 2.470034));
  v.add(new PVector(0.687845, -1.436244, 2.470034));
  d = new Data("basedoor-3.004_Cube.005", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.687845, -1.436244, 2.470034));
  v.add(new PVector(0.687845, -1.536244, 2.470034));
  v.add(new PVector(0.687845, -1.536244, 2.014716));
  v.add(new PVector(0.687845, -1.436244, 2.014716));
  d = new Data("basedoor-3.005_Cube.006", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.589526, -0.108107, 2.148788));
  v.add(new PVector(-0.589526, -1.419787, 2.148788));
  v.add(new PVector(-0.455698, -1.419787, 2.148788));
  v.add(new PVector(-0.455698, -0.108107, 2.148788));
  d = new Data("basedoor-3.006_Cube.007", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.455698, -0.108107, 2.148788));
  v.add(new PVector(-0.455698, -1.419787, 2.148788));
  v.add(new PVector(-0.455698, -1.419787, 2.014959));
  v.add(new PVector(-0.455698, -0.108107, 2.014959));
  d = new Data("basedoor-3.007_Cube.008", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.589526, -0.108107, 2.014959));
  v.add(new PVector(-0.589526, -1.419787, 2.014959));
  v.add(new PVector(-0.589526, -1.419787, 2.148788));
  v.add(new PVector(-0.589526, -0.108107, 2.148788));
  d = new Data("basedoor-3.008_Cube.010", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.589526, -0.108107, 2.148788));
  v.add(new PVector(0.589526, -1.419787, 2.148788));
  v.add(new PVector(0.455698, -1.419787, 2.148788));
  v.add(new PVector(0.455698, -0.108107, 2.148788));
  d = new Data("basedoor-3.009_Cube.011", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.455698, -0.108107, 2.148788));
  v.add(new PVector(0.455698, -1.419787, 2.148788));
  v.add(new PVector(0.455698, -1.419787, 2.01496));
  v.add(new PVector(0.455698, -0.108107, 2.01496));
  d = new Data("basedoor-3.010_Cube.012", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.589526, -0.108107, 2.01496));
  v.add(new PVector(0.589526, -1.419787, 2.01496));
  v.add(new PVector(0.589526, -1.419787, 2.148788));
  v.add(new PVector(0.589526, -0.108107, 2.148788));
  d = new Data("basedoor-3.011_Cube.013", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.397962, -0.157001, 2.01052));
  v.add(new PVector(-0.397283, -0.157001, 2.01052));
  v.add(new PVector(-0.397283, -1.379243, 2.01052));
  v.add(new PVector(0.397962, -1.379243, 2.01052));
  d = new Data("basedoor-3.012_Cube.014", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.687845, -1.436244, 2.014716));
  v.add(new PVector(-0.687845, -1.536244, 2.014716));
  v.add(new PVector(-0.687845, -1.536244, 2.470034));
  v.add(new PVector(-0.687845, -1.436244, 2.470034));
  d = new Data("basedoor-3.013_Cube.015", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.753531, 0.0, 2.688803));
  v.add(new PVector(0.753531, -0.1, 2.688803));
  v.add(new PVector(0.75353, -0.1, 2.014716));
  v.add(new PVector(0.75353, 0.0, 2.014716));
  d = new Data("basedoor-3.014_Cube.016", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.753531, 0.0, 2.688803));
  v.add(new PVector(-0.753531, -0.1, 2.688803));
  v.add(new PVector(0.753531, -0.1, 2.688803));
  v.add(new PVector(0.753531, 0.0, 2.688803));
  d = new Data("basedoor-3.015_Cube.017", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.687845, -1.436244, 2.470034));
  v.add(new PVector(-0.687845, -1.536244, 2.470034));
  v.add(new PVector(0.687845, -1.536244, 2.470034));
  v.add(new PVector(0.687845, -1.436244, 2.470034));
  d = new Data("basedoor-3.016_Cube.018", 1, v);
  dd.add(d);

  door = new Door("basedoor-3", dd);
  p.add(door);


  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(0.507551, 0.0, 2.014716));
  v.add(new PVector(-0.507551, 0.0, 2.014716));
  v.add(new PVector(-0.507551, 0.0, 2.393707));
  v.add(new PVector(0.507551, 0.0, 2.393707));
  d = new Data("basedoor-4_Cube.011", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.507551, -0.064385, 2.014716));
  v.add(new PVector(0.507551, -0.064385, 2.014716));
  v.add(new PVector(0.507551, -0.064385, 2.393707));
  v.add(new PVector(-0.507551, -0.064385, 2.393707));
  d = new Data("basedoor-4.001_Cube.001", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.507551, 0.0, 2.014716));
  v.add(new PVector(-0.507551, -0.064385, 2.014716));
  v.add(new PVector(-0.507551, -0.064385, 2.393707));
  v.add(new PVector(-0.507551, 0.0, 2.393707));
  d = new Data("basedoor-4.002_Cube.002", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.444742, -0.072926, 2.014716));
  v.add(new PVector(-0.444742, -0.137311, 2.014716));
  v.add(new PVector(-0.444742, -0.137311, 2.305517));
  v.add(new PVector(-0.444742, -0.072926, 2.305517));
  d = new Data("basedoor-4.003_Cube.003", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.444742, -0.137311, 2.014716));
  v.add(new PVector(0.444742, -0.137311, 2.014716));
  v.add(new PVector(0.444742, -0.137311, 2.305517));
  v.add(new PVector(-0.444742, -0.137311, 2.305517));
  d = new Data("basedoor-4.004_Cube.004", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.444742, -0.072926, 2.305517));
  v.add(new PVector(0.444742, -0.137311, 2.305517));
  v.add(new PVector(0.444742, -0.137311, 2.014716));
  v.add(new PVector(0.444742, -0.072926, 2.014716));
  d = new Data("basedoor-4.005_Cube.005", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.349769, -0.455924, 2.024087));
  v.add(new PVector(0.295969, -0.455924, 2.024087));
  v.add(new PVector(0.295969, -1.379243, 2.024087));
  v.add(new PVector(0.349769, -1.379243, 2.024087));
  d = new Data("basedoor-4.006_Cube.006", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.24217, -0.455924, 2.024087));
  v.add(new PVector(0.18837, -0.455924, 2.024087));
  v.add(new PVector(0.18837, -1.379243, 2.024087));
  v.add(new PVector(0.24217, -1.379243, 2.024087));
  d = new Data("basedoor-4.007_Cube.007", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.13457, -0.455924, 2.024087));
  v.add(new PVector(0.08077, -0.455924, 2.024087));
  v.add(new PVector(0.08077, -1.379243, 2.024087));
  v.add(new PVector(0.13457, -1.379243, 2.024087));
  d = new Data("basedoor-4.008_Cube.008", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.02697, -0.455924, 2.024087));
  v.add(new PVector(-0.02683, -0.455924, 2.024087));
  v.add(new PVector(-0.02683, -1.379243, 2.024087));
  v.add(new PVector(0.02697, -1.379243, 2.024087));
  d = new Data("basedoor-4.009_Cube.010", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.08063, -0.455924, 2.024087));
  v.add(new PVector(-0.13443, -0.455924, 2.024087));
  v.add(new PVector(-0.13443, -1.379243, 2.024087));
  v.add(new PVector(-0.08063, -1.379243, 2.024087));
  d = new Data("basedoor-4.010_Cube.012", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.18823, -0.455924, 2.024087));
  v.add(new PVector(-0.24203, -0.455924, 2.024087));
  v.add(new PVector(-0.24203, -1.379243, 2.024087));
  v.add(new PVector(-0.18823, -1.379243, 2.024087));
  d = new Data("basedoor-4.011_Cube.013", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.29583, -0.455924, 2.024087));
  v.add(new PVector(-0.34963, -0.455924, 2.024087));
  v.add(new PVector(-0.34963, -1.379243, 2.024087));
  v.add(new PVector(-0.29583, -1.379243, 2.024087));
  d = new Data("basedoor-4.012_Cube.014", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.404166, -0.115973, 2.01052));
  v.add(new PVector(-0.403909, -0.115973, 2.01052));
  v.add(new PVector(-0.403909, -1.434924, 2.01052));
  v.add(new PVector(0.404166, -1.434924, 2.01052));
  d = new Data("basedoor-4.013_Cube.015", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.507551, 0.0, 2.393707));
  v.add(new PVector(0.507551, -0.064385, 2.393707));
  v.add(new PVector(0.507551, -0.064385, 2.014716));
  v.add(new PVector(0.507551, 0.0, 2.014716));
  d = new Data("basedoor-4.014_Cube.016", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.507551, 0.0, 2.393707));
  v.add(new PVector(-0.507551, -0.064385, 2.393707));
  v.add(new PVector(0.507551, -0.064385, 2.393707));
  v.add(new PVector(0.507551, 0.0, 2.393707));
  d = new Data("basedoor-4.015_Cube.017", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.444742, -0.072926, 2.305517));
  v.add(new PVector(-0.444742, -0.137311, 2.305517));
  v.add(new PVector(0.444742, -0.137311, 2.305517));
  v.add(new PVector(0.444742, -0.072926, 2.305517));
  d = new Data("basedoor-4.016_Cube.018", 1, v);
  dd.add(d);

  door = new Door("basedoor-4", dd);
  p.add(door);


  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(-1.357608, -0.000574, 2.013742));
  v.add(new PVector(1.357612, -0.000574, 2.013742));
  v.add(new PVector(1.357612, -1.54063, 2.013742));
  v.add(new PVector(-1.357608, -1.54063, 2.013742));
  d = new Data("basedoor-5_Plane.007", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.025671, -0.040897, 2.026572));
  v.add(new PVector(0.834055, -0.040897, 2.026572));
  v.add(new PVector(0.834055, -1.490588, 2.026572));
  v.add(new PVector(0.025671, -1.490588, 2.026572));
  d = new Data("basedoor-5.001_Plane.001", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.834642, -0.040897, 2.026572));
  v.add(new PVector(-0.026258, -0.040897, 2.026572));
  v.add(new PVector(-0.026258, -1.490588, 2.026572));
  v.add(new PVector(-0.834642, -1.490588, 2.026572));
  d = new Data("basedoor-5.002_Plane.002", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.31039, -0.040897, 2.026572));
  v.add(new PVector(-0.87934, -0.040897, 2.026572));
  v.add(new PVector(-0.87934, -1.490588, 2.026572));
  v.add(new PVector(-1.31039, -1.490588, 2.026572));
  d = new Data("basedoor-5.003_Plane.003", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.880041, -0.040897, 2.026572));
  v.add(new PVector(1.311092, -0.040897, 2.026572));
  v.add(new PVector(1.311092, -1.490588, 2.026572));
  v.add(new PVector(0.880041, -1.490588, 2.026572));
  d = new Data("basedoor-5.004_Plane.004", 1, v);
  dd.add(d);

  door = new Door("basedoor-5", dd);
  p.add(door);


  return p;
}

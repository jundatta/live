class Win {
  String id;
  ArrayList<Data> data;
  Win(String id, ArrayList<Data> data) {
    this.id = id;
    this.data = data;
  }
}

ArrayList<Win> getBasewinsData() {
  ArrayList<Data> dd;
  ArrayList<PVector> v;
  Data d;
  Win win;

  ArrayList<Win> p = new ArrayList();

  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(2.013742, -0.470761, 1.000001));
  v.add(new PVector(2.013742, -0.470761, -0.999999));
  v.add(new PVector(2.013742, -1.54063, -0.999999));
  v.add(new PVector(2.013742, -1.54063, 1.000001));
  d = new Data("basewins-0_Plane.003", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.026572, -0.511084, -0.029073));
  v.add(new PVector(2.026572, -0.511084, -0.944677));
  v.add(new PVector(2.026572, -1.490588, -0.944677));
  v.add(new PVector(2.026572, -1.490588, -0.029073));
  d = new Data("basewins-0.001_Plane.001", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.026572, -0.511084, 0.945348));
  v.add(new PVector(2.026572, -0.511084, 0.029744));
  v.add(new PVector(2.026572, -1.490588, 0.029744));
  v.add(new PVector(2.026572, -1.490588, 0.945348));
  d = new Data("basewins-0.002_Plane.002", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.013742, -0.470761, -1.000001));
  v.add(new PVector(-2.013742, -0.470761, 0.999999));
  v.add(new PVector(-2.013742, -1.54063, 0.999999));
  v.add(new PVector(-2.013742, -1.54063, -1.000001));
  d = new Data("basewins-0.003_Plane.004", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.026572, -0.511084, 0.029073));
  v.add(new PVector(-2.026572, -0.511084, 0.944677));
  v.add(new PVector(-2.026572, -1.490588, 0.944677));
  v.add(new PVector(-2.026572, -1.490588, 0.029073));
  d = new Data("basewins-0.004_Plane.005", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.026572, -0.511084, -0.945348));
  v.add(new PVector(-2.026572, -0.511084, -0.029744));
  v.add(new PVector(-2.026572, -1.490588, -0.029744));
  v.add(new PVector(-2.026572, -1.490588, -0.945348));
  d = new Data("basewins-0.005_Plane.006", 1, v);
  dd.add(d);

  win = new Win("basewins-0", dd);
  p.add(win);


  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(1.360655, -0.574471, -2.027518));
  v.add(new PVector(-1.360652, -0.574471, -2.027519));
  v.add(new PVector(-1.360652, -1.459144, -2.027519));
  v.add(new PVector(1.360655, -1.459144, -2.027518));
  d = new Data("basewins-1_Plane.001", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.43664, -0.000574, -2.013741));
  v.add(new PVector(-1.436638, -0.000574, -2.013743));
  v.add(new PVector(-1.436638, -1.54063, -2.013743));
  v.add(new PVector(1.43664, -1.54063, -2.013741));
  d = new Data("basewins-1.001_Plane.002", 3, v);
  dd.add(d);

  win = new Win("basewins-1", dd);
  p.add(win);


  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(-2.014716, -1.500815, 0.002315));
  v.add(new PVector(-2.014716, -1.500815, -1.324665));
  v.add(new PVector(-2.233035, -1.500815, -1.324665));
  v.add(new PVector(-2.233036, -1.500815, 0.002315));
  d = new Data("basewins-2_Cube.006", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.014716, -1.600815, -1.324665));
  v.add(new PVector(-2.014716, -1.600815, 0.002315));
  v.add(new PVector(-2.233036, -1.600815, 0.002315));
  v.add(new PVector(-2.233035, -1.600815, -1.324665));
  d = new Data("basewins-2.001_Cube.001", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.014716, -1.500815, -1.324665));
  v.add(new PVector(-2.014716, -1.600815, -1.324665));
  v.add(new PVector(-2.233035, -1.600815, -1.324665));
  v.add(new PVector(-2.233035, -1.500815, -1.324665));
  d = new Data("basewins-2.002_Cube.002", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.148787, -0.457598, -1.250701));
  v.add(new PVector(-2.148787, -1.490684, -1.250701));
  v.add(new PVector(-2.148787, -1.490684, -1.116873));
  v.add(new PVector(-2.148787, -0.457598, -1.116873));
  d = new Data("basewins-2.003_Cube.003", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.148787, -0.457598, -1.116873));
  v.add(new PVector(-2.148787, -1.490684, -1.116873));
  v.add(new PVector(-2.014959, -1.490684, -1.116873));
  v.add(new PVector(-2.014959, -0.457598, -1.116873));
  d = new Data("basewins-2.004_Cube.004", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.014959, -0.457598, -1.250701));
  v.add(new PVector(-2.014959, -1.490684, -1.250701));
  v.add(new PVector(-2.148787, -1.490684, -1.250701));
  v.add(new PVector(-2.148787, -0.457598, -1.250701));
  d = new Data("basewins-2.005_Cube.005", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.148788, -0.457598, -0.071648));
  v.add(new PVector(-2.148788, -0.457598, -0.205476));
  v.add(new PVector(-2.148788, -1.490684, -0.205476));
  v.add(new PVector(-2.148788, -1.490684, -0.071648));
  d = new Data("basewins-2.006_Cube.007", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.148788, -0.457598, -0.205476));
  v.add(new PVector(-2.01496, -0.457598, -0.205476));
  v.add(new PVector(-2.01496, -1.490684, -0.205476));
  v.add(new PVector(-2.148788, -1.490684, -0.205476));
  d = new Data("basewins-2.007_Cube.008", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.01496, -0.457598, -0.071648));
  v.add(new PVector(-2.148788, -0.457598, -0.071648));
  v.add(new PVector(-2.148788, -1.490684, -0.071648));
  v.add(new PVector(-2.01496, -1.490684, -0.071648));
  d = new Data("basewins-2.008_Cube.010", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.01052, -0.492075, -0.254421));
  v.add(new PVector(-2.01052, -1.45014, -0.254421));
  v.add(new PVector(-2.01052, -1.45014, -0.308221));
  v.add(new PVector(-2.01052, -0.492075, -0.308221));
  d = new Data("basewins-2.009_Cube.011", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.01052, -0.492075, -0.362021));
  v.add(new PVector(-2.01052, -0.492075, -0.415821));
  v.add(new PVector(-2.01052, -1.45014, -0.415821));
  v.add(new PVector(-2.01052, -1.45014, -0.362021));
  d = new Data("basewins-2.010_Cube.012", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.01052, -0.492075, -0.469621));
  v.add(new PVector(-2.01052, -1.45014, -0.469621));
  v.add(new PVector(-2.01052, -1.45014, -0.523421));
  v.add(new PVector(-2.01052, -0.492075, -0.523421));
  d = new Data("basewins-2.011_Cube.013", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.01052, -0.492075, -0.577221));
  v.add(new PVector(-2.01052, -0.492075, -0.631021));
  v.add(new PVector(-2.01052, -1.45014, -0.631021));
  v.add(new PVector(-2.01052, -1.45014, -0.577221));
  d = new Data("basewins-2.012_Cube.014", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.01052, -0.492075, -0.684821));
  v.add(new PVector(-2.01052, -0.492075, -0.73862));
  v.add(new PVector(-2.01052, -1.45014, -0.73862));
  v.add(new PVector(-2.01052, -1.45014, -0.684821));
  d = new Data("basewins-2.013_Cube.015", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.01052, -0.492075, -0.79242));
  v.add(new PVector(-2.01052, -1.45014, -0.79242));
  v.add(new PVector(-2.01052, -1.45014, -0.84622));
  v.add(new PVector(-2.01052, -0.492075, -0.84622));
  d = new Data("basewins-2.014_Cube.016", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.01052, -0.492075, -0.90002));
  v.add(new PVector(-2.01052, -1.45014, -0.90002));
  v.add(new PVector(-2.01052, -1.45014, -0.95382));
  v.add(new PVector(-2.01052, -0.492075, -0.95382));
  d = new Data("basewins-2.015_Cube.017", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.01052, -0.492075, -1.00762));
  v.add(new PVector(-2.010519, -0.492075, -1.06142));
  v.add(new PVector(-2.010519, -1.45014, -1.06142));
  v.add(new PVector(-2.01052, -1.45014, -1.00762));
  d = new Data("basewins-2.016_Cube.018", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.014716, -0.345974, 0.002315));
  v.add(new PVector(-2.014716, -0.345974, -1.324665));
  v.add(new PVector(-2.233036, -0.345974, -1.324665));
  v.add(new PVector(-2.233036, -0.345974, 0.002315));
  d = new Data("basewins-2.017_Cube.019", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.014716, -0.445974, -1.324665));
  v.add(new PVector(-2.014716, -0.445974, 0.002315));
  v.add(new PVector(-2.233036, -0.445974, 0.002315));
  v.add(new PVector(-2.233036, -0.445974, -1.324665));
  d = new Data("basewins-2.018_Cube.020", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.014716, -0.345974, -1.324665));
  v.add(new PVector(-2.014716, -0.445974, -1.324665));
  v.add(new PVector(-2.233036, -0.445974, -1.324665));
  v.add(new PVector(-2.233036, -0.345974, -1.324665));
  d = new Data("basewins-2.019_Cube.021", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.339493, -1.500815, -2.014716));
  v.add(new PVector(-0.012512, -1.500815, -2.014716));
  v.add(new PVector(-0.012512, -1.500815, -2.233035));
  v.add(new PVector(-1.339492, -1.500815, -2.233036));
  d = new Data("basewins-2.020_Cube.022", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.012512, -1.600815, -2.014716));
  v.add(new PVector(-1.339493, -1.600815, -2.014716));
  v.add(new PVector(-1.339492, -1.600815, -2.233036));
  v.add(new PVector(-0.012512, -1.600815, -2.233035));
  d = new Data("basewins-2.021_Cube.023", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.012512, -1.500815, -2.014716));
  v.add(new PVector(-0.012512, -1.600815, -2.014716));
  v.add(new PVector(-0.012512, -1.600815, -2.233035));
  v.add(new PVector(-0.012512, -1.500815, -2.233035));
  d = new Data("basewins-2.022_Cube.024", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.086476, -0.457598, -2.148787));
  v.add(new PVector(-0.086476, -1.490684, -2.148787));
  v.add(new PVector(-0.220304, -1.490684, -2.148787));
  v.add(new PVector(-0.220304, -0.457598, -2.148787));
  d = new Data("basewins-2.023_Cube.025", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.220304, -0.457598, -2.148787));
  v.add(new PVector(-0.220304, -1.490684, -2.148787));
  v.add(new PVector(-0.220304, -1.490684, -2.014959));
  v.add(new PVector(-0.220304, -0.457598, -2.014959));
  d = new Data("basewins-2.024_Cube.026", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.086476, -0.457598, -2.014959));
  v.add(new PVector(-0.086476, -1.490684, -2.014959));
  v.add(new PVector(-0.086476, -1.490684, -2.148787));
  v.add(new PVector(-0.086476, -0.457598, -2.148787));
  d = new Data("basewins-2.025_Cube.027", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.265529, -0.457598, -2.148788));
  v.add(new PVector(-1.131701, -0.457598, -2.148788));
  v.add(new PVector(-1.131701, -1.490684, -2.148788));
  v.add(new PVector(-1.265529, -1.490684, -2.148788));
  d = new Data("basewins-2.026_Cube.028", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.131701, -0.457598, -2.148788));
  v.add(new PVector(-1.131701, -0.457598, -2.01496));
  v.add(new PVector(-1.131701, -1.490684, -2.01496));
  v.add(new PVector(-1.131701, -1.490684, -2.148788));
  d = new Data("basewins-2.027_Cube.029", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.265529, -0.457598, -2.01496));
  v.add(new PVector(-1.265529, -0.457598, -2.148788));
  v.add(new PVector(-1.265529, -1.490684, -2.148788));
  v.add(new PVector(-1.265529, -1.490684, -2.01496));
  d = new Data("basewins-2.028_Cube.030", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.082756, -0.492075, -2.01052));
  v.add(new PVector(-1.028956, -0.492075, -2.01052));
  v.add(new PVector(-1.028956, -1.45014, -2.01052));
  v.add(new PVector(-1.082756, -1.45014, -2.01052));
  d = new Data("basewins-2.029_Cube.031", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.975156, -0.492075, -2.01052));
  v.add(new PVector(-0.921356, -0.492075, -2.01052));
  v.add(new PVector(-0.921356, -1.45014, -2.01052));
  v.add(new PVector(-0.975156, -1.45014, -2.01052));
  d = new Data("basewins-2.030_Cube.032", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.867556, -0.492075, -2.01052));
  v.add(new PVector(-0.867556, -1.45014, -2.01052));
  v.add(new PVector(-0.813756, -1.45014, -2.01052));
  v.add(new PVector(-0.813756, -0.492075, -2.01052));
  d = new Data("basewins-2.031_Cube.033", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.759956, -0.492075, -2.01052));
  v.add(new PVector(-0.706156, -0.492075, -2.01052));
  v.add(new PVector(-0.706156, -1.45014, -2.01052));
  v.add(new PVector(-0.759956, -1.45014, -2.01052));
  d = new Data("basewins-2.032_Cube.034", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.652357, -0.492075, -2.01052));
  v.add(new PVector(-0.598557, -0.492075, -2.01052));
  v.add(new PVector(-0.598557, -1.45014, -2.01052));
  v.add(new PVector(-0.652357, -1.45014, -2.01052));
  d = new Data("basewins-2.033_Cube.035", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.544757, -0.492075, -2.01052));
  v.add(new PVector(-0.544757, -1.45014, -2.01052));
  v.add(new PVector(-0.490957, -1.45014, -2.01052));
  v.add(new PVector(-0.490957, -0.492075, -2.01052));
  d = new Data("basewins-2.034_Cube.036", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.437157, -0.492075, -2.01052));
  v.add(new PVector(-0.437157, -1.45014, -2.01052));
  v.add(new PVector(-0.383357, -1.45014, -2.01052));
  v.add(new PVector(-0.383357, -0.492075, -2.01052));
  d = new Data("basewins-2.035_Cube.037", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.329557, -0.492075, -2.01052));
  v.add(new PVector(-0.329557, -1.45014, -2.01052));
  v.add(new PVector(-0.275757, -1.45014, -2.010519));
  v.add(new PVector(-0.275757, -0.492075, -2.010519));
  d = new Data("basewins-2.036_Cube.038", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.339493, -0.345974, -2.014716));
  v.add(new PVector(-0.012512, -0.345974, -2.014716));
  v.add(new PVector(-0.012512, -0.345974, -2.233036));
  v.add(new PVector(-1.339492, -0.345974, -2.233036));
  d = new Data("basewins-2.037_Cube.039", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.012512, -0.445974, -2.014716));
  v.add(new PVector(-1.339493, -0.445974, -2.014716));
  v.add(new PVector(-1.339492, -0.445974, -2.233036));
  v.add(new PVector(-0.012512, -0.445974, -2.233036));
  d = new Data("basewins-2.038_Cube.040", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.012512, -0.345974, -2.014716));
  v.add(new PVector(-0.012512, -0.445974, -2.014716));
  v.add(new PVector(-0.012512, -0.445974, -2.233036));
  v.add(new PVector(-0.012512, -0.345974, -2.233036));
  d = new Data("basewins-2.039_Cube.041", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.014716, -1.500815, -1.330741));
  v.add(new PVector(2.014716, -1.500815, -0.00376));
  v.add(new PVector(2.233035, -1.500815, -0.00376));
  v.add(new PVector(2.233036, -1.500815, -1.33074));
  d = new Data("basewins-2.040_Cube.042", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.014716, -1.600815, -0.00376));
  v.add(new PVector(2.014716, -1.600815, -1.330741));
  v.add(new PVector(2.233036, -1.600815, -1.33074));
  v.add(new PVector(2.233035, -1.600815, -0.00376));
  d = new Data("basewins-2.041_Cube.043", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.014716, -1.500815, -0.00376));
  v.add(new PVector(2.014716, -1.600815, -0.00376));
  v.add(new PVector(2.233035, -1.600815, -0.00376));
  v.add(new PVector(2.233035, -1.500815, -0.00376));
  d = new Data("basewins-2.042_Cube.044", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.148787, -0.457598, -0.077724));
  v.add(new PVector(2.148787, -1.490684, -0.077724));
  v.add(new PVector(2.148787, -1.490684, -0.211552));
  v.add(new PVector(2.148787, -0.457598, -0.211552));
  d = new Data("basewins-2.043_Cube.045", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.148787, -0.457598, -0.211552));
  v.add(new PVector(2.148787, -1.490684, -0.211552));
  v.add(new PVector(2.014959, -1.490684, -0.211552));
  v.add(new PVector(2.014959, -0.457598, -0.211552));
  d = new Data("basewins-2.044_Cube.046", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.014959, -0.457598, -0.077724));
  v.add(new PVector(2.014959, -1.490684, -0.077724));
  v.add(new PVector(2.148787, -1.490684, -0.077724));
  v.add(new PVector(2.148787, -0.457598, -0.077724));
  d = new Data("basewins-2.045_Cube.047", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.148788, -0.457598, -1.256777));
  v.add(new PVector(2.148788, -0.457598, -1.122949));
  v.add(new PVector(2.148788, -1.490684, -1.122949));
  v.add(new PVector(2.148788, -1.490684, -1.256777));
  d = new Data("basewins-2.046_Cube.048", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.148788, -0.457598, -1.122949));
  v.add(new PVector(2.01496, -0.457598, -1.122949));
  v.add(new PVector(2.01496, -1.490684, -1.122949));
  v.add(new PVector(2.148788, -1.490684, -1.122949));
  d = new Data("basewins-2.047_Cube.049", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01496, -0.457598, -1.256777));
  v.add(new PVector(2.148788, -0.457598, -1.256777));
  v.add(new PVector(2.148788, -1.490684, -1.256777));
  v.add(new PVector(2.01496, -1.490684, -1.256777));
  d = new Data("basewins-2.048_Cube.050", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01052, -0.492075, -1.074004));
  v.add(new PVector(2.01052, -0.492075, -1.020204));
  v.add(new PVector(2.01052, -1.45014, -1.020204));
  v.add(new PVector(2.01052, -1.45014, -1.074004));
  d = new Data("basewins-2.049_Cube.051", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01052, -0.492075, -0.966404));
  v.add(new PVector(2.01052, -0.492075, -0.912604));
  v.add(new PVector(2.01052, -1.45014, -0.912604));
  v.add(new PVector(2.01052, -1.45014, -0.966404));
  d = new Data("basewins-2.050_Cube.052", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01052, -0.492075, -0.858804));
  v.add(new PVector(2.01052, -1.45014, -0.858804));
  v.add(new PVector(2.01052, -1.45014, -0.805004));
  v.add(new PVector(2.01052, -0.492075, -0.805004));
  d = new Data("basewins-2.051_Cube.053", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01052, -0.492075, -0.751204));
  v.add(new PVector(2.01052, -0.492075, -0.697405));
  v.add(new PVector(2.01052, -1.45014, -0.697405));
  v.add(new PVector(2.01052, -1.45014, -0.751204));
  d = new Data("basewins-2.052_Cube.054", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01052, -0.492075, -0.643605));
  v.add(new PVector(2.01052, -0.492075, -0.589805));
  v.add(new PVector(2.01052, -1.45014, -0.589805));
  v.add(new PVector(2.01052, -1.45014, -0.643605));
  d = new Data("basewins-2.053_Cube.055", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01052, -0.492075, -0.536005));
  v.add(new PVector(2.01052, -1.45014, -0.536005));
  v.add(new PVector(2.01052, -1.45014, -0.482205));
  v.add(new PVector(2.01052, -0.492075, -0.482205));
  d = new Data("basewins-2.054_Cube.056", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01052, -0.492075, -0.428405));
  v.add(new PVector(2.01052, -1.45014, -0.428405));
  v.add(new PVector(2.01052, -1.45014, -0.374605));
  v.add(new PVector(2.01052, -0.492075, -0.374605));
  d = new Data("basewins-2.055_Cube.057", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01052, -0.492075, -0.320805));
  v.add(new PVector(2.01052, -1.45014, -0.320805));
  v.add(new PVector(2.010519, -1.45014, -0.267005));
  v.add(new PVector(2.010519, -0.492075, -0.267005));
  d = new Data("basewins-2.056_Cube.058", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.014716, -0.345974, -1.330741));
  v.add(new PVector(2.014716, -0.345974, -0.00376));
  v.add(new PVector(2.233036, -0.345974, -0.00376));
  v.add(new PVector(2.233036, -0.345974, -1.33074));
  d = new Data("basewins-2.057_Cube.059", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.014716, -0.445974, -0.00376));
  v.add(new PVector(2.014716, -0.445974, -1.330741));
  v.add(new PVector(2.233036, -0.445974, -1.33074));
  v.add(new PVector(2.233036, -0.445974, -0.00376));
  d = new Data("basewins-2.058_Cube.060", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.014716, -0.345974, -0.00376));
  v.add(new PVector(2.014716, -0.445974, -0.00376));
  v.add(new PVector(2.233036, -0.445974, -0.00376));
  v.add(new PVector(2.233036, -0.345974, -0.00376));
  d = new Data("basewins-2.059_Cube.061", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.233036, -1.500815, 0.002315));
  v.add(new PVector(-2.233036, -1.600815, 0.002315));
  v.add(new PVector(-2.014716, -1.600815, 0.002315));
  v.add(new PVector(-2.014716, -1.500815, 0.002315));
  d = new Data("basewins-2.060_Cube.062", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.233035, -1.500815, -1.324665));
  v.add(new PVector(-2.233035, -1.600815, -1.324665));
  v.add(new PVector(-2.233036, -1.600815, 0.002315));
  v.add(new PVector(-2.233036, -1.500815, 0.002315));
  d = new Data("basewins-2.061_Cube.063", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.233036, -0.345974, 0.002315));
  v.add(new PVector(-2.233036, -0.445974, 0.002315));
  v.add(new PVector(-2.014716, -0.445974, 0.002315));
  v.add(new PVector(-2.014716, -0.345974, 0.002315));
  d = new Data("basewins-2.062_Cube.064", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.233036, -0.345974, -1.324665));
  v.add(new PVector(-2.233036, -0.445974, -1.324665));
  v.add(new PVector(-2.233036, -0.445974, 0.002315));
  v.add(new PVector(-2.233036, -0.345974, 0.002315));
  d = new Data("basewins-2.063_Cube.065", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.339492, -1.500815, -2.233036));
  v.add(new PVector(-1.339492, -1.600815, -2.233036));
  v.add(new PVector(-1.339493, -1.600815, -2.014716));
  v.add(new PVector(-1.339493, -1.500815, -2.014716));
  d = new Data("basewins-2.064_Cube.066", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.012512, -1.500815, -2.233035));
  v.add(new PVector(-0.012512, -1.600815, -2.233035));
  v.add(new PVector(-1.339492, -1.600815, -2.233036));
  v.add(new PVector(-1.339492, -1.500815, -2.233036));
  d = new Data("basewins-2.065_Cube.067", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.339492, -0.345974, -2.233036));
  v.add(new PVector(-1.339492, -0.445974, -2.233036));
  v.add(new PVector(-1.339493, -0.445974, -2.014716));
  v.add(new PVector(-1.339493, -0.345974, -2.014716));
  d = new Data("basewins-2.066_Cube.068", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.012512, -0.345974, -2.233036));
  v.add(new PVector(-0.012512, -0.445974, -2.233036));
  v.add(new PVector(-1.339492, -0.445974, -2.233036));
  v.add(new PVector(-1.339492, -0.345974, -2.233036));
  d = new Data("basewins-2.067_Cube.069", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.233036, -1.500815, -1.33074));
  v.add(new PVector(2.233036, -1.600815, -1.33074));
  v.add(new PVector(2.014716, -1.600815, -1.330741));
  v.add(new PVector(2.014716, -1.500815, -1.330741));
  d = new Data("basewins-2.068_Cube.070", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.233035, -1.500815, -0.00376));
  v.add(new PVector(2.233035, -1.600815, -0.00376));
  v.add(new PVector(2.233036, -1.600815, -1.33074));
  v.add(new PVector(2.233036, -1.500815, -1.33074));
  d = new Data("basewins-2.069_Cube.071", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.233036, -0.345974, -1.33074));
  v.add(new PVector(2.233036, -0.445974, -1.33074));
  v.add(new PVector(2.014716, -0.445974, -1.330741));
  v.add(new PVector(2.014716, -0.345974, -1.330741));
  d = new Data("basewins-2.070_Cube.072", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.233036, -0.345974, -0.00376));
  v.add(new PVector(2.233036, -0.445974, -0.00376));
  v.add(new PVector(2.233036, -0.445974, -1.33074));
  v.add(new PVector(2.233036, -0.345974, -1.33074));
  d = new Data("basewins-2.071_Cube.073", 2, v);
  dd.add(d);

  win = new Win("basewins-2", dd);
  p.add(win);


  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(-0.035399, -0.882847, -2.013742));
  v.add(new PVector(-1.325516, -0.882847, -2.013742));
  v.add(new PVector(-1.325516, -1.551483, -2.013742));
  v.add(new PVector(-0.035399, -1.551483, -2.013742));
  d = new Data("basewins-3_Plane.006", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.699211, -0.917264, -2.026572));
  v.add(new PVector(-1.28983, -0.917264, -2.026572));
  v.add(new PVector(-1.28983, -1.51601, -2.026572));
  v.add(new PVector(-0.699211, -1.51601, -2.026572));
  d = new Data("basewins-3.001_Plane.001", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.070653, -0.917264, -2.026572));
  v.add(new PVector(-0.661271, -0.917264, -2.026572));
  v.add(new PVector(-0.661271, -1.51601, -2.026572));
  v.add(new PVector(-0.070653, -1.51601, -2.026572));
  d = new Data("basewins-3.002_Plane.002", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.013742, -0.882847, 1.325517));
  v.add(new PVector(2.013742, -0.882847, 0.4354));
  v.add(new PVector(2.013742, -1.551483, 0.4354));
  v.add(new PVector(2.013742, -1.551483, 1.325517));
  d = new Data("basewins-3.003_Plane.003", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.026572, -0.917264, 0.861704));
  v.add(new PVector(2.026572, -0.917264, 0.471086));
  v.add(new PVector(2.026572, -1.51601, 0.471086));
  v.add(new PVector(2.026572, -1.51601, 0.861704));
  d = new Data("basewins-3.004_Plane.004", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.026572, -0.917264, 1.290263));
  v.add(new PVector(2.026572, -0.917264, 0.899644));
  v.add(new PVector(2.026572, -1.51601, 0.899644));
  v.add(new PVector(2.026572, -1.51601, 1.290263));
  d = new Data("basewins-3.005_Plane.005", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.013742, -0.882847, 0.435399));
  v.add(new PVector(-2.013742, -0.882847, 1.325516));
  v.add(new PVector(-2.013742, -1.551483, 1.325516));
  v.add(new PVector(-2.013742, -1.551483, 0.435399));
  d = new Data("basewins-3.006_Plane.007", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.026572, -0.917264, 0.899212));
  v.add(new PVector(-2.026572, -0.917264, 1.28983));
  v.add(new PVector(-2.026572, -1.51601, 1.28983));
  v.add(new PVector(-2.026572, -1.51601, 0.899212));
  d = new Data("basewins-3.007_Plane.008", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.026572, -0.917264, 0.470653));
  v.add(new PVector(-2.026572, -0.917264, 0.861271));
  v.add(new PVector(-2.026572, -1.51601, 0.861271));
  v.add(new PVector(-2.026572, -1.51601, 0.470653));
  d = new Data("basewins-3.008_Plane.009", 1, v);
  dd.add(d);

  win = new Win("basewins-3", dd);
  p.add(win);


  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(-0.035399, -0.882847, -2.013742));
  v.add(new PVector(-1.325516, -0.882847, -2.013742));
  v.add(new PVector(-1.325516, -1.551483, -2.013742));
  v.add(new PVector(-0.035399, -1.551483, -2.013742));
  d = new Data("basewins-4_Plane.009", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.699211, -0.917264, -2.026572));
  v.add(new PVector(-1.28983, -0.917264, -2.026572));
  v.add(new PVector(-1.28983, -1.51601, -2.026572));
  v.add(new PVector(-0.699211, -1.51601, -2.026572));
  d = new Data("basewins-4.001_Plane.001", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.070653, -0.917264, -2.026572));
  v.add(new PVector(-0.661271, -0.917264, -2.026572));
  v.add(new PVector(-0.661271, -1.51601, -2.026572));
  v.add(new PVector(-0.070653, -1.51601, -2.026572));
  d = new Data("basewins-4.002_Plane.002", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.013742, -0.882847, -0.37389));
  v.add(new PVector(2.013742, -0.882847, -1.264007));
  v.add(new PVector(2.013742, -1.551483, -1.264007));
  v.add(new PVector(2.013742, -1.551483, -0.37389));
  d = new Data("basewins-4.003_Plane.003", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.026572, -0.917264, -0.837703));
  v.add(new PVector(2.026572, -0.917264, -1.228321));
  v.add(new PVector(2.026572, -1.51601, -1.228321));
  v.add(new PVector(2.026572, -1.51601, -0.837703));
  d = new Data("basewins-4.004_Plane.004", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.026572, -0.917264, -0.409144));
  v.add(new PVector(2.026572, -0.917264, -0.799762));
  v.add(new PVector(2.026572, -1.51601, -0.799762));
  v.add(new PVector(2.026572, -1.51601, -0.409144));
  d = new Data("basewins-4.005_Plane.005", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.013742, -0.882847, -1.264008));
  v.add(new PVector(-2.013742, -0.882847, -0.373891));
  v.add(new PVector(-2.013742, -1.551483, -0.373891));
  v.add(new PVector(-2.013742, -1.551483, -1.264008));
  d = new Data("basewins-4.006_Plane.006", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.026572, -0.917264, -0.800195));
  v.add(new PVector(-2.026572, -0.917264, -0.409577));
  v.add(new PVector(-2.026572, -1.51601, -0.409577));
  v.add(new PVector(-2.026572, -1.51601, -0.800195));
  d = new Data("basewins-4.007_Plane.007", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.026572, -0.917264, -1.228754));
  v.add(new PVector(-2.026572, -0.917264, -0.838136));
  v.add(new PVector(-2.026572, -1.51601, -0.838136));
  v.add(new PVector(-2.026572, -1.51601, -1.228754));
  d = new Data("basewins-4.008_Plane.008", 1, v);
  dd.add(d);

  win = new Win("basewins-4", dd);
  p.add(win);


  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(1.104486, -0.882847, -2.013742));
  v.add(new PVector(-0.185631, -0.882847, -2.013742));
  v.add(new PVector(-0.185631, -1.551483, -2.013742));
  v.add(new PVector(1.104486, -1.551483, -2.013742));
  d = new Data("basewins-5_Plane.010", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.440674, -0.917264, -2.026572));
  v.add(new PVector(-0.149945, -0.917264, -2.026572));
  v.add(new PVector(-0.149945, -1.51601, -2.026572));
  v.add(new PVector(0.440674, -1.51601, -2.026572));
  d = new Data("basewins-5.001_Plane.001", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.069232, -0.917264, -2.026572));
  v.add(new PVector(0.478614, -0.917264, -2.026572));
  v.add(new PVector(0.478614, -1.51601, -2.026572));
  v.add(new PVector(1.069232, -1.51601, -2.026572));
  d = new Data("basewins-5.002_Plane.002", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.013742, -0.355609, -0.37389));
  v.add(new PVector(2.013742, -0.355609, -1.264007));
  v.add(new PVector(2.013742, -1.551483, -1.264007));
  v.add(new PVector(2.013742, -1.551483, -0.37389));
  d = new Data("basewins-5.003_Plane.003", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.026572, -0.390026, -0.837703));
  v.add(new PVector(2.026572, -0.390026, -1.228321));
  v.add(new PVector(2.026572, -1.51601, -1.228321));
  v.add(new PVector(2.026572, -1.51601, -0.837703));
  d = new Data("basewins-5.004_Plane.004", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.026572, -0.390026, -0.409144));
  v.add(new PVector(2.026572, -0.390026, -0.799762));
  v.add(new PVector(2.026572, -1.51601, -0.799762));
  v.add(new PVector(2.026572, -1.51601, -0.409144));
  d = new Data("basewins-5.005_Plane.005", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-4.011862, -0.355609, -1.264008));
  v.add(new PVector(-4.011862, -0.355609, -0.373891));
  v.add(new PVector(-4.011862, -1.551483, -0.373891));
  v.add(new PVector(-4.011862, -1.551483, -1.264008));
  d = new Data("basewins-5.006_Plane.006", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-4.024692, -0.390026, -0.800195));
  v.add(new PVector(-4.024692, -0.390026, -0.409577));
  v.add(new PVector(-4.024692, -1.51601, -0.409577));
  v.add(new PVector(-4.024691, -1.51601, -0.800195));
  d = new Data("basewins-5.007_Plane.007", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-4.024692, -0.390026, -1.228754));
  v.add(new PVector(-4.024692, -0.390026, -0.838136));
  v.add(new PVector(-4.024692, -1.51601, -0.838136));
  v.add(new PVector(-4.024691, -1.51601, -1.228754));
  d = new Data("basewins-5.008_Plane.008", 1, v);
  dd.add(d);

  win = new Win("basewins-5", dd);
  p.add(win);


  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(-2.014716, -1.500815, 1.703856));
  v.add(new PVector(-2.014716, -1.500815, 0.376876));
  v.add(new PVector(-2.233035, -1.500815, 0.376876));
  v.add(new PVector(-2.233036, -1.500815, 1.703856));
  d = new Data("basewins-6_Cube.014", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.014716, -1.600815, 0.376876));
  v.add(new PVector(-2.014716, -1.600815, 1.703856));
  v.add(new PVector(-2.233036, -1.600815, 1.703856));
  v.add(new PVector(-2.233035, -1.600815, 0.376876));
  d = new Data("basewins-6.001_Cube.001", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.014716, -1.500815, 0.376876));
  v.add(new PVector(-2.014716, -1.600815, 0.376876));
  v.add(new PVector(-2.233035, -1.600815, 0.376876));
  v.add(new PVector(-2.233035, -1.500815, 0.376876));
  d = new Data("basewins-6.002_Cube.002", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.148787, -0.457598, 0.45084));
  v.add(new PVector(-2.148787, -1.490684, 0.45084));
  v.add(new PVector(-2.148787, -1.490684, 0.584667));
  v.add(new PVector(-2.148787, -0.457598, 0.584667));
  d = new Data("basewins-6.003_Cube.003", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.148787, -0.457598, 0.584667));
  v.add(new PVector(-2.148787, -1.490684, 0.584667));
  v.add(new PVector(-2.014959, -1.490684, 0.584668));
  v.add(new PVector(-2.014959, -0.457598, 0.584668));
  d = new Data("basewins-6.004_Cube.004", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.014959, -0.457598, 0.45084));
  v.add(new PVector(-2.014959, -1.490684, 0.45084));
  v.add(new PVector(-2.148787, -1.490684, 0.45084));
  v.add(new PVector(-2.148787, -0.457598, 0.45084));
  d = new Data("basewins-6.005_Cube.005", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.148788, -0.457598, 1.629892));
  v.add(new PVector(-2.148788, -0.457598, 1.496064));
  v.add(new PVector(-2.148788, -1.490684, 1.496064));
  v.add(new PVector(-2.148788, -1.490684, 1.629892));
  d = new Data("basewins-6.006_Cube.006", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.148788, -0.457598, 1.496064));
  v.add(new PVector(-2.01496, -0.457598, 1.496064));
  v.add(new PVector(-2.01496, -1.490684, 1.496064));
  v.add(new PVector(-2.148788, -1.490684, 1.496064));
  d = new Data("basewins-6.007_Cube.007", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.01496, -0.457598, 1.629892));
  v.add(new PVector(-2.148788, -0.457598, 1.629892));
  v.add(new PVector(-2.148788, -1.490684, 1.629892));
  v.add(new PVector(-2.01496, -1.490684, 1.629892));
  d = new Data("basewins-6.008_Cube.008", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.01052, -0.492075, 1.447119));
  v.add(new PVector(-2.01052, -1.45014, 1.447119));
  v.add(new PVector(-2.01052, -1.45014, 1.39332));
  v.add(new PVector(-2.01052, -0.492075, 1.39332));
  d = new Data("basewins-6.009_Cube.010", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.01052, -0.492075, 1.33952));
  v.add(new PVector(-2.01052, -0.492075, 1.28572));
  v.add(new PVector(-2.01052, -1.45014, 1.28572));
  v.add(new PVector(-2.01052, -1.45014, 1.33952));
  d = new Data("basewins-6.010_Cube.011", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.01052, -0.492075, 1.23192));
  v.add(new PVector(-2.01052, -1.45014, 1.23192));
  v.add(new PVector(-2.01052, -1.45014, 1.17812));
  v.add(new PVector(-2.01052, -0.492075, 1.17812));
  d = new Data("basewins-6.011_Cube.012", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.01052, -0.492075, 1.12432));
  v.add(new PVector(-2.01052, -0.492075, 1.07052));
  v.add(new PVector(-2.01052, -1.45014, 1.07052));
  v.add(new PVector(-2.01052, -1.45014, 1.12432));
  d = new Data("basewins-6.012_Cube.013", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.01052, -0.492075, 1.01672));
  v.add(new PVector(-2.01052, -0.492075, 0.96292));
  v.add(new PVector(-2.01052, -1.45014, 0.96292));
  v.add(new PVector(-2.01052, -1.45014, 1.01672));
  d = new Data("basewins-6.013_Cube.015", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.01052, -0.492075, 0.90912));
  v.add(new PVector(-2.01052, -1.45014, 0.90912));
  v.add(new PVector(-2.01052, -1.45014, 0.85532));
  v.add(new PVector(-2.01052, -0.492075, 0.85532));
  d = new Data("basewins-6.014_Cube.016", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.01052, -0.492075, 0.801521));
  v.add(new PVector(-2.01052, -1.45014, 0.801521));
  v.add(new PVector(-2.01052, -1.45014, 0.74772));
  v.add(new PVector(-2.01052, -0.492075, 0.74772));
  d = new Data("basewins-6.015_Cube.017", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.01052, -0.492075, 0.693921));
  v.add(new PVector(-2.010519, -0.492075, 0.640121));
  v.add(new PVector(-2.010519, -1.45014, 0.640121));
  v.add(new PVector(-2.01052, -1.45014, 0.693921));
  d = new Data("basewins-6.016_Cube.018", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.014716, -0.345974, 1.703856));
  v.add(new PVector(-2.014716, -0.345974, 0.376876));
  v.add(new PVector(-2.233036, -0.345974, 0.376876));
  v.add(new PVector(-2.233036, -0.345974, 1.703856));
  d = new Data("basewins-6.017_Cube.019", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.014716, -0.445974, 0.376876));
  v.add(new PVector(-2.014716, -0.445974, 1.703856));
  v.add(new PVector(-2.233036, -0.445974, 1.703856));
  v.add(new PVector(-2.233036, -0.445974, 0.376876));
  d = new Data("basewins-6.018_Cube.020", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.014716, -0.345974, 0.376876));
  v.add(new PVector(-2.014716, -0.445974, 0.376876));
  v.add(new PVector(-2.233036, -0.445974, 0.376876));
  v.add(new PVector(-2.233036, -0.345974, 0.376876));
  d = new Data("basewins-6.019_Cube.021", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.339493, -1.500815, -2.014716));
  v.add(new PVector(-0.012512, -1.500815, -2.014716));
  v.add(new PVector(-0.012512, -1.500815, -2.233035));
  v.add(new PVector(-1.339492, -1.500815, -2.233036));
  d = new Data("basewins-6.020_Cube.022", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.012512, -1.600815, -2.014716));
  v.add(new PVector(-1.339493, -1.600815, -2.014716));
  v.add(new PVector(-1.339492, -1.600815, -2.233036));
  v.add(new PVector(-0.012512, -1.600815, -2.233035));
  d = new Data("basewins-6.021_Cube.023", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.012512, -1.500815, -2.014716));
  v.add(new PVector(-0.012512, -1.600815, -2.014716));
  v.add(new PVector(-0.012512, -1.600815, -2.233035));
  v.add(new PVector(-0.012512, -1.500815, -2.233035));
  d = new Data("basewins-6.022_Cube.024", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.086476, -0.457598, -2.148787));
  v.add(new PVector(-0.086476, -1.490684, -2.148787));
  v.add(new PVector(-0.220304, -1.490684, -2.148787));
  v.add(new PVector(-0.220304, -0.457598, -2.148787));
  d = new Data("basewins-6.023_Cube.025", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.220304, -0.457598, -2.148787));
  v.add(new PVector(-0.220304, -1.490684, -2.148787));
  v.add(new PVector(-0.220304, -1.490684, -2.014959));
  v.add(new PVector(-0.220304, -0.457598, -2.014959));
  d = new Data("basewins-6.024_Cube.026", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.086476, -0.457598, -2.014959));
  v.add(new PVector(-0.086476, -1.490684, -2.014959));
  v.add(new PVector(-0.086476, -1.490684, -2.148787));
  v.add(new PVector(-0.086476, -0.457598, -2.148787));
  d = new Data("basewins-6.025_Cube.027", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.265529, -0.457598, -2.148788));
  v.add(new PVector(-1.131701, -0.457598, -2.148788));
  v.add(new PVector(-1.131701, -1.490684, -2.148788));
  v.add(new PVector(-1.265529, -1.490684, -2.148788));
  d = new Data("basewins-6.026_Cube.028", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.131701, -0.457598, -2.148788));
  v.add(new PVector(-1.131701, -0.457598, -2.01496));
  v.add(new PVector(-1.131701, -1.490684, -2.01496));
  v.add(new PVector(-1.131701, -1.490684, -2.148788));
  d = new Data("basewins-6.027_Cube.029", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.265529, -0.457598, -2.01496));
  v.add(new PVector(-1.265529, -0.457598, -2.148788));
  v.add(new PVector(-1.265529, -1.490684, -2.148788));
  v.add(new PVector(-1.265529, -1.490684, -2.01496));
  d = new Data("basewins-6.028_Cube.030", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.082756, -0.492075, -2.01052));
  v.add(new PVector(-1.028956, -0.492075, -2.01052));
  v.add(new PVector(-1.028956, -1.45014, -2.01052));
  v.add(new PVector(-1.082756, -1.45014, -2.01052));
  d = new Data("basewins-6.029_Cube.031", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.975156, -0.492075, -2.01052));
  v.add(new PVector(-0.921356, -0.492075, -2.01052));
  v.add(new PVector(-0.921356, -1.45014, -2.01052));
  v.add(new PVector(-0.975156, -1.45014, -2.01052));
  d = new Data("basewins-6.030_Cube.032", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.867556, -0.492075, -2.01052));
  v.add(new PVector(-0.867556, -1.45014, -2.01052));
  v.add(new PVector(-0.813756, -1.45014, -2.01052));
  v.add(new PVector(-0.813756, -0.492075, -2.01052));
  d = new Data("basewins-6.031_Cube.033", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.759956, -0.492075, -2.01052));
  v.add(new PVector(-0.706156, -0.492075, -2.01052));
  v.add(new PVector(-0.706156, -1.45014, -2.01052));
  v.add(new PVector(-0.759956, -1.45014, -2.01052));
  d = new Data("basewins-6.032_Cube.034", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.652357, -0.492075, -2.01052));
  v.add(new PVector(-0.598557, -0.492075, -2.01052));
  v.add(new PVector(-0.598557, -1.45014, -2.01052));
  v.add(new PVector(-0.652357, -1.45014, -2.01052));
  d = new Data("basewins-6.033_Cube.035", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.544757, -0.492075, -2.01052));
  v.add(new PVector(-0.544757, -1.45014, -2.01052));
  v.add(new PVector(-0.490957, -1.45014, -2.01052));
  v.add(new PVector(-0.490957, -0.492075, -2.01052));
  d = new Data("basewins-6.034_Cube.036", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.437157, -0.492075, -2.01052));
  v.add(new PVector(-0.437157, -1.45014, -2.01052));
  v.add(new PVector(-0.383357, -1.45014, -2.01052));
  v.add(new PVector(-0.383357, -0.492075, -2.01052));
  d = new Data("basewins-6.035_Cube.037", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.329557, -0.492075, -2.01052));
  v.add(new PVector(-0.329557, -1.45014, -2.01052));
  v.add(new PVector(-0.275757, -1.45014, -2.010519));
  v.add(new PVector(-0.275757, -0.492075, -2.010519));
  d = new Data("basewins-6.036_Cube.038", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.339493, -0.345974, -2.014716));
  v.add(new PVector(-0.012512, -0.345974, -2.014716));
  v.add(new PVector(-0.012512, -0.345974, -2.233036));
  v.add(new PVector(-1.339492, -0.345974, -2.233036));
  d = new Data("basewins-6.037_Cube.039", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.012512, -0.445974, -2.014716));
  v.add(new PVector(-1.339493, -0.445974, -2.014716));
  v.add(new PVector(-1.339492, -0.445974, -2.233036));
  v.add(new PVector(-0.012512, -0.445974, -2.233036));
  d = new Data("basewins-6.038_Cube.040", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.012512, -0.345974, -2.014716));
  v.add(new PVector(-0.012512, -0.445974, -2.014716));
  v.add(new PVector(-0.012512, -0.445974, -2.233036));
  v.add(new PVector(-0.012512, -0.345974, -2.233036));
  d = new Data("basewins-6.039_Cube.041", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.014716, -1.500815, -1.330741));
  v.add(new PVector(2.014716, -1.500815, -0.00376));
  v.add(new PVector(2.233035, -1.500815, -0.00376));
  v.add(new PVector(2.233036, -1.500815, -1.33074));
  d = new Data("basewins-6.040_Cube.042", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.014716, -1.600815, -0.00376));
  v.add(new PVector(2.014716, -1.600815, -1.330741));
  v.add(new PVector(2.233036, -1.600815, -1.33074));
  v.add(new PVector(2.233035, -1.600815, -0.00376));
  d = new Data("basewins-6.041_Cube.043", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.014716, -1.500815, -0.00376));
  v.add(new PVector(2.014716, -1.600815, -0.00376));
  v.add(new PVector(2.233035, -1.600815, -0.00376));
  v.add(new PVector(2.233035, -1.500815, -0.00376));
  d = new Data("basewins-6.042_Cube.044", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.148787, -0.457598, -0.077724));
  v.add(new PVector(2.148787, -1.490684, -0.077724));
  v.add(new PVector(2.148787, -1.490684, -0.211552));
  v.add(new PVector(2.148787, -0.457598, -0.211552));
  d = new Data("basewins-6.043_Cube.045", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.148787, -0.457598, -0.211552));
  v.add(new PVector(2.148787, -1.490684, -0.211552));
  v.add(new PVector(2.014959, -1.490684, -0.211552));
  v.add(new PVector(2.014959, -0.457598, -0.211552));
  d = new Data("basewins-6.044_Cube.046", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.014959, -0.457598, -0.077724));
  v.add(new PVector(2.014959, -1.490684, -0.077724));
  v.add(new PVector(2.148787, -1.490684, -0.077724));
  v.add(new PVector(2.148787, -0.457598, -0.077724));
  d = new Data("basewins-6.045_Cube.047", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.148788, -0.457598, -1.256777));
  v.add(new PVector(2.148788, -0.457598, -1.122949));
  v.add(new PVector(2.148788, -1.490684, -1.122949));
  v.add(new PVector(2.148788, -1.490684, -1.256777));
  d = new Data("basewins-6.046_Cube.048", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.148788, -0.457598, -1.122949));
  v.add(new PVector(2.01496, -0.457598, -1.122949));
  v.add(new PVector(2.01496, -1.490684, -1.122949));
  v.add(new PVector(2.148788, -1.490684, -1.122949));
  d = new Data("basewins-6.047_Cube.049", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01496, -0.457598, -1.256777));
  v.add(new PVector(2.148788, -0.457598, -1.256777));
  v.add(new PVector(2.148788, -1.490684, -1.256777));
  v.add(new PVector(2.01496, -1.490684, -1.256777));
  d = new Data("basewins-6.048_Cube.050", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01052, -0.492075, -1.074004));
  v.add(new PVector(2.01052, -0.492075, -1.020204));
  v.add(new PVector(2.01052, -1.45014, -1.020204));
  v.add(new PVector(2.01052, -1.45014, -1.074004));
  d = new Data("basewins-6.049_Cube.051", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01052, -0.492075, -0.966404));
  v.add(new PVector(2.01052, -0.492075, -0.912604));
  v.add(new PVector(2.01052, -1.45014, -0.912604));
  v.add(new PVector(2.01052, -1.45014, -0.966404));
  d = new Data("basewins-6.050_Cube.052", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01052, -0.492075, -0.858804));
  v.add(new PVector(2.01052, -1.45014, -0.858804));
  v.add(new PVector(2.01052, -1.45014, -0.805004));
  v.add(new PVector(2.01052, -0.492075, -0.805004));
  d = new Data("basewins-6.051_Cube.053", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01052, -0.492075, -0.751204));
  v.add(new PVector(2.01052, -0.492075, -0.697405));
  v.add(new PVector(2.01052, -1.45014, -0.697405));
  v.add(new PVector(2.01052, -1.45014, -0.751204));
  d = new Data("basewins-6.052_Cube.054", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01052, -0.492075, -0.643605));
  v.add(new PVector(2.01052, -0.492075, -0.589805));
  v.add(new PVector(2.01052, -1.45014, -0.589805));
  v.add(new PVector(2.01052, -1.45014, -0.643605));
  d = new Data("basewins-6.053_Cube.055", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01052, -0.492075, -0.536005));
  v.add(new PVector(2.01052, -1.45014, -0.536005));
  v.add(new PVector(2.01052, -1.45014, -0.482205));
  v.add(new PVector(2.01052, -0.492075, -0.482205));
  d = new Data("basewins-6.054_Cube.056", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01052, -0.492075, -0.428405));
  v.add(new PVector(2.01052, -1.45014, -0.428405));
  v.add(new PVector(2.01052, -1.45014, -0.374605));
  v.add(new PVector(2.01052, -0.492075, -0.374605));
  d = new Data("basewins-6.055_Cube.057", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01052, -0.492075, -0.320805));
  v.add(new PVector(2.01052, -1.45014, -0.320805));
  v.add(new PVector(2.010519, -1.45014, -0.267005));
  v.add(new PVector(2.010519, -0.492075, -0.267005));
  d = new Data("basewins-6.056_Cube.058", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.014716, -0.345974, -1.330741));
  v.add(new PVector(2.014716, -0.345974, -0.00376));
  v.add(new PVector(2.233036, -0.345974, -0.00376));
  v.add(new PVector(2.233036, -0.345974, -1.33074));
  d = new Data("basewins-6.057_Cube.059", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.014716, -0.445974, -0.00376));
  v.add(new PVector(2.014716, -0.445974, -1.330741));
  v.add(new PVector(2.233036, -0.445974, -1.33074));
  v.add(new PVector(2.233036, -0.445974, -0.00376));
  d = new Data("basewins-6.058_Cube.060", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.014716, -0.345974, -0.00376));
  v.add(new PVector(2.014716, -0.445974, -0.00376));
  v.add(new PVector(2.233036, -0.445974, -0.00376));
  v.add(new PVector(2.233036, -0.345974, -0.00376));
  d = new Data("basewins-6.059_Cube.061", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.233036, -1.500815, 1.703856));
  v.add(new PVector(-2.233036, -1.600815, 1.703856));
  v.add(new PVector(-2.014716, -1.600815, 1.703856));
  v.add(new PVector(-2.014716, -1.500815, 1.703856));
  d = new Data("basewins-6.060_Cube.062", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.233035, -1.500815, 0.376876));
  v.add(new PVector(-2.233035, -1.600815, 0.376876));
  v.add(new PVector(-2.233036, -1.600815, 1.703856));
  v.add(new PVector(-2.233036, -1.500815, 1.703856));
  d = new Data("basewins-6.061_Cube.063", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.233036, -0.345974, 1.703856));
  v.add(new PVector(-2.233036, -0.445974, 1.703856));
  v.add(new PVector(-2.014716, -0.445974, 1.703856));
  v.add(new PVector(-2.014716, -0.345974, 1.703856));
  d = new Data("basewins-6.062_Cube.064", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.233036, -0.345974, 0.376876));
  v.add(new PVector(-2.233036, -0.445974, 0.376876));
  v.add(new PVector(-2.233036, -0.445974, 1.703856));
  v.add(new PVector(-2.233036, -0.345974, 1.703856));
  d = new Data("basewins-6.063_Cube.065", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.339492, -1.500815, -2.233036));
  v.add(new PVector(-1.339492, -1.600815, -2.233036));
  v.add(new PVector(-1.339493, -1.600815, -2.014716));
  v.add(new PVector(-1.339493, -1.500815, -2.014716));
  d = new Data("basewins-6.064_Cube.066", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.012512, -1.500815, -2.233035));
  v.add(new PVector(-0.012512, -1.600815, -2.233035));
  v.add(new PVector(-1.339492, -1.600815, -2.233036));
  v.add(new PVector(-1.339492, -1.500815, -2.233036));
  d = new Data("basewins-6.065_Cube.067", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.339492, -0.345974, -2.233036));
  v.add(new PVector(-1.339492, -0.445974, -2.233036));
  v.add(new PVector(-1.339493, -0.445974, -2.014716));
  v.add(new PVector(-1.339493, -0.345974, -2.014716));
  d = new Data("basewins-6.066_Cube.068", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.012512, -0.345974, -2.233036));
  v.add(new PVector(-0.012512, -0.445974, -2.233036));
  v.add(new PVector(-1.339492, -0.445974, -2.233036));
  v.add(new PVector(-1.339492, -0.345974, -2.233036));
  d = new Data("basewins-6.067_Cube.069", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.233036, -1.500815, -1.33074));
  v.add(new PVector(2.233036, -1.600815, -1.33074));
  v.add(new PVector(2.014716, -1.600815, -1.330741));
  v.add(new PVector(2.014716, -1.500815, -1.330741));
  d = new Data("basewins-6.068_Cube.070", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.233035, -1.500815, -0.00376));
  v.add(new PVector(2.233035, -1.600815, -0.00376));
  v.add(new PVector(2.233036, -1.600815, -1.33074));
  v.add(new PVector(2.233036, -1.500815, -1.33074));
  d = new Data("basewins-6.069_Cube.071", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.233036, -0.345974, -1.33074));
  v.add(new PVector(2.233036, -0.445974, -1.33074));
  v.add(new PVector(2.014716, -0.445974, -1.330741));
  v.add(new PVector(2.014716, -0.345974, -1.330741));
  d = new Data("basewins-6.070_Cube.072", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.233036, -0.345974, -0.00376));
  v.add(new PVector(2.233036, -0.445974, -0.00376));
  v.add(new PVector(2.233036, -0.445974, -1.33074));
  v.add(new PVector(2.233036, -0.345974, -1.33074));
  d = new Data("basewins-6.071_Cube.073", 2, v);
  dd.add(d);

  win = new Win("basewins-6", dd);
  p.add(win);


  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(-1.104486, -0.882847, -2.013742));
  v.add(new PVector(0.185631, -0.882847, -2.013742));
  v.add(new PVector(0.185631, -1.551483, -2.013742));
  v.add(new PVector(-1.104486, -1.551483, -2.013742));
  d = new Data("basewins-7_Plane.011", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.440673, -0.917264, -2.026572));
  v.add(new PVector(0.149945, -0.917264, -2.026572));
  v.add(new PVector(0.149945, -1.51601, -2.026572));
  v.add(new PVector(-0.440673, -1.51601, -2.026572));
  d = new Data("basewins-7.001_Plane.001", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.069232, -0.917264, -2.026572));
  v.add(new PVector(-0.478614, -0.917264, -2.026572));
  v.add(new PVector(-0.478614, -1.51601, -2.026572));
  v.add(new PVector(-1.069232, -1.51601, -2.026572));
  d = new Data("basewins-7.002_Plane.002", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.013742, -0.355609, -0.37389));
  v.add(new PVector(-2.013742, -0.355609, -1.264007));
  v.add(new PVector(-2.013742, -1.551483, -1.264007));
  v.add(new PVector(-2.013742, -1.551483, -0.37389));
  d = new Data("basewins-7.003_Plane.003", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.026572, -0.390026, -0.837703));
  v.add(new PVector(-2.026572, -0.390026, -1.228321));
  v.add(new PVector(-2.026572, -1.51601, -1.228321));
  v.add(new PVector(-2.026572, -1.51601, -0.837703));
  d = new Data("basewins-7.004_Plane.004", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.026572, -0.390026, -0.409144));
  v.add(new PVector(-2.026572, -0.390026, -0.799763));
  v.add(new PVector(-2.026572, -1.51601, -0.799763));
  v.add(new PVector(-2.026572, -1.51601, -0.409144));
  d = new Data("basewins-7.005_Plane.005", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(4.011862, -0.355609, -1.264008));
  v.add(new PVector(4.011862, -0.355609, -0.373891));
  v.add(new PVector(4.011862, -1.551483, -0.373891));
  v.add(new PVector(4.011862, -1.551483, -1.264008));
  d = new Data("basewins-7.006_Plane.006", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(4.024692, -0.390026, -0.800195));
  v.add(new PVector(4.024692, -0.390026, -0.409577));
  v.add(new PVector(4.024692, -1.51601, -0.409577));
  v.add(new PVector(4.024691, -1.51601, -0.800195));
  d = new Data("basewins-7.007_Plane.007", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(4.024692, -0.390026, -1.228754));
  v.add(new PVector(4.024692, -0.390026, -0.838135));
  v.add(new PVector(4.024692, -1.51601, -0.838135));
  v.add(new PVector(4.024691, -1.51601, -1.228754));
  d = new Data("basewins-7.008_Plane.008", 1, v);
  dd.add(d);

  win = new Win("basewins-7", dd);
  p.add(win);


  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(2.014716, -1.500815, 1.703856));
  v.add(new PVector(2.014716, -1.500815, 0.376876));
  v.add(new PVector(2.233035, -1.500815, 0.376876));
  v.add(new PVector(2.233036, -1.500815, 1.703856));
  d = new Data("basewins-8_Cube.015", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.014716, -1.600815, 0.376876));
  v.add(new PVector(2.014716, -1.600815, 1.703856));
  v.add(new PVector(2.233036, -1.600815, 1.703856));
  v.add(new PVector(2.233035, -1.600815, 0.376876));
  d = new Data("basewins-8.001_Cube.001", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.014716, -1.500815, 0.376876));
  v.add(new PVector(2.014716, -1.600815, 0.376876));
  v.add(new PVector(2.233035, -1.600815, 0.376876));
  v.add(new PVector(2.233035, -1.500815, 0.376876));
  d = new Data("basewins-8.002_Cube.002", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.148787, -0.457598, 0.45084));
  v.add(new PVector(2.148787, -1.490684, 0.45084));
  v.add(new PVector(2.148787, -1.490684, 0.584667));
  v.add(new PVector(2.148787, -0.457598, 0.584667));
  d = new Data("basewins-8.003_Cube.003", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.148787, -0.457598, 0.584667));
  v.add(new PVector(2.148787, -1.490684, 0.584667));
  v.add(new PVector(2.014959, -1.490684, 0.584668));
  v.add(new PVector(2.014959, -0.457598, 0.584668));
  d = new Data("basewins-8.004_Cube.004", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.014959, -0.457598, 0.45084));
  v.add(new PVector(2.014959, -1.490684, 0.45084));
  v.add(new PVector(2.148787, -1.490684, 0.45084));
  v.add(new PVector(2.148787, -0.457598, 0.45084));
  d = new Data("basewins-8.005_Cube.005", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.148788, -0.457598, 1.629892));
  v.add(new PVector(2.148788, -0.457598, 1.496064));
  v.add(new PVector(2.148788, -1.490684, 1.496064));
  v.add(new PVector(2.148788, -1.490684, 1.629892));
  d = new Data("basewins-8.006_Cube.006", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.148788, -0.457598, 1.496064));
  v.add(new PVector(2.01496, -0.457598, 1.496064));
  v.add(new PVector(2.01496, -1.490684, 1.496064));
  v.add(new PVector(2.148788, -1.490684, 1.496064));
  d = new Data("basewins-8.007_Cube.007", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01496, -0.457598, 1.629892));
  v.add(new PVector(2.148788, -0.457598, 1.629892));
  v.add(new PVector(2.148788, -1.490684, 1.629892));
  v.add(new PVector(2.01496, -1.490684, 1.629892));
  d = new Data("basewins-8.008_Cube.008", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01052, -0.492075, 1.447119));
  v.add(new PVector(2.01052, -1.45014, 1.447119));
  v.add(new PVector(2.01052, -1.45014, 1.39332));
  v.add(new PVector(2.01052, -0.492075, 1.39332));
  d = new Data("basewins-8.009_Cube.010", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01052, -0.492075, 1.33952));
  v.add(new PVector(2.01052, -0.492075, 1.28572));
  v.add(new PVector(2.01052, -1.45014, 1.28572));
  v.add(new PVector(2.01052, -1.45014, 1.33952));
  d = new Data("basewins-8.010_Cube.011", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01052, -0.492075, 1.23192));
  v.add(new PVector(2.01052, -1.45014, 1.23192));
  v.add(new PVector(2.01052, -1.45014, 1.17812));
  v.add(new PVector(2.01052, -0.492075, 1.17812));
  d = new Data("basewins-8.011_Cube.012", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01052, -0.492075, 1.12432));
  v.add(new PVector(2.01052, -0.492075, 1.07052));
  v.add(new PVector(2.01052, -1.45014, 1.07052));
  v.add(new PVector(2.01052, -1.45014, 1.12432));
  d = new Data("basewins-8.012_Cube.013", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01052, -0.492075, 1.01672));
  v.add(new PVector(2.01052, -0.492075, 0.96292));
  v.add(new PVector(2.01052, -1.45014, 0.96292));
  v.add(new PVector(2.01052, -1.45014, 1.01672));
  d = new Data("basewins-8.013_Cube.014", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01052, -0.492075, 0.90912));
  v.add(new PVector(2.01052, -1.45014, 0.90912));
  v.add(new PVector(2.01052, -1.45014, 0.85532));
  v.add(new PVector(2.01052, -0.492075, 0.85532));
  d = new Data("basewins-8.014_Cube.016", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01052, -0.492075, 0.801521));
  v.add(new PVector(2.01052, -1.45014, 0.801521));
  v.add(new PVector(2.01052, -1.45014, 0.74772));
  v.add(new PVector(2.01052, -0.492075, 0.74772));
  d = new Data("basewins-8.015_Cube.017", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01052, -0.492075, 0.693921));
  v.add(new PVector(2.010519, -0.492075, 0.640121));
  v.add(new PVector(2.010519, -1.45014, 0.640121));
  v.add(new PVector(2.01052, -1.45014, 0.693921));
  d = new Data("basewins-8.016_Cube.018", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.014716, -0.345974, 1.703856));
  v.add(new PVector(2.014716, -0.345974, 0.376876));
  v.add(new PVector(2.233036, -0.345974, 0.376876));
  v.add(new PVector(2.233036, -0.345974, 1.703856));
  d = new Data("basewins-8.017_Cube.019", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.014716, -0.445974, 0.376876));
  v.add(new PVector(2.014716, -0.445974, 1.703856));
  v.add(new PVector(2.233036, -0.445974, 1.703856));
  v.add(new PVector(2.233036, -0.445974, 0.376876));
  d = new Data("basewins-8.018_Cube.020", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.014716, -0.345974, 0.376876));
  v.add(new PVector(2.014716, -0.445974, 0.376876));
  v.add(new PVector(2.233036, -0.445974, 0.376876));
  v.add(new PVector(2.233036, -0.345974, 0.376876));
  d = new Data("basewins-8.019_Cube.021", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.339493, -1.500815, -2.014716));
  v.add(new PVector(0.012512, -1.500815, -2.014716));
  v.add(new PVector(0.012512, -1.500815, -2.233035));
  v.add(new PVector(1.339492, -1.500815, -2.233036));
  d = new Data("basewins-8.020_Cube.022", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.012512, -1.600815, -2.014716));
  v.add(new PVector(1.339493, -1.600815, -2.014716));
  v.add(new PVector(1.339492, -1.600815, -2.233036));
  v.add(new PVector(0.012512, -1.600815, -2.233035));
  d = new Data("basewins-8.021_Cube.023", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.012512, -1.500815, -2.014716));
  v.add(new PVector(0.012512, -1.600815, -2.014716));
  v.add(new PVector(0.012512, -1.600815, -2.233035));
  v.add(new PVector(0.012512, -1.500815, -2.233035));
  d = new Data("basewins-8.022_Cube.024", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.086476, -0.457598, -2.148787));
  v.add(new PVector(0.086476, -1.490684, -2.148787));
  v.add(new PVector(0.220304, -1.490684, -2.148787));
  v.add(new PVector(0.220304, -0.457598, -2.148787));
  d = new Data("basewins-8.023_Cube.025", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.220304, -0.457598, -2.148787));
  v.add(new PVector(0.220304, -1.490684, -2.148787));
  v.add(new PVector(0.220304, -1.490684, -2.014959));
  v.add(new PVector(0.220304, -0.457598, -2.014959));
  d = new Data("basewins-8.024_Cube.026", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.086476, -0.457598, -2.014959));
  v.add(new PVector(0.086476, -1.490684, -2.014959));
  v.add(new PVector(0.086476, -1.490684, -2.148787));
  v.add(new PVector(0.086476, -0.457598, -2.148787));
  d = new Data("basewins-8.025_Cube.027", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.265529, -0.457598, -2.148788));
  v.add(new PVector(1.131701, -0.457598, -2.148788));
  v.add(new PVector(1.131701, -1.490684, -2.148788));
  v.add(new PVector(1.265529, -1.490684, -2.148788));
  d = new Data("basewins-8.026_Cube.028", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.131701, -0.457598, -2.148788));
  v.add(new PVector(1.131701, -0.457598, -2.01496));
  v.add(new PVector(1.131701, -1.490684, -2.01496));
  v.add(new PVector(1.131701, -1.490684, -2.148788));
  d = new Data("basewins-8.027_Cube.029", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.265529, -0.457598, -2.01496));
  v.add(new PVector(1.265529, -0.457598, -2.148788));
  v.add(new PVector(1.265529, -1.490684, -2.148788));
  v.add(new PVector(1.265529, -1.490684, -2.01496));
  d = new Data("basewins-8.028_Cube.030", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.082756, -0.492075, -2.01052));
  v.add(new PVector(1.028956, -0.492075, -2.01052));
  v.add(new PVector(1.028956, -1.45014, -2.01052));
  v.add(new PVector(1.082756, -1.45014, -2.01052));
  d = new Data("basewins-8.029_Cube.031", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.975156, -0.492075, -2.01052));
  v.add(new PVector(0.921356, -0.492075, -2.01052));
  v.add(new PVector(0.921356, -1.45014, -2.01052));
  v.add(new PVector(0.975156, -1.45014, -2.01052));
  d = new Data("basewins-8.030_Cube.032", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.867556, -0.492075, -2.01052));
  v.add(new PVector(0.867556, -1.45014, -2.01052));
  v.add(new PVector(0.813756, -1.45014, -2.01052));
  v.add(new PVector(0.813756, -0.492075, -2.01052));
  d = new Data("basewins-8.031_Cube.033", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.759956, -0.492075, -2.01052));
  v.add(new PVector(0.706156, -0.492075, -2.01052));
  v.add(new PVector(0.706156, -1.45014, -2.01052));
  v.add(new PVector(0.759956, -1.45014, -2.01052));
  d = new Data("basewins-8.032_Cube.034", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.652357, -0.492075, -2.01052));
  v.add(new PVector(0.598557, -0.492075, -2.01052));
  v.add(new PVector(0.598557, -1.45014, -2.01052));
  v.add(new PVector(0.652357, -1.45014, -2.01052));
  d = new Data("basewins-8.033_Cube.035", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.544757, -0.492075, -2.01052));
  v.add(new PVector(0.544757, -1.45014, -2.01052));
  v.add(new PVector(0.490957, -1.45014, -2.01052));
  v.add(new PVector(0.490957, -0.492075, -2.01052));
  d = new Data("basewins-8.034_Cube.036", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.437157, -0.492075, -2.01052));
  v.add(new PVector(0.437157, -1.45014, -2.01052));
  v.add(new PVector(0.383357, -1.45014, -2.01052));
  v.add(new PVector(0.383357, -0.492075, -2.01052));
  d = new Data("basewins-8.035_Cube.037", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.329557, -0.492075, -2.01052));
  v.add(new PVector(0.329557, -1.45014, -2.01052));
  v.add(new PVector(0.275757, -1.45014, -2.010519));
  v.add(new PVector(0.275757, -0.492075, -2.010519));
  d = new Data("basewins-8.036_Cube.038", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.339493, -0.345974, -2.014716));
  v.add(new PVector(0.012512, -0.345974, -2.014716));
  v.add(new PVector(0.012512, -0.345974, -2.233036));
  v.add(new PVector(1.339492, -0.345974, -2.233036));
  d = new Data("basewins-8.037_Cube.039", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.012512, -0.445974, -2.014716));
  v.add(new PVector(1.339493, -0.445974, -2.014716));
  v.add(new PVector(1.339492, -0.445974, -2.233036));
  v.add(new PVector(0.012512, -0.445974, -2.233036));
  d = new Data("basewins-8.038_Cube.040", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.012512, -0.345974, -2.014716));
  v.add(new PVector(0.012512, -0.445974, -2.014716));
  v.add(new PVector(0.012512, -0.445974, -2.233036));
  v.add(new PVector(0.012512, -0.345974, -2.233036));
  d = new Data("basewins-8.039_Cube.041", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.014716, -1.500815, -1.330741));
  v.add(new PVector(-2.014716, -1.500815, -0.00376));
  v.add(new PVector(-2.233035, -1.500815, -0.00376));
  v.add(new PVector(-2.233036, -1.500815, -1.33074));
  d = new Data("basewins-8.040_Cube.042", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.014716, -1.600815, -0.00376));
  v.add(new PVector(-2.014716, -1.600815, -1.330741));
  v.add(new PVector(-2.233036, -1.600815, -1.33074));
  v.add(new PVector(-2.233035, -1.600815, -0.00376));
  d = new Data("basewins-8.041_Cube.043", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.014716, -1.500815, -0.00376));
  v.add(new PVector(-2.014716, -1.600815, -0.00376));
  v.add(new PVector(-2.233035, -1.600815, -0.00376));
  v.add(new PVector(-2.233035, -1.500815, -0.00376));
  d = new Data("basewins-8.042_Cube.044", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.148787, -0.457598, -0.077724));
  v.add(new PVector(-2.148787, -1.490684, -0.077724));
  v.add(new PVector(-2.148787, -1.490684, -0.211552));
  v.add(new PVector(-2.148787, -0.457598, -0.211552));
  d = new Data("basewins-8.043_Cube.045", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.148787, -0.457598, -0.211552));
  v.add(new PVector(-2.148787, -1.490684, -0.211552));
  v.add(new PVector(-2.014959, -1.490684, -0.211552));
  v.add(new PVector(-2.014959, -0.457598, -0.211552));
  d = new Data("basewins-8.044_Cube.046", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.014959, -0.457598, -0.077724));
  v.add(new PVector(-2.014959, -1.490684, -0.077724));
  v.add(new PVector(-2.148787, -1.490684, -0.077724));
  v.add(new PVector(-2.148787, -0.457598, -0.077724));
  d = new Data("basewins-8.045_Cube.047", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.148788, -0.457598, -1.256777));
  v.add(new PVector(-2.148788, -0.457598, -1.122949));
  v.add(new PVector(-2.148788, -1.490684, -1.122949));
  v.add(new PVector(-2.148788, -1.490684, -1.256777));
  d = new Data("basewins-8.046_Cube.048", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.148788, -0.457598, -1.122949));
  v.add(new PVector(-2.01496, -0.457598, -1.122949));
  v.add(new PVector(-2.01496, -1.490684, -1.122949));
  v.add(new PVector(-2.148788, -1.490684, -1.122949));
  d = new Data("basewins-8.047_Cube.049", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.01496, -0.457598, -1.256777));
  v.add(new PVector(-2.148788, -0.457598, -1.256777));
  v.add(new PVector(-2.148788, -1.490684, -1.256777));
  v.add(new PVector(-2.01496, -1.490684, -1.256777));
  d = new Data("basewins-8.048_Cube.050", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.01052, -0.492075, -1.074004));
  v.add(new PVector(-2.01052, -0.492075, -1.020204));
  v.add(new PVector(-2.01052, -1.45014, -1.020204));
  v.add(new PVector(-2.01052, -1.45014, -1.074004));
  d = new Data("basewins-8.049_Cube.051", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.01052, -0.492075, -0.966404));
  v.add(new PVector(-2.01052, -0.492075, -0.912604));
  v.add(new PVector(-2.01052, -1.45014, -0.912604));
  v.add(new PVector(-2.01052, -1.45014, -0.966404));
  d = new Data("basewins-8.050_Cube.052", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.01052, -0.492075, -0.858804));
  v.add(new PVector(-2.01052, -1.45014, -0.858804));
  v.add(new PVector(-2.01052, -1.45014, -0.805004));
  v.add(new PVector(-2.01052, -0.492075, -0.805004));
  d = new Data("basewins-8.051_Cube.053", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.01052, -0.492075, -0.751204));
  v.add(new PVector(-2.01052, -0.492075, -0.697405));
  v.add(new PVector(-2.01052, -1.45014, -0.697405));
  v.add(new PVector(-2.01052, -1.45014, -0.751204));
  d = new Data("basewins-8.052_Cube.054", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.01052, -0.492075, -0.643605));
  v.add(new PVector(-2.01052, -0.492075, -0.589805));
  v.add(new PVector(-2.01052, -1.45014, -0.589805));
  v.add(new PVector(-2.01052, -1.45014, -0.643605));
  d = new Data("basewins-8.053_Cube.055", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.01052, -0.492075, -0.536005));
  v.add(new PVector(-2.01052, -1.45014, -0.536005));
  v.add(new PVector(-2.01052, -1.45014, -0.482205));
  v.add(new PVector(-2.01052, -0.492075, -0.482205));
  d = new Data("basewins-8.054_Cube.056", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.01052, -0.492075, -0.428405));
  v.add(new PVector(-2.01052, -1.45014, -0.428405));
  v.add(new PVector(-2.01052, -1.45014, -0.374605));
  v.add(new PVector(-2.01052, -0.492075, -0.374605));
  d = new Data("basewins-8.055_Cube.057", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.01052, -0.492075, -0.320805));
  v.add(new PVector(-2.01052, -1.45014, -0.320805));
  v.add(new PVector(-2.010519, -1.45014, -0.267005));
  v.add(new PVector(-2.010519, -0.492075, -0.267005));
  d = new Data("basewins-8.056_Cube.058", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.014716, -0.345974, -1.330741));
  v.add(new PVector(-2.014716, -0.345974, -0.00376));
  v.add(new PVector(-2.233036, -0.345974, -0.00376));
  v.add(new PVector(-2.233036, -0.345974, -1.33074));
  d = new Data("basewins-8.057_Cube.059", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.014716, -0.445974, -0.00376));
  v.add(new PVector(-2.014716, -0.445974, -1.330741));
  v.add(new PVector(-2.233036, -0.445974, -1.33074));
  v.add(new PVector(-2.233036, -0.445974, -0.00376));
  d = new Data("basewins-8.058_Cube.060", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.014716, -0.345974, -0.00376));
  v.add(new PVector(-2.014716, -0.445974, -0.00376));
  v.add(new PVector(-2.233036, -0.445974, -0.00376));
  v.add(new PVector(-2.233036, -0.345974, -0.00376));
  d = new Data("basewins-8.059_Cube.061", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.233036, -1.500815, 1.703856));
  v.add(new PVector(2.233036, -1.600815, 1.703856));
  v.add(new PVector(2.014716, -1.600815, 1.703856));
  v.add(new PVector(2.014716, -1.500815, 1.703856));
  d = new Data("basewins-8.060_Cube.062", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.233035, -1.500815, 0.376876));
  v.add(new PVector(2.233035, -1.600815, 0.376876));
  v.add(new PVector(2.233036, -1.600815, 1.703856));
  v.add(new PVector(2.233036, -1.500815, 1.703856));
  d = new Data("basewins-8.061_Cube.063", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.233036, -0.345974, 1.703856));
  v.add(new PVector(2.233036, -0.445974, 1.703856));
  v.add(new PVector(2.014716, -0.445974, 1.703856));
  v.add(new PVector(2.014716, -0.345974, 1.703856));
  d = new Data("basewins-8.062_Cube.064", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.233036, -0.345974, 0.376876));
  v.add(new PVector(2.233036, -0.445974, 0.376876));
  v.add(new PVector(2.233036, -0.445974, 1.703856));
  v.add(new PVector(2.233036, -0.345974, 1.703856));
  d = new Data("basewins-8.063_Cube.065", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.339492, -1.500815, -2.233036));
  v.add(new PVector(1.339492, -1.600815, -2.233036));
  v.add(new PVector(1.339493, -1.600815, -2.014716));
  v.add(new PVector(1.339493, -1.500815, -2.014716));
  d = new Data("basewins-8.064_Cube.066", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.012512, -1.500815, -2.233035));
  v.add(new PVector(0.012512, -1.600815, -2.233035));
  v.add(new PVector(1.339492, -1.600815, -2.233036));
  v.add(new PVector(1.339492, -1.500815, -2.233036));
  d = new Data("basewins-8.065_Cube.067", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.339492, -0.345974, -2.233036));
  v.add(new PVector(1.339492, -0.445974, -2.233036));
  v.add(new PVector(1.339493, -0.445974, -2.014716));
  v.add(new PVector(1.339493, -0.345974, -2.014716));
  d = new Data("basewins-8.066_Cube.068", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.012512, -0.345974, -2.233036));
  v.add(new PVector(0.012512, -0.445974, -2.233036));
  v.add(new PVector(1.339492, -0.445974, -2.233036));
  v.add(new PVector(1.339492, -0.345974, -2.233036));
  d = new Data("basewins-8.067_Cube.069", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.233036, -1.500815, -1.33074));
  v.add(new PVector(-2.233036, -1.600815, -1.33074));
  v.add(new PVector(-2.014716, -1.600815, -1.330741));
  v.add(new PVector(-2.014716, -1.500815, -1.330741));
  d = new Data("basewins-8.068_Cube.070", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.233035, -1.500815, -0.00376));
  v.add(new PVector(-2.233035, -1.600815, -0.00376));
  v.add(new PVector(-2.233036, -1.600815, -1.33074));
  v.add(new PVector(-2.233036, -1.500815, -1.33074));
  d = new Data("basewins-8.069_Cube.071", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.233036, -0.345974, -1.33074));
  v.add(new PVector(-2.233036, -0.445974, -1.33074));
  v.add(new PVector(-2.014716, -0.445974, -1.330741));
  v.add(new PVector(-2.014716, -0.345974, -1.330741));
  d = new Data("basewins-8.070_Cube.072", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.233036, -0.345974, -0.00376));
  v.add(new PVector(-2.233036, -0.445974, -0.00376));
  v.add(new PVector(-2.233036, -0.445974, -1.33074));
  v.add(new PVector(-2.233036, -0.345974, -1.33074));
  d = new Data("basewins-8.071_Cube.073", 4, v);
  dd.add(d);

  win = new Win("basewins-8", dd);
  p.add(win);


  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(-3.310514, -0.882847, -2.013742));
  v.add(new PVector(-2.020397, -0.882847, -2.013742));
  v.add(new PVector(-2.020397, -1.551483, -2.013742));
  v.add(new PVector(-3.310514, -1.551483, -2.013742));
  d = new Data("basewins-9_Plane.012", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.646701, -0.917264, -2.026572));
  v.add(new PVector(-2.056083, -0.917264, -2.026572));
  v.add(new PVector(-2.056083, -1.51601, -2.026572));
  v.add(new PVector(-2.646701, -1.51601, -2.026572));
  d = new Data("basewins-9.001_Plane.001", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-3.275259, -0.917264, -2.026572));
  v.add(new PVector(-2.684641, -0.917264, -2.026572));
  v.add(new PVector(-2.684641, -1.51601, -2.026572));
  v.add(new PVector(-3.275259, -1.51601, -2.026572));
  d = new Data("basewins-9.002_Plane.002", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-4.009762, -0.355609, -0.37389));
  v.add(new PVector(-4.009762, -0.355609, -1.264007));
  v.add(new PVector(-4.009762, -1.551483, -1.264007));
  v.add(new PVector(-4.009762, -1.551483, -0.37389));
  d = new Data("basewins-9.003_Plane.003", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-4.022592, -0.390026, -0.837703));
  v.add(new PVector(-4.022592, -0.390026, -1.228321));
  v.add(new PVector(-4.022592, -1.51601, -1.228321));
  v.add(new PVector(-4.022592, -1.51601, -0.837703));
  d = new Data("basewins-9.004_Plane.004", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-4.022592, -0.390026, -0.409144));
  v.add(new PVector(-4.022592, -0.390026, -0.799763));
  v.add(new PVector(-4.022592, -1.51601, -0.799763));
  v.add(new PVector(-4.022592, -1.51601, -0.409144));
  d = new Data("basewins-9.005_Plane.005", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(4.011862, -0.355609, -1.264008));
  v.add(new PVector(4.011862, -0.355609, -0.373891));
  v.add(new PVector(4.011862, -1.551483, -0.373891));
  v.add(new PVector(4.011862, -1.551483, -1.264008));
  d = new Data("basewins-9.006_Plane.006", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(4.024692, -0.390026, -0.800195));
  v.add(new PVector(4.024692, -0.390026, -0.409577));
  v.add(new PVector(4.024692, -1.51601, -0.409577));
  v.add(new PVector(4.024691, -1.51601, -0.800195));
  d = new Data("basewins-9.007_Plane.007", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(4.024692, -0.390026, -1.228754));
  v.add(new PVector(4.024692, -0.390026, -0.838135));
  v.add(new PVector(4.024692, -1.51601, -0.838135));
  v.add(new PVector(4.024691, -1.51601, -1.228754));
  d = new Data("basewins-9.008_Plane.008", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.012884, -0.882847, -2.013742));
  v.add(new PVector(3.303001, -0.882847, -2.013742));
  v.add(new PVector(3.303001, -1.551483, -2.013742));
  v.add(new PVector(2.012884, -1.551483, -2.013742));
  d = new Data("basewins-9.009_Plane.009", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.676697, -0.917264, -2.026572));
  v.add(new PVector(3.267315, -0.917264, -2.026572));
  v.add(new PVector(3.267315, -1.51601, -2.026572));
  v.add(new PVector(2.676697, -1.51601, -2.026572));
  d = new Data("basewins-9.010_Plane.010", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.048139, -0.917264, -2.026572));
  v.add(new PVector(2.638757, -0.917264, -2.026572));
  v.add(new PVector(2.638757, -1.51601, -2.026572));
  v.add(new PVector(2.048139, -1.51601, -2.026572));
  d = new Data("basewins-9.011_Plane.011", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.015004, -1.230669, 0.339317));
  v.add(new PVector(2.015004, -1.230669, 0.729936));
  v.add(new PVector(2.015004, -1.51601, 0.729936));
  v.add(new PVector(2.015003, -1.51601, 0.339317));
  d = new Data("basewins-9.012_Plane.013", 1, v);
  dd.add(d);

  win = new Win("basewins-9", dd);
  p.add(win);


  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(2.014716, -1.500815, 1.703856));
  v.add(new PVector(2.014716, -1.500815, 0.376876));
  v.add(new PVector(2.233035, -1.500815, 0.376876));
  v.add(new PVector(2.233036, -1.500815, 1.703856));
  d = new Data("basewins-10_Cube.016", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.014716, -1.600815, 0.376876));
  v.add(new PVector(2.014716, -1.600815, 1.703856));
  v.add(new PVector(2.233036, -1.600815, 1.703856));
  v.add(new PVector(2.233035, -1.600815, 0.376876));
  d = new Data("basewins-10.001_Cube.001", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.014716, -1.500815, 0.376876));
  v.add(new PVector(2.014716, -1.600815, 0.376876));
  v.add(new PVector(2.233035, -1.600815, 0.376876));
  v.add(new PVector(2.233035, -1.500815, 0.376876));
  d = new Data("basewins-10.002_Cube.002", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.148787, -0.457598, 0.45084));
  v.add(new PVector(2.148787, -1.490684, 0.45084));
  v.add(new PVector(2.148787, -1.490684, 0.584667));
  v.add(new PVector(2.148787, -0.457598, 0.584667));
  d = new Data("basewins-10.003_Cube.003", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.148787, -0.457598, 0.584667));
  v.add(new PVector(2.148787, -1.490684, 0.584667));
  v.add(new PVector(2.014959, -1.490684, 0.584668));
  v.add(new PVector(2.014959, -0.457598, 0.584668));
  d = new Data("basewins-10.004_Cube.004", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.014959, -0.457598, 0.45084));
  v.add(new PVector(2.014959, -1.490684, 0.45084));
  v.add(new PVector(2.148787, -1.490684, 0.45084));
  v.add(new PVector(2.148787, -0.457598, 0.45084));
  d = new Data("basewins-10.005_Cube.005", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.148788, -0.457598, 1.629892));
  v.add(new PVector(2.148788, -0.457598, 1.496064));
  v.add(new PVector(2.148788, -1.490684, 1.496064));
  v.add(new PVector(2.148788, -1.490684, 1.629892));
  d = new Data("basewins-10.006_Cube.006", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.148788, -0.457598, 1.496064));
  v.add(new PVector(2.01496, -0.457598, 1.496064));
  v.add(new PVector(2.01496, -1.490684, 1.496064));
  v.add(new PVector(2.148788, -1.490684, 1.496064));
  d = new Data("basewins-10.007_Cube.007", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01496, -0.457598, 1.629892));
  v.add(new PVector(2.148788, -0.457598, 1.629892));
  v.add(new PVector(2.148788, -1.490684, 1.629892));
  v.add(new PVector(2.01496, -1.490684, 1.629892));
  d = new Data("basewins-10.008_Cube.008", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01052, -0.492075, 1.447119));
  v.add(new PVector(2.01052, -1.45014, 1.447119));
  v.add(new PVector(2.01052, -1.45014, 1.39332));
  v.add(new PVector(2.01052, -0.492075, 1.39332));
  d = new Data("basewins-10.009_Cube.010", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01052, -0.492075, 1.33952));
  v.add(new PVector(2.01052, -0.492075, 1.28572));
  v.add(new PVector(2.01052, -1.45014, 1.28572));
  v.add(new PVector(2.01052, -1.45014, 1.33952));
  d = new Data("basewins-10.010_Cube.011", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01052, -0.492075, 1.23192));
  v.add(new PVector(2.01052, -1.45014, 1.23192));
  v.add(new PVector(2.01052, -1.45014, 1.17812));
  v.add(new PVector(2.01052, -0.492075, 1.17812));
  d = new Data("basewins-10.011_Cube.012", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01052, -0.492075, 1.12432));
  v.add(new PVector(2.01052, -0.492075, 1.07052));
  v.add(new PVector(2.01052, -1.45014, 1.07052));
  v.add(new PVector(2.01052, -1.45014, 1.12432));
  d = new Data("basewins-10.012_Cube.013", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01052, -0.492075, 1.01672));
  v.add(new PVector(2.01052, -0.492075, 0.96292));
  v.add(new PVector(2.01052, -1.45014, 0.96292));
  v.add(new PVector(2.01052, -1.45014, 1.01672));
  d = new Data("basewins-10.013_Cube.014", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01052, -0.492075, 0.90912));
  v.add(new PVector(2.01052, -1.45014, 0.90912));
  v.add(new PVector(2.01052, -1.45014, 0.85532));
  v.add(new PVector(2.01052, -0.492075, 0.85532));
  d = new Data("basewins-10.014_Cube.015", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01052, -0.492075, 0.801521));
  v.add(new PVector(2.01052, -1.45014, 0.801521));
  v.add(new PVector(2.01052, -1.45014, 0.74772));
  v.add(new PVector(2.01052, -0.492075, 0.74772));
  d = new Data("basewins-10.015_Cube.017", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.01052, -0.492075, 0.693921));
  v.add(new PVector(2.010519, -0.492075, 0.640121));
  v.add(new PVector(2.010519, -1.45014, 0.640121));
  v.add(new PVector(2.01052, -1.45014, 0.693921));
  d = new Data("basewins-10.016_Cube.018", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.014716, -0.345974, 1.703856));
  v.add(new PVector(2.014716, -0.345974, 0.376876));
  v.add(new PVector(2.233036, -0.345974, 0.376876));
  v.add(new PVector(2.233036, -0.345974, 1.703856));
  d = new Data("basewins-10.017_Cube.019", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.014716, -0.445974, 0.376876));
  v.add(new PVector(2.014716, -0.445974, 1.703856));
  v.add(new PVector(2.233036, -0.445974, 1.703856));
  v.add(new PVector(2.233036, -0.445974, 0.376876));
  d = new Data("basewins-10.018_Cube.020", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.014716, -0.345974, 0.376876));
  v.add(new PVector(2.014716, -0.445974, 0.376876));
  v.add(new PVector(2.233036, -0.445974, 0.376876));
  v.add(new PVector(2.233036, -0.345974, 0.376876));
  d = new Data("basewins-10.019_Cube.021", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.977642, -1.500815, -2.014716));
  v.add(new PVector(1.650661, -1.500815, -2.014716));
  v.add(new PVector(1.650661, -1.500815, -2.233035));
  v.add(new PVector(2.977642, -1.500815, -2.233036));
  d = new Data("basewins-10.020_Cube.022", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.650661, -1.600815, -2.014716));
  v.add(new PVector(2.977642, -1.600815, -2.014716));
  v.add(new PVector(2.977642, -1.600815, -2.233036));
  v.add(new PVector(1.650661, -1.600815, -2.233035));
  d = new Data("basewins-10.021_Cube.023", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.650661, -1.500815, -2.014716));
  v.add(new PVector(1.650661, -1.600815, -2.014716));
  v.add(new PVector(1.650661, -1.600815, -2.233035));
  v.add(new PVector(1.650661, -1.500815, -2.233035));
  d = new Data("basewins-10.022_Cube.024", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.724625, -0.457598, -2.148787));
  v.add(new PVector(1.724625, -1.490684, -2.148787));
  v.add(new PVector(1.858453, -1.490684, -2.148787));
  v.add(new PVector(1.858453, -0.457598, -2.148787));
  d = new Data("basewins-10.023_Cube.025", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.858453, -0.457598, -2.148787));
  v.add(new PVector(1.858453, -1.490684, -2.148787));
  v.add(new PVector(1.858453, -1.490684, -2.014959));
  v.add(new PVector(1.858453, -0.457598, -2.014959));
  d = new Data("basewins-10.024_Cube.026", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.724625, -0.457598, -2.014959));
  v.add(new PVector(1.724625, -1.490684, -2.014959));
  v.add(new PVector(1.724625, -1.490684, -2.148787));
  v.add(new PVector(1.724625, -0.457598, -2.148787));
  d = new Data("basewins-10.025_Cube.027", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.903678, -0.457598, -2.148788));
  v.add(new PVector(2.76985, -0.457598, -2.148788));
  v.add(new PVector(2.76985, -1.490684, -2.148788));
  v.add(new PVector(2.903678, -1.490684, -2.148788));
  d = new Data("basewins-10.026_Cube.028", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.76985, -0.457598, -2.148788));
  v.add(new PVector(2.76985, -0.457598, -2.01496));
  v.add(new PVector(2.76985, -1.490684, -2.01496));
  v.add(new PVector(2.76985, -1.490684, -2.148788));
  d = new Data("basewins-10.027_Cube.029", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.903678, -0.457598, -2.01496));
  v.add(new PVector(2.903678, -0.457598, -2.148788));
  v.add(new PVector(2.903678, -1.490684, -2.148788));
  v.add(new PVector(2.903678, -1.490684, -2.01496));
  d = new Data("basewins-10.028_Cube.030", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.720905, -0.492075, -2.01052));
  v.add(new PVector(2.667105, -0.492075, -2.01052));
  v.add(new PVector(2.667105, -1.45014, -2.01052));
  v.add(new PVector(2.720905, -1.45014, -2.01052));
  d = new Data("basewins-10.029_Cube.031", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.613305, -0.492075, -2.01052));
  v.add(new PVector(2.559505, -0.492075, -2.01052));
  v.add(new PVector(2.559505, -1.45014, -2.01052));
  v.add(new PVector(2.613305, -1.45014, -2.01052));
  d = new Data("basewins-10.030_Cube.032", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.505705, -0.492075, -2.01052));
  v.add(new PVector(2.505705, -1.45014, -2.01052));
  v.add(new PVector(2.451906, -1.45014, -2.01052));
  v.add(new PVector(2.451906, -0.492075, -2.01052));
  d = new Data("basewins-10.031_Cube.033", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.398106, -0.492075, -2.01052));
  v.add(new PVector(2.344306, -0.492075, -2.01052));
  v.add(new PVector(2.344306, -1.45014, -2.01052));
  v.add(new PVector(2.398106, -1.45014, -2.01052));
  d = new Data("basewins-10.032_Cube.034", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.290506, -0.492075, -2.01052));
  v.add(new PVector(2.236706, -0.492075, -2.01052));
  v.add(new PVector(2.236706, -1.45014, -2.01052));
  v.add(new PVector(2.290506, -1.45014, -2.01052));
  d = new Data("basewins-10.033_Cube.035", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.182906, -0.492075, -2.01052));
  v.add(new PVector(2.182906, -1.45014, -2.01052));
  v.add(new PVector(2.129106, -1.45014, -2.01052));
  v.add(new PVector(2.129106, -0.492075, -2.01052));
  d = new Data("basewins-10.034_Cube.036", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.075306, -0.492075, -2.01052));
  v.add(new PVector(2.075306, -1.45014, -2.01052));
  v.add(new PVector(2.021506, -1.45014, -2.01052));
  v.add(new PVector(2.021506, -0.492075, -2.01052));
  d = new Data("basewins-10.035_Cube.037", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.967706, -0.492075, -2.01052));
  v.add(new PVector(1.967706, -1.45014, -2.01052));
  v.add(new PVector(1.913906, -1.45014, -2.010519));
  v.add(new PVector(1.913906, -0.492075, -2.010519));
  d = new Data("basewins-10.036_Cube.038", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.977642, -0.345974, -2.014716));
  v.add(new PVector(1.650661, -0.345974, -2.014716));
  v.add(new PVector(1.650661, -0.345974, -2.233036));
  v.add(new PVector(2.977642, -0.345974, -2.233036));
  d = new Data("basewins-10.037_Cube.039", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.650661, -0.445974, -2.014716));
  v.add(new PVector(2.977642, -0.445974, -2.014716));
  v.add(new PVector(2.977642, -0.445974, -2.233036));
  v.add(new PVector(1.650661, -0.445974, -2.233036));
  d = new Data("basewins-10.038_Cube.040", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.650661, -0.345974, -2.014716));
  v.add(new PVector(1.650661, -0.445974, -2.014716));
  v.add(new PVector(1.650661, -0.445974, -2.233036));
  v.add(new PVector(1.650661, -0.345974, -2.233036));
  d = new Data("basewins-10.039_Cube.041", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-4.011861, -1.500815, -1.645769));
  v.add(new PVector(-4.01186, -1.500815, -0.318789));
  v.add(new PVector(-4.23018, -1.500815, -0.318789));
  v.add(new PVector(-4.230181, -1.500815, -1.645769));
  d = new Data("basewins-10.040_Cube.042", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-4.01186, -1.600815, -0.318789));
  v.add(new PVector(-4.011861, -1.600815, -1.645769));
  v.add(new PVector(-4.230181, -1.600815, -1.645769));
  v.add(new PVector(-4.23018, -1.600815, -0.318789));
  d = new Data("basewins-10.041_Cube.043", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-4.01186, -1.500815, -0.318789));
  v.add(new PVector(-4.01186, -1.600815, -0.318789));
  v.add(new PVector(-4.23018, -1.600815, -0.318789));
  v.add(new PVector(-4.23018, -1.500815, -0.318789));
  d = new Data("basewins-10.042_Cube.044", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-4.145933, -0.457598, -0.392753));
  v.add(new PVector(-4.145933, -1.490684, -0.392753));
  v.add(new PVector(-4.145933, -1.490684, -0.526581));
  v.add(new PVector(-4.145933, -0.457598, -0.526581));
  d = new Data("basewins-10.043_Cube.045", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-4.145933, -0.457598, -0.526581));
  v.add(new PVector(-4.145933, -1.490684, -0.526581));
  v.add(new PVector(-4.012105, -1.490684, -0.526581));
  v.add(new PVector(-4.012105, -0.457598, -0.526581));
  d = new Data("basewins-10.044_Cube.046", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-4.012105, -0.457598, -0.392753));
  v.add(new PVector(-4.012105, -1.490684, -0.392753));
  v.add(new PVector(-4.145933, -1.490684, -0.392753));
  v.add(new PVector(-4.145933, -0.457598, -0.392753));
  d = new Data("basewins-10.045_Cube.047", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-4.145933, -0.457598, -1.571805));
  v.add(new PVector(-4.145933, -0.457598, -1.437977));
  v.add(new PVector(-4.145933, -1.490684, -1.437977));
  v.add(new PVector(-4.145933, -1.490684, -1.571805));
  d = new Data("basewins-10.046_Cube.048", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-4.145933, -0.457598, -1.437977));
  v.add(new PVector(-4.012105, -0.457598, -1.437978));
  v.add(new PVector(-4.012105, -1.490684, -1.437978));
  v.add(new PVector(-4.145933, -1.490684, -1.437977));
  d = new Data("basewins-10.047_Cube.049", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-4.012105, -0.457598, -1.571805));
  v.add(new PVector(-4.145933, -0.457598, -1.571805));
  v.add(new PVector(-4.145933, -1.490684, -1.571805));
  v.add(new PVector(-4.012105, -1.490684, -1.571805));
  d = new Data("basewins-10.048_Cube.050", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-4.007665, -0.492075, -1.389033));
  v.add(new PVector(-4.007664, -0.492075, -1.335233));
  v.add(new PVector(-4.007664, -1.45014, -1.335233));
  v.add(new PVector(-4.007665, -1.45014, -1.389033));
  d = new Data("basewins-10.049_Cube.051", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-4.007664, -0.492075, -1.281433));
  v.add(new PVector(-4.007664, -0.492075, -1.227633));
  v.add(new PVector(-4.007664, -1.45014, -1.227633));
  v.add(new PVector(-4.007664, -1.45014, -1.281433));
  d = new Data("basewins-10.050_Cube.052", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-4.007664, -0.492075, -1.173833));
  v.add(new PVector(-4.007664, -1.45014, -1.173833));
  v.add(new PVector(-4.007664, -1.45014, -1.120033));
  v.add(new PVector(-4.007664, -0.492075, -1.120033));
  d = new Data("basewins-10.051_Cube.053", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-4.007664, -0.492075, -1.066233));
  v.add(new PVector(-4.007664, -0.492075, -1.012433));
  v.add(new PVector(-4.007664, -1.45014, -1.012433));
  v.add(new PVector(-4.007664, -1.45014, -1.066233));
  d = new Data("basewins-10.052_Cube.054", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-4.007664, -0.492075, -0.958633));
  v.add(new PVector(-4.007664, -0.492075, -0.904833));
  v.add(new PVector(-4.007664, -1.45014, -0.904833));
  v.add(new PVector(-4.007664, -1.45014, -0.958633));
  d = new Data("basewins-10.053_Cube.055", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-4.007664, -0.492075, -0.851034));
  v.add(new PVector(-4.007664, -1.45014, -0.851034));
  v.add(new PVector(-4.007664, -1.45014, -0.797234));
  v.add(new PVector(-4.007664, -0.492075, -0.797234));
  d = new Data("basewins-10.054_Cube.056", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-4.007664, -0.492075, -0.743434));
  v.add(new PVector(-4.007664, -1.45014, -0.743434));
  v.add(new PVector(-4.007664, -1.45014, -0.689634));
  v.add(new PVector(-4.007664, -0.492075, -0.689634));
  d = new Data("basewins-10.055_Cube.057", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-4.007664, -0.492075, -0.635834));
  v.add(new PVector(-4.007664, -1.45014, -0.635834));
  v.add(new PVector(-4.007664, -1.45014, -0.582034));
  v.add(new PVector(-4.007664, -0.492075, -0.582034));
  d = new Data("basewins-10.056_Cube.058", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-4.011861, -0.345974, -1.645769));
  v.add(new PVector(-4.011861, -0.345974, -0.318789));
  v.add(new PVector(-4.23018, -0.345974, -0.318789));
  v.add(new PVector(-4.230181, -0.345974, -1.645769));
  d = new Data("basewins-10.057_Cube.059", 5, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-4.011861, -0.445974, -0.318789));
  v.add(new PVector(-4.011861, -0.445974, -1.645769));
  v.add(new PVector(-4.230181, -0.445974, -1.645769));
  v.add(new PVector(-4.23018, -0.445974, -0.318789));
  d = new Data("basewins-10.058_Cube.060", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-4.011861, -0.345974, -0.318789));
  v.add(new PVector(-4.011861, -0.445974, -0.318789));
  v.add(new PVector(-4.23018, -0.445974, -0.318789));
  v.add(new PVector(-4.23018, -0.345974, -0.318789));
  d = new Data("basewins-10.059_Cube.061", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.478303, -0.075918, -2.01052));
  v.add(new PVector(-1.582001, -0.075918, -2.010519));
  v.add(new PVector(-1.582001, -1.922565, -2.010519));
  v.add(new PVector(-1.478303, -1.922565, -2.01052));
  d = new Data("basewins-10.060_Cube.062", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.685699, -0.075918, -2.010519));
  v.add(new PVector(-1.789397, -0.075918, -2.010519));
  v.add(new PVector(-1.789397, -1.922565, -2.010519));
  v.add(new PVector(-1.685699, -1.922565, -2.010519));
  d = new Data("basewins-10.061_Cube.063", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.893095, -0.075918, -2.010519));
  v.add(new PVector(-1.893095, -1.922565, -2.010519));
  v.add(new PVector(-1.996793, -1.922565, -2.010519));
  v.add(new PVector(-1.996793, -0.075918, -2.010519));
  d = new Data("basewins-10.062_Cube.064", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.100491, -0.075918, -2.010519));
  v.add(new PVector(-2.204189, -0.075918, -2.010519));
  v.add(new PVector(-2.204189, -1.922565, -2.010519));
  v.add(new PVector(-2.100491, -1.922565, -2.010519));
  d = new Data("basewins-10.063_Cube.065", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.307887, -0.075918, -2.010519));
  v.add(new PVector(-2.411585, -0.075918, -2.010519));
  v.add(new PVector(-2.411585, -1.922565, -2.010519));
  v.add(new PVector(-2.307887, -1.922565, -2.010519));
  d = new Data("basewins-10.064_Cube.066", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.515283, -0.075918, -2.010519));
  v.add(new PVector(-2.515283, -1.922565, -2.010519));
  v.add(new PVector(-2.618981, -1.922565, -2.010519));
  v.add(new PVector(-2.618981, -0.075918, -2.010519));
  d = new Data("basewins-10.065_Cube.067", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.722679, -0.075918, -2.010519));
  v.add(new PVector(-2.722679, -1.922565, -2.010519));
  v.add(new PVector(-2.826377, -1.922565, -2.010519));
  v.add(new PVector(-2.826377, -0.075918, -2.010519));
  d = new Data("basewins-10.066_Cube.068", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.930075, -0.075918, -2.010519));
  v.add(new PVector(-2.930075, -1.922565, -2.010519));
  v.add(new PVector(-3.033773, -1.922565, -2.010519));
  v.add(new PVector(-3.033773, -0.075918, -2.010519));
  d = new Data("basewins-10.067_Cube.069", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.233036, -1.500815, 1.703856));
  v.add(new PVector(2.233036, -1.600815, 1.703856));
  v.add(new PVector(2.014716, -1.600815, 1.703856));
  v.add(new PVector(2.014716, -1.500815, 1.703856));
  d = new Data("basewins-10.068_Cube.070", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.233035, -1.500815, 0.376876));
  v.add(new PVector(2.233035, -1.600815, 0.376876));
  v.add(new PVector(2.233036, -1.600815, 1.703856));
  v.add(new PVector(2.233036, -1.500815, 1.703856));
  d = new Data("basewins-10.069_Cube.071", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.233036, -0.345974, 1.703856));
  v.add(new PVector(2.233036, -0.445974, 1.703856));
  v.add(new PVector(2.014716, -0.445974, 1.703856));
  v.add(new PVector(2.014716, -0.345974, 1.703856));
  d = new Data("basewins-10.070_Cube.072", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.233036, -0.345974, 0.376876));
  v.add(new PVector(2.233036, -0.445974, 0.376876));
  v.add(new PVector(2.233036, -0.445974, 1.703856));
  v.add(new PVector(2.233036, -0.345974, 1.703856));
  d = new Data("basewins-10.071_Cube.073", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.977642, -1.500815, -2.233036));
  v.add(new PVector(2.977642, -1.600815, -2.233036));
  v.add(new PVector(2.977642, -1.600815, -2.014716));
  v.add(new PVector(2.977642, -1.500815, -2.014716));
  d = new Data("basewins-10.072_Cube.074", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.650661, -1.500815, -2.233035));
  v.add(new PVector(1.650661, -1.600815, -2.233035));
  v.add(new PVector(2.977642, -1.600815, -2.233036));
  v.add(new PVector(2.977642, -1.500815, -2.233036));
  d = new Data("basewins-10.073_Cube.075", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.977642, -0.345974, -2.233036));
  v.add(new PVector(2.977642, -0.445974, -2.233036));
  v.add(new PVector(2.977642, -0.445974, -2.014716));
  v.add(new PVector(2.977642, -0.345974, -2.014716));
  d = new Data("basewins-10.074_Cube.076", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.650661, -0.345974, -2.233036));
  v.add(new PVector(1.650661, -0.445974, -2.233036));
  v.add(new PVector(2.977642, -0.445974, -2.233036));
  v.add(new PVector(2.977642, -0.345974, -2.233036));
  d = new Data("basewins-10.075_Cube.077", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-4.230181, -1.500815, -1.645769));
  v.add(new PVector(-4.230181, -1.600815, -1.645769));
  v.add(new PVector(-4.011861, -1.600815, -1.645769));
  v.add(new PVector(-4.011861, -1.500815, -1.645769));
  d = new Data("basewins-10.076_Cube.078", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-4.23018, -1.500815, -0.318789));
  v.add(new PVector(-4.23018, -1.600815, -0.318789));
  v.add(new PVector(-4.230181, -1.600815, -1.645769));
  v.add(new PVector(-4.230181, -1.500815, -1.645769));
  d = new Data("basewins-10.077_Cube.079", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-4.230181, -0.345974, -1.645769));
  v.add(new PVector(-4.230181, -0.445974, -1.645769));
  v.add(new PVector(-4.011861, -0.445974, -1.645769));
  v.add(new PVector(-4.011861, -0.345974, -1.645769));
  d = new Data("basewins-10.078_Cube.080", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-4.23018, -0.345974, -0.318789));
  v.add(new PVector(-4.23018, -0.445974, -0.318789));
  v.add(new PVector(-4.230181, -0.445974, -1.645769));
  v.add(new PVector(-4.230181, -0.345974, -1.645769));
  d = new Data("basewins-10.079_Cube.081", 4, v);
  dd.add(d);

  win = new Win("basewins-10", dd);
  p.add(win);


  return p;
}

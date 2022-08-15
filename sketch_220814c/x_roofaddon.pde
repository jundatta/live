class Roofaddon {
  String id;
  ArrayList<Data> data;
  Roofaddon(String id, ArrayList<Data> data) {
    this.id = id;
    this.data = data;
  }
}

ArrayList<Roofaddon> getRoofaddonData() {
  ArrayList<Data> dd;
  ArrayList<PVector> v;
  Data d;
  Roofaddon roofaddon;

  ArrayList<Roofaddon> p = new ArrayList();

  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(-0.837501, -3.048156, 2.4239289999999998));
  v.add(new PVector(-0.907958, -3.048156, 2.4239289999999998));
  v.add(new PVector(-0.907958, -3.997427, 2.42393));
  v.add(new PVector(-0.837501, -3.997427, 2.42393));
  d = new Data("roofaddon-0_Plane.013", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.973855, -3.048156, 2.4239289999999998));
  v.add(new PVector(-1.044311, -3.048156, 2.4239289999999998));
  v.add(new PVector(-1.044311, -3.997427, 2.42393));
  v.add(new PVector(-0.973855, -3.997427, 2.42393));
  d = new Data("roofaddon-0.001_Plane.001", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.120384, -3.048156, 2.4239289999999998));
  v.add(new PVector(-1.19084, -3.048156, 2.4239289999999998));
  v.add(new PVector(-1.19084, -3.997427, 2.42393));
  v.add(new PVector(-1.120384, -3.997427, 2.42393));
  d = new Data("roofaddon-0.002_Plane.002", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.260808, -3.048156, 2.4239289999999998));
  v.add(new PVector(-1.331264, -3.048156, 2.4239289999999998));
  v.add(new PVector(-1.331264, -3.997427, 2.42393));
  v.add(new PVector(-1.260808, -3.997427, 2.42393));
  d = new Data("roofaddon-0.003_Plane.003", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.401232, -3.048156, 2.4239289999999998));
  v.add(new PVector(-1.471688, -3.048156, 2.4239289999999998));
  v.add(new PVector(-1.471688, -3.997427, 2.42393));
  v.add(new PVector(-1.401232, -3.997427, 2.42393));
  d = new Data("roofaddon-0.004_Plane.004", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.541655, -3.048156, 2.4239289999999998));
  v.add(new PVector(-1.612112, -3.048156, 2.4239289999999998));
  v.add(new PVector(-1.612112, -3.997427, 2.42393));
  v.add(new PVector(-1.541655, -3.997427, 2.42393));
  d = new Data("roofaddon-0.005_Plane.005", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.682079, -3.048156, 2.4239289999999998));
  v.add(new PVector(-1.752536, -3.048156, 2.4239289999999998));
  v.add(new PVector(-1.752536, -3.997427, 2.42393));
  v.add(new PVector(-1.682079, -3.997427, 2.42393));
  d = new Data("roofaddon-0.006_Plane.006", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.818433, -3.048156, 2.4239289999999998));
  v.add(new PVector(-1.888889, -3.048156, 2.4239289999999998));
  v.add(new PVector(-1.888889, -3.997427, 2.42393));
  v.add(new PVector(-1.818433, -3.997427, 2.42393));
  d = new Data("roofaddon-0.007_Plane.007", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.956821, -3.048156, 2.4239289999999998));
  v.add(new PVector(-2.027278, -3.048156, 2.4239289999999998));
  v.add(new PVector(-2.027278, -3.997427, 2.42393));
  v.add(new PVector(-1.956821, -3.997427, 2.42393));
  d = new Data("roofaddon-0.008_Plane.008", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.093174, -3.048156, 2.4239289999999998));
  v.add(new PVector(-2.163631, -3.048156, 2.4239289999999998));
  v.add(new PVector(-2.163631, -3.997427, 2.42393));
  v.add(new PVector(-2.093174, -3.997427, 2.42393));
  d = new Data("roofaddon-0.009_Plane.009", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.231563, -3.048156, 2.4239289999999998));
  v.add(new PVector(-2.30202, -3.048156, 2.4239289999999998));
  v.add(new PVector(-2.30202, -3.997427, 2.42393));
  v.add(new PVector(-2.231563, -3.997427, 2.42393));
  d = new Data("roofaddon-0.010_Plane.010", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.351636, -3.048156, 2.4239289999999998));
  v.add(new PVector(-2.422092, -3.048156, 2.4239289999999998));
  v.add(new PVector(-2.422092, -3.997427, 2.42393));
  v.add(new PVector(-2.351636, -3.997427, 2.42393));
  d = new Data("roofaddon-0.011_Plane.011", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.837501, -3.048156, -2.423928));
  v.add(new PVector(0.907958, -3.048156, -2.423928));
  v.add(new PVector(0.907958, -3.997428, -2.423928));
  v.add(new PVector(0.837501, -3.997428, -2.423928));
  d = new Data("roofaddon-0.012_Plane.012", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.973855, -3.048156, -2.423928));
  v.add(new PVector(1.044311, -3.048156, -2.423928));
  v.add(new PVector(1.044311, -3.997428, -2.423928));
  v.add(new PVector(0.973855, -3.997428, -2.423928));
  d = new Data("roofaddon-0.013_Plane.014", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.120384, -3.048156, -2.423928));
  v.add(new PVector(1.19084, -3.048156, -2.423928));
  v.add(new PVector(1.19084, -3.997428, -2.423928));
  v.add(new PVector(1.120384, -3.997428, -2.423928));
  d = new Data("roofaddon-0.014_Plane.015", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.260808, -3.048156, -2.423928));
  v.add(new PVector(1.331264, -3.048156, -2.423928));
  v.add(new PVector(1.331264, -3.997428, -2.423928));
  v.add(new PVector(1.260808, -3.997428, -2.423928));
  d = new Data("roofaddon-0.015_Plane.016", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.401231, -3.048156, -2.423928));
  v.add(new PVector(1.471688, -3.048156, -2.423928));
  v.add(new PVector(1.471688, -3.997428, -2.423928));
  v.add(new PVector(1.401231, -3.997428, -2.423928));
  d = new Data("roofaddon-0.016_Plane.017", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.541655, -3.048156, -2.423928));
  v.add(new PVector(1.612111, -3.048156, -2.423928));
  v.add(new PVector(1.612111, -3.997428, -2.423928));
  v.add(new PVector(1.541655, -3.997428, -2.423928));
  d = new Data("roofaddon-0.017_Plane.018", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.682079, -3.048156, -2.423928));
  v.add(new PVector(1.752535, -3.048156, -2.423928));
  v.add(new PVector(1.752535, -3.997428, -2.423928));
  v.add(new PVector(1.682079, -3.997428, -2.423928));
  d = new Data("roofaddon-0.018_Plane.019", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.818432, -3.048156, -2.423928));
  v.add(new PVector(1.888889, -3.048156, -2.423928));
  v.add(new PVector(1.888889, -3.997428, -2.423928));
  v.add(new PVector(1.818432, -3.997428, -2.423928));
  d = new Data("roofaddon-0.019_Plane.020", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.956821, -3.048156, -2.423928));
  v.add(new PVector(2.027277, -3.048156, -2.423928));
  v.add(new PVector(2.027277, -3.997428, -2.423928));
  v.add(new PVector(1.956821, -3.997428, -2.423928));
  d = new Data("roofaddon-0.020_Plane.021", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.093174, -3.048156, -2.423928));
  v.add(new PVector(2.16363, -3.048156, -2.423928));
  v.add(new PVector(2.16363, -3.997428, -2.423928));
  v.add(new PVector(2.093174, -3.997428, -2.423928));
  d = new Data("roofaddon-0.021_Plane.022", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.231563, -3.048156, -2.423928));
  v.add(new PVector(2.302019, -3.048156, -2.423928));
  v.add(new PVector(2.302019, -3.997428, -2.423928));
  v.add(new PVector(2.231563, -3.997428, -2.423928));
  d = new Data("roofaddon-0.022_Plane.023", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.351635, -3.048156, -2.423928));
  v.add(new PVector(2.422092, -3.048156, -2.423928));
  v.add(new PVector(2.422092, -3.997428, -2.423928));
  v.add(new PVector(2.351635, -3.997428, -2.423928));
  d = new Data("roofaddon-0.023_Plane.024", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.4239289999999998, -3.048156, -0.837501));
  v.add(new PVector(-2.4239289999999998, -3.048156, -0.907957));
  v.add(new PVector(-2.4239289999999998, -3.997428, -0.907956));
  v.add(new PVector(-2.4239289999999998, -3.997428, -0.8375));
  d = new Data("roofaddon-0.024_Plane.025", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.4239289999999998, -3.048156, -0.973854));
  v.add(new PVector(-2.4239289999999998, -3.048156, -1.044311));
  v.add(new PVector(-2.4239289999999998, -3.997428, -1.04431));
  v.add(new PVector(-2.4239289999999998, -3.997428, -0.973853));
  d = new Data("roofaddon-0.025_Plane.026", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.4239289999999998, -3.048156, -1.120384));
  v.add(new PVector(-2.4239289999999998, -3.048156, -1.19084));
  v.add(new PVector(-2.4239289999999998, -3.997428, -1.190839));
  v.add(new PVector(-2.4239289999999998, -3.997428, -1.120383));
  d = new Data("roofaddon-0.026_Plane.027", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.4239289999999998, -3.048156, -1.260807));
  v.add(new PVector(-2.4239289999999998, -3.048156, -1.331264));
  v.add(new PVector(-2.4239289999999998, -3.997428, -1.331263));
  v.add(new PVector(-2.4239289999999998, -3.997428, -1.260806));
  d = new Data("roofaddon-0.027_Plane.028", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.4239289999999998, -3.048156, -1.401231));
  v.add(new PVector(-2.4239289999999998, -3.048156, -1.471688));
  v.add(new PVector(-2.4239289999999998, -3.997428, -1.471687));
  v.add(new PVector(-2.4239289999999998, -3.997428, -1.40123));
  d = new Data("roofaddon-0.028_Plane.029", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.4239289999999998, -3.048156, -1.541654));
  v.add(new PVector(-2.4239289999999998, -3.048156, -1.61211));
  v.add(new PVector(-2.4239289999999998, -3.997428, -1.61211));
  v.add(new PVector(-2.4239289999999998, -3.997428, -1.541654));
  d = new Data("roofaddon-0.029_Plane.030", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.4239289999999998, -3.048156, -1.682078));
  v.add(new PVector(-2.4239289999999998, -3.048156, -1.752535));
  v.add(new PVector(-2.4239289999999998, -3.997428, -1.752534));
  v.add(new PVector(-2.4239289999999998, -3.997428, -1.682078));
  d = new Data("roofaddon-0.030_Plane.031", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.4239289999999998, -3.048156, -1.818431));
  v.add(new PVector(-2.4239289999999998, -3.048156, -1.888888));
  v.add(new PVector(-2.4239289999999998, -3.997428, -1.888888));
  v.add(new PVector(-2.4239289999999998, -3.997428, -1.818431));
  d = new Data("roofaddon-0.031_Plane.032", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.4239289999999998, -3.048156, -1.95682));
  v.add(new PVector(-2.4239289999999998, -3.048156, -2.027277));
  v.add(new PVector(-2.4239289999999998, -3.997428, -2.027276));
  v.add(new PVector(-2.4239289999999998, -3.997428, -1.95682));
  d = new Data("roofaddon-0.032_Plane.033", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.4239289999999998, -3.048156, -2.093174));
  v.add(new PVector(-2.4239289999999998, -3.048156, -2.16363));
  v.add(new PVector(-2.4239289999999998, -3.997428, -2.163629));
  v.add(new PVector(-2.4239289999999998, -3.997428, -2.093173));
  d = new Data("roofaddon-0.033_Plane.034", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.4239289999999998, -3.048156, -2.231563));
  v.add(new PVector(-2.4239289999999998, -3.048156, -2.302018));
  v.add(new PVector(-2.4239289999999998, -3.997428, -2.302018));
  v.add(new PVector(-2.4239289999999998, -3.997428, -2.231562));
  d = new Data("roofaddon-0.034_Plane.035", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.4239289999999998, -3.048156, -2.351635));
  v.add(new PVector(-2.4239289999999998, -3.048156, -2.422091));
  v.add(new PVector(-2.4239289999999998, -3.997428, -2.422091));
  v.add(new PVector(-2.4239289999999998, -3.997428, -2.351634));
  d = new Data("roofaddon-0.035_Plane.036", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.4239289999999998, -3.048156, 0.837501));
  v.add(new PVector(2.4239289999999998, -3.048156, 0.907958));
  v.add(new PVector(2.4239289999999998, -3.997428, 0.907959));
  v.add(new PVector(2.4239289999999998, -3.997428, 0.837502));
  d = new Data("roofaddon-0.036_Plane.037", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.4239289999999998, -3.048156, 0.973854));
  v.add(new PVector(2.4239289999999998, -3.048156, 1.044312));
  v.add(new PVector(2.4239289999999998, -3.997428, 1.044312));
  v.add(new PVector(2.4239289999999998, -3.997428, 0.973855));
  d = new Data("roofaddon-0.037_Plane.038", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.4239289999999998, -3.048156, 1.120384));
  v.add(new PVector(2.4239289999999998, -3.048156, 1.19084));
  v.add(new PVector(2.4239289999999998, -3.997428, 1.190841));
  v.add(new PVector(2.4239289999999998, -3.997428, 1.120385));
  d = new Data("roofaddon-0.038_Plane.039", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.4239289999999998, -3.048156, 1.260808));
  v.add(new PVector(2.4239289999999998, -3.048156, 1.331264));
  v.add(new PVector(2.4239289999999998, -3.997428, 1.331265));
  v.add(new PVector(2.4239289999999998, -3.997428, 1.260809));
  d = new Data("roofaddon-0.039_Plane.040", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.4239289999999998, -3.048156, 1.401232));
  v.add(new PVector(2.4239289999999998, -3.048156, 1.471689));
  v.add(new PVector(2.4239289999999998, -3.997428, 1.471689));
  v.add(new PVector(2.4239289999999998, -3.997428, 1.401232));
  d = new Data("roofaddon-0.040_Plane.041", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.4239289999999998, -3.048156, 1.541655));
  v.add(new PVector(2.4239289999999998, -3.048156, 1.612111));
  v.add(new PVector(2.4239289999999998, -3.997428, 1.612112));
  v.add(new PVector(2.4239289999999998, -3.997428, 1.541656));
  d = new Data("roofaddon-0.041_Plane.042", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.4239289999999998, -3.048156, 1.682079));
  v.add(new PVector(2.4239289999999998, -3.048156, 1.752535));
  v.add(new PVector(2.4239289999999998, -3.997428, 1.752536));
  v.add(new PVector(2.4239289999999998, -3.997428, 1.68208));
  d = new Data("roofaddon-0.042_Plane.043", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.4239289999999998, -3.048156, 1.818432));
  v.add(new PVector(2.4239289999999998, -3.048156, 1.888889));
  v.add(new PVector(2.4239289999999998, -3.997428, 1.88889));
  v.add(new PVector(2.4239289999999998, -3.997428, 1.818433));
  d = new Data("roofaddon-0.043_Plane.044", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.4239289999999998, -3.048156, 1.956821));
  v.add(new PVector(2.4239289999999998, -3.048156, 2.027277));
  v.add(new PVector(2.4239289999999998, -3.997428, 2.027278));
  v.add(new PVector(2.4239289999999998, -3.997428, 1.956822));
  d = new Data("roofaddon-0.044_Plane.045", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.4239289999999998, -3.048156, 2.093174));
  v.add(new PVector(2.4239289999999998, -3.048156, 2.16363));
  v.add(new PVector(2.4239289999999998, -3.997428, 2.163631));
  v.add(new PVector(2.4239289999999998, -3.997428, 2.093175));
  d = new Data("roofaddon-0.045_Plane.046", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.4239289999999998, -3.048156, 2.231564));
  v.add(new PVector(2.4239289999999998, -3.048156, 2.302019));
  v.add(new PVector(2.4239289999999998, -3.997427, 2.30202));
  v.add(new PVector(2.4239289999999998, -3.997427, 2.231564));
  d = new Data("roofaddon-0.046_Plane.047", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.4239289999999998, -3.048156, 2.351635));
  v.add(new PVector(2.4239289999999998, -3.048156, 2.422092));
  v.add(new PVector(2.4239289999999998, -3.997427, 2.422093));
  v.add(new PVector(2.4239289999999998, -3.997427, 2.351636));
  d = new Data("roofaddon-0.047_Plane.048", 2, v);
  dd.add(d);

  roofaddon = new Roofaddon("roofaddon-0", dd);
  p.add(roofaddon);


  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(0.837502, -2.685915, -2.423928));
  v.add(new PVector(0.907958, -2.685915, -2.423928));
  v.add(new PVector(0.907958, -3.414826, -2.423928));
  v.add(new PVector(0.837502, -3.414826, -2.423928));
  d = new Data("roofaddon-1_Plane.015", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(0.973855, -2.685915, -2.423928));
  v.add(new PVector(1.044312, -2.685915, -2.423928));
  v.add(new PVector(1.044312, -3.414826, -2.423928));
  v.add(new PVector(0.973855, -3.414826, -2.423928));
  d = new Data("roofaddon-1.001_Plane.001", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.120384, -2.685915, -2.423928));
  v.add(new PVector(1.190841, -2.685915, -2.423928));
  v.add(new PVector(1.190841, -3.414826, -2.423928));
  v.add(new PVector(1.120384, -3.414826, -2.423928));
  d = new Data("roofaddon-1.002_Plane.002", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.260808, -2.685915, -2.423928));
  v.add(new PVector(1.331265, -2.685915, -2.423928));
  v.add(new PVector(1.331265, -3.414826, -2.423928));
  v.add(new PVector(1.260808, -3.414826, -2.423928));
  d = new Data("roofaddon-1.003_Plane.003", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.401232, -2.685915, -2.423928));
  v.add(new PVector(1.471688, -2.685915, -2.423928));
  v.add(new PVector(1.471688, -3.414826, -2.423928));
  v.add(new PVector(1.401232, -3.414826, -2.423928));
  d = new Data("roofaddon-1.004_Plane.004", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.541656, -2.685915, -2.423928));
  v.add(new PVector(1.612112, -2.685915, -2.423928));
  v.add(new PVector(1.612112, -3.414826, -2.423928));
  v.add(new PVector(1.541656, -3.414826, -2.423928));
  d = new Data("roofaddon-1.005_Plane.005", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.682079, -2.685915, -2.423928));
  v.add(new PVector(1.752536, -2.685915, -2.423928));
  v.add(new PVector(1.752536, -3.414826, -2.423928));
  v.add(new PVector(1.682079, -3.414826, -2.423928));
  d = new Data("roofaddon-1.006_Plane.006", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.818433, -2.685915, -2.423928));
  v.add(new PVector(1.888889, -2.685915, -2.423928));
  v.add(new PVector(1.888889, -3.414826, -2.423928));
  v.add(new PVector(1.818433, -3.414826, -2.423928));
  d = new Data("roofaddon-1.007_Plane.007", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(1.956822, -2.685915, -2.423928));
  v.add(new PVector(2.027278, -2.685915, -2.423928));
  v.add(new PVector(2.027278, -3.414826, -2.423928));
  v.add(new PVector(1.956822, -3.414826, -2.423928));
  d = new Data("roofaddon-1.008_Plane.008", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.093175, -2.685915, -2.423928));
  v.add(new PVector(2.163631, -2.685915, -2.423928));
  v.add(new PVector(2.163631, -3.414826, -2.423928));
  v.add(new PVector(2.093175, -3.414826, -2.423928));
  d = new Data("roofaddon-1.009_Plane.009", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.231564, -2.685915, -2.423928));
  v.add(new PVector(2.30202, -2.685915, -2.423928));
  v.add(new PVector(2.30202, -3.414826, -2.423928));
  v.add(new PVector(2.231564, -3.414826, -2.423928));
  d = new Data("roofaddon-1.010_Plane.010", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.351636, -2.685915, -2.423928));
  v.add(new PVector(2.422093, -2.685915, -2.423928));
  v.add(new PVector(2.422093, -3.414826, -2.423928));
  v.add(new PVector(2.351636, -3.414826, -2.423928));
  d = new Data("roofaddon-1.011_Plane.011", 3, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.837501, -2.685915, 2.4239289999999998));
  v.add(new PVector(-0.907958, -2.685915, 2.4239289999999998));
  v.add(new PVector(-0.907958, -3.414825, 2.4239289999999998));
  v.add(new PVector(-0.837501, -3.414825, 2.4239289999999998));
  d = new Data("roofaddon-1.012_Plane.012", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-0.973855, -2.685915, 2.4239289999999998));
  v.add(new PVector(-1.044311, -2.685915, 2.4239289999999998));
  v.add(new PVector(-1.044311, -3.414825, 2.4239289999999998));
  v.add(new PVector(-0.973855, -3.414825, 2.4239289999999998));
  d = new Data("roofaddon-1.013_Plane.013", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.120384, -2.685915, 2.4239289999999998));
  v.add(new PVector(-1.19084, -2.685915, 2.4239289999999998));
  v.add(new PVector(-1.19084, -3.414825, 2.4239289999999998));
  v.add(new PVector(-1.120384, -3.414825, 2.4239289999999998));
  d = new Data("roofaddon-1.014_Plane.014", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.260808, -2.685915, 2.4239289999999998));
  v.add(new PVector(-1.331264, -2.685915, 2.4239289999999998));
  v.add(new PVector(-1.331264, -3.414825, 2.4239289999999998));
  v.add(new PVector(-1.260808, -3.414825, 2.4239289999999998));
  d = new Data("roofaddon-1.015_Plane.016", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.401232, -2.685915, 2.4239289999999998));
  v.add(new PVector(-1.471688, -2.685915, 2.4239289999999998));
  v.add(new PVector(-1.471688, -3.414825, 2.4239289999999998));
  v.add(new PVector(-1.401232, -3.414825, 2.4239289999999998));
  d = new Data("roofaddon-1.016_Plane.017", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.541655, -2.685915, 2.4239289999999998));
  v.add(new PVector(-1.612112, -2.685915, 2.4239289999999998));
  v.add(new PVector(-1.612112, -3.414825, 2.4239289999999998));
  v.add(new PVector(-1.541655, -3.414825, 2.4239289999999998));
  d = new Data("roofaddon-1.017_Plane.018", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.682079, -2.685915, 2.4239289999999998));
  v.add(new PVector(-1.752536, -2.685915, 2.4239289999999998));
  v.add(new PVector(-1.752536, -3.414825, 2.4239289999999998));
  v.add(new PVector(-1.682079, -3.414825, 2.4239289999999998));
  d = new Data("roofaddon-1.018_Plane.019", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.818433, -2.685915, 2.4239289999999998));
  v.add(new PVector(-1.888889, -2.685915, 2.4239289999999998));
  v.add(new PVector(-1.888889, -3.414825, 2.4239289999999998));
  v.add(new PVector(-1.818433, -3.414825, 2.4239289999999998));
  d = new Data("roofaddon-1.019_Plane.020", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-1.956821, -2.685915, 2.4239289999999998));
  v.add(new PVector(-2.027278, -2.685915, 2.4239289999999998));
  v.add(new PVector(-2.027278, -3.414825, 2.4239289999999998));
  v.add(new PVector(-1.956821, -3.414825, 2.4239289999999998));
  d = new Data("roofaddon-1.020_Plane.021", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.093174, -2.685915, 2.4239289999999998));
  v.add(new PVector(-2.163631, -2.685915, 2.4239289999999998));
  v.add(new PVector(-2.163631, -3.414825, 2.4239289999999998));
  v.add(new PVector(-2.093174, -3.414825, 2.4239289999999998));
  d = new Data("roofaddon-1.021_Plane.022", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.231563, -2.685915, 2.4239289999999998));
  v.add(new PVector(-2.30202, -2.685915, 2.4239289999999998));
  v.add(new PVector(-2.30202, -3.414825, 2.4239289999999998));
  v.add(new PVector(-2.231563, -3.414825, 2.4239289999999998));
  d = new Data("roofaddon-1.022_Plane.023", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.351636, -2.685915, 2.4239289999999998));
  v.add(new PVector(-2.422092, -2.685915, 2.4239289999999998));
  v.add(new PVector(-2.422092, -3.414825, 2.4239289999999998));
  v.add(new PVector(-2.351636, -3.414825, 2.4239289999999998));
  d = new Data("roofaddon-1.023_Plane.024", 1, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.4239289999999998, -2.685915, 0.837501));
  v.add(new PVector(2.4239289999999998, -2.685915, 0.907958));
  v.add(new PVector(2.4239289999999998, -3.414826, 0.907959));
  v.add(new PVector(2.4239289999999998, -3.414826, 0.837502));
  d = new Data("roofaddon-1.024_Plane.025", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.4239289999999998, -2.685915, 0.973855));
  v.add(new PVector(2.4239289999999998, -2.685915, 1.044312));
  v.add(new PVector(2.4239289999999998, -3.414826, 1.044312));
  v.add(new PVector(2.4239289999999998, -3.414826, 0.973856));
  d = new Data("roofaddon-1.025_Plane.026", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.4239289999999998, -2.685915, 1.120384));
  v.add(new PVector(2.4239289999999998, -2.685915, 1.19084));
  v.add(new PVector(2.4239289999999998, -3.414826, 1.190841));
  v.add(new PVector(2.4239289999999998, -3.414826, 1.120385));
  d = new Data("roofaddon-1.026_Plane.027", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.4239289999999998, -2.685915, 1.260808));
  v.add(new PVector(2.4239289999999998, -2.685915, 1.331264));
  v.add(new PVector(2.4239289999999998, -3.414826, 1.331265));
  v.add(new PVector(2.4239289999999998, -3.414826, 1.260809));
  d = new Data("roofaddon-1.027_Plane.028", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.4239289999999998, -2.685915, 1.401232));
  v.add(new PVector(2.4239289999999998, -2.685915, 1.471689));
  v.add(new PVector(2.4239289999999998, -3.414826, 1.471689));
  v.add(new PVector(2.4239289999999998, -3.414826, 1.401232));
  d = new Data("roofaddon-1.028_Plane.029", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.4239289999999998, -2.685915, 1.541655));
  v.add(new PVector(2.4239289999999998, -2.685915, 1.612113));
  v.add(new PVector(2.4239289999999998, -3.414826, 1.612113));
  v.add(new PVector(2.4239289999999998, -3.414826, 1.541656));
  d = new Data("roofaddon-1.029_Plane.030", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.4239289999999998, -2.685915, 1.682079));
  v.add(new PVector(2.4239289999999998, -2.685915, 1.752535));
  v.add(new PVector(2.4239289999999998, -3.414826, 1.752536));
  v.add(new PVector(2.4239289999999998, -3.414826, 1.68208));
  d = new Data("roofaddon-1.030_Plane.031", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.4239289999999998, -2.685915, 1.818432));
  v.add(new PVector(2.4239289999999998, -2.685915, 1.888889));
  v.add(new PVector(2.4239289999999998, -3.414826, 1.88889));
  v.add(new PVector(2.4239289999999998, -3.414826, 1.818433));
  d = new Data("roofaddon-1.031_Plane.032", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.4239289999999998, -2.685915, 1.956821));
  v.add(new PVector(2.4239289999999998, -2.685915, 2.027278));
  v.add(new PVector(2.4239289999999998, -3.414826, 2.027278));
  v.add(new PVector(2.4239289999999998, -3.414826, 1.956822));
  d = new Data("roofaddon-1.032_Plane.033", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.4239289999999998, -2.685915, 2.093174));
  v.add(new PVector(2.4239289999999998, -2.685915, 2.163631));
  v.add(new PVector(2.4239289999999998, -3.414826, 2.163631));
  v.add(new PVector(2.4239289999999998, -3.414826, 2.093174));
  d = new Data("roofaddon-1.033_Plane.034", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.4239289999999998, -2.685915, 2.231564));
  v.add(new PVector(2.4239289999999998, -2.685915, 2.302021));
  v.add(new PVector(2.4239289999999998, -3.414825, 2.302021));
  v.add(new PVector(2.4239289999999998, -3.414825, 2.231564));
  d = new Data("roofaddon-1.034_Plane.035", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.4239289999999998, -2.685915, 2.351636));
  v.add(new PVector(2.4239289999999998, -2.685915, 2.422092));
  v.add(new PVector(2.4239289999999998, -3.414825, 2.422092));
  v.add(new PVector(2.4239289999999998, -3.414825, 2.351636));
  d = new Data("roofaddon-1.035_Plane.036", 2, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.4239289999999998, -2.685915, -0.837501));
  v.add(new PVector(-2.4239289999999998, -2.685915, -0.907958));
  v.add(new PVector(-2.4239289999999998, -3.414826, -0.907957));
  v.add(new PVector(-2.4239289999999998, -3.414826, -0.8375));
  d = new Data("roofaddon-1.036_Plane.037", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.4239289999999998, -2.685915, -0.973855));
  v.add(new PVector(-2.4239289999999998, -2.685915, -1.044311));
  v.add(new PVector(-2.4239289999999998, -3.414826, -1.04431));
  v.add(new PVector(-2.4239289999999998, -3.414826, -0.973854));
  d = new Data("roofaddon-1.037_Plane.038", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.4239289999999998, -2.685915, -1.120384));
  v.add(new PVector(-2.4239289999999998, -2.685915, -1.19084));
  v.add(new PVector(-2.4239289999999998, -3.414826, -1.190839));
  v.add(new PVector(-2.4239289999999998, -3.414826, -1.120383));
  d = new Data("roofaddon-1.038_Plane.039", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.4239289999999998, -2.685915, -1.260808));
  v.add(new PVector(-2.4239289999999998, -2.685915, -1.331264));
  v.add(new PVector(-2.4239289999999998, -3.414826, -1.331263));
  v.add(new PVector(-2.4239289999999998, -3.414826, -1.260807));
  d = new Data("roofaddon-1.039_Plane.040", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.4239289999999998, -2.685915, -1.401232));
  v.add(new PVector(-2.4239289999999998, -2.685915, -1.471688));
  v.add(new PVector(-2.4239289999999998, -3.414826, -1.471687));
  v.add(new PVector(-2.4239289999999998, -3.414826, -1.401231));
  d = new Data("roofaddon-1.040_Plane.041", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.4239289999999998, -2.685915, -1.541654));
  v.add(new PVector(-2.4239289999999998, -2.685915, -1.612112));
  v.add(new PVector(-2.4239289999999998, -3.414826, -1.612111));
  v.add(new PVector(-2.4239289999999998, -3.414826, -1.541654));
  d = new Data("roofaddon-1.041_Plane.042", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.4239289999999998, -2.685915, -1.682078));
  v.add(new PVector(-2.4239289999999998, -2.685915, -1.752536));
  v.add(new PVector(-2.4239289999999998, -3.414826, -1.752535));
  v.add(new PVector(-2.4239289999999998, -3.414826, -1.682078));
  d = new Data("roofaddon-1.042_Plane.043", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.4239289999999998, -2.685915, -1.818433));
  v.add(new PVector(-2.4239289999999998, -2.685915, -1.888888));
  v.add(new PVector(-2.4239289999999998, -3.414826, -1.888888));
  v.add(new PVector(-2.4239289999999998, -3.414826, -1.818432));
  d = new Data("roofaddon-1.043_Plane.044", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.4239289999999998, -2.685915, -1.95682));
  v.add(new PVector(-2.4239289999999998, -2.685915, -2.027277));
  v.add(new PVector(-2.4239289999999998, -3.414826, -2.027277));
  v.add(new PVector(-2.4239289999999998, -3.414826, -1.95682));
  d = new Data("roofaddon-1.044_Plane.045", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.4239289999999998, -2.685915, -2.093174));
  v.add(new PVector(-2.4239289999999998, -2.685915, -2.16363));
  v.add(new PVector(-2.4239289999999998, -3.414826, -2.16363));
  v.add(new PVector(-2.4239289999999998, -3.414826, -2.093174));
  d = new Data("roofaddon-1.045_Plane.046", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.4239289999999998, -2.685915, -2.231563));
  v.add(new PVector(-2.4239289999999998, -2.685915, -2.30202));
  v.add(new PVector(-2.4239289999999998, -3.414826, -2.30202));
  v.add(new PVector(-2.4239289999999998, -3.414826, -2.231563));
  d = new Data("roofaddon-1.046_Plane.047", 4, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(-2.4239289999999998, -2.685915, -2.351635));
  v.add(new PVector(-2.4239289999999998, -2.685915, -2.422091));
  v.add(new PVector(-2.4239289999999998, -3.414826, -2.422091));
  v.add(new PVector(-2.4239289999999998, -3.414826, -2.351635));
  d = new Data("roofaddon-1.047_Plane.048", 4, v);
  dd.add(d);

  roofaddon = new Roofaddon("roofaddon-1", dd);
  p.add(roofaddon);


  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(2.649778, -3.325337, 2.649778));
  v.add(new PVector(-2.649778, -3.325337, 2.649778));
  v.add(new PVector(-2.649778, -3.325338, -2.649777));
  v.add(new PVector(2.649778, -3.325338, -2.649777));
  d = new Data("roofaddon-2_Plane", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.649778, -3.201894, 2.649778));
  v.add(new PVector(-2.649778, -3.201894, 2.649778));
  v.add(new PVector(-2.649778, -3.201895, -2.649777));
  v.add(new PVector(2.649778, -3.201895, -2.649777));
  d = new Data("roofaddon-2.001_Plane.001", 0, v);
  dd.add(d);

  roofaddon = new Roofaddon("roofaddon-2", dd);
  p.add(roofaddon);


  dd = new ArrayList();

  v = new ArrayList();
  v.add(new PVector(2.482485, -2.968596, 2.482486));
  v.add(new PVector(-2.482485, -2.968596, 2.482486));
  v.add(new PVector(-2.482485, -2.968597, -2.482485));
  v.add(new PVector(2.482485, -2.968597, -2.482485));
  d = new Data("roofaddon-3_Plane.008", 0, v);
  dd.add(d);

  v = new ArrayList();
  v.add(new PVector(2.482485, -2.852947, 2.482486));
  v.add(new PVector(-2.482485, -2.852947, 2.482486));
  v.add(new PVector(-2.482485, -2.852947, -2.482485));
  v.add(new PVector(2.482485, -2.852947, -2.482485));
  d = new Data("roofaddon-3.001_Plane.001", 0, v);
  dd.add(d);

  roofaddon = new Roofaddon("roofaddon-3", dd);
  p.add(roofaddon);


  return p;
}

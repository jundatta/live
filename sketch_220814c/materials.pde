ArrayList<ArrayList<Integer>> getMaterialsData() {
  ArrayList<ArrayList<Integer>> cc = new ArrayList();

  ArrayList<Integer> c = new ArrayList();

  //[255, 255, 255, 0],
  //  [255, 255, 255, 255],
  //  [255, 245, 233, 255],
  //  [211, 195, 174, 255],
  //  [248, 235, 216, 255],
  //  [211, 195, 174, 255]
  c.add(new Integer(color(255, 255, 255, 0)));
  c.add(new Integer(color(255, 255, 255, 255)));
  c.add(new Integer(color(255, 245, 233, 255)));
  c.add(new Integer(color(211, 195, 174, 255)));
  c.add(new Integer(color(248, 235, 216, 255)));
  c.add(new Integer(color(211, 195, 174, 255)));
  cc.add(c);

  c = new ArrayList();

  //[255, 255, 255, 0],
  //  [255, 255, 255, 255],
  //  [255, 255, 255, 255],
  //  [255, 255, 255, 255],
  //  [255, 255, 255, 255],
  //  [255, 255, 255, 255]
  c.add(new Integer(color(255, 255, 255, 0)));
  c.add(new Integer(color(255, 255, 255, 255)));
  c.add(new Integer(color(255, 255, 255, 255)));
  c.add(new Integer(color(255, 255, 255, 255)));
  c.add(new Integer(color(255, 255, 255, 255)));
  c.add(new Integer(color(255, 255, 255, 255)));
  cc.add(c);

  c = new ArrayList();

  //[234, 219, 200, 0],
  //  [234, 219, 200, 255],
  //  [234, 219, 200, 255],
  //  [234, 219, 200, 255],
  //  [234, 219, 200, 255],
  //  [234, 219, 200, 255]
  c.add(new Integer(color(234, 219, 200, 0)));
  c.add(new Integer(color(234, 219, 200, 255)));
  c.add(new Integer(color(234, 219, 200, 255)));
  c.add(new Integer(color(234, 219, 200, 255)));
  c.add(new Integer(color(234, 219, 200, 255)));
  c.add(new Integer(color(234, 219, 200, 255)));
  cc.add(c);

  c = new ArrayList();

  //[255, 255, 255, 0],
  //  [37, 73, 99, 255],
  //  [41, 82, 112, 255],
  //  [47, 93, 127, 255],
  //  [54, 107, 145, 255],
  //  [63, 126, 171, 255]
  c.add(new Integer(color(255, 255, 255, 0)));
  c.add(new Integer(color(37, 73, 99, 255)));
  c.add(new Integer(color(41, 82, 112, 255)));
  c.add(new Integer(color(47, 93, 127, 255)));
  c.add(new Integer(color(54, 107, 145, 255)));
  c.add(new Integer(color(63, 126, 171, 255)));
  cc.add(c);

  return cc;
}

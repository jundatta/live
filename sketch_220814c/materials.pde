ArrayList<IntList> getMaterialsData() {
  ArrayList<IntList> cc = new ArrayList();

  IntList c;

  c = new IntList();
  c.append(color(255, 255, 255, 0));
  c.append(color(255, 255, 255, 255));
  c.append(color(255, 245, 233, 255));
  c.append(color(211, 195, 174, 255));
  c.append(color(248, 235, 216, 255));
  c.append(color(211, 195, 174, 255));
  cc.add(c);

  c = new IntList();
  c.append(color(255, 255, 255, 0));
  c.append(color(255, 255, 255, 255));
  c.append(color(255, 255, 255, 255));
  c.append(color(255, 255, 255, 255));
  c.append(color(255, 255, 255, 255));
  c.append(color(255, 255, 255, 255));
  cc.add(c);

  c = new IntList();
  c.append(color(234, 219, 200, 0));
  c.append(color(234, 219, 200, 255));
  c.append(color(234, 219, 200, 255));
  c.append(color(234, 219, 200, 255));
  c.append(color(234, 219, 200, 255));
  c.append(color(234, 219, 200, 255));
  cc.add(c);

  c = new IntList();
  c.append(color(255, 255, 255, 0));
  c.append(color(37, 73, 99, 255));
  c.append(color(41, 82, 112, 255));
  c.append(color(47, 93, 127, 255));
  c.append(color(54, 107, 145, 255));
  c.append(color(63, 126, 171, 255));
  cc.add(c);

  return cc;
}

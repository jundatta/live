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
  Data data;
  Floor(String id, Next next, Data data) {
    this.id = id;
    this.next = next;
    this.data = data;
  }
}

ArrayList<Floor> getFloorData() {
  ArrayList<Floor> p = new ArrayList();

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

  Floor f = new Floor("floor-0", n, d);
  p.add(f);

  return [ {
  "id":
    "floor-0",
    "next":
    {
    "trees":
      ["trees-0", "trees-1", "trees-2", "trees-3", "trees-4", "trees-5", "empty", "empty", "empty", "empty"]
    }
    ,
    "data":
    [ {
    "name":
      "floor-0_Cube.018",
      "mat":
      0,
      "vertices":
      [
        [-5.992014, 0.013097, -5.030954],
        [5.992014, 0.013097, -5.030954],
        [5.992014, 0.013099, 5.030954],
        [-5.992014, 0.013099, 5.030954]
        ]
    }
    ]
  }
  ,
  {
  "id":
    "floor-1",
    "next":
    {
    "trees":
      ["trees-0", "trees-1", "trees-2", "trees-3", "trees-4", "trees-5", "empty", "empty", "empty", "empty"]
    }
    ,
    "data":
    [ {
    "name":
      "floor-1_Cube.019",
      "mat":
      0,
      "vertices":
      [
        [5.992014, 1.27413, -5.030954],
        [-5.992014, 0.101938, -5.030954],
        [-5.992014, 0.10194, 5.030954],
        [5.992014, 1.274132, 5.030954]
        ]
    }
    , {
    "name":
      "floor-1.001_Cube.001",
      "mat":
      0,
      "vertices":
      [
        [-5.992014, 0.013097, -5.030954],
        [5.992014, 0.013097, -5.030954],
        [5.992014, 0.013099, 5.030954],
        [-5.992014, 0.013099, 5.030954]
        ]
    }
    ]
  }
  ,
  {
  "id":
    "floor-2",
    "next":
    {
    "trees":
      ["trees-0", "trees-1", "trees-2", "trees-3", "trees-4", "trees-5", "empty", "empty", "empty", "empty"]
    }
    ,
    "data":
    [ {
    "name":
      "floor-2_Cube.022",
      "mat":
      0,
      "vertices":
      [
        [-5.992015, 1.274132, 5.030952],
        [5.992013, 0.10194, 5.030957],
        [5.992015, 0.101938, -5.030952],
        [-5.992013, 1.27413, -5.030957]
        ]
    }
    , {
    "name":
      "floor-2.001_Cube.001",
      "mat":
      0,
      "vertices":
      [
        [5.992013, 0.013099, 5.030957],
        [-5.992015, 0.013099, 5.030952],
        [-5.992013, 0.013097, -5.030957],
        [5.992015, 0.013097, -5.030952]
        ]
    }
    ]
  }
  ]
}

class Next {
  String[] trees;
}

class Data {
  String name;
  float mat;
  PVector[] vertices;
}

class Floor {
  String id;
  Next next;
  Data data;
}

function getFloorData() {
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

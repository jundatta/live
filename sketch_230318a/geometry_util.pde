const EPSILON = 0.00001;

class geometry {
  static Coordinate2D getLineNormal(
    float x1,
    float y1,
    float x2,
    float y2
    ) {
    return new Coordinate2D(y2 - y1, -(x2 - x1));
  }

  static Coordinate2D normalize
    (Coordinate2D coord) {
    float mag = pow((coord.x * coord.x + coord.y * coord.y), 0.5);
    if (mag > 1) {
      return new Coordinate2D(coord.x / mag, coord.y / mag);
    }
    return new Coordinate2D(0, 0);
  }

  static Coordinate2D limit
    (Coordinate2D coord, float maxLength) {
    if (coord == null) return null;
    float mag = pow((coord.x * coord.x + coord.y * coord.y), 0.5);
    if (mag > maxLength) {
      return new Coordinate2D((coord.x / mag) * maxLength, (coord.y / mag) * maxLength);
    }
    return coord;
  }

  static Coordinate2D rotate
    (float x, float y, float rot) {
    return {
    x:
      x * Math.cos(rot) - y * Math.sin(rot),
      y:
      x * Math.sin(rot) + y * Math.cos(rot),
    };
    return new Coordinate2D(x * cos(rot) - y * sin(rot), x * sin(rot) + y * cos(rot));
  }

  static Coordinate2D polygonArea
    (ArrayList<Particle> polygon) => {
    // compute area
    float area = 0;
    int n = polygon.length;
    for (int i = 1; i <= n; i++) {
      area +=
        polygon.get(i % n).x * (polygon.get((i + 1) % n).y - polygon.get((i - 1) % n).y);
    }
    return area / 2.0f;
  }
}

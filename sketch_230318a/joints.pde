class DistanceJoint {
  Particle pointA, pointB;
  float originalLen, len, strength;
  DistanceJoint(
    Particle pointA,
    Particle pointB,
    float len,
    float strength
    ) {
    this.pointA = pointA;
    this.pointB = pointB;
    this.originalLen = len;
    this.len = len;
    this.strength = strength;
  }

  //void update(dt = 1) {
  void update(float dt) {
    float diffx = this.pointB.x - this.pointA.x;
    float diffy = this.pointB.y - this.pointA.y;
    float mag = pow((diffx * diffx + diffy * diffy), 0.5);
    float diffMag = this.len - mag;
    if (mag > 0) {
      float dA =
        (((this.pointA.mass / (this.pointA.mass + this.pointB.mass)) *
        diffMag *
        this.strength) /
        mag) *
        -dt;
      float dB =
        (((this.pointB.mass / (this.pointA.mass + this.pointB.mass)) *
        diffMag *
        this.strength) /
        mag) *
        dt;
      this.pointA.move(diffx * dA, diffy * dA);
      this.pointB.move(diffx * dB, diffy * dB);
    }
  }
}

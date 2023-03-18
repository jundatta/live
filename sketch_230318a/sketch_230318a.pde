// オリジナルはこちらです。
// 【作者】Richard Bourneさん
// 【作品名】Squishy Squish Squish
// https://openprocessing.org/sketch/1847401

final float maxVertexCount = 500; // Increase to get more blobs. Not really a max but more of a guideline for the setup :)
final float substeps = 10; // How many physics steps per frame
final float maxRadius = 0.25; // relative to min canvas length [min(widht,length)]
final float minRadius = 0.1; // relative to min canvas length [min(widht,length)]
final float vertexDistance = 0.015; // How far apart are the vertices (relative to min canvas length) (smaller number == more cpu work)
final boolean outlineOnly = false; // draw only the outline, no fill
final boolean showCollisionAreas = false;

float mx;
float my;
class Blob {
  float area;
  float currentArea;
  float areaDiff;
  ChainableParticle rootParticle;
  ArrayList<ChainableParticle> particles;
  ArrayList<DistanceJoint> joints;
  float radius;
  color c;
  Blob(float area, float currentArea, float areaDiff,
    ChainableParticle rootParticle, ArrayList<ChainableParticle> particles,
    ArrayList<DistanceJoint> joints, float radius, color c) {
    this.area = area;
    this.currentArea = currentArea;
    this.areaDiff = areaDiff;
    this.rootParticle = rootParticle;
    this.particles = particles;
    this.joints = joints;
    this.radius = radius;
    this.c = c;
  }
}
ArrayList<Blob> blobs;
ArrayList<ChainableParticle> particles;
ArrayList<DistanceJoint> distanceJoints;
HashGrid hashGrid;
float effectiveVertexDistance;

float marginX = 20;
float marginY = 5;

void setup() {
  size(4*834/3, 934);
  colorMode(HSB, 360, 100, 100, 100);
  pixelDensity(1);
  frameRate(60);
  cursor(CROSS);

  effectiveVertexDistance = vertexDistance * min(width, height);

  mx = 0;
  my = 0;
  hashGrid = new HashGrid(width, height, floor(effectiveVertexDistance*2));
  particles = new ArrayList();
  distanceJoints = new ArrayList();
  blobs = new ArrayList();

  float minLength = min(width, height);
  float offsetY = 0;
  float totalArea = 0;
  float prevRadius = 0;
  float maxArea = (width - marginX * 2) * (height - marginY * 2) * 0.8;
  while (totalArea < maxArea && particles.size() < maxVertexCount) {
    float radiusLimit = (maxArea - totalArea) / (PI * 2);
    float radius = min(radiusLimit, (pow(random(1), 3) * (maxRadius-minRadius) + minRadius)*minLength);
    offsetY += prevRadius + radius + 50;
    var blob = generateBlob(width / 2+random(-1, 1)*(width/2-marginX-radius), height / 2 - offsetY, radius);
    totalArea += blob.area;
    blobs.add(blob);
    //particles.push(...blob.particles);
    for (var p : blob.particles) {
      particles.add(p);
    }
    //distanceJoints.push(...blob.joints);
    for (var dj : blob.joints) {
      distanceJoints.add(dj);
    }

    prevRadius = radius;
  }
}

void draw() {
  float mr = min(width, height)*0.1;
  mx = lerp(mx, mouseX, 1);
  my = lerp(my, mouseY, 1);

  float dt = 1 / 60.0f;
  float sdt = dt / substeps;

  // (i--) != 0は評価の順番的にあやしい（汗）
  for (int i=particles.size(); (i--) != 0; ) {
    var particle = particles.get(i);
    particle.updateClient();
  }

  for (float substep = substeps; (substep--) != 0; ) {
    for (int i=blobs.size(); (i--) != 0; ) {
      var blob = blobs.get(i);
      blob.currentArea = geometry.polygonArea(blob.particles);
      blob.areaDiff = (blob.area - blob.currentArea) / blob.area;
    }

    for (int i=particles.size(); (i--) != 0; ) {
      var particle = particles.get(i);
      particle.addForce(0, 1000 * sdt);
      var coord = new Coordinate2D(particle.vx, particle.vy);
      var v = geometry.limit(coord, effectiveVertexDistance / sdt *2);
      particle.vx = v.x;
      particle.vy = v.y;
      particle.update(sdt);
    }

    // ここもi--;を(i--) != 0;に変えても評価的にあってるか（汗）
    for (int i=particles.size(); (i--) != 0; ) {
      var v = particles.get(i);
      // Area constraint
      var v0 = v.prevSibling;
      var v1 = v.nextSibling;
      var lineNormal = geometry.getLineNormal(v0.x, v0.y, v1.x, v1.y);
      var dir = v.parent.areaDiff;
      v.move(lineNormal.x * dir, lineNormal.y * dir);
    }

    // ここも（汗）
    for (int i=distanceJoints.size(); (i--) != 0; ) {
      distanceJoints.get(i).update(1);
    }

    for (int i=particles.size(); (i--) != 0; ) {
      var particle = particles.get(i);
      HashSet<ChainableParticle> cps
        = hashGrid.query((int)particle.x, (int)particle.y, (int)particle.radius);
      //.forEach((other) => {
      for (var other : cps) {
        // ここの比較中身なのだとしたらどうするのかなぁ？
        if (
          other == particle ||
          other == particle.nextSibling ||
          other == particle.prevSibling
          )
          break;

        var force = particle.testCollision(
          other.x,
          other.y,
          other.radius
          );

        if (force != null) {
          particle.move(force.x * 0.5, force.y * 0.5);
          other.move(-force.x * 0.5, -force.y * 0.5);
        }
      }
    }

    // ここも（汗）
    for (int i=particles.size(); (i--) != 0; ) {
      var particle = particles.get(i);
      particle.collide(mx, my, mr);
      particle.constrain(
        marginX,
        -99999,
        width - marginX,
        height - marginY
        );
      particle.endUpdate(sdt);
    }
  }

  background(10);
  fill(20);
  noStroke();
  circle(mx, my, mr * 2 - 2);

  // ここも（汗）
  for (int i=blobs.size(); (i--) != 0; ) {
    var blob = blobs.get(i);
    var currentParticle = blob.rootParticle;

    if (outlineOnly) {
      stroke(blob.c);
      noFill();
      strokeWeight(1);
    } else {
      stroke(blob.c);
      strokeWeight(effectiveVertexDistance*2-6);
      fill(blob.c);
    }
    beginShape();
    do {
      curveVertex(currentParticle.x, currentParticle.y);
      currentParticle = currentParticle.nextSibling;
    } while (currentParticle != blob.rootParticle);

    curveVertex(currentParticle.x, currentParticle.y);
    currentParticle = currentParticle.nextSibling;
    curveVertex(currentParticle.x, currentParticle.y);
    currentParticle = currentParticle.nextSibling;
    curveVertex(currentParticle.x, currentParticle.y);
    endShape();

    if (showCollisionAreas) {
      strokeWeight(1);
      stroke(blob.c);
      noFill();
      currentParticle = blob.rootParticle;
      do {
        circle(currentParticle.x, currentParticle.y, currentParticle.radius*2);
        currentParticle = currentParticle.nextSibling;
      } while (currentParticle != blob.rootParticle);
    }
  }
}

Blob generateBlob(float offsetX, float offsetY, float radius) {
  int numPoints = floor((radius * PI * 2) / effectiveVertexDistance);
  ArrayList<ChainableParticle> vertices = new ArrayList();
  for (int i = 0; i < numPoints; i++) {
    float t = i / (float)numPoints;
    float angle = t * TWO_PI;
    float x = cos(angle) * radius + offsetX;
    float y = sin(angle) * radius + offsetY;
    float rad = effectiveVertexDistance;
    float damping = 1;
    float friction = 0.1f;
    float mass = 1;
    Blob parent = null;
    ChainableParticle particle = new ChainableParticle(x, y, rad, damping, friction, mass, parent);
    particle.setClient(hashGrid.createClient(particle));
    vertices.add(particle);
  }

  int len = vertices.size();
  for (int i = 0; i < len; i++) {
    var v = vertices.get(i);

    var vprev = vertices.get((i + len - 1) % len);
    var vnext = vertices.get((i + 1) % len);
    v.setPrevSibling(vprev);
    v.setNextSibling(vnext);
    if (i == 0) {
      v.setIsRoot(true);
    }
  }

  ArrayList<DistanceJoint> joints = new ArrayList();
  for (var v : vertices) {
    var v2 = v.nextSibling.nextSibling;
    var dj = new DistanceJoint(v, v.nextSibling, effectiveVertexDistance, 0.75);
    joints.add(dj);
    dj = new DistanceJoint(v, v2, effectiveVertexDistance * 2, 0.25);
    joints.add(dj);
  }
  // うぅう、わかりゃん＼(^_^)／コメントアウトする（汗）
  //joints.flat();

  float area = geometry.polygonArea(vertices) * random(0.6, 0.9);
  float currentArea = area;
  float areaDiff = 0;
  ChainableParticle rootParticle = vertices.get(0);
  ArrayList<ChainableParticle> particles = vertices;
  color c = color(random(360), 100, 100);
  Blob blob = new Blob(area, currentArea, areaDiff,
    rootParticle, particles, joints, radius, c);
  for (var particle : blob.particles) {
    particle.parent = blob;
  }
  return blob;
}

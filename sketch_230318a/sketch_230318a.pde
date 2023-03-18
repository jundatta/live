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
  Coordinate2D area;
  Coordinate2D currentArea;
  float areaDiff;
  Particle rootParticle;
  ArrayList<Particle> particles;
  ArrayList<Particle> vertices;
  ArrayList<DistanceJoint> joints;
  float radius;
  color c;
}
ArrayList<Blob> blobs;
ArrayList<Particle> particles;
ArrayList<DistanceJoint> distanceJoints;
HashGrid hashGrid;
float effectiveVertexDistance;

float marginX = 20;
float marginY = 5;

void setup() {
  createCanvas(4*834/3, 934);
  colorMode(HSB, 360, 100, 100, 100);
  pixelDensity(1);
  frameRate(60);
  cursor(CROSS);

  effectiveVertexDistance = vertexDistance * min(width, height);

  mx = 0;
  my = 0;
  hashGrid = new HashGrid(width, height, Math.floor(effectiveVertexDistance*2));
  particles = new ArrayList();
  distanceJoints = new ArrayList();
  blobs = new ArrayList();

  float minLength = min(width, height);
  float offsetY = 0;
  float totalArea = 0;
  float prevRadius = 0;
  float maxArea = (width - marginX * 2) * (height - marginY * 2) * 0.8;
  while (totalArea < maxArea && particles.length < maxVertexCount) {
    float radiusLimit = (maxArea - totalArea) / (PI * 2);
    float radius = min(radiusLimit, (random(1) ** 3 * (maxRadius-minRadius) + minRadius)*minLength);
    offsetY += prevRadius + radius + 50;
    const blob = generateBlob(width / 2+random(-1, 1)*(width/2-marginX-radius), height / 2 - offsetY, radius);
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

  for (int i=particles.length; i--; ) {
    var particle = particles.get(i);
    particle.updateClient();
  }

  for (float substep = substeps; (substep--) != 0; ) {
    for (int i=blobs.length; i--; ) {
      var blob = blobs.get(i);
      blob.currentArea = geometry.polygonArea(blob.particles);
      blob.areaDiff = (blob.area - blob.currentArea) / blob.area;
    }

    for (int i=particles.length; i--; ) {
      var particle = particles.get(i);
      particle.addForce(0, 1000 * sdt, 0);
      var coord = Coordinate2D(particle.vx, particle.vy);
      var v = geometry.limit(coord, effectiveVertexDistance / sdt *2);
      particle.vx = v.x;
      particle.vy = v.y;
      particle.update(sdt);
    }

    for (int i=particles.length; i--; ) {
      var v = particles.get(i);
      // Area constraint
      var v0 = v.prevSibling;
      var v1 = v.nextSibling;
      var lineNormal = geometry.getLineNormal(v0.x, v0.y, v1.x, v1.y);
      var dir = v.parent.areaDiff;
      v.move(lineNormal.x * dir, lineNormal.y * dir, 0);
    }

    for (int i=distanceJoints.length; i--; ) {
      distanceJoints.get(i).update(1);
    }

    for (int i=particles.length; i--; ) {
      var particle = particles.get(i);
      Set<ChainableParticle> cps = hashGrid.query(particle.x, particle.y, particle.radius);
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

    for (int i=particles.length; i--; ) {
      var particle = particles.get(i);
      particle.collide(mx, my, mr, 9999);
      particle.constrain(
        marginX,
        -99999,
        width - marginX,
        height - marginY,
        );
      particle.endUpdate(sdt);
    }
  }

  background(10);
  fill(20);
  noStroke();
  circle(mx, my, mr * 2 - 2);

  for (int i=blobs.length; i--; ) {
    var blob = blobs.get(i);
    var currentParticle = blob.rootParticle;

    if (outlineOnly) {
      stroke(blob.color);
      noFill();
      strokeWeight(1);
    } else {
      stroke(blob.color);
      strokeWeight(effectiveVertexDistance*2-6);
      fill(blob.color);
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
      stroke(blob.color);
      noFill();
      currentParticle = blob.rootParticle;
      do {
        circle(currentParticle.x, currentParticle.y, currentParticle.radius*2);
        currentParticle = currentParticle.nextSibling;
      } while (currentParticle != blob.rootParticle);
    }
  }
}

function generateBlob(offsetX, offsetY, radius) {
  const numPoints = Math.floor((radius * PI * 2) / effectiveVertexDistance);
  const vertices = new Array(numPoints).fill(0).map((_, i, {
    length
  }
  ) => {
    const t = i / length;
    const angle = t * TWO_PI;
    const particle = new ChainableParticle( {
    x:
      Math.cos(angle) * radius + offsetX,
      y:
      Math.sin(angle) * radius + offsetY,
      z:
      0,
      damping:
      1,
      friction:
      0.1,
      radius:
      effectiveVertexDistance,
      mass:
      1,
    }
    );
    particle.setClient(hashGrid.createClient(particle));
    return particle;
  }
  );

  vertices.forEach((v, i, {
    length
  }
  ) => {
    const vprev = vertices[(i + length - 1) % length];
    const vnext = vertices[(i + 1) % length];

    v.setPrevSibling(vprev);
    v.setNextSibling(vnext);

    if (i === 0) {
      v.setIsRoot(true);
    }
  }
  );

  const joints = vertices
    .map((v) => {
    const v2 = v.nextSibling.nextSibling;
    return [
      new DistanceJoint(
      v,
      v.nextSibling,
      effectiveVertexDistance,
      0.75
      ),
      new DistanceJoint(
      v,
      v2,
      effectiveVertexDistance * 2,
      0.25
      ),
    ];
  }
  )
  .flat();

  const area = geometry.polygonArea(vertices) * random(0.6, 0.9);
  const blob = {
    area,
  currentArea:
  area,
  areaDiff:
  0,
  rootParticle:
  vertices[0],
  particles:
  vertices,
    joints,
    radius,
  color:
  color(random(360), 100, 100),
};

blob.particles.forEach((particle) => {
  particle.parent = blob;
}
);

return blob;
}

// By Roni Kaufman
// https://ronikaufman.github.io
// https://twitter.com/KaufmanRoni

/*
Algorithm inspired by the one described by Matt DesLauriers in this talk: https://youtube.com/watch?v=tPqGn-4VdgA
 "1. use a large set of random 2D points
 2. select a cluster of points and outline it
 3. remove these points from the data set
 4. repeat from step 2 on remaining points"
 */


let clusters = [];
let hulls = [];

function setup() {
  createCanvas(1112, 834);
  let size = min(width, height)*.95;
  noStroke();
  fill(255);

  let points = [];
  for (let i = 0; i < 2000; i++) {
    points.push(createVector(width/2+random(-size/2, size/2), height/2+random(-size/2, size/2)));
  }

  clusters = divide(points);
  hulls = [convexHull(clusters[0]), convexHull(clusters[1])];
}

function draw() {
  if (frameCount%60 == 0) {
    mouseX = random(130, width - 130);
    mouseY = random(60, height - 60);
    mouseReleased();
  }
  background("#2560AC");
  for (let hull of hulls) {
    if (hull.length > 3) {
      beginShape();
      for (let p of hull) {
        vertex(p.x, p.y);
      }
      endShape(CLOSE);
    }
  }
}

function mouseReleased() {
  let p = createVector(mouseX, mouseY);
  fill(230, 230, random(230, 255));
  let argmin = -1;
  let minDist = width*height;

  for (let i = 0; i < clusters.length; i++) {
    for (let q of clusters[i]) {
      let d = distSquared(p, q);
      if (d < minDist) {
        argmin = i;
        minDist = d;
        continue;
      }
    }
  }

  if (hulls[argmin].length > 5) {
    let clu = clusters.splice(argmin, 1)[0];
    let newClusters = divide(clu);
    clusters = [...clusters, ...newClusters];
    hulls.splice(argmin, 1);
    hulls = [...hulls, convexHull(newClusters[0]), convexHull(newClusters[1])];
  }

  return false;
}

// divide points into two convex clusters
function divide(points) {
  let clusters = [];

  // initialize centroids randomly
  let centroids = [];
  for (let i = 0; i < 2; i++) {
    let c;
    do {
      c = random(points);
    } while (centroids.indexOf(c) != -1)
      centroids.push(c);
    clusters.push([]);
  }

  // assign clusters
  for (let p of points) {
    let argmin = 0;
    let minDist = distSquared(p, centroids[0]);
    for (let i = 1; i < 2; i++) {
      let d = distSquared(p, centroids[i]);
      if (d < minDist) {
        minDist = d;
        argmin = i;
      }
    }
    clusters[argmin].push(p);
  }

  return clusters;
}

function convexHull(points) {
  // adapted from https://en.wikipedia.org/wiki/Gift_wrapping_algorithm#Pseudocode
  points.sort((p, q) => p.x - q.x);
  let hull = [];
  let i = 0;
  let endPoint;
  let pointOnHull = points[0];
  do {
    hull.push(pointOnHull);
    endPoint = points[0];
    for (let j = 0; j < points.length; j++) {
      let p = p5.Vector.sub(endPoint, pointOnHull);
      let q = p5.Vector.sub(points[j], pointOnHull);
      if (endPoint.equals(pointOnHull) || (p.cross(q)).z < 0) {
        endPoint = points[j];
      }
    }
    i++;
    pointOnHull = endPoint;
  } while (!endPoint.equals(points[0]));
  return hull;
}

function distSquared(p, q) {
  return sq(p.x - q.x) + sq(p.y - q.y);
}

function keyPressed() {
  save("img_" + month() + '-' + day() + '_' + hour() + '-' + minute() + '-' + second() + ".jpg");
}

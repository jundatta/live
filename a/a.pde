//[Arrows on the numbers. Draw by openFrameworks – プログラミング de 落描き](https://junkiyoshi.com/openframeworks20220203/)

// [Processing フォントのアウトライン情報を取得して文字をいじってみた - 忘れないうちに](https://turtar-fms.hatenablog.com/entry/2018/12/10/214017)



int fontSize = 550;
PFont font;

void setup() {
  size(500, 500);
  frameRate(30);
  background(255);
  strokeWeight(4);

  font = createFont("arial", fontSize);
}

//void draw() {
//  background(255);
//  strokeWeight(4);

//  drawArrow(new PVector(50, 50), new PVector(150, 150), 50, color(0));
//  noLoop();
//}

void draw() {
  background(255);
  translate(width/2 + fontSize * -0.4, height/2 + fontSize * 0.4);

  var word = "0123456789".toCharArray();
  var index = (frameCount / 54) % word.length;

  var charaShape = font.getShape(word[index], 1);
  
  //auto vertices = outline[outline_index].getResampledBySpacing(38);
  for (var i = 0; i < charaShape.getVertexCount(); i++) {
    var param = frameCount % 5;
    if (i < charaShape.getVertexCount() - 1) {
      var gap = PVector.sub(charaShape.getVertex(i + 1), charaShape.getVertex(i));
      var location = PVector.add(charaShape.getVertex(i), PVector.mult(gap, map(param, 0, 5, 0, 1)));
      drawArrow(location, charaShape.getVertex(i + 1), 18, color(0));
    } else {
      var distance = PVector.dist(charaShape.getVertex(0), charaShape.getVertex(i));

      if (distance >= 18) {
        var gap = PVector.sub(charaShape.getVertex(0), charaShape.getVertex(i));
        var location = PVector.add(charaShape.getVertex(i), PVector.mult(gap, map(param, 0, 5, 0, 1)));
        drawArrow(location, charaShape.getVertex(0), 18, color(0));
      }
    }
  }
}

void drawArrow(PVector location, PVector target, float size, color stroke) {
  size *= 0.5;
  var angle = PVector.sub(target, location).heading();
  var vv = PVector.fromAngle(angle).mult(size * 0.5);

  var v1 = PVector.fromAngle(angle).mult(size * 2);
  var v2 = PVector.fromAngle(angle + HALF_PI).mult(size);
  var v3 = PVector.fromAngle(angle + HALF_PI).mult(size * 0.25);
  var v4 = PVector.fromAngle(angle + HALF_PI).mult(size * 0.25).sub(vv);
  var v5 = PVector.fromAngle(angle - HALF_PI).mult(size * 0.25).sub(vv);
  var v6 = PVector.fromAngle(angle - HALF_PI).mult(size * 0.25);
  var v7 = PVector.fromAngle(angle - HALF_PI).mult(size);

  push();
  translate(location.x, location.y);
  stroke(stroke);
  beginShape();
  ofVertex(v1);
  ofVertex(v2);
  ofVertex(v3);
  ofVertex(v4);
  ofVertex(v5);
  ofVertex(v6);
  ofVertex(v7);
  endShape(CLOSE);
  pop();
}

void ofVertex(PVector v) {
  vertex(v.x, v.y);
}
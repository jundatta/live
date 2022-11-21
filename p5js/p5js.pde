// こちらがオリジナルです。
// 【作者】Richard Bourneさん
// 【作品名】Ice Planet
// https://openprocessing.org/sketch/1417946

PShader theShader;

void preload() {
  theShader = loadShader("frag.glsl", "vert.glsl");
}
void setup() {
  preload();
  size(1112, 834, P3D);
  pixelDensity(1);
  noStroke();

  background(0);

  theShader = loadShader("frag.glsl", "vert.glsl");
  theShader.set("uResolution", (float)width, (float)height);
}

int uprisingSpeed=2;
int utime=0;

void draw() {
  shader(Shader);

  PGraphics canv = getGraphics();
  tex.beginDraw();
  tex.background(0);
  tex.image(canv, 0, -uprisingSpeed, width, height);
  tex.endDraw();

  // （自分自身にコピー。はうまくいかない？）
  // （beginDraw()をいれてもうまくいかにゃい）
  //coolingMap.image(coolingMap, 0, -uprisingSpeed, width, height);
  tmp.beginDraw();
  tmp.image(coolingMap, 0, -uprisingSpeed, width, height);
  tmp.endDraw();
  coolingMap.beginDraw();
  coolingMap.image(tmp, 0, 0);
  coolingMap.endDraw();

  coolingMap.beginDraw();
  coolingMap.loadPixels();
  if (uprisingSpeed>0) {
    for (int y=height-uprisingSpeed; y<height; y++) {
      for (int x=0; x<width; x++) {
        float n = noise(x/50.0f, (y+utime*uprisingSpeed)/50.0f);
        float val=pow(n, 3)*255;
        coolingMap.pixels[x+y*width] = color((int)val);
      }
    }
  } else if (uprisingSpeed<0) {
    for (int y=-uprisingSpeed-1; y>=0; y--) {
      for (int x=0; x<width; x++) {
        float n = noise(x/50.0f, (y+utime*uprisingSpeed)/50.0f);
        float val=pow(n, 3)*255;
        coolingMap.pixels[x+y*width] = color((int)val);
      }
    }
  }
  coolingMap.updatePixels();
  coolingMap.endDraw();

  Shader.set("tex", tex);
  Shader.set("coolingMap", coolingMap);
  rect(0, 0, width, height);
  if (uprisingSpeed!=0) {
    utime++;
  }
}
void keyPressed() {
  if (keyCode==UP&&uprisingSpeed<4) {
    utime*=uprisingSpeed==0?1:uprisingSpeed;
    uprisingSpeed+=1;
    utime/=uprisingSpeed==0?1:uprisingSpeed;
  }
  if (keyCode==DOWN&&uprisingSpeed>-4) {
    utime*=uprisingSpeed==0?1:uprisingSpeed;
    uprisingSpeed-=1;
    utime/=uprisingSpeed==0?1:uprisingSpeed;
  }
}

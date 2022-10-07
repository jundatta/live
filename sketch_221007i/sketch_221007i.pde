// こちらがオリジナルです。
// 【作者】jcponcemathさん
// 【作品名】Waves
// https://openprocessing.org/sketch/1236958

/*

 Original sketch in processing by @hisadan
 
 https://twitter.com/hisadan
 
 https://twitter.com/hisadan/status/1417869746138017794
 
 This version by Juan Carlos Ponce Campuzano
 22/Jul/2021
 #tinycode
 
 One line (262 characters):
 
 */
t=0;
z=0;
setup=_=> {
  createCanvas(w=500, w, WEBGL);
  camera(w, 0, 99, 0, 0, 0, 0, 0, -1);
  noFill()
};
draw=_=> {
  background(0);
  for (r=0; r<999; r+=2) {
    stroke(c=64*sin(t+r/9)+64, c+64, c+128, 50);
    circle(0, 0, r)
  }
  t-=0.1;
  push();
  translate(0, 0, 9*cos(z));
  fill("#204060");
  sphere(45);
  pop();
  z+=PI/30
}

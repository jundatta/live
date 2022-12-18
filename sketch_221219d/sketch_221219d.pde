// こちらがオリジナルです。
// 【作者】mathfoxLabさん
// 【作品名】117649ptsTorus
// https://openprocessing.org/sketch/1352693

// index attributeのみを使って点描画するテスト

let gl;
let _gl;

let pointBuf1;
let count = 0;

let myShader;
let vs =
  "precision mediump float;" +
  "attribute float aIndex;" + // unique attribute.
  "uniform float uPointSize;" +
  "uniform float uScale;" +
  "uniform float uCount;" +
  "const float TAU = 6.28318;" +
  "varying vec2 vIndex;" +
  "uniform mat4 uModelViewMatrix;" +
  "uniform mat4 uProjectionMatrix;" +
  // 入力は0～1でindexを網羅するように設定
  // 0～120のとき0で600～720のとき1ですね
  // 120～600のときはdelayの値がy*360でつまりy*360+120<uCount<y*360+240のときに(uCount-y*360-120)/120
  // 720～1200の場合は逆でy*360+720<uCount<y*360+840のときに(y*360+840-uCount)/120ですね。
  "float getRatio(float z){" +
  "  if(uCount < 120.0){ return 0.0; }" +
  "  if(uCount < 600.0){" +
  "    if(z * 360.0 + 120.0 < uCount && uCount < z * 360.0 + 240.0){" +
  "      return (uCount - z * 360.0 - 120.0) / 120.0;" +
  "    }else if(uCount < z * 360.0 + 121.0){ return 0.0; }else{ return 1.0; }" +
  "  }" +
  "  if(uCount < 720.0){ return 1.0; }" +
  "  if(z * 360.0 + 720.0 < uCount && uCount < z * 360.0 + 840.0){" +
  "    return (z * 360.0 + 840.0 - uCount) / 120.0;" +
  "  }else if(uCount < z * 360.0 + 721.0){ return 1.0; }" +
  "  return 0.0;" +
  "}" +
  "void main() {" +
  // 320x320個の点を配置
  "  float x = mod(aIndex, 343.0) / 343.0;" +
  "  float y = floor(aIndex / 343.0) / 343.0;" +
  "  vIndex = vec2(x, y);" +
  "  vec3 p0 = vec3(vec2(x, y) * 2.0 - 1.0, 0.0) * uScale;" +
  "  float theta = x * TAU;" +
  "  float phi = y * TAU;" +
  "  float r = 0.5 + 0.2 * cos(phi);" +
  "  vec3 p1 = vec3(r * cos(theta), r * sin(theta), 0.2 * sin(phi)) * uScale;" +
  // p0が平面でp1がトーラス
  // モーフィングの入りと出を微妙に変える
  "  float ratio = getRatio((uCount < 721.0 ? max(abs(x*2.0-1.0),abs(y*2.0-1.0)) : x));" +
  "  ratio = ratio * ratio * (3.0 - 2.0 * ratio);" +
  "  vec3 p = (1.0-ratio)*p0 + ratio*p1;" +
  "  vec3 rdm;" +
  "  rdm.x = cos(aIndex * 331.49) + 2.0 * sin(aIndex * 255.68);" +
  "  rdm.y = 2.0 * cos(aIndex * 161.49) + sin(aIndex * 354.38);" +
  "  rdm.z = cos(aIndex * 251.29) + sin(aIndex * 119.68);" +
  "  p += 0.5 * (1.0 - cos(TAU * ratio)) * uScale * rdm;" +
  "  vec4 positionVec4 =  vec4(p, 1.0);" +
  "  gl_Position = uProjectionMatrix * uModelViewMatrix * positionVec4;" +
  "  gl_PointSize = uPointSize;" +
  "}";

let fs =
  "precision mediump float;" +
  "uniform float uCount;" +
  "const float TAU = 6.28318;" +
  "varying vec2 vIndex;" +
  // getRGB(HSBtoRGB)
  "vec3 getRGB(float h, float s, float b){" +
  "    vec3 c = vec3(h, s, b);" +
  "    vec3 rgb = clamp(abs(mod(c.x * 6.0 + vec3(0.0, 4.0, 2.0), 6.0) - 3.0) - 1.0, 0.0, 1.0);" +
  "    rgb = rgb * rgb * (3.0 - 2.0 * rgb);" +
  "    return c.z * mix(vec3(1.0), rgb, c.y);" +
  "}" +
  // mask関連の余計な処理をカットしました。いいのか悪いのかは知らない・・
  "void main(){" +
  "  gl_FragColor = vec4(getRGB(fract(uCount/240.0), 0.5 + 0.5 * cos(TAU * vIndex.y), 1.0), 1.0);" +
  "}";

let indices = [];
const NUM = 117649;

let gr;

function setup() {
  _gl=createCanvas(windowWidth, windowHeight, WEBGL);
  gl = _gl.GL
    pixelDensity(1);
  myShader = createShader(vs, fs);
  _gl.pointSize = 2;
  //myShader.isPointShader = () => true;
  //_gl.userPointShader = myShader;
  //gl.drawArraysで描画してるのでここ要らないですね...

  pointBuf1 = gl.createBuffer(); // これがvboになる
  for (let i = 0; i < NUM; i++) {
    indices.push(i);
  }

  // 背景設定
  gl.enable(gl.DEPTH_TEST);
  gr = createGraphics(width, height);
  gr.fill(255);
  gr.textSize(min(width, height) * 0.025);
  gr.textAlign(LEFT, TOP);

  // bufferDataは1回でいい。ここで設定してしまう。
  gl.bindBuffer(gl.ARRAY_BUFFER, pointBuf1);
  gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(indices), gl.STATIC_DRAW);
  gl.bindBuffer(gl.ARRAY_BUFFER, null);
}

function draw() {
  let start = millis();

  // 背景関連
  resetShader();
  gl.disable(gl.DEPTH_TEST);
  texture(gr);
  plane(width, height);
  gl.enable(gl.DEPTH_TEST);

  // 点描画
  resetShader();
  shader(myShader);
  rotateX(TAU * count / 241);
  rotateY(TAU * count / 353);
  myShader.setUniform("uScale", min(width, height) * 0.5);
  myShader.setUniform("uCount", count % 1200);
  myDrawPoints();
  count++;

  // 描画速度をテキストで表示（次のフレームで速度レートが表示される）
  let end = millis();
  // 1/60秒を1としたときの描画所要時間
  const performanceRatio = (end-start)*60/1000;
  gr.background(0);
  const offset = min(width, height)*0.025;
  gr.text(performanceRatio.toFixed(3), offset, offset);
}

function myDrawPoints() {
  _gl._setPointUniforms(myShader);

  gl.bindBuffer(gl.ARRAY_BUFFER, pointBuf1);
  myShader.enableAttrib(myShader.attributes.aIndex, 1);

  gl.drawArrays(gl.POINTS, 0, NUM);

  myShader.unbindShader();
}

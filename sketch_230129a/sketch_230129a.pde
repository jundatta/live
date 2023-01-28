// こちらがオリジナルです。
// 【作者】中内　純(ハンドルネーム：JunKiyoshi)さん
// 【作品名】Jelly beans. Draw by openFrameworks
// https://junkiyoshi.com/openframeworks20230128/

//--------------------------------------------------------------
void setup() {
  size(720, 720);
  colorMode(HSB, 255, 255, 255);
  background(0, 0, 255);
}

//--------------------------------------------------------------
void draw() {
  translate(width * 0.5f, height * 0.5f);
  noStroke();

  int numberOfActor = 255;

  ofSeedRandom(39);
  for (int i = 0; i < numberOfActor; i++) {
    PVector noise_seed = new PVector(random(1000), random(1000));

    fill(0, 0, 255);
    for (int k = 0; k < 35; k++) {
      PVector location = new PVector(
        map(openFrameworks.ofNoise(noise_seed.x, k * 0.002 + ofGetFrameNum() * 0.001), 0, 1, -350, 350),
        map(openFrameworks.ofNoise(noise_seed.y, k * 0.002 + ofGetFrameNum() * 0.001), 0, 1, -350, 350));
      circle(location.x, location.y, 12 * 2);
    }

    fill(random(255), 100, 255);
    for (int k = 0; k < 35; k++) {
      PVector location = new PVector(
        map(openFrameworks.ofNoise(noise_seed.x, k * 0.002 + ofGetFrameNum() * 0.001), 0, 1, -350, 350),
        map(openFrameworks.ofNoise(noise_seed.y, k * 0.002 + ofGetFrameNum() * 0.001), 0, 1, -350, 350));
      circle(location.x, location.y, 8 * 2);
    }
  }
}

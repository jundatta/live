// "hey clara what are all these funcitons you're not using?"
//
// well
// funny story
//
// i usually write these in a webpacked environment
// and then copy them over to OpenProcessing.
// so i have a list of utils i just like to have on hand, in one file
// i don't use all of them in every project
// but sorting through which ones i use and which ones I don't is a pain
// so I just dump the whole file in here because i'm lazy

let isPaused = false;
let lapse = 0;
let frameStandard = 300;

const utils = {
  random_int:
function(a, b) {
  return Math.floor(random(a, b))
}
,

  standardCanvas:
function(override = false) {
  let smallerDimension = windowWidth < windowHeight ? windowWidth : windowHeight;
  smallerDimension -= 20; // for padding
  if (override) {
    smallerDimension = override;
  }

  return createCanvas(smallerDimension, smallerDimension);
}
,
  standardKeyPressed:
function() {

  if (frameStandard > 30) {
    frameStandard = floor(frameRate());
  }

  if (key === "s") {
    save()
  }
  if (key === "p") {
    frameRate(isPaused ? 30 : 0);
    isPaused = !isPaused;
    console.log(isPaused);
  }
}
,
  standardMouseReleasedFactory:
function(resetFunction) {
  return function() {
    if (millis() - lapse > 200) {
      clear();
      noiseSeed(random(1000));
      resetFunction();
      redraw();
    }
    lapse = millis();
    return false;
  }
}
,
  getMatrix:
function(matrixVariation) {
  return [ // a very slightly messed up identity matrix
    1 + random(-matrixVariation, matrixVariation),
    random(-matrixVariation, matrixVariation),
    random(-matrixVariation, matrixVariation),
    1 + random(-matrixVariation, matrixVariation),
    random(-matrixVariation, matrixVariation),
    random(-matrixVariation, matrixVariation)
  ];
}
,
  relSize:
function(pixelsIsh) {
  // this assumes square. my stuff is always square tho
  return width * (pixelsIsh / 1000);
}
};

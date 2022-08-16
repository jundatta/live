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

boolean isPaused = false;
int lapse = 0;
int frameStandard = 300;

PMatrix2D getMatrix(float matrixVariation) {
  return new PMatrix2D( // a very slightly messed up identity matrix
    1 + random(-matrixVariation, matrixVariation),
    random(-matrixVariation, matrixVariation),
    random(-matrixVariation, matrixVariation),
    1 + random(-matrixVariation, matrixVariation),
    random(-matrixVariation, matrixVariation),
    random(-matrixVariation, matrixVariation)
    );
}

float relSize(float pixelsIsh) {
  // this assumes square. my stuff is always square tho
  return width * (pixelsIsh / 1000.0f);
}

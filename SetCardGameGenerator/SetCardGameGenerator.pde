int shapeSize = 30;
int cardWidth = 160;
int cardHeight = (int)(cardWidth*12.0/24);
int gridSize = 50;
int rotShapeSize = (int) (shapeSize/sqrt(2));
int strkWeight = 5;
int transparentFactor = 90;

color RED = color(220,20,60);
color GREEN = color(0, 255, 0);
color PURPLE = color(138,43,226);

void setup() {
  size(860, 360);
  strokeCap(ROUND);
  rectMode(CENTER);
}

//for (int i = 0; i < 4; i++)  {
//  pushMatrix();
//  translate (i*4*gridSize + gridSize/2,50);
//  fill(255,255,255);
//  noStroke();
//  rect(gridSize*2,100,160,90,5);
//  strokeWeight(strkWeight);
//  stroke(PURPLE);
//  //fill(0,0,255);
//  fill(255);
//  pushMatrix();
//  translate(gridSize,100);
//  ellipse(0, 0, shapeSize, shapeSize);
//  popMatrix();
  
//  strokeWeight(strkWeight);
//  stroke(GREEN);
//  fill(GREEN);
//  pushMatrix();
//  translate(gridSize*2,100);
//  rect(0, 0, shapeSize, shapeSize);
//  popMatrix();
  
//  strokeWeight(strkWeight);
//  stroke(RED);
//  fill(RED);
//  pushMatrix();
//  translate(gridSize*3, 100);
//  rotate(PI/4.0);
//  rect(0, 0, rotShapeSize, rotShapeSize);
//  popMatrix();
//  popMatrix();
//}

void draw() {
  background(0);
  
  translate(gridSize*2,100);
  drawCardBackground();
  translate(-gridSize*2,0);
  
  translate(gridSize,0);
  drawSolidSquare(RED);
  translate(gridSize,0);
  drawHollowSquare(GREEN);  
  translate(gridSize,0);
  drawSemiSquare(PURPLE);   
  
  translate(gridSize*3,0);
  drawCardBackground();
  translate(-gridSize*1,0);
  
  drawSolidCircle(RED);
  translate(gridSize,0);
  drawHollowCircle(GREEN);  
  translate(gridSize,0);
  drawSemiCircle(PURPLE);     
  
  translate(gridSize*3,0);
  drawCardBackground();
  translate(-gridSize*1,0);
  
  drawSolidDiamond(RED);
  translate(gridSize,0);
  drawHollowDiamond(GREEN);  
  translate(gridSize,0);
  drawSemiDiamond(PURPLE);     
}

void drawCardBackground()  {
  noStroke();
  fill(255);
  pushMatrix();
  rect(0, 0, cardWidth, cardHeight,10);
  popMatrix();  
}

void drawSolidSquare(int colr)  {
  noStroke();
  fill(colr);
  pushMatrix();
  rect(0, 0, shapeSize, shapeSize);
  popMatrix();  
}

void drawHollowSquare(int colr)  {
  strokeWeight(strkWeight);
  stroke(colr);
  fill(255);
  pushMatrix();
  rect(0, 0, shapeSize, shapeSize);
  popMatrix();  
}

void drawSemiSquare(int colr)  {
  //strokeWeight(strkWeight);
  //stroke(colr,50);
  noStroke();
  fill(colr,transparentFactor);
  pushMatrix();
  rect(0, 0, shapeSize, shapeSize);
  popMatrix();  
}

void drawSolidCircle(int colr)  {
  noStroke();
  fill(colr);
  pushMatrix();
  ellipse(0, 0, shapeSize, shapeSize);
  popMatrix();  
}

void drawHollowCircle(int colr)  {
  strokeWeight(strkWeight);
  stroke(colr);
  fill(255);
  pushMatrix();
  ellipse(0, 0, shapeSize, shapeSize);
  popMatrix();  
}

void drawSemiCircle(int colr)  {
  //strokeWeight(strkWeight);
  //stroke(colr,50);
  noStroke();
  fill(colr,transparentFactor);
  pushMatrix();
  ellipse(0, 0, shapeSize, shapeSize);
  popMatrix();  
}

void drawSolidDiamond(int colr)  {
  noStroke();
  fill(colr);
  pushMatrix();
  rotate(PI/4.0);
  rect(0, 0, rotShapeSize, rotShapeSize);
  popMatrix();  
}

void drawHollowDiamond(int colr)  {
  strokeWeight(strkWeight);
  stroke(colr);
  fill(255);
  pushMatrix();
  rotate(PI/4.0);
  rect(0, 0, rotShapeSize, rotShapeSize);
  popMatrix();  
}

void drawSemiDiamond(int colr)  {
  //strokeWeight(strkWeight);
  //stroke(colr,50);
  noStroke();
  fill(colr,transparentFactor);
  pushMatrix();
  rotate(PI/4.0);
  rect(0, 0, rotShapeSize, rotShapeSize);
  popMatrix();  
}

//GIST
/*
read in file of hand
for each card (1-6):
  pushmatrix
  translate to the centroid of that card
  draw card rectangle
  based on number of shapes, either:
    stay in the cetner and draw one shape
    shift left and draw first of two then shift right and draw second of two
    draw middle, then shift left and draw first of three, then shift right and draw third of three

build functions to call to draw each shape with color / fill defined
  

*/
/*
card legend:
number = ["1","2","3"] # number of shapes
shape = ["S","D","C"]  # Square, Diamond, Circle
colors = ["R","G","P"] # Red, Green, Purple
fill = ["S","E","T"]   # Solid, Empty, Transparent
*/

int shapeSize = 30;
int cardWidth = 160;
int cardBorder = 20;
int numberCardsWide = 3;
int numberCardsHigh = 2;

int currentX = 0;
int currentY = 0;

int cardHeight = (int)(cardWidth*12.0/24);
int gridSize = 50;
int rotShapeSize = (int) (shapeSize/sqrt(2));
int strkWeight = 5;
int transparentFactor = 90;

color RED = color(220,20,60);
color GREEN = color(0, 255, 0);
color PURPLE = color(138,43,226);

int tempWidth = (numberCardsWide * cardWidth) + ((numberCardsWide + 1) * cardBorder);
int tempHeight = (numberCardsHigh * cardHeight) + ((numberCardsHigh + 1) * cardBorder);

void setup() {
  size(560, 220);
  //println(tempWidth);
  //println(tempHeight);
  strokeCap(ROUND);
  rectMode(CENTER);
  
  background(0);
  
  moveToZero();
  pushMatrix();
  moveToCardCenter(1);
  drawCardBackground();
  popMatrix();
 
  pushMatrix();
  moveToCardPos(1);
  printPosition("card position 1");
  drawSolidSquare(RED);
  printPosition("card position 1, solid red drawn");
  
  moveToCardPos(2);
  printPosition("card position 2");  
  drawHollowSquare(GREEN);
  printPosition("card position 2, hollow green drawn");
  moveToCardPos(3);
  printPosition("card position 3");
  drawSemiSquare(PURPLE);
  printPosition("card position 3, semi purpledrawn");
  popMatrix();
  
  
  moveToZero();
  pushMatrix();  
  moveToCardCenter(2);
  drawCardBackground();
  popMatrix();
  
  pushMatrix();
  moveToCardPos(4);
  drawSolidCircle(RED);
  moveToCardPos(5);
  drawHollowCircle(GREEN);
  popMatrix();
  
  moveToZero();
  pushMatrix();
  moveToCardCenter(3);
  drawCardBackground();
  popMatrix();
  
  pushMatrix();
  moveToCardPos(6);
  drawSolidDiamond(RED);
  popMatrix();  
}

void draw() {
  //background(0);
  
  //moveToZero();
  //printPosition();
  //moveToCardCenter(1);
  //printPosition();
  
  //drawCardBackground(); //<>//
  
  //moveToCardPos(1); //<>//
  //moveToCardCenter(1);
  
  //printPosition();
  
  //drawSolidSquare(RED);
  //printPosition();
  
  
  //moveToCardPos(2);
  //drawHollowSquare(GREEN);  
  //moveToCardPos(3);
  //drawSemiSquare(PURPLE);
  
  //moveToZero();
  //moveToCardCenter(2);
  //drawCardBackground();
  
  //moveToCardPos(4);
  //drawSolidCircle(RED);
  //moveToCardPos(5);
  //drawHollowCircle(GREEN);    
  
  //moveToZero();
  //moveToCardCenter(3);
  //drawCardBackground();
  
  //moveToCardPos(6);
  //drawSolidDiamond(RED);  
}
//

//-------------------------------------------------------------------------------------------------------
void printPosition(String input)  {  
  println(input);
  println(currentX);
  println(currentY);
  println();
}

void moveToCardCenter(int i)  {
  if (i < 4)  {
    currentX = (int)(i*cardBorder+(i - 1/2.0)*cardWidth);
    currentY = (int)(cardBorder+cardHeight/2.0);
    translate(currentX,currentY);
  }
  else  {
    currentX = (int)((i-3)*cardBorder+((i-3) - 1/2.0)*cardWidth);
    currentY = (int)(2*cardBorder+cardHeight*3/2.0);
    translate(currentX,currentY);
  }
}

void moveToZero()  {
  translate(-currentX,-currentY);
  currentX = 0;
  currentY = 0;
}

void moveToCardPos(int i)  {
  int deltaX = 0;
  int deltaY = 0;
  
  if (i==1)  {
    deltaX = -gridSize;
    deltaY = 0;
  }
  if (i==2) {
    deltaX = 0;
    deltaY = 0;
  }
  if (i==3)  {
    deltaX = gridSize;
    deltaY = 0;
  }
  if (i==4)  {
    deltaX = (int)(-gridSize/2.0);
    deltaY = gridSize;
  }
  if (i==5)  {
    deltaX = (int)(+gridSize/2.0);
    deltaY = 0;
  }
  if (i==6)  {
    deltaX = 0;
    deltaY = gridSize;
  }  
  
  currentX = currentX + deltaX;
  currentY = currentY + deltaY;
  translate(currentX,currentY);
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
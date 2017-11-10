size(860, 360);
background(0);
//noStroke();
strokeCap(ROUND);
rectMode(CENTER);

int shapeSize = 30;
int gridSize = 50;
int rotShapeSize = (int) (shapeSize/sqrt(2));
//int strkWeight = (int) (10/100*shapeSize);
int strkWeight = 5;
print(rotShapeSize);

color RED = color(220,20,60);
color GREEN = color(0, 255, 0);
color PURPLE = color(138,43,226);

for (int i = 0; i < 4; i++)  {
  pushMatrix();
  translate (i*4*gridSize + gridSize/2,50);
  strokeWeight(strkWeight);
  stroke(PURPLE);
  //fill(0,0,255);
  fill(0,0,0);
  pushMatrix();
  translate(gridSize,100);
  ellipse(0, 0, shapeSize, shapeSize);
  popMatrix();
  
  strokeWeight(strkWeight);
  stroke(GREEN);
  fill(GREEN);
  pushMatrix();
  translate(gridSize*2,100);
  rect(0, 0, shapeSize, shapeSize);
  popMatrix();
  
  strokeWeight(strkWeight);
  stroke(RED);
  fill(RED);
  pushMatrix();
  translate(gridSize*3, 100);
  rotate(PI/4.0);
  rect(0, 0, rotShapeSize, rotShapeSize);
  popMatrix();
  popMatrix();
}
/*
Mike Stebbins
last updated: 11-14-2017

Purpose is to read in a text file of inidividual hands from the card game SET,
build a picture of that hand, and then export an image file of that hand.
*/


//// Good settings for 2 rows, 3 columns
//int shapeSize = 14;
//int cardWidth = 60;
//int cardBorder = 4;
//int numberCardsWide = 3;
//int numberCardsHigh = 2;

//// Good settings for 1 rows, 2 columns
//int shapeSize = 14;
//int cardWidth = 60;
//int cardBorder = 4;
//int numberCardsWide = 2;
//int numberCardsHigh = 1;

// Good settings for 1 rows, 1 columns
int shapeSize = 14;
int cardWidth = 60;
int cardBorder = 4;
int numberCardsWide = 2;
int numberCardsHigh = 1;

int currentX = 0;
int currentY = 0;

int cardHeight = (int)(cardWidth*1.0/2);
int gridSize = 18;
int rotShapeSize = (int) (1.1*shapeSize/sqrt(2));
int strkWeight = 2;
int transparentFactor = 90;

color RED = color(220,20,60);
color GREEN = color(0, 255, 0);
color PURPLE = color(138,43,226);

int tempWidth = (numberCardsWide * cardWidth) + ((numberCardsWide + 1) * cardBorder);
int tempHeight = (numberCardsHigh * cardHeight) + ((numberCardsHigh + 1) * cardBorder);

String[] input;
int i = -1;
int numberOfHands = 0;

// ----------------------------------------------------------------------------------------------------------
// SETUP
// ----------------------------------------------------------------------------------------------------------

void setup() {
  //size(196, 72); // 3 cards wide by 2 cards high
  //size(132, 40);   // 2 cards wide by 1 card high
  size(68, 40);    // 1 cards wide by 1 card high

  //println(tempWidth);
  //println(tempHeight);
  strokeCap(ROUND);
  rectMode(CENTER);
  background(0);
  frameRate(30);
  input = loadStrings("inputfile_TEST.txt");
  numberOfHands = input.length;
  smooth(3);
}

// ----------------------------------------------------------------------------------------------------------
// DRAW
// ----------------------------------------------------------------------------------------------------------
void draw() {
  //buildCard("1,1,S,R,S");
  //buildCard("2,3,D,G,E");
  //buildCard("3,3,D,P,T");
  //buildCard("4,1,S,P,T");
  //buildCard("5,2,D,R,E");
  //buildCard("6,3,C,G,S");
  
    if (i < (numberOfHands-1))  {
      i++;
      }
    else {
      noLoop();
      } 
  
    String tempHand = input[i];
    String[] tempHandArray = split(tempHand,'/');
    
    for (int j = 0; j < tempHandArray.length-1; j++)  {
        buildCard(tempHandArray[j]);
    }
    
    int tempIndex = (tempHandArray.length)-1;
    int numberOfSets = int(tempHandArray[tempIndex]);
    
    //println(numberOfSets);  
    println(i); 
    
    if (numberOfSets > 0)  {
          saveFrame("HAS_SET-######.PNG");
    }
    else  {
          saveFrame("NO_SET-######.PNG");
    }
    //println(frameRate); //<>// //<>//
}

// ----------------------------------------------------------------------------------------------------------
// FUNCTIONS
// ----------------------------------------------------------------------------------------------------------
void buildCard(String cardData)  {
  String[] list = split(cardData, ',');
  // 0: card number
  // 1: number = ["1","2","3"] # number of shapes
  // 2: shape = ["S","D","C"]  # Square, Diamond, Circle
  // 3: colors = ["R","G","P"] # Red, Green, Purple
  // 4: fill = ["S","E","T"]   # Solid, Empty, Transparent
  // 5: sets = ["0" - "9"]     # number of sets in this hand
  
  int temp0 = int(trim(list[0]));
  int temp1 = int(trim(list[1]));
 
  if (list[3].equals("R"))  {
    setFillColor(trim(list[4]),RED);  
  }
  if (list[3].equals("G"))  {
    setFillColor(trim(list[4]),GREEN);
  }
  if (list[3].equals("P"))  {
    setFillColor(trim(list[4]),PURPLE);
  }
    
  pushMatrix();
  moveToCardCenter(temp0);
  drawCardBackground();
  pushMatrix();
  
  if (list[3].equals("R"))  {
    setFillColor(list[4],RED);  
  }
  if (list[3].equals("G"))  {
    setFillColor(list[4],GREEN);
  }
  if (list[3].equals("P"))  {
    setFillColor(list[4],PURPLE);
  }  
   
  if (temp1 == 3)  {
    moveToSymPos(1);
    if (list[2].equals("S"))  {
      drawSquare();
      moveToSymPos(2);
      drawSquare();
      moveToSymPos(3);
      drawSquare();
    }
    if (list[2].equals("D"))  {
      drawDiamond();
      moveToSymPos(2);
      drawDiamond();
      moveToSymPos(3);
      drawDiamond();
    }
    if (list[2].equals("C"))  {
      drawCircle();
      moveToSymPos(2);
      drawCircle();
      moveToSymPos(3);
      drawCircle();
    }
    popMatrix();
    popMatrix();
  } 
  
  if (temp1 == 2)  {
    moveToSymPos(4);
    if (list[2].equals("S"))  {
      drawSquare();
      moveToSymPos(5);
      drawSquare();
    }
    if (list[2].equals("D"))  {
      drawDiamond();
      moveToSymPos(5);
      drawDiamond();
    }
    if (list[2].equals("C"))  {
      drawCircle();
      moveToSymPos(5);
      drawCircle();
    }
    popMatrix();
    popMatrix();
  }

  if (temp1 == 1)  {
    moveToSymPos(6);
    if (list[2].equals("S"))  {
      drawSquare();
    }
    if (list[2].equals("D"))  {
      drawDiamond();
    }
    if (list[2].equals("C"))  {
      drawCircle();
    }
    popMatrix();
    popMatrix();
  }
}  

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

void moveToSymPos(int i)  {
  //   if 3 symbols on card: 1 / 2 / 3
  //   if 2 symbols on card:   4 / 5
  //   if 1 symbol on card:      6
    
  int deltaX = 0;
  int deltaY = 0;
  
  if (i==1)  {
    deltaX = -gridSize;
    deltaY = 0;
  }
  if (i==2) {
    deltaX = gridSize;
    deltaY = 0;
  }
  if (i==3)  {
    deltaX = gridSize;
    deltaY = 0;
  }
  if (i==4)  {
    deltaX = (int)(-gridSize/2.0);
    deltaY = 0;
  }
  if (i==5)  {
    deltaX = gridSize;
    deltaY = 0;
  }
  if (i==6)  {
    deltaX = 0;
    deltaY = 0;
  }  
  translate(deltaX,deltaY);
}

void drawCardBackground()  {
  noStroke();
  fill(255);
  pushMatrix();
  rect(0, 0, cardWidth, cardHeight,10);
  popMatrix();  
}

void setFillColor (String fill, color colr)  {
  if (fill.equals("S"))  {  // Solid fill
    noStroke();
    fill(colr);
  }
  
  if (fill.equals("E"))  {  // Empty fill
    strokeWeight(strkWeight);
    stroke(colr);
    fill(255);
  }
  
  if (fill.equals("T"))  {  // Transparent, or "Semi" fill
    noStroke();
    fill(colr,transparentFactor);
  }
}

void drawSquare()  {
  pushMatrix();
  rect(0, 0, shapeSize, shapeSize);
  popMatrix();  
}

void drawCircle()  {
  pushMatrix();
  ellipse(0, 0, shapeSize, shapeSize);
  popMatrix();  
}

void drawDiamond()  {
  pushMatrix();
  rotate(PI/4.0);
  rect(0, 0, rotShapeSize, rotShapeSize);
  popMatrix();  
}
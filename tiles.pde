int cols = 541;
int rows = 541;
int cellSize = 30;
int offset = 2;
int[][] screen = new int[cols][rows];
int playerPosX = 481;
int playerPosY = 271;
int gridMax = 511;
color baseTile = color(189,189,189);
color lines = color(123,123,123);

void setup(){
  background(lines);
// Initialize 2D array values

for (int i = 1; i < cols; i++) {
  for (int j = 1; j < rows; j++) {
    screen[i][j] = baseTile;

  }
}


// Draw points
for (int i = 1; i < cols; i += cellSize) {
  for (int j = 1; j < rows; j += cellSize) {
    //println("i: " + i + " j: " + j);
    stroke(screen[i][j]);
    fill(screen[i][j]);
    rect(i,j,cellSize - offset,cellSize - offset);
  }
}


size(541,541);

}

void draw(){
   setup();
   drawPlayer();
}

void keyPressed(){
  if (key=='r'){
    setup();
  }else if (key=='w'){
    if(playerPosY - cellSize < 0){
    println("ERROR - COLLIDING WITH TOP_WALL");
    }else{
      playerPosY -= cellSize;
    }
  }else if (key=='a'){
    if(playerPosX - cellSize < 0){
    println("ERROR - COLLIDING WITH L_WALL");
    }else{
      playerPosX -= cellSize;
    }
  }else if (key=='s'){
    if(playerPosY + cellSize > 511){
    println("ERROR - COLLIDING WITH BOT_WALL");
    }else{
      playerPosY += cellSize;
    }
  }else if (key=='d'){
    if(playerPosX + cellSize > 511){
    println("ERROR - COLLIDING WITH R_WALL");
    }else{
      playerPosX += cellSize;
    }
  }
}

void drawPlayer(){
  stroke(255);
  fill(255);
  rect(playerPosX,playerPosY,cellSize - offset,cellSize - offset);
}

void setPlayerPos(int X, int Y){
  if(X > gridMax || Y > gridMax){
    println("ERROR - PLAYER POS OUTSIDE BOUNDS");
  }else{
    for(int count=0; count < gridMax; count += cellSize){
      
    }
  }
}
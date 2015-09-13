class grid {
  int cols = 541;
  int rows = 541;
  int cellSize = 30;
  int offset = 2;
  int[][] screen = new int[cols][rows];
  int playerPosX = 0;
  int playerPosY = 0;
  int gridMax = 511;
  color baseTile = color(45,45,189);
  color lines = color(123,123,123);
  color selectCol = color(255,255,255);
  char moveUp = 'w';
  char moveLeft = 'a';
  char moveDown = 's';
  char moveRight = 'd';
  
  void update(){
    background(lines);

    for (int i = 1; i < cols; i += cellSize) {
      for (int j = 1; j < rows; j += cellSize) {
        stroke(baseTile);
        fill(baseTile);
        rect(i,j,cellSize - offset,cellSize - offset);
      }
    }
  
    setPlayerPosX(mouseX);
    setPlayerPosY(mouseY);
    drawPlayer();  
  }
  
  void move(char in){
    if (key=='r'){
      setup();
    }else if (in==moveUp){
      if(playerPosY - cellSize < 0){
      println("ERROR - COLLIDING WITH TOP_WALL");
      }else{
        playerPosY -= cellSize;
      }
    }else if (in==moveLeft){
      if(playerPosX - cellSize < 0){
      println("ERROR - COLLIDING WITH L_WALL");
      }else{
        playerPosX -= cellSize;
      }
    }else if (in==moveDown){
      if(playerPosY + cellSize > 511){
      println("ERROR - COLLIDING WITH BOT_WALL");
      }else{
        playerPosY += cellSize;
      }
    }else if (in==moveRight){
      if(playerPosX + cellSize > 511){
      println("ERROR - COLLIDING WITH R_WALL");
      }else{
        playerPosX += cellSize;
      }
    }
  }
  
  void drawPlayer(){
    stroke(selectCol);
    fill(selectCol);
    rect(playerPosX,playerPosY,cellSize,cellSize);
  }
  
  void setPlayerPosX(int X){
    if(X > gridMax+cellSize){
      println("ERROR - PLAYER POS OUTSIDE BOUNDS");
    }else{
      for(int count=0; count < gridMax+cellSize; count += cellSize){
        if(X < count){
          playerPosX = count - cellSize;
          break;
        }      
      }
    }
  }
  
  void setPlayerPosY(int Y){
    if(Y > gridMax+cellSize){
      println("ERROR - PLAYER POS OUTSIDE BOUNDS");
    }else{
      for(int count=0; count < gridMax+cellSize; count += cellSize){
        if(Y < count){
          playerPosY = count - cellSize;
          break;
        }      
      }
    }
  }

}
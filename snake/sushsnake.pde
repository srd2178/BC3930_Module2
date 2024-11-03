import processing.serial.*;

Serial myPort;  
String val; 

int[] colors = {
  color(0, 255, 0), // Green
  color(0, 0, 255), // Blue
  color(128, 0, 128), // Purple
  color(255, 192, 203), // Pink
  color(255, 165, 0), // Orange
  color(0, 0, 0) // Black
};

int currentColorIndex = 0;

PVector playButtonPos = new PVector(125, 150);
PVector exitButtonPos = new PVector(125, 250);  
int buttonWidth = 150;
int buttonHeight = 50;
boolean isPlayPressed = false;
boolean isExitPressed = false;

PVector easyButtonPos = new PVector(125, 150);
PVector hardButtonPos = new PVector(125, 250);  
boolean isEasyPressed = false;
boolean isHardPressed = false;

boolean isPlayAgainPressed = false;
boolean isMainMenuPressed = false;

boolean buttonPressed = false;
PVector snake;
ArrayList<PVector> chain = new ArrayList<PVector>();
int thcknss = 20;


int wid, hei;

PVector mvmnt = new PVector(0, 0);
int speed = 12;
int lngth = 1;

boolean isColorSelected = false;
PVector apple;

int MENUSCREEN = 0;
int MODESCREEN = 1;
int GAMESCREEN = 2;
int GAMEOVER = 3;
int screenState = 0;
int difficulty = 0;

int canvasSize = 500;
int analogMax = 4095;
int button;

void setup() {
  size(400, 400);
  background(255, 255, 204);
  
  wid = width/thcknss;
  hei = height/thcknss;
  snake = new PVector(wid/2, hei/2);
  
  stroke(0);
  strokeWeight(3);
  printArray(Serial.list());
  String portName = Serial.list()[4]; // Adjust index if needed
  myPort = new Serial(this, portName, 9600);
}

void draw(){
  background(255, 255, 204);
  
if (screenState == MENUSCREEN) {
    drawMenu();
  } else if (screenState == MODESCREEN) {
    drawDifficulty();
  } else if (screenState == GAMESCREEN) {
    drawGame();
  } else if (screenState == GAMEOVER) {
    gameOver();
  } else { println("Something went wrong!");
  }  
 //keyPressed();
  readJoystick();
  
}

void drawGame() {
  background(255, 255, 204);
  drawTail();
  drawApple();
  
  fill(0);  
  textSize(20);
  textAlign(LEFT, TOP);
  text("Score: " + (lngth - 1), 10, 10);
 
 if(frameCount % speed == 0 && speed > 0) {
   if(mvmnt.x != 0 || mvmnt.y!= 0) {
   chain.add(new PVector(snake.x, snake.y));
   }
   while(chain.size() > lngth) {
     chain.remove(0);
   }
   snake.add(mvmnt); 
   
   if(snake.x == apple.x && snake.y == apple.y){
     newApple();
     lngth += 1;
     speed = max(5, speed - 1);
   }
   
   deaths(chain);
   
   if(snake.x < 0) {snake.x = wid - 1;}
   if(snake.x > wid) {snake.x = 0;}
   if(snake.y < 0) {snake.y = hei - 1;}
   if(snake.y > hei) {snake.y = 0;}
 }  
}

void deaths(ArrayList<PVector> chain) {
  for(int i = 0; i < chain.size(); i++) {
     if(snake.x == chain.get(i).x && snake.y == chain.get(i).y) {
       screenState = GAMEOVER;
       gameOver();
     }
   }
   if(difficulty == 1) {
     if(snake.x < 0 || snake.x > wid || snake.y < 0 || snake.y > hei) {
       screenState = GAMEOVER;
       gameOver();
   }
  
  }
}


void drawMenu() {
  background(176, 248, 255);

  // Title Text
  textSize(32);
  fill(0);
  textAlign(CENTER);
  text("Snake Game", width / 2, 80);

  // Play Button
  if (mouseX >= playButtonPos.x && mouseX <= playButtonPos.x + buttonWidth &&
      mouseY >= playButtonPos.y && mouseY <= playButtonPos.y + buttonHeight) {
    fill(100);
    if (mousePressed) {
      isPlayPressed = true;  
    }
  } else {
    fill(200);
  }
  
  rect(playButtonPos.x, playButtonPos.y, buttonWidth, buttonHeight);
  fill(0);
  textSize(20);
  text("Play", playButtonPos.x + buttonWidth / 2, playButtonPos.y + buttonHeight / 1.5);

  // Exit Button
  if (mouseX >= exitButtonPos.x && mouseX <= exitButtonPos.x + buttonWidth &&
      mouseY >= exitButtonPos.y && mouseY <= exitButtonPos.y + buttonHeight) {
    fill(100);
    if (mousePressed) {
      isExitPressed = true;  
    }
  } else {
    fill(200);
  }
  
  rect(exitButtonPos.x, exitButtonPos.y, buttonWidth, buttonHeight);
  fill(0);
  text("Exit", exitButtonPos.x + buttonWidth / 2, exitButtonPos.y + buttonHeight / 1.5);

  fill(colors[currentColorIndex]);
  rect(183, 310, 40, 40); 
  textSize(20);
  fill(0);
  text("Change Color", width / 2, 370);  

  if (button == 1 && !buttonPressed) { 
    currentColorIndex = (currentColorIndex + 1) % colors.length;  
    buttonPressed = true; 
  } else if (button == 0) {
    buttonPressed = false; 
  }
}


void drawDifficulty() {
  background(204, 0, 0);

  textSize(32);
  fill(0);
  textAlign(CENTER);
  text("Choose difficulty", width / 2, 80);

  if (mouseX >= easyButtonPos.x && mouseX <= easyButtonPos.x + buttonWidth &&
      mouseY >= easyButtonPos.y && mouseY <= easyButtonPos.y + buttonHeight) {
    fill(100);
    if (mousePressed) {
      isEasyPressed = true;  
    }
  } else {
    fill(200);
  }

  rect(easyButtonPos.x, easyButtonPos.y, buttonWidth, buttonHeight);
  fill(0);
  textSize(20);
  text("Easy Mode", easyButtonPos.x + buttonWidth / 2, easyButtonPos.y + buttonHeight / 1.5);

  if (mouseX >= hardButtonPos.x && mouseX <= hardButtonPos.x + buttonWidth &&
      mouseY >= hardButtonPos.y && mouseY <= hardButtonPos.y + buttonHeight) {
    fill(100);
    if (mousePressed) {
      isHardPressed = true;
    }
  } else {
    fill(200);
  }

  rect(hardButtonPos.x, hardButtonPos.y, buttonWidth, buttonHeight);
  fill(0);
  text("Hard mode", hardButtonPos.x + buttonWidth / 2, hardButtonPos.y + buttonHeight / 1.5);
}

void gameOver() {
  background(153, 0, 0);
  PVector playagainButtonPos = new PVector(125, 150);
  PVector mainmenuButtonPos = new PVector(125, 250);  

  
  textSize(32);
  fill(0);
  textAlign(CENTER);
  text("GAME OVER! Score:" + (lngth - 1), width / 2, 80);
  
  if (mouseX >= playagainButtonPos.x && mouseX <= playagainButtonPos.x + buttonWidth &&
      mouseY >= playagainButtonPos.y && mouseY <= playagainButtonPos.y + buttonHeight) {
    fill(100);
    if (mousePressed) {
      isPlayAgainPressed = true;  
    }
  } else {
    fill(200);
  }

  rect(playagainButtonPos.x, playagainButtonPos.y, buttonWidth, buttonHeight);
  fill(0);
  textSize(20);
  text("Play Again", playagainButtonPos.x + buttonWidth / 2, playagainButtonPos.y + buttonHeight / 1.5);

  if (mouseX >= mainmenuButtonPos.x && mouseX <= mainmenuButtonPos.x + buttonWidth &&
      mouseY >= mainmenuButtonPos.y && mouseY <= mainmenuButtonPos.y + buttonHeight) {
    fill(100);
    if (mousePressed) {
      isMainMenuPressed = true;
    }
  } else {
    fill(200);
  }

  rect(mainmenuButtonPos.x, mainmenuButtonPos.y, buttonWidth, buttonHeight);
  fill(0);
  text("Main Menu", mainmenuButtonPos.x + buttonWidth / 2, mainmenuButtonPos.y + buttonHeight / 1.5);
}
  


void mouseReleased() {
  if (isPlayPressed) {
    screenState = MODESCREEN;
    isPlayPressed = false;
  }

  if (isExitPressed) {
    exit();
  }

  if (screenState == MODESCREEN && isEasyPressed) {
    screenState = GAMESCREEN;
    difficulty = 0;  
    startGame();
    isEasyPressed = false;
  }

  if (screenState == MODESCREEN && isHardPressed) {
    screenState = GAMESCREEN;
    difficulty = 1; 
    startGame();
    isHardPressed = false;
  }
  
  if (screenState == GAMEOVER && isPlayAgainPressed) {
    screenState = GAMESCREEN;
    startGame();
    isPlayAgainPressed = false;
  }
  
  if (screenState == GAMEOVER && isMainMenuPressed) {
    screenState = MENUSCREEN;
    drawMenu();
    isMainMenuPressed = false;
    isExitPressed = false;
  }
}

  

void drawApple() {
  
 fill(255, 0, 0);
 rect(apple.x * thcknss, apple.y * thcknss, thcknss, thcknss); 
}

void newApple() {
  boolean isOnSnake = true;
  
  while (isOnSnake) {
    apple = new PVector(int(random(wid)), int(random(hei)));

    isOnSnake = false; 
    for (PVector segment : chain) {
      if (apple.x == segment.x && apple.y == segment.y) {
        isOnSnake = true; 
        break; 
      }
    }
  }
}

void startGame() {
  snake = new PVector(wid / 2, hei / 2);
  chain = new ArrayList<PVector>();
  mvmnt = new PVector(0, 0);
  speed = 12;
  lngth = 1;
  newApple(); 
   
}


void drawTail() {
  fill(colors[currentColorIndex]);
  rect(snake.x * thcknss, snake.y * thcknss, thcknss, thcknss);
  for(int i = 0; i < chain.size(); i++) {
    rect(chain.get(i).x * thcknss, chain.get(i).y * thcknss, thcknss, thcknss);
  }
}
/*void keyPressed() {
  if(key == CODED) {
    if(keyCode == UP) { mvmnt = new PVector(0, -1); }
    if(keyCode == DOWN) { mvmnt = new PVector(0, 1); }
    if(keyCode == RIGHT) { mvmnt = new PVector(1, 0); }
    if(keyCode == LEFT) { mvmnt = new PVector(-1, 0); }
}
}*/

void readJoystick() {
  if (myPort.available() > 0) {  
    val = myPort.readStringUntil('\n');         
  }
  val = trim(val);
  println(val);
  if (val != null) {
    int[] xyz = int(splitTokens(val, ","));
    //println(xyz);
      
    if (xyz.length == 4) {
      int x = xyz[0];  
      int y = xyz[1];  
      button = xyz[3];
      println(button);
      
      println("Joystick X: " + x + ", Y: " + y + ", Button: " + button);
      if (y < 1500) {  
        mvmnt = new PVector(0, -1);
      } else if (y > 2500) {  
        mvmnt = new PVector(0, 1);
      }

      if (x < 1500) {  
        mvmnt = new PVector(-1, 0);
      } else if (x > 2500) {  
        mvmnt = new PVector(1, 0);
      } 
    }
  }
}

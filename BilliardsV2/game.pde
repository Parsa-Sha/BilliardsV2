// First player places ball
// First player aim
// Balls move
// Evaluate
// Second player aim
// Balls move
// Evaluate


// Collision
// Pool stick
// Ball enters holes
// Scratch
// All rules

void game() {
  background(200);
  image(table, width/2, height-480/2);

  for (int i = 0; i < myBalls.size(); i++) {
    objectBall = myBalls.get(i);
    objectBall.show();
    objectBall.act();
  }

  rect(85, 95, 370, 10); // Testing
  rect(505, 95, 370, 10);
  rect(85, 495, 370, 10);
  rect(505, 495, 370, 10);
  rect(40, 135, 10, 325);
  rect(910, 135, 10, 325);
  ellipse(60, 115, 26, 26);


  if (newGame) { // Reset game code
    newGame = false;

    for (int i = 0; i < ballArrangement.length; i++) ballArrangement[i] = 16;
    ballArrangement[0] = 1; // Set one ball and eight ball ids
    ballArrangement[4] = 8;
    boolean isNew = false;
    int idCandidate = 16;
    int selectionCleared = 0;
    for (int i = 0; i < ballArrangement.length; i++) {
      if (i != 0 && i != 4) {
        while (!isNew) {
          idCandidate = floor(random(2, 16));
          for (int j = 0; j < ballArrangement.length; j++) {
            if (ballArrangement[j] != idCandidate) selectionCleared++; // Checking if random placement is not equal to an already placed ball
          }
          if (selectionCleared == ballArrangement.length){
            isNew = true;
          } else {
            selectionCleared = 0;
          }
        }
        ballArrangement[i] = idCandidate;
        isNew = false;
        selectionCleared = 0; // Place id into index, then reset
      }
    }
    
    myBalls = new ArrayList<Ball>();
    myBalls.add(new PlayerBall());
    int bpi = 1; // Ball placed index, used to refrence which ball should be placed where
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 5-i; j++) {
        myBalls.add(new Ball(ballArrangement[15-bpi], new PVector(800 - i*22.52, 250 + j*26 + i*13)));
        bpi++;
      }
    }
  } // End of newGame code
  
  for (int i = 0; i < myBalls.size(); i++) {
    for (int j = 0; j < myBalls.size(); j++) {
      if (i != j && 
      myBalls.get(i).pos.x + 13 <= myBalls.get(j).pos.x &&
      myBalls.get(i).pos.y + 13 <= myBalls.get(j).pos.x &&
      myBalls.get(i).pos.x + 13 <= myBalls.get(j).pos.y &&
      myBalls.get(i).pos.y + 13 <= myBalls.get(j).pos.y 
      ) {
      }
    }
  }

  switch(gameState) {
  case PLAYERBEGIN:
    playerBegin();
    break;
  case PLAYERPLACE:
    playerPlace();
    break;
  case PLAYERSHOOT:
    playerShoot();
    break;
  case CALCULATE:
    calculate();
    break;
  case EVALUATE:
    evaluate();
    break;
  default:
    println("GAMESTATE ERROR. ERROR = " + gameState);
  }
}

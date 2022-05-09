void calculate() {
  if (myBalls.get(0).vel.x < 0.01 && myBalls.get(0).vel.y < 0.01) gameState = PLAYERSHOOT;  
}

PVector mouseStart, mouseEnd, velocity;
boolean hasPressed;
float rotationPressed;
float testVelocity;
float tVelbegin, tVel;
float angle;

void playerShoot() {
  pushMatrix();
  translate(myBalls.get(0).pos.x, myBalls.get(0).pos.y);
  rotate(atan2(mouseY - myBalls.get(0).pos.y, mouseX - myBalls.get(0).pos.x) * int(!hasPressed));
  rotate(rotationPressed * int(hasPressed));
  translate(20, -6); // Incorporate length of mouse dragged
  imageMode(CORNER);
  if (abs(myBalls.get(0).vel.x) < 0.01 && abs(myBalls.get(0).vel.y) < 0.01) image(stick, 0, 0);
  imageMode(CENTER);
  popMatrix();
}

void mousePressed() { // Rotate origin, mouseDragged ignoring Y changes, only X. Take X change, rotate back, and then apply velocity
  if (gameState == PLAYERSHOOT) {
    if (!hasPressed) {
      hasPressed = true; // Vx = V * cos(angle), Vy = V * sin(angle)
      rotationPressed = atan2(mouseY - myBalls.get(0).pos.y, mouseX - myBalls.get(0).pos.x);
      pushMatrix();
      translate(myBalls.get(0).pos.x, myBalls.get(0).pos.y);
      rotate(rotationPressed);
      tVelbegin = mouseX;
      popMatrix();
    }
  }
}

void mouseReleased() {
  if (gameState == PLAYERSHOOT) {

    pushMatrix();
    translate(myBalls.get(0).pos.x, myBalls.get(0).pos.y);
    rotate(rotationPressed);
    tVel = abs(mouseX - tVelbegin);
    popMatrix();
    velocity = new PVector(tVel * cos(-rotationPressed), tVel * sin(-rotationPressed)); // Still need to figure out how to only have drag in that direction
    velocity.setMag(min(tVel, 40)); 
    velocity.x *= -1;
    myBalls.get(0).vel = velocity;

    hasPressed = false;
    gameState = CALCULATE;
  }
}

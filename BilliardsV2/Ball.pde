class Ball {
  PVector pos;
  PVector vel;
  int size;
  int id;
  
  Ball() {
    pos = new PVector(0, 0);
    vel = new PVector(0, 0);
    size = 26;
    id = 1;
  }
  
  Ball(int identification, PVector location) {
    pos = location;
    vel = new PVector(0, 0);
    size = 26;
    id = identification;
  }
  
  void show() {
    image(ballImages[id], pos.x, pos.y);
  }
  
  void act() {
    pos.add(vel);
    vel.setMag(vel.mag()*0.975);
    
    if (pos.y - size/2 <= 105 && pos.x + size/2 >= 85 && pos.x - size/2 <= 455) vel.y *= -1; // Top left bumper
    if (pos.y - size/2 <= 105 && pos.x + size/2 >= 505 && pos.x - size/2 <= 875) vel.y *= -1; // Top right bumper
    if (pos.y + size/2 >= 495 && pos.x + size/2 >= 85 && pos.x - size/2 <= 455) vel.y *= -1; // Bottom left bumper
    if (pos.y + size/2 >= 495 && pos.x + size/2 >= 505 && pos.x - size/2 <= 875) vel.y *= -1; // Bottom right bumper
    
    if (pos.x - size/2 <= 50 && pos.y + size/2 >= 135 && pos.y - size/2 <= 455) vel.x *= -1; // Left bumper
    if (pos.x + size/2 >= 910 && pos.y + size/2 >= 135 && pos.y - size/2 <= 455) vel.x *= -1; // Right bumper
  }
}

class PlayerBall extends Ball {
  PlayerBall() {
    pos = new PVector(263, 305);
    vel = new PVector(0, 0);
    size = 26;
    id = 0;
  }  
  
  void show() {
    image(ballImages[0], pos.x, pos.y);
  }
  
  void act() {
    super.act();
  }
}

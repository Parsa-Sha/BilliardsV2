ArrayList<Ball> myBalls;
Ball objectBall = null;

final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEWON = 3;
final int GAMEOVER = 4;
int mode = GAME;

final int PLAYERBEGIN = 0;
final int PLAYERPLACE = 1;
final int PLAYERSHOOT = 2;
final int CALCULATE = 3;
final int EVALUATE = 4;
int gameState = PLAYERSHOOT;

int[] ballArrangement = new int[15];

boolean newGame = true;

PImage table;
PImage stick;
PImage[] ballImages = new PImage[16];

void setup() {
  size(960, 540);
  
  table = loadImage("images\\EightBallTable.png");
  stick = loadImage("images\\poolStick.png");
  ballImages[0] = loadImage("balls\\cueball.png");
  ballImages[1] = loadImage("balls\\1ball.png");
  ballImages[2] = loadImage("balls\\2ball.png");
  ballImages[3] = loadImage("balls\\3ball.png");
  ballImages[4] = loadImage("balls\\4ball.png");
  ballImages[5] = loadImage("balls\\5ball.png");
  ballImages[6] = loadImage("balls\\6ball.png");
  ballImages[7] = loadImage("balls\\7ball.png");
  ballImages[8] = loadImage("balls\\8ball.png");
  ballImages[9] = loadImage("balls\\9ball.png");
  ballImages[10] = loadImage("balls\\10ball.png");
  ballImages[11] = loadImage("balls\\11ball.png");
  ballImages[12] = loadImage("balls\\12ball.png");
  ballImages[13] = loadImage("balls\\13ball.png");
  ballImages[14] = loadImage("balls\\14ball.png");
  ballImages[15] = loadImage("balls\\15ball.png");
  imageMode(CENTER);
  
  myBalls = new ArrayList<Ball>();
}

void draw() {
  switch (mode) {
  case INTRO:
    intro();
    break;
  case GAME:
    game();
    break;
  case PAUSE:
    pause();
    break;
  case GAMEWON:
    gamewon();
    break;
  case GAMEOVER:
    gameover();
    break;
  default:
    println("MODE ERROR. MODE = " + mode);
  }
}

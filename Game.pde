// Holder styr på game state
enum GameState {
  RUNNING, PAUSED, GAME_OVER
}

// En class som indenholder ting som selve spillet delen har brug for
class Game {
  // Til at holde styre op hvad der skal ske og hvor i spillet vi er
  GameState state;
  // Ting som spillet skal bruge
  SpaceShip ship;
  EnemyShip enemy;
  Obstacle[] obstacles = {};
  // Holder styr op vores highscore.
  Highscore highscore;
  // Bruges til at load levels
  Level level;
  int score;
  // Alle spillets GUI's
  GUI gameGUI, pauseGUI, gameOverGUI;

  Game(SpaceShip ship, Level level, EnemyShip enemy, GUI gameGUI, GUI pauseGUI, GUI gameOverGUI) {
    this.ship = ship;
    this.level = level;
    this.enemy = enemy;
    this.gameGUI = gameGUI;
    this.pauseGUI = pauseGUI;
    this.gameOverGUI = gameOverGUI;
    this.highscore = new Highscore();
    this.state = GameState.GAME_OVER;
  }

  // Bruges til at vise hvad der skal tegnes på spillet og kører spillet hvis de bliver vist
  void display() {
    switch(state) {
    case RUNNING:
      this.gameGUI.display();
      this.ship.display();

      for (Obstacle obstacle : obstacles) {
        obstacle.display();
      }

      this.enemy.display();
      this.run();
      break;

    case PAUSED:
      this.gameGUI.display();
      this.ship.display();

      for (Obstacle obstacle : this.obstacles) {
        obstacle.display();
      }

      this.enemy.display();
      this.pauseGUI.display();
      break;

    case GAME_OVER:
      this.gameGUI.display();
      this.ship.display();

      for (Obstacle obstacle : this.obstacles) {
        obstacle.display();
      }

      this.enemy.display();
      this.gameOverGUI.display();
      break;
    }
  }

  // Kører selve spillet. Tjekker collision og gameOver() bliver kaldt
  void run() {
    if (this.state != GameState.RUNNING) {
      this.state = GameState.RUNNING;
    }
    
    // Hvis skibbet rammer kanten er man død og gameOver() bliver kaldt
    if (this.ship.circleBoundary()) {
      this.gameOver();
    }

    // Hvis skibbet rammer et obstacle er man død og gameOver() bliver kaldt
    for (Obstacle obstacle : this.obstacles) {
      if (this.ship.circleRect(obstacle)) {
        this.gameOver();
      }
    }
    
    // Hvis skibbet rammer fjenden er man død og gameOver() bliver kaldt
    if (this.ship.circleCircle(this.enemy)) {
      this.gameOver();
    }

    this.ship.move();
    this.enemy.move();

    game.score++;
  }

  // Kaldes når spillet skal slutte
  void gameOver() {
    if (this.state != GameState.GAME_OVER) {
      this.state = GameState.GAME_OVER;
    }

    if (this.score > this.highscore.highscore) {
      this.highscore.highscore = this.score;
    }
  }

  // Starter selve spillet  og resetter alle variabler
  void start() {
    this.ship.vel.set(0, 0);

    this.score = 0;

    this.ship.moveForward = false;
    this.ship.moveBackwards = false;
    this.ship.rotateRight = false;
    this.ship.rotateLeft = false;

    this.state = GameState.RUNNING;
  }
}

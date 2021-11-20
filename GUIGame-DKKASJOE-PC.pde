// Alle copmonents der bruges til game GUI'erne (Se GUI og GUILayout)

/**  Componenets for GUI game state = running */

class GameBackground implements GUIElement {
  Star[] stars = new Star[200];
  int baseSpeed;

  GameBackground() {
    for (int i = 0; i < this.stars.length; i++) {
      stars[i] = new Star();
    }
  }

  class Star implements GUIElement {
    PVector pos;
    float radius;
    color col;
    int speed;

    Star() {
      this.pos = new PVector(random(width), random(height));
      this.radius = random(3.5, 5);
      this.col = round(random(200, 255));
      this.speed = round(random(2, 3));
    }

    void update() {
      if (game.state == GameState.RUNNING) {
        this.pos.sub(this.speed, 0);

        if (this.pos.x < -5) {
          this.pos.x = width+5;
          this.pos.y = round(random(height));
        }
      }
    }

    void display() {
      this.update();

      fill(this.col);
      circle(this.pos.x, this.pos.y, radius);
    }
  }

  void display() {
    background(0);

    for (Star star : this.stars) {
      star.display();
    }
  }
}

// Dynamic string!
class Speedometer implements GUIElement {
  void display() {
    textSize(15);
    fill(GUIColors.BLACK);
    text("SPEED: "+round(game.ship.vel.mag()), width/2+4-2, height-40+4-2);
    fill(GUIColors.WHITE);
    text("SPEED: "+round(game.ship.vel.mag()), width/2, height-40);
  }
}

/**  Componenets for GUI game state = paused */

class PauseTitle extends TextShadowLayout {
  PauseTitle() {
    super("PAUSED", new PVector(width/2+4, 65+4), 50);
  }
}

class StartGameButton extends ButtonLayout {
  StartGameButton() {
    super("RESUME", new PVector(width/2, height/2-60), new PVector(450, 75));
  }

  void onClick() {
    game.state = GameState.RUNNING;
  }
}

/** Componenets for GUI game state = game over */

class GameOverTitle extends TextShadowLayout {
  GameOverTitle() {
    super("GAME OVER", new PVector(width/2+4, 65+4), 50);
  }
}

// Dynamic string!
class Score implements GUIElement {
  void display() {
    textSize(50);
    fill(GUIColors.BLACK);
    text("SCORE: "+game.score, width/2+4, height/2-40+4);
    fill(GUIColors.WHITE);
    text("SCORE: "+game.score, width/2, height/2-40);
  }
}

/** Components for multiple GUIs */

class LeaveGameButton extends ButtonLayout {
  LeaveGameButton() {
    super("LEAVE", new PVector(width/2, height/2+60), new PVector(450, 75));
  }

  void onClick() {
    state = AppState.MENU;
  }
}

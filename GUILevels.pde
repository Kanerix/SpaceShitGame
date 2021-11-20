// Alle copmonents der bruges til Level GUI (Se GUI og GUILayout)

class LevelsTitle extends TextShadowLayout {
  LevelsTitle() {
    super("LEVELS", new PVector(width/2+4, 65+4), 50);
  }
}

class LevelOneButton extends ButtonLayout {
  LevelOneButton() {
    super("1", new PVector(width/2-80, height/2-80), new PVector(80, 80));
  }

  void onClick() {
    game.level.load("levels/level1.json");

    game.start();

    state = AppState.RUNNING;
  }
}

class LevelTwoButton extends ButtonLayout {
  LevelTwoButton() {
    super("2", new PVector(width/2+80, height/2-80), new PVector(80, 80));
  }

  void onClick() {
    game.level.load("levels/level2.json");

    game.start();

    state = AppState.RUNNING;
  }
}

class LevelThreeButton extends ButtonLayout {
  LevelThreeButton() {
    super("3", new PVector(width/2-80, height/2+80), new PVector(80, 80));
  }

  void onClick() {
    game.level.load("levels/level3.json");

    game.start();

    state = AppState.RUNNING;
  }
}

class LevelFourButton extends ButtonLayout {
  LevelFourButton() {
    super("4", new PVector(width/2+80, height/2+80), new PVector(80, 80));
  }

  void onClick() {
    game.level.load("levels/level4.json");

    game.start();

    state = AppState.RUNNING;
  }
}

// Dynamic string!
class HighscoreTitle implements GUIElement {
  void display() {
    textSize(30);
    fill(GUIColors.BLACK);
    text("HIGHSCORE: "+game.highscore.highscore, width/2+4, 175+4);
    fill(GUIColors.WHITE);
    text("HIGHSCORE: "+game.highscore.highscore, width/2, 175);
  }
}

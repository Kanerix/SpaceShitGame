// Alle copmonents der bruges til menu GUI (Se GUI og GUILayout)

class MenuTitle extends TextShadowLayout {
  MenuTitle() {
    super("SPACE SHIT GAME", new PVector(width/2, 65), 70);
  }
}

class StartButton extends ButtonLayout {
  StartButton() {
    super("START", new PVector(width/2, height/2-180), new PVector(450, 75));
  }

  void onClick() {
    state = AppState.LEVELS;
  }
}

class ShowDiagramButton extends ButtonLayout {
  ShowDiagramButton() {
    super("DIAGRAM", new PVector(width/2, height/2-60), new PVector(450, 75));
  }

  void onClick() {
    state = AppState.DIAGRAM;
  }
}

class SettingsButton extends ButtonLayout {
  SettingsButton() {
    super("SETTINGS", new PVector(width/2, height/2+60), new PVector(450, 75));
  }

  void onClick() {
    state = AppState.SETTINGS;
  }
}

class QuitButton extends ButtonLayout {
  QuitButton() {
    super("QUIT", new PVector(width/2, height/2 + 180), new PVector(450, 75));
  }

  void onClick() {
    game.highscore.saveHighscoreToFile();

    exit();
  }
}

// Alle variablerne er protected for at ungå at man overskriver dem, da de er essentielle for at spillet virker.
protected AppState state;

protected Game game;
protected Diagram diagram;
protected SettingsMenu settings;

protected GUI menuGUI, diagramGUI, levelsGUI;

// Bruges til at holde styr på hvilket sted i vores app vi er
enum AppState {
  MENU, RUNNING, DIAGRAM, SETTINGS, LEVELS
}

void setup() {
  size(800, 800);

  textFont(createFont("./assets/Gameplay.ttf", 32));
  textAlign(CENTER, CENTER);
  rectMode(CENTER); // Meget vigtige funktioner, for at collision virker!

  // Sætter vores app state til vi starter i menuen
  state = AppState.MENU;

  // Brugt til at autogenerer et class diagram (reflection)
  diagram = new Diagram(this);

  // Game GUI
  GUI gameRunningGUI = new GUI(
    new GameBackground(),
    new Speedometer()
    );

  GUI gamePausedGUI = new GUI(
    //new Backdrop(),
    new PauseTitle(),
    new StartGameButton(),
    new LeaveGameButton()
    );

  GUI gameOverGUI = new GUI(
    new Backdrop(),
    new GameOverTitle(),
    new Score(),
    new LeaveGameButton()
    );

  game = new Game(
    new SpaceShip(),
    new Level(),
    new EnemyShip(),
    gameRunningGUI,
    gamePausedGUI,
    gameOverGUI
    );

  // Menu GUI
  menuGUI = new GUI(
    new MenuTitle(),
    new StartButton(),
    new ShowDiagramButton(),
    new SettingsButton(),
    new QuitButton()
    );

  // Diagram GUI
  diagramGUI = new GUI(
    new DiagramTitle(),
    new QuitToMenuButton(),
    diagram,
    new DiagramNextPageButton(),
    new DiagramPreviousPageButton()
    );

  // Settings GUI
  GUI settingsHomeGUI = new GUI(
    new SettingsTitle(),
    new QuitToMenuButton(),
    new BindForwardTitle(),
    new BindForwardButton(),
    new BindBrakeTitle(),
    new BindBrakeButton(),
    new BindRightTitle(),
    new BindRightButton(),
    new BindLeftTitle(),
    new BindLeftButton(),
    new SaveBindsButton()
    );

  GUI settingsBindForwardGUI = new GUI(
    new Backdrop(),
    new BindForwardPageTitle()
    );

  GUI settingsBindBrakeGUI = new GUI(
    new Backdrop(),
    new BindBrakePageTitle()
    );

  GUI settingsBindRightGUI = new GUI(
    new Backdrop(),
    new BindRightPageTitle()
    );

  GUI settingsBindLeftGUI = new GUI(
    new Backdrop(),
    new BindLeftPageTitle()
    );

  settings = new SettingsMenu(
    settingsHomeGUI,
    settingsBindForwardGUI,
    settingsBindBrakeGUI,
    settingsBindRightGUI,
    settingsBindLeftGUI
    );

  // Levels GUI
  levelsGUI = new GUI(
    new LevelsTitle(),
    new QuitToMenuButton(),
    new HighscoreTitle(),
    new LevelOneButton(),
    new LevelTwoButton(),
    new LevelThreeButton(),
    new LevelFourButton()
    );
}

void draw() {
  // Tjekker vores app state til at finde ud af hvad der skal tegnes
  switch(state) {
  case MENU:
    background(color(GUIColors.TEAL));
    menuGUI.display();
    break;

  case RUNNING:
    game.display();
    break;

  case DIAGRAM:
    background(color(GUIColors.BROWN));
    diagramGUI.display();
    break;

  case SETTINGS:
    background(color(GUIColors.RED));
    settings.display();
    break;

  case LEVELS:
    background(color(GUIColors.INDIGO));
    levelsGUI.display();
    break;
  }
}

void keyPressed() {
  // Pauser spillet hvis vi klikker på key code 32 (Space)
  if (
    keyCode == 32 &&
    state == AppState.RUNNING &&
    game.state == GameState.RUNNING
    ) {
    game.state = GameState.PAUSED;
  }

  switch(state) {
    // Sikre at vi kun lytter efter keyPressed på spillerens binds når spillet er i gang
  case RUNNING:
    // Tjekker om der bliver trykket på nogen af tasterne som er bindet til spilleren
    if (game.state == GameState.RUNNING) {
      if (keyCode == game.ship.forwardKey) {
        game.ship.moveForward = true;
      } else if (keyCode == game.ship.backwardsKey) {
        game.ship.moveBackwards = true;
      } else if (keyCode == game.ship.rightKey) {
        game.ship.rotateRight = true;
      } else if (keyCode == game.ship.leftKey) {
        game.ship.rotateLeft = true;
      }
    }
    break;

  default:
    break;
  }
}

void keyReleased() {
  switch(state) {
    // Sikre at vi kun lytter efter keyReleased på spillerens binds når spillet er i gang
  case RUNNING:
    // Tjekker om der bliver trykket på nogen af tasterne som er bindet til spilleren
    if (keyCode == game.ship.forwardKey) {
      game.ship.moveForward = false;
    } else if (keyCode == game.ship.backwardsKey) {
      game.ship.moveBackwards = false;
    } else if (keyCode == game.ship.rightKey) {
      game.ship.rotateRight = false;
    } else if (keyCode == game.ship.leftKey) {
      game.ship.rotateLeft = false;
    }
    break;

    // Sikre at vi kun lytter efter keyReleased når vi er i settings menuen
  case SETTINGS:
    // Sender tasten vi kligger på til settings objektet som opdatere vores binds
    settings.updateKeyBind(keyCode);
    break;

  default:
    break;
  }
}

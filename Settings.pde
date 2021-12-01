// Holde styr på hvor vi er i settings menuen
enum SettingsMenuState {
  NONE, FORWARD_KEY, BACKWARDS_KEY, RIGHT_KEY, LEFT_KEY
}

class SettingsMenu {
  // Alle vores menu GUI's
  GUI settingsGUI, forwardKeyGUI, backwardsKeyGUI, rightKeyGUI, leftKeyGUI;
  SettingsMenuState state;

  SettingsMenu(GUI settingsGUI, GUI forwardKeyGUI, GUI backwardsKeyGUI, GUI rightKeyGUI, GUI leftKeyGUI ) {
    this.settingsGUI = settingsGUI;
    this.forwardKeyGUI = forwardKeyGUI;
    this.backwardsKeyGUI = backwardsKeyGUI;
    this.rightKeyGUI = rightKeyGUI;
    this.leftKeyGUI = leftKeyGUI;

    this.state = SettingsMenuState.NONE;

    // Fejler hvis filen mangler eller den er opsat forkert
    try {
      // Loader binds fra settings
      JSONObject jsonObject = loadJSONObject("./data/binds.json");

      // Sætter det loaded data til skibbet
      game.ship.forwardKey = jsonObject.getInt("forwardKey");
      game.ship.backwardsKey = jsonObject.getInt("backwardsKey");
      game.ship.rightKey = jsonObject.getInt("rightKey");
      game.ship.leftKey = jsonObject.getInt("leftKey");
    }
    catch(Exception _error) {
      this.generateBindsFile();
    }
  }

  void generateBindsFile() {
    JSONObject jsonObject = new JSONObject();

    jsonObject.setInt("forwardKey", game.ship.forwardKey);
    jsonObject.setInt("backwardsKey", game.ship.backwardsKey);
    jsonObject.setInt("rightKey", game.ship.rightKey);
    jsonObject.setInt("leftKey", game.ship.leftKey);

    saveJSONObject(jsonObject, "data/binds.json");
  }

  // Viser settings siden ud fra state.
  void display() {
    switch(this.state) {
    case NONE:
      settingsGUI.display();
      break;

    case FORWARD_KEY:
      forwardKeyGUI.display();
      break;

    case BACKWARDS_KEY:
      backwardsKeyGUI.display();
      break;

    case RIGHT_KEY:
      rightKeyGUI.display();
      break;

    case LEFT_KEY:
      leftKeyGUI.display();
      break;
    }
  }

  // Tjekker om en key code allerede er binded
  boolean isKeyUsed(int newKeyCode) {
    return (
      newKeyCode == game.ship.forwardKey ||
      newKeyCode == game.ship.backwardsKey ||
      newKeyCode == game.ship.rightKey ||
      newKeyCode == game.ship.leftKey ||
      newKeyCode == 32);
  }

  // Updatere en key code.
  void updateKeyBind(int newKeyCode) {
    if (this.isKeyUsed(newKeyCode)) {
      return;
    }

    // Tjekker ud fra state hvilken keycode den skal opdatere og derefter tager tilbage til main settings siden
    switch(this.state) {
    case NONE:
      return;

    case FORWARD_KEY:
      game.ship.forwardKey = newKeyCode;
      break;

    case BACKWARDS_KEY:
      game.ship.backwardsKey = newKeyCode;
      break;

    case RIGHT_KEY:
      game.ship.rightKey = newKeyCode;
      break;

    case LEFT_KEY:
      game.ship.leftKey = newKeyCode;
      break;
    }

    this.state = SettingsMenuState.NONE;
  }

  // Gemmer vores keybinds i en json fil
  void save() {
    // Laver et nyt JSON objekt
    JSONObject json = new JSONObject();

    // Sætter værdier til tasterne i JSON objektet
    json.setInt("forwardKey", game.ship.forwardKey);
    json.setInt("backwardsKey", game.ship.backwardsKey);
    json.setInt("rightKey", game.ship.rightKey);
    json.setInt("leftKey", game.ship.leftKey);

    // Her gemmer vi JSON objektet vi har lavet
    saveJSONObject(json, "./data/binds.json");

    // Sætter state til non som betyder vi ikke
    // længere er i gang med at bind en knap
    this.state = SettingsMenuState.NONE;
  }
}

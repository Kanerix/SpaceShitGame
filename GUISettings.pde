// Alle copmonents der bruges til settings GUI (Se GUI og GUILayout)

// Componenets for GUI settings state = none
class SettingsTitle extends TextShadowLayout {
  SettingsTitle() {
    super("SETTINGS", new PVector(width/2, 65), 50);
  }
}

// Dynamic string!
class BindForwardTitle implements GUIElement {
  void display() {
    textSize(25);
    fill(GUIColors.BLACK);
    text("FORWARD KEY IS: " + char(game.ship.forwardKey), width/2 + 4, 160-30 + 4);
    fill(GUIColors.WHITE);
    text("FORWARD KEY IS: " + char(game.ship.forwardKey), width/2, 160-30);
  }
}

class BindForwardButton extends ButtonLayout {
  BindForwardButton() {
    super("CHANGE FORWARD KEY", new PVector(width/2, 160+30), new PVector(600, 60), 30);
  }

  void onClick() {
    settings.state = SettingsMenuState.FORWARD_KEY;
  }
}

// Dynamic string!
class BindBrakeTitle implements GUIElement {
  void display() {
    textSize(25);
    fill(GUIColors.BLACK);
    text("BACKWARDS KEY IS: " + char(game.ship.backwardsKey), width/2 + 4, 305-30+4);
    fill(GUIColors.WHITE);
    text("BACKWARDS KEY IS: " + char(game.ship.backwardsKey), width/2, 305-30);
  }
}

class BindBrakeButton extends ButtonLayout {
  BindBrakeButton() {
    super("CHANGE BACKWARDS KEY", new PVector(width/2, 305+30), new PVector(600, 60), 30);
  }

  void onClick() {
    settings.state = SettingsMenuState.BACKWARDS_KEY;
  }
}

// Dynamic string!
class BindRightTitle implements GUIElement {
  void display() {
    textSize(25);
    fill(GUIColors.BLACK);
    text("RIGHT KEY IS: " + char(game.ship.rightKey), width/2+4, 450-30+4);
    fill(GUIColors.WHITE);
    text("RIGHT KEY IS: " + char(game.ship.rightKey), width/2, 450-30);
  }
}

class BindRightButton extends ButtonLayout {
  BindRightButton() {
    super("CHANGE RIGHT KEY", new PVector(width/2, 450+30), new PVector(600, 60), 30);
  }

  void onClick() {
    settings.state = SettingsMenuState.RIGHT_KEY;
  }
}

// Dynamic string!
class BindLeftTitle implements GUIElement {
  void display() {
    textSize(25);
    fill(GUIColors.BLACK);
    text("LEFT KEY IS: " + char(game.ship.leftKey), width/2+4, 595-30+4);
    fill(GUIColors.WHITE);
    text("LEFT KEY IS: " + char(game.ship.leftKey), width/2, 595-30 );
  }
}

class BindLeftButton extends ButtonLayout {
  BindLeftButton() {
    super("CHANGE LEFT KEY", new PVector(width/2, 595+30), new PVector(600, 60), 30);
  }

  void onClick() {
    settings.state = SettingsMenuState.LEFT_KEY;
  }
}

class SaveBindsButton extends ButtonLayout {
  SaveBindsButton() {
    super("SAVE SETTINGS", new PVector(width/2, 740), new PVector(600, 60), 30);
  }

  void onClick() {
    settings.save();
  }
}

// Componenets for GUI settings state = forward, backwards, right, left
class BindForwardPageTitle extends TextShadowLayout {
  BindForwardPageTitle() {
    super("PRESS A NEW BUTTON TO BIND FORWARD KEY", new PVector(width/2, height/2), 30, 2);
  }
}
class BindBrakePageTitle extends TextShadowLayout {
  BindBrakePageTitle() {
    super("PRESS A NEW BUTTON TO BIND BRAKE KEY", new PVector(width/2, height/2), 30, 2);
  }
}
class BindRightPageTitle extends TextShadowLayout {
  BindRightPageTitle() {
    super("PRESS A NEW BUTTON TO BIND RIGHT KEY", new PVector(width/2, height/2), 30, 2);
  }
}
class BindLeftPageTitle extends TextShadowLayout {
  BindLeftPageTitle() {
    super("PRESS A NEW BUTTON TO BIND LEFT KEY", new PVector(width/2, height/2), 30, 2);
  }
}

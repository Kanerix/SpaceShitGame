// GUI componets som ikke er til en specefik menu
class Backdrop implements GUIElement {
  void display() {
    fill(GUIColors.BLACK, 175);
    rect(width/2, height/2, width, height);
  }
}

class QuitToMenuButton extends ButtonLayout {
  QuitToMenuButton() {
    super("X", new PVector(65, 65), new PVector(75, 75));
  }

  void onClick() {
    state = AppState.MENU;
  }
}

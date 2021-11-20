// Bruges til at lave en ny GUI
class GUI {
  // Alle elementer der skal vises når man viser sit GUI
  GUIElement[] elements = {};

  GUI(GUIElement ...elements) {
    this.elements = (GUIElement[]) concat(this.elements, elements);
  }

  // Viser alle ens elementer
  void display() {
    if (this.elements.length != 0) {
      for (GUIElement element : this.elements) {
        element.display();
      }
    }
  }
}

// Bruges til at man implementere denne interface og give classen til et GUI objekt
interface GUIElement {
  void display();
}

// En masse standard farver som bruges til at farve objekter med fill(farve);
interface GUIColors {
  color GREEN = #259b24;
  color INDIGO = #3f51b5;
  color BLUE = #5677fc;
  color GREY = #9e9e9e;
  color CYAN = #00bcd4;
  color TEAL = #009688;
  color BROWN = #795548;
  color PURPLE = #9c27b0;
  color YELLOW = #ffeb3b;
  color LIME = #cddc39;
  color AMBER = #ffc107;
  color ORANGE = #ff9800;
  color RED = #e51c23;
  color PINK = #e91e63;
  color WHITE = #fafafa;
  color BLACK = #030303;
}

// Et element som automatisk har en funktion der tjekker for click og hover
// (hover og clicked kan bruges til styling af knappen)
abstract class GUIButton implements GUIElement {
  // Bruges til at finde ud af om der bliver klikket på knappen
  PVector pos, size;
  // Bruges til styling af knappen
  boolean clicked, hover;

  GUIButton(PVector pos, PVector size) {
    this.pos = pos;
    this.size = size;
  }

  // Tjekker om der er trykket på knappen samt hover og clicked state
  void checkForButtonPress() {
    // Retunere true hvis mussen er over knappen
    if (
      mouseX >= this.pos.x-(this.size.x/2) &&
      mouseX <= this.pos.x+(this.size.x/2) &&
      mouseY >= this.pos.y-(this.size.y/2) &&
      mouseY <= this.pos.y+(this.size.y/2)
      ) {
      if (!this.hover) {
        // Sætter hover til true da mussen er over knappen i if-statementet og ikke er sat til true endnu
        this.hover = true;
      }

      // Retunere true hvis knappen er klikket på
      if (mousePressed && !clicked) {
        this.clicked = true;
      }
    } else if (this.hover) {
      // Sætter hover til falsk hvis mussen bliver hovered over længere og det før var sandt
      this.hover = false;
    }
    
    // Retunere true hvis man har clicked og efter slipper mussen. Dette kalder onClick()
    if (!mousePressed && clicked) {
      this.clicked = false;
      this.onClick();
    }
  }

  // Skal implementeres a sub classes
  abstract void onClick();

  abstract void display();
}

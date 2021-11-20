// Dette er hvordan man laver et class diagram med Processing og java.
// Dette gøres ved brug af reflections
class Diagram implements GUIElement {
  Class[] classes;
  int page = 1;

  Diagram(PApplet app) {
    // Får alle vores classes vi selv har lavet (Udnytter hvordan processing er lavet)
    this.classes = app.getClass().getDeclaredClasses();
  }

  void replace() {
  }

  void display() {
    int x = 0;
    int xOffset = 150;

    textSize(15);

    if (classes.length > 0) {
      Class currentClass = classes[page-1];

      // Får all super classes fra vores nuværende class
      Object superclass = (Object) currentClass.getSuperclass();

      // Viser super class
      fill(GUIColors.BLACK);
      text(""+superclass, width/2+4-2, xOffset+(25*x)+4-2);
      fill(GUIColors.WHITE);
      text(""+superclass, width/2, xOffset+(25*x));

      // Sørger får mellemrum mellem sektionerne
      x += 2;

      // får alle interfaces fra vores nuværenden class
      Object[] interfaces = (Object[]) currentClass.getInterfaces();

      // Viser alle interfaces
      for (Object classInterface : interfaces) {
        fill(GUIColors.BLACK);
        text(""+classInterface, width/2+4-2, xOffset+(25*x)+4-2);
        fill(GUIColors.WHITE);
        text(""+classInterface, width/2, xOffset+(25*x));
        x++;
      }

      // får alle constructors fra vores nuværenden class
      Object[] constructors = (Object[]) currentClass.getDeclaredConstructors();

      // Viser alle constructors
      for (Object constructor : constructors) {
        fill(GUIColors.BLACK);
        text(""+constructor, width/2+4-2, xOffset+(25*x)+4-2);
        fill(GUIColors.WHITE);
        text(""+constructor, width/2, xOffset+(25*x));
        x++;
      }

      // Sørger får mellemrum mellem sektionerne
      x++;

      // får alle field fra vores nuværenden class
      Object[] fields = (Object[]) currentClass.getDeclaredFields();

      // Viser alle fields
      for (Object field : fields) {
        fill(GUIColors.BLACK);
        text(""+field, width/2+4-2, xOffset+(25*x)+4-2);
        fill(GUIColors.WHITE);
        text(""+field, width/2, xOffset+(25*x));
        x++;
      }

      // Sørger får mellemrum mellem sektionerne
      x++;

      // får alle metoder fra vores nuværenden class
      Object[] methods = (Object[]) currentClass.getDeclaredMethods();

      // Viser alle metoder
      for (Object method : methods) {
        fill(GUIColors.BLACK);
        text(""+method, width/2+2, xOffset+(25*x)+2);
        fill(GUIColors.WHITE);
        text(""+method, width/2, xOffset+(25*x));
        x++;
      }
    }
  }
}

// Alle copmonents der bruges til fiagram GUI'en (Se GUI og GUILayout)
class DiagramTitle extends TextShadowLayout {
  DiagramTitle() {
    super("CLASS DIAGRAM", new PVector(width/2, 65), 50);
  }
}

class DiagramNextPageButton extends ButtonLayout {
  DiagramNextPageButton() {
    super("NEXT", new PVector(width/2+160, height-75), new PVector(290, 85));
  }

  void onClick() {
    if (diagram.page < diagram.classes.length) {
      diagram.page++;
    }
  }
}

class DiagramPreviousPageButton extends ButtonLayout {
  DiagramPreviousPageButton() {
    super("BACK", new PVector(width/2-160, height-75), new PVector(290, 85));
  }

  void onClick() {
    if (diagram.page > 1) {
      diagram.page--;
    }
  }
}

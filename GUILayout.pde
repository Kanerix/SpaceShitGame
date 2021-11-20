// Components her kan blive extended og givet nogen få parameter og derefter
// lave ting som tekst skygge og knapper der ser ens ud.

// Ved nogen ting står der Dynamic string. Dette er fordi at lige nu understøtter components ikke dynamiske strings.

abstract class ButtonLayout extends GUIButton {
  String text;
  PVector pos, size;
  int fontSize;

  ButtonLayout(String text, PVector pos, PVector size) {
    super(pos, size);
    this.text = text;
    this.pos = pos;
    this.size = size;
    this.fontSize = 50;
  }

  ButtonLayout(String text, PVector pos, PVector size, int fontSize) {
    super(pos, size);
    this.text = text;
    this.pos = pos;
    this.size = size;
    this.fontSize = fontSize;
  }

  // Viser teksten
  void display() {
    this.checkForButtonPress();

    // Offset er hvor langt teksten Skal bevæge sig når man hover over knappen
    int offset = 0;
    color col = color(GUIColors.WHITE, 125);

    if (this.hover) {
      offset = 2;
      col = color(GUIColors.WHITE, 175);
    }

    stroke(GUIColors.BLACK);
    strokeWeight(5);
    fill(col);
    rect(this.pos.x, this.pos.y, this.size.x, this.size.y);
    
    textSize(this.fontSize);
    fill(GUIColors.BLACK);
    text(this.text, this.pos.x+4-offset, this.pos.y-3+4-offset);

    fill(GUIColors.WHITE);
    text(this.text, this.pos.x, this.pos.y-3-offset);
  }
}

abstract class TextShadowLayout implements GUIElement {
  String text;
  PVector pos;
  // Offset er hvor langt skyggen er fra teksten
  int fontSize, offset;

  TextShadowLayout(String text, PVector pos, int fontSize) {
    this.text = text;
    this.pos = pos;
    this.fontSize = fontSize;
    this.offset = 4;
  }

  TextShadowLayout(String text, PVector pos, int fontSize, int offset) {
    this.text = text;
    this.pos = pos;
    this.fontSize = fontSize;
    this.offset = offset;
  }

  void display() {
    textSize(this.fontSize);
    fill(GUIColors.BLACK);
    text(this.text, this.pos.x+this.offset, this.pos.y+this.offset);

    fill(GUIColors.WHITE);
    text(this.text, this.pos.x, this.pos.y);
  }
}

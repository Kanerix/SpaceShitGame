// Vores hindringer på banen
class Obstacle extends RectCollider implements GUIElement {
  Obstacle(PVector pos, PVector size, PVector vel) {
    super(pos, size, vel);
  }
  
  // Viser vores hindringer
  void display() {
    noStroke();
    fill(GUIColors.ORANGE);
    rect(this.pos.x, this.pos.y, this.size.x, this.size.y);
  }
}

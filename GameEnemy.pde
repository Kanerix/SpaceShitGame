// Fjende skibbet i spillet.
class EnemyShip extends CircleCollider implements GUIElement {
  // Dens fart
  float speed;

  EnemyShip() {
    super(new PVector(), 15, new PVector());
    this.speed = 4.2;
  }

  // Viser skibet
  void display() {
    strokeWeight(0);
    fill(GUIColors.RED);
    circle(this.pos.x, this.pos.y, this.radius*2);
  }
  
  // Flytter skibbet mod spillerenvoid start()
  void move() {
    if (game.ship.vel.mag() > 0) {
      // Sætter skibbet retning mod spillerens
      this.vel.set(PVector.sub(game.ship.pos, this.pos));

      // Sætter farten på skibbet
      this.vel
        .normalize()
        .mult(this.speed);

      // Tilføjer vores hastighed til skibbet
      this.pos.add(this.vel);
    }
  }
}

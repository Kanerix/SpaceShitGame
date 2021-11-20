// Bruges til at spiller skibbets movement
interface Movement {
  float MAX_SPEED = 10;
  float HORSE_POWER = 1.035f;
  float BREAK_POWER = 1.040f;
  float TURN_RATE = 0.07f;
  float FRICTION = 0.99f;
  float LOWEST_VEL = 1.5;
}

// Vores spiller skib i spillet
class SpaceShip extends CircleCollider implements Movement, GUIElement {
  // Bruges til at sætte hvilken vej skibet skal og om den skal dreje
  boolean moveForward, moveBackwards, rotateRight, rotateLeft;

  // Skibbets binds. Standard sat til WASD.
  int forwardKey = 87;
  int backwardsKey = 83;
  int rightKey = 68;
  int leftKey = 65;

  SpaceShip() {
    super(new PVector(), 15, new PVector());
  }

  // Viser selve skibbet
  void display() {
    fill(255);
    strokeWeight(0);
    circle(this.pos.x, this.pos.y, this.radius*2);
  }

  // Flytter skibbet
  void move() {
    // Flytter skibet fremad
    if (moveForward) {
      // Hvis spilleren lige er spawned er vel = 0 og dette giver spilleren et boost i en valgt retning
      if (vel.mag() == 0) {
        vel.set(0, LOWEST_VEL*-1);
      }

      // Adder fart til skibbets hastihed
      else if (vel.mag() < MAX_SPEED) {
        vel.mult(HORSE_POWER);
      }
    }

    // Bremser skibet fremad
    if (moveBackwards) {
      // Hvis spilleren lige er spawned er vel = 0 og dette giver spilleren et boost i en valgt retning
      if (vel.mag() == 0) {
        vel.set(0, LOWEST_VEL);
      }

      // Tager fart fra skibbets hastihed
      else if (vel.mag() > LOWEST_VEL) {
        vel.div(BREAK_POWER);
      }
    }

    // Rotere skibet til højrer
    if (rotateRight) {
      // Hvis spilleren lige er spawned er vel = 0 og dette giver spilleren et boost i en valgt retning
      if (vel.mag() == 0) {
        vel.set(LOWEST_VEL, 0);
      }

      // Rotere skibet til højrer via vores hastigheds vektor
      vel.rotate(TURN_RATE);
    }

    // Rotere skibet til venstre
    if (rotateLeft) {
      // Hvis spilleren lige er spawned er vel = 0 og dette giver spilleren et boost i en valgt retning
      if (vel.mag() == 0) {
        vel.set(LOWEST_VEL*-1, 0);
      }

      vel.rotate(TURN_RATE*-1);
    }

    // Rotere skibet til venstre via vores hastigheds vektor
    if (vel.mag() > LOWEST_VEL) {
      vel.mult(FRICTION);
    }

    pos.add(vel);
  }
}

// Skal nedarves af objekter der skal bruge collision.
abstract class RectCollider {
  // Bruges til at udregne collision
  PVector pos, size, vel;

  RectCollider(PVector pos, PVector size, PVector vel) {
    this.pos = pos;
    this.size = size;
    this.vel = vel;
  }

  // Hvis rektanglen er ude fra banen
  boolean rectBoundary() {
    return (
      this.pos.x > width-(size.x/2) ||
      this.pos.x < size.x/ 2 ||
      this.pos.y > height-(size.y/2) ||
      this.pos.y < size.y/2);
  }


  // Hvis rektanglen rammer rektanglen T. Generic for at man kan puttet en class som har nedarvet en collider ind som parameter
  <T extends RectCollider> boolean rectRect(T rect) {
    PVector rectOneSize = rect.size;
    PVector rectOnePos = rect.pos;

    PVector rectTwoSize = this.size;
    PVector rectTwoPos = this.pos;

    return (
      rectOnePos.x+(rectOneSize.x/2) >= rectTwoPos.x-(rectTwoSize.x/2) &&
      rectOnePos.x-(rectOneSize.x/2) <= rectTwoPos.x+(rectTwoSize.x/2) &&
      rectOnePos.y+(rectOneSize.y/2) >= rectTwoPos.y-(rectTwoSize.x/2) &&
      rectOnePos.y-(rectOneSize.y/2) <= rectTwoPos.y+(rectTwoSize.y/2));
  }

  // Hvis rektanglen rammer circlen T. Generic for at man kan puttet en class som har nedarvet en collider ind som parameter
  <T extends CircleCollider> boolean rectCircle(T circle) {
    PVector circlePosition = circle.pos;
    float radius = circle.radius;

    PVector rectSize = this.size;
    PVector rectPosition = this.pos;

    PVector edge = circlePosition.copy();

    if (circlePosition.x < rectPosition.x-(rectSize.x/2)) {
      edge.x = rectPosition.x-(rectSize.x/2);
    } else if (circlePosition.x > rectPosition.x + (rectSize.x/2)) {
      edge.x = rectPosition.x+(rectSize.x/2);
    }

    if (circlePosition.y < rectPosition.y-(rectSize.y/2)) {
      edge.y = rectPosition.y-(rectSize.y / 2);
    } else if (circlePosition.y > rectPosition.y+(rectSize.y/2)) {
      edge.y = rectPosition.y+(rectSize.y/2);
    }

    float distance = PVector.dist(circlePosition, edge);

    return (distance <= radius);
  }
}

// Skal nedarves af objekter der skal bruge collision.
abstract class CircleCollider {
  // Bruges til at udregne collision
  PVector pos, vel;
  int radius;

  CircleCollider(PVector pos, int radius, PVector vel) {
    this.pos = pos;
    this.radius = radius;
    this.vel = vel;
  }

  // Hvis circlen er ude af banen
  boolean circleBoundary() {
    return (
      this.pos.x > width-radius ||
      this.pos.x < radius ||
      this.pos.y > height-radius ||
      this.pos.y < radius);
  }

  // Hvis circlen rammer cirklen T. Generic for at man kan puttet en class som har nedarvet en collider ind som parameter
  <T extends CircleCollider> boolean circleCircle(T circle) {
    float distance = PVector.dist(this.pos, circle.pos);

    return (distance <= this.radius+circle.radius);
  }

  // Hvis cirklen rammer rektanglen T. Generic for at man kan puttet en class som har nedarvet en collider ind som parameter
  <T extends RectCollider> boolean circleRect(T rect) {
    PVector circlePosition = this.pos;
    float radius = this.radius;

    PVector rectSize = rect.size;
    PVector rectPosition = rect.pos;

    PVector edge = circlePosition.copy();

    if (circlePosition.x < rectPosition.x-(rectSize.x/2)) {
      edge.x = rectPosition.x-(rectSize.x/2);
    } else if (circlePosition.x > rectPosition.x+(rectSize.x/2)) {
      edge.x = rectPosition.x+(rectSize.x/2);
    }

    if (circlePosition.y < rectPosition.y-(rectSize.y/2)) {
      edge.y = rectPosition.y-(rectSize.y/2);
    } else if (circlePosition.y > rectPosition.y + (rectSize.y/2)) {
      edge.y = rectPosition.y+(rectSize.y/2);
    }

    float distance = PVector.dist(circlePosition, edge);

    return (distance <= radius);
  }
}

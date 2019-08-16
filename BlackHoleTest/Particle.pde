// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Thank you Chris Orban!
// https://www.asc.ohio-state.edu/orban.14/stemcoding/blackhole.html

class Particle {

  PVector position;
  PVector velocity;
  PVector acceleration;
  ArrayList<PVector> trail;
  float mass;

  Particle(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector(0, -c);
    acceleration = new PVector(0, 0);
    this.trail = new ArrayList<PVector>();
    mass = 1;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  boolean isDone() {
    if (position.y <= 0 || position.x <= 0) return true;
    if (position.y >= height || position.x >= width) return true;
    return false;
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(c);
    position.add(velocity);
    if (this.trail.size() > 20) this.trail.remove(0);
    this.trail.add(position.copy());
    acceleration.mult(0);
  }

  void drawTrail() {
    noFill();
    strokeWeight(1);
    beginShape();
    for (PVector p : this.trail) {
      vertex(p.x, p.y);
    }
    endShape();
  }

  void display() {
    drawTrail();
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(position.x, position.y, 2, 2);
  }
}

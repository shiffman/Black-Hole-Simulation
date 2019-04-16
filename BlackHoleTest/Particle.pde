// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Thank you Chris Orban!
// https://www.asc.ohio-state.edu/orban.14/stemcoding/blackhole.html

class Particle {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;

  Particle(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector(0, -c);
    acceleration = new PVector(0, 0);
    mass = 1;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(c);
    position.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(position.x, position.y, 2, 2);
        
  }
}

// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Thank you Chris Orban!
// https://www.asc.ohio-state.edu/orban.14/stemcoding/blackhole.html

final int c = 5;

class Blackhole {
  float mass;    // Mass, tied to size
  float G;       // Gravitational Constant
  PVector position;   // position

  Blackhole(float x, float y) {
    position = new PVector(x, y);
    mass = 100;
    G = 10;
  }

  PVector attract(Particle m) {
    PVector force = PVector.sub(position, m.position);   // Calculate direction of force
    float d = force.mag();                              // Distance between objects
    // d = constrain(d, 5.0, 25.0);                          // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                  // Normalize vector (distance doesn't matter here, we just want this vector for direction)
    float strength = (G * mass * m.mass) / (d * d);     // Calculate gravitional force magnitude
    force.mult(strength);     // Get force vector --> magnitude * direction
    return force;
  }

  // Method to display
  void display() {
    ellipseMode(CENTER);
    strokeWeight(1);
    stroke(0);
    ellipse(position.x, position.y, 2, 2);

    float er = (2 * G * mass) / (c * c);
    println(er);
    noFill();
    stroke(0);
    ellipse(position.x, position.y, er * 2, er * 2);
  }
}

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
  PVector cur_force;

  Particle(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector(0, -c);
    acceleration = new PVector(0, 0);
    mass = 1;
  }

  void applyForce(PVector force) {
    cur_force = force;
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
    //mapColor(cur_force);
    fill(255,0,0);
    ellipse(position.x, position.y, 3, 3);  // size 3 is good.
        
  }
  
  // Map the colours of the particles depending on the foce experienced by them.
  void mapColor(PVector force){
    
    float mag = sqrt(pow(force.x, 2) + pow(force.y, 2));
    noStroke();
    int col = int(map(mag, 0, 255, pow(10,-1), pow(10,-6)));
    println(mag, col);
    fill(col, 0,0);
  }
}

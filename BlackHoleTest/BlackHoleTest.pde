// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Thank you Chris Orban!
// https://www.asc.ohio-state.edu/orban.14/stemcoding/blackhole.html

Particle[] particles;
Blackhole b;

void setup() {
  size(640, 640);
  b = new Blackhole(320, 100);
  particles = new Particle[100];
  for (int i = 0; i < 100; i++) {
    particles[i] = new Particle(random(width), 600);
  }
}

void draw() {
  background(255);

  for (Particle p : particles) {
    if (isNear(p.position.x, b.position.x, 4) && isNear(p.position.y, b.position.y, 4)){
      // delete the particle that is too close to the black hole.
      // Not sure how to delete but can just skip everything that uses time.
      continue;
    }
    PVector force = b.attract(p);
    p.applyForce(force);
    p.update();

    p.display();

  }
  // moving the blackhole draw so it dosent get drawn for every particle.
  b.display();
}

boolean isNear(float test_val, float near_val, float tol){
    float dist = abs(test_val - near_val);
    if (dist >= tol){
      return false;
    }else{
     return true; 
    }
  }

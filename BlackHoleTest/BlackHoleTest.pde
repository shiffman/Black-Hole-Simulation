// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Thank you Chris Orban!
// https://www.asc.ohio-state.edu/orban.14/stemcoding/blackhole.html

ArrayList<Particle> particles;
Blackhole b;

void setup() {
  size(640, 640);
  b = new Blackhole(320, height / 2);
  particles = new ArrayList<Particle>(100);
  for (int i = 0; i < 100; i++) {
    particles.add(new Particle(random(width), 600));
  }
}

void mousePressed() {
  this.particles.add(new Particle(mouseX, mouseY));
}

void draw() {
  background(255);
  b.display();
  for (int i = particles.size() - 1; i >= 0; i--) {
    Particle p = particles.get(i);
    if (p.isDone()) particles.remove(i);
    else {
      PVector force = b.attract(p);
      p.applyForce(force);
      p.update();
      p.display();
    }
  }
}

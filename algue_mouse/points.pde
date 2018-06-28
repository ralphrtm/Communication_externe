class points {
  float lifeSpan, alpha;
  PVector pos, vel;

  boolean alive; 

  color col = color(random(100), random(100, 170), random(100));

  points() {
    pos = new PVector(random(width), random(height));
    vel = new PVector(0, 0);
    alive = true;
    lifeSpan = 300;
    alpha = 10;
  }

  void display() {
    if (alpha == 255) alpha -= 3;
    else alpha += 1;
    
    lifeSpan -= 2;

    noStroke();
    fill(210, 92, 150);
    ellipse(mouseX, mouseY, 10, 10);

    if (mousePressed) {
      noStroke();
      fill(210, 92, 150);
      ellipse(mouseX, mouseY, 10, 10);
      vel.add(PVector.sub(pos, new PVector(mouseX, mouseY)));
      vel.setMag(3);
    } else {
      noStroke();
      fill(150, 210, 98);
      ellipse(mouseX, mouseY, 10, 10);
      vel.add(PVector.sub(new PVector(mouseX, mouseY), pos));
      vel.setMag(2);
    }

    pos.add(vel);

    noStroke();
    fill(col, alpha);
    ellipse(pos.x, pos.y, 50, 50);

    if (lifeSpan < 0) {
      alive = false;
    }
  }
}

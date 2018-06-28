class root {
  PVector location, velocity;
  float radius;
  float angle, angleOff = random(500);
  float x, y, z;
  color c1;
  color c2;
  color col;
  float colOff;
  float distance;

  boolean checkRadius = true;

  root(PVector _location, float dis) {
    location = _location;
    radius = random(50,62);
    c1 = color(0, 204, 51);
    c2 = color(255, 204, 102);
    col = lerpColor(c1, c2, map(dis, 0, 100, 1, 0));
    distance = dis;
  }

  void update() {
    colOff += 0.1;
    angleOff += random(0.02);
    angle = noise(angleOff) * TWO_PI*2; 

    x = cos(angle);
    y = sin(angle);

    velocity = new PVector(x, y);
    velocity.setMag(2);

    location.add(velocity);

    noStroke();
    
    fill(lerpColor(col, color(80), map(radius, 0, 80, 1, 0)));

    radius -= random(0.5);

    if (radius < 0.5) {
      checkRadius = false;
    }

    ellipse(location.x, location.y, radius, radius);
  }
}

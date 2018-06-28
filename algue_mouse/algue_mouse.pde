ArrayList<points> pointSys;

void setup() {
  background(0);
  size(700, 700);
  noCursor();
  //fullScreen();
  pointSys = new ArrayList<points>();
  pointSys.add(new points());
}

void draw() {
  if (random(0, 1) < 0.1) {
    pointSys.add(new points());
  }

  for (int i = 0; i < pointSys.size(); i++) {
    points p = pointSys.get(i);
    p.display();
    if (p.alive == false) {
      pointSys.remove(i);
    }
  }

  fill(color(0), 10);
  rect(0, 0, width, height);
}

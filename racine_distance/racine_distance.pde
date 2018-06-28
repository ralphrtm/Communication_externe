  import processing.serial.*;

Serial port;

ArrayList<root> pathfinder;
float distance;
int dis;

void setup() {
  size(1000, 1000, P3D);
  background(0);
  port = new Serial(this, Serial.list()[0], 9600);

  pathfinder = new ArrayList<root>();
  pathfinder.add(new root(new PVector(width/2, height/2), 62));
}

void draw() {
  if (0 < port.available()) {
    dis = port.read();
    println("Distance", dis);
  }

  for (int i = 0; i < pathfinder.size(); i++) {
    root p = pathfinder.get(i);
    p.update();

    if (p.checkRadius == false) {
      pathfinder.remove(i);
    }
  }

  if (random(0, 1) < 0.05) {
    pathfinder.add(new root(new PVector(width/2, height/2), dis));
  }
}

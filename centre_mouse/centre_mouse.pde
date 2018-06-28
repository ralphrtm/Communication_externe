ArrayList<PVector> listPosIni;
ArrayList<Particle> particles;

PVector mouse;

int radius = 30;

void setup() {
  //fullScreen();
  size(900, 900);

  listPosIni = new ArrayList<PVector>();
  particles = new ArrayList<Particle>();

  for (int y = 0; y <= height; y += radius) {
    for (int x = 0; x <= width; x += radius) {
      listPosIni.add(new PVector(x, y));
      particles.add(new Particle(new PVector(x, y)));
    }
  }
}

void draw() {  
  background(0);

  mouse = new PVector(mouseX, mouseY);

  for (int i = 0; i < listPosIni.size(); i++) {
    Particle p = particles.get(i);
    p.update(mouse, listPosIni.get(i), i); 
    p.display();
  }
}

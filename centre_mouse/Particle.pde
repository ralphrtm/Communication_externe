class Particle {
  PVector position;

  Particle(PVector _position) {
    position = _position;
  }

  color col() {
    PVector distance = PVector.sub(mouse, position);
    float valCol = map(distance.mag(), 0, max(width, height), 0, 1);
    //println(valCol);
    color col = lerpColor(0, 255, valCol); 
    return col;
  }

  void display() {
    PVector distance = PVector.sub(mouse, position);
    float depth = map(distance.mag(), 0, max(width, height), 0, radius*1.5);
    noStroke();
    fill(col());
    ellipse(position.x, position.y, depth, depth);
  }

  void update(PVector mouse, PVector posIni, int i) {

    PVector target = PVector.sub(mouse, posIni);
    target.setMag(radius);

    position.set(posIni);
    position.add(target);

    /*println("CentreParticle", i, " ", posIni);
    println("Direction", target.mag(), target);
    println("PositionParticle", i, position);      
    println(" ");*/
  }
}

class Ball {
  PVector pos;
  PVector vel;

  float elasticity;
  int radius;
  color hue;

  Ball (PVector tpos, PVector tvel, float tel, int tr, color thue) {
    pos = tpos;
    vel = tvel;
    elasticity = tel;
    radius = tr;
    hue = thue;
  }

  void update() {
    vel.y += gravity;
    pos.y += vel.y;
    pos.x += vel.x;
    
    //Wall bouncing 
    if (pos.y > height - 20) {
      pos.y = height - 20;
      vel.y *= -elasticity;
    } 
    if (pos.y < 0) {
      pos.y = 1;
      vel.y *= -elasticity;
    }

    if (pos.x > width) {
      pos.x = width;
      vel.x *= -elasticity;
    } else if (pos.x < 0) {
      pos.x = 0;
      vel.x *= -elasticity;
    }
  }

  void disp() {
    fill(hue);
    ellipse(pos.x, pos.y, radius, radius);
  }
}
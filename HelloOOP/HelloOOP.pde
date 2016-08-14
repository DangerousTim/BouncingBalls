/* Bouncing balls */

float gravity = 0.4;
int numballs = 10;  //More than 2000 and your program may crash

Ball[] ball = new Ball[numballs];

PVector dist;

void setup() {
  size(50, 200);
  for (int i = 0; i < numballs; i++) {
    ball[i] = new Ball(new PVector(random(width), random(height-30)), 
      new PVector(random(-4, 4), random(-4, 4)), .8, 10, 
      color(random(255), random(255), random(255)));
  }
}
void draw() {
  background(100, 100, 230);
  for (int i = 0; i < numballs; i++) {

    for (int j = 0; j < numballs && j != i; j++) {  //check for collision
      if (collide(ball[i], ball[j])) {

        ball[i].pos = PVector.add(ball[j].pos, dist); //position check: Ensure all balls' are positions clearly defined

        if (abs(ball[i].vel.mag()) > .1 && abs(ball[j].vel.mag()) > .1) { //to let balls act normal when stacking over each other
          exchangevel(ball[i], ball[j]); //There must be a better solution to this
        }
      }
    }

    ball[i].update();
    ball[i].disp();
  }
}

boolean collide(Ball b1, Ball b2) {
  dist = PVector.sub(b1.pos, b2.pos);

  if (dist.mag() < b1.radius) {
    dist.setMag(b1.radius);
    return true;
  } else return false;
}

//simple 10th grade physics
void exchangevel(Ball b1, Ball b2) {
  PVector tempv;
  tempv = b1.vel;
  b1.vel = b2.vel;
  b2.vel = tempv;
}
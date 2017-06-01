Window x = new Window(9.8);
Ball a = new Ball(100, 400, 5, x.gravity);

void setup() {
  size(500,500);
  frameRate(60);
}

void draw() {
  background(50,10,30);
  a.recalculate();
  a.make();
  if(a.location.y > 500) {
    a.location.y = 400;
    a.location.x = 100;
    a.velocity.y = -10;
    a.velocity.x = 5;
  }
}
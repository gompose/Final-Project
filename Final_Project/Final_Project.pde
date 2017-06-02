public Window x;

void setup() {
  frameRate(60);
  x = new Window(400, 400, 9.8);
  size(500, 500);
  x.makeBall(200, 10, 10);
  
}

void draw() {
  background(50,10,30);
  x.constrict();
  x.recalculateAll();
  x.makeAll();
}
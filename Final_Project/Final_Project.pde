public Window x;
public PVector mouseInitialHolder = new PVector(0,0);
public PVector mouseEndHolder = new PVector(0,0);
public PVector mouseResultant;
public boolean isInteracting = false;
public PVector testVector;

void setup() {
  frameRate(60);
  x = new Window(750, 430, 9.8);
  size(750, 430);
  x.makeBall(200, 10, 10);
  testVector = new PVector(10, -10);
  x.makeBall(150, 200, testVector, 10);
}

void draw() {
  background(50,10,30);
  x.constrict();
  x.recalculateAll();
  x.makeAll();
  
}

void mousePressed() {
  mouseInitialHolder = new PVector(mouseX, mouseY);
}
void mouseReleased() {
  mouseEndHolder = new PVector(mouseX, mouseY);
  x.makeBall(floor(mouseInitialHolder.x), floor(mouseInitialHolder.y), mouseEndHolder.sub(mouseInitialHolder), 10);
}
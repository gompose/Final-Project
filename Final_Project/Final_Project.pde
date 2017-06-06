public Window x;
public int mouseXHolder;
public PVector mouseInitialHolder;
public PVector mouseEndHolder;

void setup() {
  frameRate(60);
  x = new Window(750, 430, 9.8);
  size(750, 430);
  x.makeBall(200, 10, 10);
  
}

void draw() {
  background(50,10,30);
  x.constrict();
  x.recalculateAll();
  x.makeAll();
}

void mouseClicked() {
  mouseInitialHolder = new PVector(mouseX, mouseY);
}
void mouseReleased() {
  mouseEndHolder = new PVector(mouseX, mouseY);
}
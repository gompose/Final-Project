import java.util.*;
ArrayList<DynamicObject> everyDynamic;
Window x;
Ball a;
int xMax;
int yMax;
void setup() {
  xMax = 500;
  yMax = 500;
  everyDynamic = new ArrayList<DynamicObject>();
  size(xMax,yMax);
  frameRate(60);
  x = new Window(9.8);
  a = new Ball(100, 400, 5, x.gravity);
  everyDynamic.add(a);
}

void draw() {
  background(50,10,30);
  a.constrict();
  a.recalculate();
  a.make();
  /*if(a.location.y > 500) {
    a.location.y = 400;
    a.location.x = 100;
    a.velocity.y = -10;
    a.velocity.x = 5;
  }
  */
}
void constrict() {
// Keeps all objects on screen. Bounces if they hit the edge
  int index = 0;
  for(int index = 0; index < everyDynamic.size(); index++) {
    if(everyDynamic.get(index).location.x >= xMax || everyDynamic.get(index).location.x <= 0) {
      bounceHorizontal(everyDynamic.get(index));
    }
    if(everyDynamic.get(index).location.y >= yMax || everyDynamic.get(index).location.y <= 0) {
      bounceVertical(everyDynamic.get(index));
    }    
  }
}

void bounceVertical(DynamicObject obj) {
  obj.velocity.y = obj.velocity.y * -1.0;
}
void bounceHorizontal(DynamicObject obj) {
  obj.velocity.x = obj.velocity.x * -1.0;
}
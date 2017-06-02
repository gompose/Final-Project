import java.util.*;

public class Window {
 //-----------------> Instant Variables
 public float gravity; //effects downward Acceleration
 public ArrayList<DynamicObject> everyDynamic;
 public int xMax;// Size of Screen
 public int yMax;// Size of Screen
 //-----------------> Constructors
 public Window () {
   xMax = 500;
   yMax = 500;
   gravity = 9.8;
   everyDynamic = new ArrayList<DynamicObject>();
 }
 public Window (int _xMax, int _yMax, float _gravity) {
   xMax = _xMax;
   yMax = _yMax;
   gravity = _gravity;
   everyDynamic = new ArrayList<DynamicObject>();
 }
 //----------------> Object Maker Methods
 public void makeBall(int x, int y, int _radius) {
   // Creates a ball object, and adds it to everyDynamic.
   Ball a = new Ball(x, y, _radius, gravity);
   everyDynamic.add(a);
 }
 
 //----------------> Control/Manipulate Methods
 public void recalculateAll() {
   // calls recalculate for every object in everyDynamic
   for(int index = 0; index < everyDynamic.size(); index++) {
     everyDynamic.get(index).recalculate();
     System.out.println(everyDynamic.get(index).velocity.y);
     
   }
 }
 public void makeAll() {
   // calls make for every object in everyDynamic
   for(int index = 0; index < everyDynamic.size(); index++) {
     everyDynamic.get(index).make();
   }
 }
 public void constrict() { 
  // Keeps all objects on screen. Bounces if they hit the edge
  for(int index = 0; index < everyDynamic.size(); index++) {
    if(everyDynamic.get(index).location.x >= xMax || everyDynamic.get(index).location.x <= 0) {
      bounceHorizontal(everyDynamic.get(index));
    }
    if(everyDynamic.get(index).location.y >= yMax || everyDynamic.get(index).location.y <= 0) {
      bounceVertical(everyDynamic.get(index));
    }
  }
 }
 public void bounceVertical(DynamicObject obj) {
   if(obj.velocity.y < 0.001) {
     obj.velocity.y = 0;
   }
   obj.velocity.y = obj.velocity.y * -1.0;
 }
 public void bounceHorizontal(DynamicObject obj) {
   if(obj.velocity.x < 0.001) {
     obj.velocity.x = 0;
   }
    obj.velocity.x = obj.velocity.x * -1.0;
 }
}
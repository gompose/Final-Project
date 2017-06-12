import java.util.*;

public class Window {
 //-----------------> Instant Variables
 public float gravity; //effects downward Acceleration
 public ArrayList<DynamicObject> everyDynamic;
 public int xMax;// Size of Screen
 public int yMax;// Size of Screen
 public float scale; // Scale of everything.
 //-----------------> Constructors
 public Window () {
   xMax = 500;
   yMax = 500;
   scale = 0.1;
   gravity = 9.8;
   everyDynamic = new ArrayList<DynamicObject>();
 }
 public Window (int _xMax, int _yMax, float _gravity) {
   xMax = _xMax;
   yMax = _yMax;
   scale = 0.1;
   gravity = _gravity;
   everyDynamic = new ArrayList<DynamicObject>();
 }
 //----------------> Object Maker Methods
 public void makeBall(int x, int y, int _radius) {
   // Creates a ball object, and adds it to everyDynamic.
   Ball a = new Ball(x, y, _radius, gravity * scale);
   everyDynamic.add(a);
 }
 public void makeBall(int x, int y, PVector xyVelocity, int _radius) {
   // Creates a ball object, and imbues it with initial xy velocity
   Ball a = new Ball(x, y, xyVelocity.x * scale, xyVelocity.y * scale, _radius, gravity * scale);
   everyDynamic.add(a);
 }
 
 //----------------> Control/Manipulate Methods
 public void recalculateAll() {
   // calls recalculate for every object in everyDynamic
   for(int index = 0; index < everyDynamic.size(); index++) {
     everyDynamic.get(index).recalculate();
     // -- Temporary Bandaid --<>
     if(everyDynamic.get(index).location.y >= yMax) {
       everyDynamic.get(index).acceleration.y = 0;
     } else {
       everyDynamic.get(index).acceleration.y = gravity * scale;
     }
     // -- Temporary Bandaid -- Detects collision with floor, and sets acceleration to 0. Need to create a 
     //Collision Detection
   }
   
   //Implement here:
   //BROKEN! Index out of bounds exception.
   /*for(int index = 0; index < everyDynamic.size(); index++) {
     for(int index2 = 0; index < everyDynamic.size(); index2++) {
       if (index != index2) {
         if (isColliding(everyDynamic.get(index), everyDynamic.get(index2))){
           bounce(everyDynamic.get(index), everyDynamic.get(index2));
         }
       }
     }
   }
   */
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
   obj.velocity.y = obj.velocity.y * -1.0; //Dividing causes ball to fall out of world
 }
 public void bounceHorizontal(DynamicObject obj) {
   obj.velocity.x = obj.velocity.x * -1.0;
 }
 public boolean isColliding(DynamicObject obj1, DynamicObject obj2) {
   boolean truthFactorX = false;
   boolean truthFactorY = false;
   int obj1UpperX = floor(obj1.location.x) + obj1.radius;
   int obj1LowerX = floor(obj1.location.x) - obj1.radius;
   int obj1UpperY = floor(obj1.location.y) + obj1.radius;
   int obj1LowerY = floor(obj1.location.y) - obj1.radius;
   if(obj1UpperX >= floor(obj2.location.x) - obj2.radius) {
     truthFactorX = true;
   }
   if (obj1LowerX <= floor(obj2.location.x) + obj2.radius) {
     truthFactorX = true;
   }
   if (obj1UpperY >= floor(obj2.location.y) - obj2.radius) {
     truthFactorY = true;
   }
   if (obj1LowerY <= floor(obj2.location.y) + obj2.radius) {
     truthFactorY = true;
   }
   return truthFactorX && truthFactorY;
 }
 public void bounce(DynamicObject obj1, DynamicObject obj2){
   obj1.velocity.x = obj1.velocity.x * -1;
   obj1.velocity.y = obj1.velocity.y * -1;
   obj2.velocity.x = obj2.velocity.x * -1;
   obj2.velocity.y = obj2.velocity.y * -1;
 }
}
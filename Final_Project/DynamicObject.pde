public abstract class DynamicObject  {
  public PVector location;
  public PVector velocity;
  public PVector acceleration;
  public int heading; //Angle of direction, compared to a horizontal base line.
  
  public abstract void make(); // Draws the object;
  public abstract void recalculate(); // Calculates the next position of object
  
}
public class Ball extends DynamicObject {
  public int radius;
  public float gravity;
  public float scale;
  public Ball (int x, int y, int _radius, float _gravity) {
    location = new PVector(x, y);
    radius = _radius;
    gravity = _gravity;
    velocity = new PVector(0.0, 0.0);
    scale = 0.1;
    acceleration = new PVector(0, gravity * scale);
  }
  public Ball (int x, int y, float _gravity) {
    location = new PVector(x, y);
    radius = 5;
    gravity = _gravity;
    velocity = new PVector(0.0, 0.0);
    scale = 0.1;
    acceleration = new PVector(0.0, gravity * scale);
  }
  public void make() {
    ellipse(location.x, location.y, radius, radius);
  }
  public void recalculate() {
    velocity = velocity.add(acceleration);
    location = location.add(velocity);
  }
}
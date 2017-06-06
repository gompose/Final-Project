public class Ball extends DynamicObject {
  public int radius;
  public float gravity;
  public Ball (int x, int y, float _xVelocity, float _yVelocity, int _radius, float _gravity) {
    location = new PVector(x, y);
    radius = _radius;
    gravity = _gravity;
    velocity = new PVector(_xVelocity, _yVelocity);
    acceleration = new PVector(0, gravity);
  }
  public Ball (int x, int y, int _radius, float _gravity) {
    location = new PVector(x, y);
    radius = _radius;
    gravity = _gravity;
    velocity = new PVector(0.0, 0.0);
    acceleration = new PVector(0, gravity);
  }
  public Ball (int x, int y, float _gravity) {
    location = new PVector(x, y);
    radius = 5;
    gravity = _gravity;
    velocity = new PVector(0.0, 0.0);
    acceleration = new PVector(0.0, gravity);
  }
  public void make() {
    ellipse(location.x, location.y, radius, radius);
  }
  public void recalculate() {
    velocity = velocity.add(acceleration);
    location = location.add(velocity);
  }
}
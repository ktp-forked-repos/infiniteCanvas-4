public class Vec2
{
  public double x,y;
  
  public Vec2(double x, double y)
  {
    this.x = x; this.y = y;
  }
  
  public void Translate(double x, double y)
  {
    this.x += x; this.y += y;
  }
  
  public void Translate(Vec2 v)
  {
    this.x += v.x; this.y += v.y;
  }
  
  public Vec2 add(double x, double y)
  {
    return new Vec2(this.x + x, this.y + y);
  }
  
  public Vec2 add(Vec2 v)
  {
    return new Vec2(this.x + v.x, this.y + v.y);
  }
  
  public Vec2 sub(double x, double y)
  {
    return new Vec2(this.x - x, this.y - y);
  }
  
  public Vec2 sub(Vec2 v)
  {
    return new Vec2(this.x - v.x, this.y - v.y);
  }
  
  public Vec2 mul(double factor)
  {
    return new Vec2(this.x * factor, this.y * factor);
  }
  
  public Vec2 mul(Vec2 v)
  {
    return new Vec2(this.x * v.x, this.y * v.y);
  }
  
  public Vec2 div(double factor)
  {
    return new Vec2(this.x / factor, this.y / factor);
  }
  
  public Vec2 div(Vec2 v)
  {
    return new Vec2(this.x / v.x, this.y / v.y);
  }
  
  public String toString()
  {
    return "VEC2 (" + x + "," + y + ")";
  }
}

public class Vec2Float
{
  public float x,y;
  
  public Vec2Float(float x, float y)
  {
    this.x = x; this.y = y;
  }
  
  public void Translate(float x, float y)
  {
    this.x += x; this.y += y;
  }
  
  public void Translate(Vec2 v)
  {
    this.x += v.x; this.y += v.y;
  }
  
  public Vec2Float add(float x, float y)
  {
    return new Vec2Float(this.x + x, this.y + y);
  }
  
  public Vec2Float add(Vec2Float v)
  {
    return new Vec2Float(this.x + v.x, this.y + v.y);
  }
  
  public Vec2Float sub(float x, float y)
  {
    return new Vec2Float(this.x - x, this.y - y);
  }
  
  public Vec2Float sub(Vec2Float v)
  {
    return new Vec2Float(this.x - v.x, this.y - v.y);
  }
  
  public Vec2Float mul(float factor)
  {
    return new Vec2Float(this.x * factor, this.y * factor);
  }
  
  public Vec2Float mul(Vec2Float v)
  {
    return new Vec2Float(this.x * v.x, this.y * v.y);
  }
  
  public Vec2Float div(float factor)
  {
    return new Vec2Float(this.x / factor, this.y / factor);
  }
  
  public Vec2Float div(Vec2Float v)
  {
    return new Vec2Float(this.x / v.x, this.y / v.y);
  }
  
  public String toString()
  {
    return "VEC2Float (" + x + "," + y + ")";
  }
}

class Camera
{
  public Vec2 position;
  public double zoom;
  
  public Camera(Vec2 position, double zoom)
  {
    this.position = position;
    this.zoom = zoom;
  }
  
  public Vec2 worldToScreenPoint(Vec2 position)
  {
    Vec2 offsetPosition = position.add(this.position);
    return new Vec2((offsetPosition.x * zoom + 0.5) * width, (offsetPosition.y * zoom - 0.5 / aspectRatio) * height * aspectRatio * -1 /*invert axis*/);
  }
  
  public Vec2 screenToWorldPos(Vec2 position)
  {
    return new Vec2((position.x - width / 2) / zoom / width, (position.y - height / 2) / zoom / height / aspectRatio * -1).add(this.position.mul(-1));
  }
  
  public Vec2 screenToWorldPos(int x, int y)
  {
    return screenToWorldPos(new Vec2(x, y));
  }
  
  public double getRange()
  {
    return Math.pow(this.zoom, -1);
  }
  
  public void zoomIn(double factor)
  {
    this.zoom *= factor;
  }
  
  public void zoomOut(double factor)
  {
    this.zoom /= factor;
  }
  
  public void move(Vec2 value)
  {
    this.position = this.position.add(value);
  }
  
  public void moveRelative(Vec2 value) //relative to zoom
  {
    Vec2 relValue = value.mul(getRange());
    this.position = this.position.add(relValue);
  }
}
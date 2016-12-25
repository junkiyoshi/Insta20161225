
class Pole
{
  Body body;
  
  float x, y;
  float w, h;
  
  Pole(float x_, float y_)
  {
    x = x_;
    y = y_;
    w = 10;
    h = 10;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    body = box2d.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w / 2);
    float box2dH = box2d.scalarPixelsToWorld(h / 2);
    ps.setAsBox(box2dW,box2dH);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 0;
    fd.friction = 0.5;
    fd.restitution = 0.8;
    
    body.createFixture(fd);
    
    body.setLinearVelocity(new Vec2(random(-1, 1), 0));
  }
  
  void display()
  {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(128);
    noStroke();
    rect(0, 0, w, h);
    popMatrix();
  }
}
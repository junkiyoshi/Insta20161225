class Wing
{
  Body body;
  
  float x, y;
  float size = 200;
  PolygonShape ps;
  
  Wing(float x_, float y_)
  {
    x = x_;
    y = y_;
    
    makeBody();
  }
  
  void makeBody()
  {    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    body = box2d.createBody(bd);
    
    ps = new PolygonShape();
    Vec2[] vertices = new Vec2[4];
    vertices[0]  = box2d.vectorPixelsToWorld(new Vec2(-10, size));
    vertices[1]  = box2d.vectorPixelsToWorld(new Vec2(10, size));
    vertices[2]  = box2d.vectorPixelsToWorld(new Vec2(10, -size));
    vertices[3]  = box2d.vectorPixelsToWorld(new Vec2(-10, -size));
    ps.set(vertices, vertices.length);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 1;
    fd.friction = 0.5;
    fd.restitution = 0.8;
    
    body.createFixture(fd);
  }
  
  void display()
  {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    
    fill(128);
    noStroke();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    
    beginShape();
    for(int i = 0; i < ps.getVertexCount(); i++)
    {
      Vec2 v = box2d.vectorWorldToPixels(ps.getVertex(i));
      vertex(v.x, v.y);
    }
    endShape(CLOSE);
    
    popMatrix();
  }
}
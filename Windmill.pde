class Windmill
{
  RevoluteJoint joint;
  Wing wing;
  Pole pole;
  
  Windmill(float x_, float y_)
  {
    wing = new Wing(x_, y_);
    pole = new Pole(x_, y_);
    
    RevoluteJointDef rjd = new RevoluteJointDef();
    rjd.initialize(pole.body, wing.body, wing.body.getWorldCenter());
    
    rjd.enableMotor = true;
    
    joint = (RevoluteJoint)box2d.world.createJoint(rjd);
  }
  
  void display()
  {
    // pole.display();
    wing.display();
  }
}
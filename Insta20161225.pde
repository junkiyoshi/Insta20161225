import java.util.*;
import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;
Windmill[] windmills;
Wall wall;

ArrayList<Particle> particles;

void setup()
{
  size(1080, 1080);
  background(0);
  smooth();
  frameRate(60);
  imageMode(CENTER);
  blendMode(ADD);
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -20);
  
  particles = new ArrayList<Particle>();
  windmills = new Windmill[2];
  windmills[0] = new Windmill(250, height / 2);
  windmills[1] = new Windmill(750, height / 2);
  wall = new Wall();
}

void draw()
{
  background(0);
   
  box2d.step();
 
  windmills[0].display();
  windmills[1].display();
  wall.display();
  
  if(frameCount % 1 == 0)
  {
    Particle particle = new Particle(0, height / 2 - 150);
    particle.body.setLinearVelocity(new Vec2(100, 0));
    particles.add(particle);
  }
 
  Iterator<Particle> it = particles.iterator();
  
  while(it.hasNext())
  {
    Particle p = it.next();
    p.display();
    
    if(p.isDead())
    {
      it.remove();
    }
  }
  
  println(frameCount);
  /*
  saveFrame("screen-#####.png");
  if(frameCount > 3600)
  {
     exit();
  } 
  */
}
Spaceship space;//your variable declarations here
ArrayList <Asteroids> a = new ArrayList <Asteroids>(10);
Stars [] star;

public void setup()
{

  size(500, 500);
  space= new Spaceship();

  star = new Stars [300];
  
  for (int i = 0; i < star.length; i++)
  {
    star[i] = new Stars(250, 250);
  }

  for(int i =0; i<10; i++)
  {
    a.add(new Asteroids());

  }  
}

public void draw()
{
  background(0);
  for (int i=0; i<star.length; i++) 
  {  

    star[i].move();  
    star[i].show();
  }

  for(int i=1; i<a.size(); i++)
  {

    a.get(i).move();
    a.get(i).show();
    if (dist(a.get(i).getX(),a.get(i).getY(),space.getX(),space.getY()) <20)
    {

      a.remove(i);

    }

  } 

  space.move();
  space.show();
  
}

public void keyPressed()
{
  if ( key == 'r')
    space.rotate(-30); //up
  if (key == 'f')
    space.rotate(30); //down
  if ( key == 'd')
    space.rotate(-10); //left
  if ( key == 'g')
    space.rotate(10); //right
  if ( key == 'o')
    space.accelerate(.3);  
  if (key == 'p')
    space.deccelerate(.6);  
  if ( key == 'h')
    space.hyperspace();
}


class Spaceship extends Floater
{

  public void setX(int x) {
    myCenterX = x;
  }
  public int getX() {
    return (int)myCenterX;
  }
  public void setY(int y) {
    myCenterY = y;
  }
  public int getY() {
    return (int)myCenterY;
  }
  public void setDirectionX(double x) {
    myDirectionX = x;
  }
  public double getDirectionX() {
    return myDirectionX;
  }
  public void setDirectionY(double y) {
    myDirectionY = y;
  }
  public double getDirectionY() {
    return myDirectionY;
  }
  public void setPointDirection(int degrees) {
    myPointDirection = degrees;
  }
  public double getPointDirection() {
    return myPointDirection;
  }

  public Spaceship()
  {
    corners = 4;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -8;
    yCorners[0] = -8;
    xCorners[1] = 16;
    yCorners[1] = 0;
    xCorners[2] = -8;
    yCorners[2] = 8;
    xCorners[3] = -2;
    yCorners[3] = 0;
    myColor = color(255, 250, 250);
    myCenterX = 250;
    myCenterY = 250;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
  }
  public void hyperspace()
  {
    background(255);
    myCenterX = (Math.random()*500);
    myCenterY = (Math.random()*500);
    myPointDirection = (Math.random()*360);
    myDirectionX = 0;
    myDirectionY = 0;
  }
}
class Asteroids extends Floater

{
  public void setX(int x) {
    myCenterX = x;
  }
  public int getX() {
    return (int)myCenterX;
  }
  public void setY(int y) {
    myCenterY = y;
  }
  public int getY() {
    return (int)myCenterY;
  }
  public void setDirectionX(double x) {
    myDirectionX = x;
  }
  public double getDirectionX() {
    return myDirectionX;
  }
  public void setDirectionY(double y) {
    myDirectionY = y;
  }
  public double getDirectionY() {
    return myDirectionY;
  }
  public void setPointDirection(int degrees) {
    myPointDirection = degrees;
  }
  public double getPointDirection() {
    return myPointDirection;
  }
  private int spr; //speed rotation of asteroids

  public Asteroids()
  {
    corners = 6;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -14;
    yCorners[0] = -11;
    xCorners[1] = 10;
    yCorners[1] = -11;
    xCorners[2] = 16;
    yCorners[2] = 3;
    xCorners[3] = 5;
    yCorners[3] = 13;
    xCorners[4] = -12;
    yCorners[4] = 8;
    xCorners[5] = -15;
    yCorners[5] = 3;
    myColor = color(128,0,32);
    myCenterX = (int)(Math.random()*500)+1;
    myCenterY = (int)(Math.random()*500)-1;
    myDirectionX = (Math.random()*2)-2;
    myDirectionY = (Math.random()*2)-2;
    myPointDirection = 0;
    spr = (int)(Math.random()*2)-2;
  }
 
  public void move()
  {
    rotate(spr);
    super.move();
  }
}
class Stars
{     
  private int myX;
  private int myY;
  public Stars(int x, int y)
  {
    myX=x;
    myY=y;
  }
  //make a random walk for this
  public void move()
  {
    myX = myX + (int)(Math.random()*50)-1;
    myY = myY + (int)(Math.random()*50)-1;
    if (myX >width)
    {
      myX = 0;
    } else if (myX<0)
    {
      myX = width;
    }
    if (myY >height)
    {
      myY = 0;
    } else if (myY < 0)
    {
      myY = height;
    }
  }

  public void show()
  {  
    stroke(0, 57, 247);
    fill(0, 255, 255);
    ellipse(myX, myY, random(10), random(10));
  }
}    
abstract class Floater //Do NOT modify the Floater class! Make changes
{
  protected int corners;  //the number of corners, a triangular floater has 3
  protected int[] xCorners;
  protected int[] yCorners;
  protected int myColor;
  protected double myCenterX, myCenterY; //holds center coordinates
  protected double myDirectionX, myDirectionY; //holds x and y
  //coordinates of the vector for direction of travel
  protected double myPointDirection; //holds current direction the
  //ship is pointing in degrees
  abstract public void setX(int x);
  abstract public int getX();
  abstract public void setY(int y);
  abstract public int getY();
  abstract public void setDirectionX(double x);
  abstract public double getDirectionX();
  abstract public void setDirectionY(double y);
  abstract public double getDirectionY();
  abstract public void setPointDirection(int degrees);
  abstract public double getPointDirection();

  //Accelerates the floater in the direction it is pointing (myPointDirection)
  public void accelerate (double dAmount)
  {
    //convert the current direction the floater is pointing to radians
    double dRadians =myPointDirection*(Math.PI/180);
    //change coordinates of direction of travel
    myDirectionX += ((dAmount) * Math.cos(dRadians));
    myDirectionY += ((dAmount) * Math.sin(dRadians));
  }
  public void deccelerate (double dAmount)
  {
    //convert the current direction the floater is pointing to radians
    double dRadians =myPointDirection*(Math.PI/180);
    //change coordinates of direction of travel
    myDirectionX -= ((dAmount) * Math.cos(dRadians));
    myDirectionY -= ((dAmount) * Math.sin(dRadians));
  }
  public void rotate (int nDegreesOfRotation)
  {
    //rotates the floater by a given number of degrees
    myPointDirection+=nDegreesOfRotation;
  }
  public void move ()   //move the floater in the current direction of travel
  {
    //change the x and y coordinates by myDirectionX and myDirectionY
    myCenterX += myDirectionX;
    myCenterY += myDirectionY;

    //wrap around screen
    if (myCenterX >width)
    {
      myCenterX = 0;
    } else if (myCenterX<0)
    {
      myCenterX = width;
    }
    if (myCenterY >height)
    {
      myCenterY = 0;
    } else if (myCenterY < 0)
    {
      myCenterY = height;
    }
  }
  public void show ()  //Draws the floater at the current position
  {
    fill(myColor);
    stroke(myColor);
    //convert degrees to radians for sin and cos
    double dRadians = myPointDirection*(Math.PI/180);
    int xRotatedTranslated, yRotatedTranslated;
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      //rotate and translate the coordinates of the floater using
      //current direction
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) -
        (yCorners[nI] * Math.sin(dRadians))+myCenterX);
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) +
        (yCorners[nI] * Math.cos(dRadians))+myCenterY);
      vertex(xRotatedTranslated, yRotatedTranslated);
    }
    endShape(CLOSE);
  }
}

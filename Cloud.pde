public class Cloud
{
  private PImage image; //Make the image variable.
  private float rangeX; //RangeX will be the width of the image.
  private float rangeY; //RangeY will be the height of the image.
  private float xCoord; //This will be the X-Coordinate of the cloud image.
  private float yCoord; //This will be the Y-Coordinate of the cloud image.
  private float speedX; //This will be the horizonal speed of the cloud image.
  
  public Cloud()
  {
    resetCloud(); //Reset cloud at the start.
  }
  
  //The display method displays the cloud.
  public void display()
  {
    image = loadImage("cloud.png"); //The image variable holds the image.
    image(image, xCoord, yCoord, rangeX, rangeY); //Display the image.
  }
  
  //This method updates the clouds position.
  public void update()
  {
    xCoord = xCoord + speedX; //Increase the xCoord by the speed.
    
    if (xCoord > width) //If the cloud went off the screen, reset it.
    {
     resetCloud(); 
    }
    
  }
  
  //Resetting method.
  public void resetCloud()
  {
    xCoord = random(-300, -350); //Random xCoord between those values(makes it appear earlier of later).
    yCoord = random(0, height/2); //Random yCoord between those value.
    speedX = random(0.5,6); //Random speed.
    rangeX = random(300, 150); //Random width.
    rangeY = random(100,25); //Random height.
  }
  
}
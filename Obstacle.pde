public class Obstacle
{
 private float xCoord; //Will be the X-Coordinate of the obstacle.
 private float yCoord; //Will be the Y-Coordinate of the obstacle.
 private float speedX; //Will be the horizontal speed of the obstalce.
 private float rangeX; //Will be the width of the obstalce.
 private float red; //The variable for the colour red on the rgb.
 private float green; //The variable for the colour green on the rgb.
 private float blue; //The variable for the colour blue on the rgb.
 private boolean reset; //Boolean for the reset which is used for the score.
 
 public Obstacle()
 {
   rangeX = xCoord + 30; // Setting the inital width of the obstacle.
   resetObstacle(); //Resetting the obstalce to start on the left.
   reset = false; //Initially the reset will be false.
 }
 
 ///////////GETTERS////////////////
 public float getXCoord()
 {
  return xCoord; 
 }
 
 public float getYCoord()
 {
  return yCoord; 
 }
 
 public float getWidth()
 {
  return rangeX; 
 }
 
 public float getHeight()
 {
  return height-yCoord; 
 }
 
 public boolean getReset()
 {
  return reset; 
 }
 /////////////////////////////////////////
 
 ///////////SETTER////////////////////////
 public void setReset(boolean reset)
 {
  this.reset = reset; 
 }
 /////////////////////////////////////////
 
 //Display the obstacle method.
 public void display()
 {
   fill(red, green, blue); //The colour will be random from each red, green and blue variables.
   rect(xCoord, yCoord, rangeX, height - yCoord); //Draw a rectangle with all the variables.
 }
 
 //Update the position of the obstacle.
 public void update()
 {
   
   xCoord = xCoord + speedX; //Move the xCoord via the speed.
   if (xCoord > width) //If the obstacle leaves the screen reset it.
   {
    resetObstacle(); 
    reset = true; //Sets the boolean of reset to true.
   }
 }
 
 //Resetting the obstacle method.
  public void resetObstacle()
 {
  xCoord = 0; //Setting the xCoord to zero so it starts on the left side.
  yCoord = random(height-200, height -100); //Giving it a random height between those values.
  speedX = random(6,9); //Random speed between those limits.
  rangeX = random(50, 100); //Random width between those values.
  red = random(255); //Random red value.
  green = random(255); //Random green value.
  blue = random(255); //Random blue value.
 }
 
}
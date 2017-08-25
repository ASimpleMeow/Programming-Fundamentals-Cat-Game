public class Cat
{
 private int currentFrame = 0; //The current frame of animation for the cat images.
 private PImage[] images = new PImage[12]; //Make an array of cat images.
 private float xCoord; //This will be the X-Coordinate of the cat image.
 private float yCoord; //This will be the Y-Coordinate of the cat image.
 private float rangeX; //This will be the height of the images (couldn't use the word 'height').
 private float rangeY; //This will be the width of the images (couldn't use the word 'width').
 private boolean allowJump; //A boolean to allow the jump for the cat.
 private int timer; //A timer to limit the jump.
 
 public Cat(float rangeX, float rangeY) 
 {
  setWidth(rangeX); //Sets the width of the cat images with a setter.
  setHeight(rangeY); //Sets the height of the cat images with a setter.
  resetCat();
 }
 
 /////////////GETTERS/////////////////
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
  return rangeY; 
 }
 
 public float getHeight()
 {
  return rangeY; 
 }
 ///////////////////////////////////////
 
  /////////////SETTERS//////////////////
 public void setYCoord(float yCoord)
 {
   this.yCoord = yCoord;
 }
 
 public void setHeight(float rangeY)
 {
   if (rangeY <= width/4)
   {this.rangeY = rangeY;}
   else 
   {this.rangeY = width/4;}
 }
 
 public void setWidth(float rangeX)
 {
  if (rangeX <= height/3) 
  {this.rangeX = rangeX;}
  else
  {this.rangeX = height/3;}
 }
 
 public void setTimer(int timer)
 {
  if ((timer >= -5) && (timer <= 5))
  {
   this.timer = timer; 
  }
  else 
  {this.timer = 0;}
 }
 
 public void setAllowJump(boolean allowJump)
 {
   this.allowJump = allowJump;
 }
 ///////////////////////////////////////
 
 
 //This method display and cycles through the cat images.
 void display()
{
  //Give each array an image of one frame of the cat.
  images[0]  = loadImage("cat_1.png");
  images[1]  = loadImage("cat_2.png"); 
  images[2]  = loadImage("cat_3.png");
  images[3]  = loadImage("cat_4.png"); 
  images[4]  = loadImage("cat_5.png");
  images[5]  = loadImage("cat_6.png"); 
  images[6]  = loadImage("cat_7.png");
  images[7]  = loadImage("cat_8.png"); 
  images[8]  = loadImage("cat_9.png");
  images[9]  = loadImage("cat_10.png"); 
  images[10] = loadImage("cat_11.png");
  images[11] = loadImage("cat_12.png");
  frameRate(20); //Set the frame rate.
  
  //I will cylce through the frames by making the 'currentFrame' be the remainder
  //of the 'currentFrame' divided by the total number of frame (12).
  //Thus if it reaches the final frame (12) the remiander will be 0, making 
  //The currentFrame 0 as well, restarting the cycle.
  currentFrame = (currentFrame+1) % 12; 
  image(images[(currentFrame) % 12], xCoord, yCoord, rangeX, rangeY); //Display the image(s).
}

//This method jumps the cat.
public void jump()
{
 if (keyPressed) //Checks is a key is pressed.
 {
  if (key == 32) //If spacebar is pressed.
  {
   if ((yCoord > height/3) && (allowJump)) //If the cat is bellow a certain point and you're allowed
   {
    yCoord = yCoord - 33; //Raise the cat image up.
    jumpControl(); //Controls the timer, everytime spacebar is pressed, timer goes up.
   }
  }
 }
}

//Controls the duration of the jump with the timer.
private void jumpControl()
{
  timer ++; //Increase the timer.
  if (timer < 25) //If the timer is less than 25, allow the jump.
  {
   allowJump = true; 
  }
  else //otherwise turn off the jump.
  allowJump = false;
  
}

public void resetCat()
{
 xCoord = width - 300; //Positions the cat images on the screen.
 yCoord = height-200; 
 timer = 25; //Set timer to 25 so you can't jump immediately.
}

}
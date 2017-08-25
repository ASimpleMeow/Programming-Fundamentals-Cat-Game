public class Floor
{
 private float rangeY; //Will be the yCoord/Height of the floor(ground).
 
 public Floor()
 {
   rangeY = height - 50; //Set the height of the floor(ground).
   
 }
 /////////GETTERS//////////////////
  public float getHeight()
 {
   return rangeY;
 }
 //////////////////////////////////
 
 //Display method shows the floor(ground).
 public void display()
 {
   fill(0,200,0); //Give it a green colour.
  rect (0, rangeY, width, height);  //Draw a rectangle.
 }
}
//------------------------------------------------------------
//          THE JOURNEY OF THE WALKING CAT!                  
//------------------------------------------------------------
//          NAME:           Oleksandr Kononov.
//          STUDENT NUMBER: 20071032.
//------------------------------------------------------------
//                                                            |
//The aim of the game is to journey with the walking cat      |
//(that you cat name). By pressing and holding spacebar you   |
//can jump for a limited period of time to jump over blocks   |
//that are a random colour, height, width and speed.          |
//The Cat class is written to display and allow jump for the  |
//cat object. The Cloud class is to add clouds object to the  |
//game and to creat an illusion of movement.                  |
//The floor class creates the floor(ground) object for the    |
//cat to walk on and to know when to stop falling due to      |
//gravity. The Obstacle class makes to obstacles and controls |
//the objects speed, position, it's warping(reset) and its    |
//display. The Player class holds the username(cat name) and  |
//the score array for the different rounds of the journey,    |
//as well as the function to display the results of the       |
//journey.                                                    |
//                                                            |
//The Input/Output is done through JOptionPane.               |
//The images for the clouds and cat are taken from            |
//Google Images.                                              |
//PImage and loadImages are used to show the images.          |
//                                                            |
//                    KNOWN BUGS                              |
// -You must click on the screen for the keyPressed method to |
//  register that the key was pressed.                        |
//                                                            |
//------------------------------------------------------------


import javax.swing.JOptionPane;

// Objects to be used.
Cat cat;
Floor floor;
Obstacle obstacle;
Cloud[] cloud = new Cloud[2]; //Since there are two clouds, I used an array.
Player player;


int score = 0; //score for the current round.
int gameState = 0; //gamesState is used to create the start screen to the game.
int numberOfGames; //This is the maximum number of rounds in the game.
int currentGame = 0; //This is the current game out of the maximum number of games.

    
void setup() {
  noCursor();
  size(600,600);
  
  //Takes in the maximum number of games(rounds) to play
  numberOfGames = Integer.parseInt(JOptionPane.showInputDialog("  How many journey's should the walking-cat take (max 5):  \n\n","3"));
  if (numberOfGames>5) //checks to make sure the max number of games is within the limit.
  {
   numberOfGames = 5; //Sets the max number of games to 5 if it's above the limit.
  }
  
  //Creates the objects with the constructors
  cat = new Cat(600,600);
  floor = new Floor();
  obstacle = new Obstacle();
  player = new Player(numberOfGames, JOptionPane.showInputDialog("Give the walking-cat a name (max 7 characters):\n\n","Sammy"));
  cloud[0] = new Cloud();
  cloud[1] = new Cloud();

} 
 
void draw() { 
  if (gameState == 1)//Checks the gamesState, if it's 1 the actual games starts.
  { 
  background(149, 255, 242); //Sets the background to be sky-blue.
  for (int i = 0; i < 2; i++) //I used to for-loop to efficiently display the array of clouds.
  {
  cloud[i].display(); //Displays the cloud.
  cloud[i].update();  //Update the position of the cloud.
  }
  floor.display(); //Display the floor(ground).
  cat.display();  //Display the cat object.
  cat.jump();    //The method for the jump for the cat.
  obstacle.display(); //Display the obstacle.
  obstacle.update();  //Update the obstacles position.
  gravity();    //Use the method for gravity on the cat.
  enableJump(); //This method enables the jump when the cat hits the ground.
  displayScore(); //Display the score for the current round.
  increaseScore(); //Increase the score when the obstacle hits the edge.
  
    if (collision()) //Checks for collision between the cat and the obstacle.
   {
      if (currentGame < numberOfGames-1)//Checks if the current game is greater than the maximum number.
      {
       currentGame++; //Incriments the currentGame variable (since there's been a collision).
       score = 0; //Sets the score back to zero.
       
       //Here you are offered to quit the game and recieve your results.
       int nextGameReply = JOptionPane.showConfirmDialog(
           null,
           player.getUsername()+" got his by a block! \n Do you want to continue?",
           "Continue the journey? \n\n",
           JOptionPane.YES_NO_OPTION);
       if (nextGameReply != JOptionPane.YES_OPTION) //Checks your answer to the dialog box.
       {
        endGame();  //Ends the game via method.
       }
       else
       {
        //This is used to fix a bug where when you hit a block while holding spacebar,
        //the dialog box will pop up prompting you to continue.
        //the program still thinks the key is pressed when you continue causing you to continue jumping.
        //This reset the keyPressed back to false, until you press it.
        keyPressed = false; 
       }
      }
      else 
      {
       endGame(); //If the number of games(rounds) is up, end the game via method.
      }
    }
  }
  else //If the gameState is zero (which it will be at the begining of the game), start the "start screen"
  {
   background(0); //Set Black background.
   textAlign(CENTER); //Align the text to the center.
   textSize(30); //Set the text size.
   text("THE JOURNEY OF THE WALKING CAT" , width/2, 30); //Show this text.
   textSize(40); //Set the text size.
   text("Press SPACE to start" , width/2, height/2); //Show this text.
   textSize(20); //Set the text size.
   text("Jump over the blocks with space (hold for a long jump)" , width/2, height - 40); //Show this text.
   
   //If the spacebar is pressed, change gameState to 1 (will start the game).
   if (keyPressed) 
   {
    if (key == 32)
    {
     gameState = 1; 
    }
   }
  }
}

//The gravity method for the cat to fall if he isn't on the ground.
void gravity()
{
 if ((cat.getYCoord() + cat.getHeight()) < (floor.getHeight() + 45) ) //Checks cat's yCoord and floors yCoord.
  {
   cat.setYCoord(cat.getYCoord() + 15); //Reduces cat's yCoord till the above if statement is false.
  }
}

//This method allow the cat to jump and resets the timer.
void enableJump()
{
 if ((cat.getYCoord() + cat.getHeight()) >= (floor.getHeight() + 45)) //Checks if the cat is near to the floor(ground).
  {
   cat.setTimer(0);  //Resets the timer to zero.
   cat.setAllowJump(true); //Allows the jump for the cat.
  }
}

//This method display the current round score on the top left corner of the screen.
void displayScore()
{
 fill(255,0,0); //Set the back-colour for the text.
 textSize(24); //Sets the size of the text.
 text("Score: "+ score, 20.75,25.75); //Shows the back-text.
 textAlign(LEFT); //Left aligns the text.
 fill(0); //Sets the texts front-colour to black.
 text("Score: "+score, 20,25); //Shows the front-text.
}

//The method to increase the score.
void increaseScore()
{
 if (obstacle.getReset()) //Check if the obstacle has reset.
 {
  score++; //Incriment the score.
  obstacle.setReset(false); //Set the reset to false.
 }
}

//The collision method is a boolean method to test the collision of the cat and the obstacle.
boolean collision()
{
 //Obtain the absolute value for the distance of the center(x-axis) of the cat to the center of the obstacle on the X-Axis.
 float distanceX = abs( (obstacle.getXCoord()+obstacle.getWidth()/2) - (cat.getXCoord()+cat.getWidth()/2) ); 
 //Obtain the absolute value for the distance of the middle(y-axis) of the car to the middle of the obstacle on the Y-Axis.
 float distanceY = abs( (obstacle.getYCoord() + obstacle.getHeight()/2) - (cat.getYCoord() + cat.getHeight()/2 + 25) );
 
 if ( (distanceX <= obstacle.getWidth()/2+cat.getWidth()/2-20) && (distanceY <= obstacle.getHeight()/2 + 50) ) //Check the distances of both X and Y.
 {
  obstacle.resetObstacle(); //Resets the position of the obstacle.
  player.addScore(score); //Places the current score to the score array in the player object.
  cat.setAllowJump(false);
  return true; //returns the collision as true.
 }
 else
 {
  return false; //returns the collision as false.
 }
}

//The endGame method ends the game and shows the results of the game played.
void endGame()
{
  //Just shows how this cat got tired of hitting those obstacles.
  JOptionPane.showMessageDialog(null,"\n\n"+player.getUsername()+" got too tired of walking and getting hit with blocks so he gave up. \n\n"); 
  //Shows the result of the game from the player object.
  JOptionPane.showMessageDialog(null, player.toString());
  exit(); //Close the game.
}
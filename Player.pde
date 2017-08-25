public class Player
{
 private String username; //This will the username/cat name.
 private int[] scores; //Making an array for the scores.
 private int gameNumber; //The gameNumber for the arrays.
 
 public Player(int gamesToPlay, String username)
 {
  if (username.length() <= 7) //Making sure that the name has a limit of 7 characters.
  {
   this.username = username; 
  }
  else //If not, it will be made to be 7 characters.
  {
   this.username = username.substring(0,7); 
  }
  scores = new int[gamesToPlay]; //The array will be made with the player input.
  gameNumber = 0; //Set to zero and used for arrays.
 }
 
 ///////////GETTERS/////////////////
 public String getUsername()
 {
  return username; 
 }
 
 public int[] getScores()
 {
  return scores; 
 }
 //////////////////////////////
 
 //Method to add the current score to the array.
 public void addScore(int score)
 {
  if (score >= 0) //If the score is not equal to zero, it will be added to the array.
  {
   scores[gameNumber] = score;
   gameNumber++; //Increase for the next array score.
  }
 }
 
 //Method to convert the integer score to string and display the results.
 public String toString()
 {
   String string = "Before giving up, " + username + " managed to jump over: \n\n";

    for (int i = 0; i < numberOfGames; i++) {
      string = string + scores[i] + " Blocks on Round " + (i+1) + "\n";
    }   
    return string;
 }
  
}
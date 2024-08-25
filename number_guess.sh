#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
secret_number=$(( RANDOM % 1000 + 1 ))
number_of_guesses=0
echo Enter your username:
read username

user=$($PSQL "SELECT username FROM user_info WHERE username='$username'")

if [[ -z $user ]]
then
  echo Welcome, $username! It looks like this is your first time here.
  #add the new user to the database
  INSERT_NEW_USER=$($PSQL "INSERT INTO user_info(username, games_played, best_game) VALUES('$username', 1, 0)")

else
  #get games_played
  games_played=$($PSQL "SELECT games_played FROM user_info WHERE username='$username'")
  #get best_game
  best_game=$($PSQL "SELECT best_game FROM user_info WHERE username='$username'")

  echo Welcome back, $user! You have played $games_played games, and your best game took $best_game guesses.
  #update the number of games played
  UPDATE_NUMBER_GAMES=$($PSQL "UPDATE user_info SET games_played = games_played + 1 WHERE username = '$username'")
fi


while true
do
  # Prompt the user for a guess
  echo "Guess the secret number between 1 and 1000:"
  read guess

  # Check if the input is an integer
  while ! [[ "$guess" =~ ^[0-9]+$ ]]
  do
    echo "That is not an integer, guess again:"
    read guess
  done

  # Check if the guess is equal to the secret number
  if [ "$guess" -eq "$secret_number" ]
  then
    # Correct guess
    number_of_guesses=$(( number_of_guesses + 1 ))
    echo You guessed it in $number_of_guesses tries. The secret number was $secret_number. Nice job!
    
    break
  elif [ "$guess" -gt "$secret_number" ]
  then
    # Guess is too high
    number_of_guesses=$(( number_of_guesses + 1 ))
    echo "It's lower than that, guess again:"
  elif [ "$guess" -lt "$secret_number" ]
  then
    # Guess is too low
    number_of_guesses=$(( number_of_guesses + 1 ))
    echo "It's higher than that, guess again:"
  fi
done


#insert the best game
NUMBER_BEST_GAME=$($PSQL "SELECT best_game FROM user_info WHERE username = '$username'")

if [[ "$NUMBER_BEST_GAME" -eq 0 ]]
then
  NUMBER_BEST_GAME=$($PSQL "UPDATE user_info SET best_game = $number_of_guesses WHERE username = '$username'")
fi

#update the best game
if [ "$NUMBER_BEST_GAME" -gt "$number_of_guesses" ]
then
  # Update the database
  $PSQL "UPDATE user_info SET best_game = $number_of_guesses WHERE username = '$username';"
fi


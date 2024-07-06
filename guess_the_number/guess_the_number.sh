#!/bin/bash

# Function to generate a random number
# This function generates a random number between 1 and 100.
generate_random_number() {
  echo $(( RANDOM % 100 + 1 ))
}

# Function to prompt the user for a guess
# This function prompts the user to input their guess, ensuring it's within the range of numbers.
prompt_user_for_guess() {
  read -p "Guess the number (between 1 and 100): " guess
}

# Main game loop
# This is where the main logic of the game resides. It generates a random number, prompts the user for their guess,
# and continues until the user guesses correctly.
play_game() {
  # Generate a random number between 1 and 100.
  random_number=$(generate_random_number)
  
  # Initialize the user's guess to -1 (representing an invalid guess).
  guess=-1

  while [[ $guess -ne $random_number ]]; do
    # Prompt the user for their guess.
    prompt_user_for_guess
    
    # Check if the user's guess is lower than or higher than the random number.
    if [[ $guess -lt $random_number ]]; then
      echo "Too low!"
    elif [[ $guess -gt $random_number ]]; then
      echo "Too high!"
    else
      echo "Congratulations! You guessed the number."
    fi
    
  done
}

# Start the game by calling the main game loop.
play_game

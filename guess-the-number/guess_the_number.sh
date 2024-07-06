#!/bin/bash

# Function to generate a random number
generate_random_number() {
  echo $(( RANDOM % 100 + 1 ))
}

# Function to prompt the user for a guess
prompt_user_for_guess() {
  read -p "Guess the number (between 1 and 100): " guess
}

# Main game loop
play_game() {
  random_number=$(generate_random_number)
  guess=-1

  while [[ $guess -ne $random_number ]]; do
    prompt_user_for_guess
    if [[ $guess -lt $random_number ]]; then
      echo "Too low!"
    elif [[ $guess -gt $random_number ]]; then
      echo "Too high!"
    else
      echo "Congratulations! You guessed the number."
    fi
  done
}

# Start the game
play_game

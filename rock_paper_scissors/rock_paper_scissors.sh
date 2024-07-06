#!/bin/bash

# Function to display the choices
display_choices() {
  echo "1) Rock"
  echo "2) Paper"
  echo "3) Scissors"
}

# Function to get the computer's choice
get_computer_choice() {
  echo $(( RANDOM % 3 + 1 ))
}

# Function to determine the winner
determine_winner() {
  if [[ $player_choice -eq $computer_choice ]]; then
    echo "It's a tie!"
  elif [[ ($player_choice -eq 1 && $computer_choice -eq 3) || 
          ($player_choice -eq 2 && $computer_choice -eq 1) || 
          ($player_choice -eq 3 && $computer_choice -eq 2) ]]; then
    echo "You win!"
  else
    echo "You lose!"
  fi
}

# Main game loop
play_game() {
  while true; do
    display_choices
    read -p "Enter your choice (1-3) or 0 to quit: " player_choice
    
    if [[ $player_choice -eq 0 ]]; then
      echo "Thanks for playing!"
      break
    elif [[ $player_choice -lt 1 || $player_choice -gt 3 ]]; then
      echo "Invalid choice. Please enter a number between 1 and 3."
    else
      computer_choice=$(get_computer_choice)
      echo "Computer chose: $computer_choice"
      determine_winner
    fi
  done
}

# Start the game
play_game

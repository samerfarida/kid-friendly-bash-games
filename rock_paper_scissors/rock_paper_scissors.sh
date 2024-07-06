#!/bin/bash

# Function to display the choices.
# This function displays the options available to the player.
display_choices() {
  # Display the possible choices to the user.
  echo "1) Rock"
  echo "2) Paper"
  echo "3) Scissors"
}

# Function to get the computer's choice.
# This function generates a random number between 1 and 3, 
# which represents the computer's choice.
get_computer_choice() {
  # Generate a random number between 1 and 3.
  echo $(( RANDOM % 3 + 1 ))
}

# Function to determine the winner.
# This function compares the player's choice with the computer's choice
# and determines who wins or if it's a tie.
determine_winner() {
  # Check if the player's choice is equal to the computer's choice.
  if [[ $player_choice -eq $computer_choice ]]; then
    # If they are equal, it's a tie!
    echo "It's a tie!"
  elif [[ ($player_choice -eq 1 && $computer_choice -eq 3) || 
          ($player_choice -eq 2 && $computer_choice -eq 1) || 
          ($player_choice -eq 3 && $computer_choice -eq 2) ]]; then
    # If the player's choice beats the computer's, the player wins.
    echo "You win!"
  else
    # Otherwise, the computer wins.
    echo "You lose!"
  fi
}

# Main game loop.
# This is where the game logic takes place.
play_game() {
  while true; do
    # Display the choices to the user.
    display_choices
    
    read -p "Enter your choice (1-3) or 0 to quit: " player_choice
    
    if [[ $player_choice -eq 0 ]]; then
      # If the user chooses to quit, exit the loop and end the game.
      echo "Thanks for playing!"
      break
    elif [[ $player_choice -lt 1 || $player_choice -gt 3 ]]; then
      # If the user's choice is invalid (not between 1 and 3), 
      # display an error message and continue to the next iteration of the loop.
      echo "Invalid choice. Please enter a number between 1 and 3."
    else
      # Get the computer's choice.
      computer_choice=$(get_computer_choice)
      # Display the computer's choice to the user.
      echo "Computer chose: $computer_choice"
      
      # Determine who wins this round.
      determine_winner
    fi
  done
}

# Start the game loop.
play_game

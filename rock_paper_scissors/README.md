# Rock, Paper, Scissors Game

## Introduction

"Rock, Paper, Scissors" is a simple and fun game written in Bash. Players choose rock, paper, or scissors and play against the computer. This game helps kids learn basic coding concepts such as random number generation, conditionals, and input/output.

## How to Play

1. Run the script.
2. Choose rock, paper, or scissors by entering the corresponding number.
3. The computer will randomly choose rock, paper, or scissors.
4. The result will be displayed: win, lose, or tie.
5. You can play multiple rounds until you choose to quit.

## Code

Here's the Bash script for the "Rock, Paper, Scissors" game:

```bash
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
```


## How to Run
1. Save the script to a file, for example, `rock_paper_scissors.sh`.
2. Open a terminal and navigate to the directory where the script is saved.
3. Make the script executable by running: ```chmod +x rock_paper_scissors.sh```
4. Run the script by typing: ```./rock_paper_scissors.sh```

## Learning Points

This game is designed to teach the following coding concepts:

* Random Number Generation: Generating random choices for the computer.
* Conditionals: Determining the outcome based on the player's and computer's choices.
* Input/Output: Reading user input and displaying messages.
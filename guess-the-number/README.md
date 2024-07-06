# Guess the Number Game

## Introduction

"Guess the Number" is a simple and fun game written in Bash. It challenges the player to guess a randomly selected number within a specified range. This game helps kids learn basic coding concepts such as variables, loops, conditionals, and input/output.

## How to Play

1. Run the script.
2. The computer will randomly select a number between 1 and 100.
3. You will be prompted to guess the number.
4. After each guess, the computer will tell you if your guess is too low, too high, or correct.
5. Keep guessing until you find the correct number.

## Code

```bash
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

```

## How to Run
1. Save the script to a file, for example, guess_the_number.sh.
2. Open a terminal and navigate to the directory where the script is saved.
3. Make the script executable by running: chmod +x guess_the_number.sh
4. Run the script by typing: ./guess_the_number.sh

## Learning Points

This game is designed to teach the following coding concepts:

* Variables: Storing the random number and user guesses.
* Loops: Repeating the guessing process until the correct number is found.
* Conditionals: Checking if the guess is too high, too low, or correct.
* Input/Output: Reading user input and displaying messages.

## Contributing
We welcome contributions! If you have ideas for improvements or additional features, please fork the repository and submit a pull request.

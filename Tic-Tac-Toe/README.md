# Tic-Tac-Toe Game

## Introduction

"Tic-Tac-Toe" is a classic game implemented in Bash. Players take turns placing Xs and Os on a 3x3 grid, aiming to get three in a row. This game helps kids learn basic coding concepts such as 2D arrays, loops, conditionals, and input/output.

## How to Play

1. Run the script.
2. Players take turns entering a cell number (1-9) to place their marker (X or O) on the board.
3. The game continues until a player wins by getting three in a row horizontally, vertically, or diagonally, or until the board is full.
4. Enjoy multiple rounds with friends or family!

## Code

Here's the Bash script for the "Tic-Tac-Toe" game:

```bash
#!/bin/bash

# Initialize the board
board=(" " " " " " " " " " " " " " " " " ")

# Function to display the board
display_board() {
    clear
    echo " ${board[0]} | ${board[1]} | ${board[2]} "
    echo "---+---+---"
    echo " ${board[3]} | ${board[4]} | ${board[5]} "
    echo "---+---+---"
    echo " ${board[6]} | ${board[7]} | ${board[8]} "
}

# Function to check if a player has won
check_win() {
    local player=$1
    if [[ (${board[0]} == $player && ${board[1]} == $player && ${board[2]} == $player) ||
          (${board[3]} == $player && ${board[4]} == $player && ${board[5]} == $player) ||
          (${board[6]} == $player && ${board[7]} == $player && ${board[8]} == $player) ||
          (${board[0]} == $player && ${board[3]} == $player && ${board[6]} == $player) ||
          (${board[1]} == $player && ${board[4]} == $player && ${board[7]} == $player) ||
          (${board[2]} == $player && ${board[5]} == $player && ${board[8]} == $player) ||
          (${board[0]} == $player && ${board[4]} == $player && ${board[8]} == $player) ||
          (${board[2]} == $player && ${board[4]} == $player && ${board[6]} == $player) ]]; then
        return 0
    fi
    return 1
}

# Function to check if the board is full
check_full_board() {
    for cell in "${board[@]}"; do
        if [[ $cell == " " ]]; then
            return 1
        fi
    done
    return 0
}

# Function to switch player turns
switch_player() {
    if [[ $current_player == "X" ]]; then
        current_player="O"
    else
        current_player="X"
    fi
}

# Main game loop
play_game() {
    local current_player="X"
    local choice

    while true; do
        display_board
        echo "Player $current_player's turn"
        read -p "Enter cell number (1-9): " choice
        if [[ $choice =~ ^[1-9]$ && ${board[$((choice - 1))]} == " " ]]; then
            board[$((choice - 1))]="$current_player"
            check_win "$current_player"
            if [[ $? -eq 0 ]]; then
                display_board
                echo "Player $current_player wins!"
                break
            fi
            check_full_board
            if [[ $? -eq 0 ]]; then
                display_board
                echo "It's a tie!"
                break
            fi
            switch_player
        else
            echo "Invalid choice. Please enter a number between 1 and 9 for an empty cell."
        fi
    done
}

# Start the game
play_game

```

## How to Run
1. Save the script to a file, for example, `tic_tac_toe.sh`.
2. Open a terminal and navigate to the directory where the script is saved.
3. Make the script executable by running: ```chmod +x tic_tac_toe.sh```
4. Run the script by typing: ```./tic_tac_toe.sh```

## Learning Points

This game is designed to teach the following coding concepts:

* 2D Arrays: Managing a grid for the game board.
* Loops: Iterating through turns and checking conditions.
* Conditionals: Determining game outcomes based on player moves.
* Input/Output: Handling user input and displaying the game board.


#!/bin/bash

# Initialize the board.
board=(" " " " " " " " " " " " " " " " " ")

# Function to display the board.
display_board() {
    # Clear the screen before displaying the board.
    clear
    
    # Display the board with the current state of cells.
    echo " ${board[0]} | ${board[1]} | ${board[2]} "
    echo "---+---+---"
    echo " ${board[3]} | ${board[4]} | ${board[5]} "
    echo "---+---+---"
    echo " ${board[6]} | ${board[7]} | ${board[8]} "
}

# Function to check if a player has won.
check_win() {
    # Check for winning combinations of cells based on the current state of the board and the player's turn.
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

# Function to check if the board is full.
check_full_board() {
    # Check for empty cells in the board and return true if any are found, false otherwise.
    for cell in "${board[@]}"; do
        if [[ $cell == " " ]]; then
            return 1
        fi
    done
    return 0
}

# Function to switch player turns.
switch_player() {
    # Switch the current player's turn between X and O.
    if [[ $current_player == "X" ]]; then
        current_player="O"
    else
        current_player="X"
    fi
}

# Main game loop.
play_game() {
    local current_player="X"
    local choice

    # Game loop.
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

# Start the game.
play_game
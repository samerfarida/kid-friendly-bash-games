#!/bin/bash

# Initialize the game board (4x4 grid)
# Each pair of cards is represented by letters A-H.
board=("A" "B" "C" "D" "E" "F" "G" "H" "A" "B" "C" "D" "E" "F" "G" "H")

# Shuffle the board to randomize the positions of the cards
shuffled_board=($(shuf -e "${board[@]}"))

# Initialize the display board (hidden initially)
# All cards are hidden using "*".
display_board=("*" "*" "*" "*" "*" "*" "*" "*" "*" "*" "*" "*" "*" "*" "*" "*")

# Function to print the board
# This will show the current state of the game board.
print_board() {
    echo "  1 2 3 4"  # Column headers
    for i in {0..3}; do
        echo -n "$((i+1)) "  # Row headers
        for j in {0..3}; do
            echo -n "${display_board[$((i*4+j))]} "  # Print each card
        done
        echo  # New line after each row
    done
}

# Function to check if all pairs are matched
# If all cards are matched, it will return 0 (true), otherwise 1 (false).
check_win() {
    for card in "${display_board[@]}"; do
        if [[ "$card" == "*" ]]; then
            return 1  # Not all cards are matched
        fi
    done
    return 0  # All cards are matched
}

# Main game loop
# This loop will keep running until all pairs are matched.
attempts=0  # Counter for the number of attempts
while true; do
    clear  # Clear the screen to update the board
    print_board  # Print the current state of the board
    
    # Ask the player for the coordinates of the first card to flip
    echo "Enter the coordinates of the first card to flip (row column), e.g., 1 2:"
    read -r row1 col1
    row1=$((row1-1))  # Convert to zero-based index
    col1=$((col1-1))  # Convert to zero-based index
    index1=$((row1*4+col1))  # Calculate the index in the array
    
    # Ask the player for the coordinates of the second card to flip
    echo "Enter the coordinates of the second card to flip (row column), e.g., 3 4:"
    read -r row2 col2
    row2=$((row2-1))  # Convert to zero-based index
    col2=$((col2-1))  # Convert to zero-based index
    index2=$((row2*4+col2))  # Calculate the index in the array
    
    # Check if the chosen cards are already matched
    if [[ "${display_board[$index1]}" != "*" || "${display_board[$index2]}" != "*" ]]; then
        echo "One or both of these cards are already matched. Try again."
        continue  # Skip to the next iteration of the loop
    fi

    # Reveal the chosen cards
    display_board[$index1]="${shuffled_board[$index1]}"
    display_board[$index2]="${shuffled_board[$index2]}"
    clear  # Clear the screen to update the board
    print_board  # Print the current state of the board
    
    # Check if the revealed cards match
    if [[ "${shuffled_board[$index1]}" == "${shuffled_board[$index2]}" ]]; then
        echo "It's a match!"
    else
        echo "Not a match."
        sleep 1  # Pause for a second to let the player see the cards
        display_board[$index1]="*"  # Hide the first card again
        display_board[$index2]="*"  # Hide the second card again
    fi
    
    ((attempts++))  # Increment the attempt counter
    
    # Check if the player has won
    if check_win; then
        clear  # Clear the screen to update the board
        print_board  # Print the final state of the board
        echo "Congratulations! You've matched all pairs in $attempts attempts."
        break  # Exit the loop and end the game
    fi
done

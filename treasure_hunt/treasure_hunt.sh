#!/bin/bash

# Constants
GRID_SIZE=5
TREASURE_ROW=$((RANDOM % GRID_SIZE))
TREASURE_COL=$((RANDOM % GRID_SIZE))
ATTEMPTS=3

# Function to display the grid
display_grid() {
    for ((row = 0; row < GRID_SIZE; row++)); do
        for ((col = 0; col < GRID_SIZE; col++)); do
            if [[ $row -eq $TREASURE_ROW && $col -eq $TREASURE_COL ]]; then
                echo -n "[X] "
            else
                echo -n "[ ] "
            fi
        done
        echo
    done
}

# Game instructions
echo "Welcome to Treasure Hunt!"
echo "You have 3 attempts to find the hidden treasure on a $GRID_SIZE x $GRID_SIZE grid."

# Game loop
for ((attempt = 1; attempt <= ATTEMPTS; attempt++)); do
    echo
    echo "Attempt $attempt:"
    echo "---------------------"
    display_grid
    echo "---------------------"

    # Prompt for user input
    read -p "Enter row (0-4): " row
    read -p "Enter column (0-4): " col

    # Check if the user found the treasure
    if [[ $row -eq $TREASURE_ROW && $col -eq $TREASURE_COL ]]; then
        echo "Congratulations! You found the treasure."
        exit
    else
        echo "Oops! The treasure is not here."
    fi
done

echo "Game over. The treasure was located at: ($TREASURE_ROW, $TREASURE_COL)"

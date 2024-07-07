#!/bin/bash

# Array of words for the game
words=("apple" "banana" "cherry" "orange" "grape")

# Function to shuffle a word
shuffle_word() {
    local word="$1"
    echo $(echo "$word" | fold -w1 | shuf | tr -d '\n')
}

# Select a random word from the array
selected_word=${words[$((RANDOM % ${#words[@]}))]}

# Shuffle the selected word
scrambled_word=$(shuffle_word "$selected_word")

# Game instructions
echo "Welcome to Word Scramble!"
echo "Unscramble the word: $scrambled_word"

# Prompt for user input
read -p "Your guess: " guess

# Check if the guess is correct
if [[ "$guess" == "$selected_word" ]]; then
    echo "Correct! Well done."
else
    echo "Incorrect. The word was: $selected_word"
fi

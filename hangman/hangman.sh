#!/bin/bash

# Array of words for the game
words=("apple" "banana" "cherry" "orange" "grape" "lemon" "melon" "peach" "pear" "plum")

# Function to pick a random word
pick_word() {
    local array=("$@")
    local idx=$(( RANDOM % ${#array[@]} ))
    echo "${array[$idx]}"
}

# Function to display the hangman figure
display_hangman() {
    local attempts=$1
    case $attempts in
        0)
            echo "  +---+"
            echo "  |   |"
            echo "      |"
            echo "      |"
            echo "      |"
            echo "      |"
            echo "========="
            ;;
        1)
            echo "  +---+"
            echo "  |   |"
            echo "  O   |"
            echo "      |"
            echo "      |"
            echo "      |"
            echo "========="
            ;;
        2)
            echo "  +---+"
            echo "  |   |"
            echo "  O   |"
            echo "  |   |"
            echo "      |"
            echo "      |"
            echo "========="
            ;;
        3)
            echo "  +---+"
            echo "  |   |"
            echo "  O   |"
            echo " /|   |"
            echo "      |"
            echo "      |"
            echo "========="
            ;;
        4)
            echo "  +---+"
            echo "  |   |"
            echo "  O   |"
            echo " /|\\  |"
            echo "      |"
            echo "      |"
            echo "========="
            ;;
        5)
            echo "  +---+"
            echo "  |   |"
            echo "  O   |"
            echo " /|\\  |"
            echo " /    |"
            echo "      |"
            echo "========="
            ;;
        6)
            echo "  +---+"
            echo "  |   |"
            echo "  O   |"
            echo " /|\\  |"
            echo " / \\  |"
            echo "      |"
            echo "========="
            ;;
    esac
}

# Function to initialize the game
initialize_game() {
    word=$(pick_word "${words[@]}")
    guessed_letters=()
    attempts=0
    hidden_word=$(echo "$word" | sed 's/./_/g')
}

# Function to display the current game status
display_game_status() {
    clear
    echo "Current word: $hidden_word"
    echo "Guessed letters: ${guessed_letters[@]}"
    display_hangman $attempts
}

# Function to check if a letter is in the word
check_letter() {
    local letter=$1
    if [[ $word == *"$letter"* ]]; then
        for (( i=0; i<${#word}; i++ )); do
            if [[ ${word:$i:1} == "$letter" ]]; then
                hidden_word="${hidden_word:0:$i}$letter${hidden_word:$((i + 1))}"
            fi
        done
        return 0
    else
        (( attempts++ ))
        return 1
    fi
}

# Function to check if the game is over
check_game_over() {
    if [[ $hidden_word == "$word" ]]; then
        return 0
    elif [[ $attempts -ge 6 ]]; then
        return 1
    else
        return -1
    fi
}

# Main game loop
play_game() {
    initialize_game
    while true; do
        display_game_status
        read -p "Guess a letter: " letter
        if [[ ${#letter} -eq 1 && $letter =~ [a-zA-Z] ]]; then
            if [[ " ${guessed_letters[@]} " =~ " $letter " ]]; then
                echo "You already guessed '$letter'. Try another letter."
            else
                guessed_letters+=( "$letter" )
                check_letter "$letter"
                check_game_over
                case $? in
                    0)
                        display_game_status
                        echo "Congratulations! You guessed the word '$word' correctly!"
                        break
                        ;;
                    1)
                        display_game_status
                        echo "Game over! The word was '$word'. Try again!"
                        break
                        ;;
                    -1)
                        continue
                        ;;
                esac
            fi
        else
            echo "Invalid input. Please enter a single letter."
        fi
    done
}

# Start the game
play_game

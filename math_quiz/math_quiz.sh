#!/bin/bash

# Function to generate a random math question
generate_question() {
    # Define an array of operations
    local operations=("+" "-" "*" "/")
    # Generate two random numbers between 1 and 10
    local num1=$(( RANDOM % 10 + 1 ))
    local num2=$(( RANDOM % 10 + 1 ))
    # Pick a random operation from the array
    local operation=${operations[$(( RANDOM % 4 ))]}

    # Ensure we don't divide by zero
    if [[ $operation == "/" && $num2 -eq 0 ]]; then
        num2=1
    fi

    # Return the generated question
    echo "$num1 $operation $num2"
}

# Function to calculate the correct answer
calculate_answer() {
    local num1=$1
    local operation=$2
    local num2=$3

    # Perform the correct arithmetic operation based on the given operator
    case $operation in
        "+")
            echo $(( num1 + num2 ))
            ;;
        "-")
            echo $(( num1 - num2 ))
            ;;
        "*")
            echo $(( num1 * num2 ))
            ;;
        "/")
            echo $(( num1 / num2 ))
            ;;
    esac
}

# Main game loop
play_game() {
    local score=0
    local rounds=5

    # Loop through the specified number of rounds
    for (( i=1; i<=rounds; i++ )); do
        # Generate a random question
        question=$(generate_question)
        echo "Round $i: What is $question?"
        # Prompt the player for an answer
        read -p "Your answer: " player_answer

        # Extract the numbers and operation from the question
        num1=$(echo $question | awk '{print $1}')
        operation=$(echo $question | awk '{print $2}')
        num2=$(echo $question | awk '{print $3}')
        # Calculate the correct answer
        correct_answer=$(calculate_answer $num1 $operation $num2)

        # Check if the player's answer is correct
        if [[ $player_answer -eq $correct_answer ]]; then
            echo "Correct!"
            (( score++ ))
        else
            echo "Incorrect. The correct answer is $correct_answer."
        fi
    done

    # Display the final score
    echo "Game over! Your score is $score out of $rounds."
}

# Start the game
play_game

#!/bin/bash

# Function for outputting color table
output_color() {
    local color="$1"
    # Table fields separator
    text="myTest"

    # Move to new line
    echo ""

    # Display an empty field in the background color names line
    echo -n "         "
    # Display color names with the same width
    for color in "${colors[@]}"; do
        echo -n "${color%%:*} "
    done

    echo ""

    # Cycle to display a table of text and background combinations
    for fg_color in "${colors[@]}"; do
        IFS=":" read -r name fg bgt <<< "$fg_color"
        echo -en "$name"
        for bg_color in "${colors[@]}"; do
            IFS=":" read -r nt fgt bg <<< "$bg_color"
            echo -en " $fg$bg $text \033[0m"
        done
        echo ""
    done
    echo ""
}

# Screen cleaning
clear

# Array of ANSI colors for text and background
colors=(
    "Default :\033[m:"
    "Black   :\033[30m:\033[40m"
    "Red     :\033[31m:\033[41m"
    "Green   :\033[32m:\033[42m"
    "Yellow  :\033[33m:\033[43m"
    "Blue    :\033[34m:\033[44m"
    "Purple  :\033[35m:\033[45m"
    "Cyan    :\033[36m:\033[46m"
    "White   :\033[37m:\033[47m"
    "L_Black :\033[90m:\033[100m"
    "L_Red   :\033[91m:\033[101m"
    "L_Green :\033[92m:\033[102m"
    "L_Yellow:\033[93m:\033[103m"
    "L_Blue  :\033[94m:\033[104m"
    "L_Purple:\033[95m:\033[105m"
    "L_Cyan  :\033[96m:\033[106m"
    "L_White :\033[97m:\033[107m"
    "Default :\033[m:"
)

# Call the function for outputting the table of colors
output_color $color

# Array of ANSI colors for text and background
colors=(
    "Default :\033[m:"
    "Black   :\033[30m:\033[40m"
    "L_Black :\033[90m:\033[100m"
    "Red     :\033[31m:\033[41m"
    "L_Red   :\033[91m:\033[101m"
    "Green   :\033[32m:\033[42m"
    "L_Green :\033[92m:\033[102m"
    "Yellow  :\033[33m:\033[43m"
    "L_Yellow:\033[93m:\033[103m"
    "Blue    :\033[34m:\033[44m"
    "L_Blue  :\033[94m:\033[104m"
    "Purple  :\033[35m:\033[45m"
    "L_Purple:\033[95m:\033[105m"
    "Cyan    :\033[36m:\033[46m"
    "L_Cyan  :\033[96m:\033[106m"
    "White   :\033[37m:\033[47m"
    "L_White :\033[97m:\033[107m"
    "Default :\033[m:"
)

# Call the function for outputting the table of colors
output_color $color

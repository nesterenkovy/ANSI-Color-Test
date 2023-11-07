#!/bin/bash

# Array of ANSI colors for text and background
name_colors=("Black" "Red" "Green" "Yellow" "Blue" "Purple" "Cyan" "Gray" "D_Gray" "L_Red" "L_Green" "L_Yellow" "L_Blue" "L_Purple" "L_Cyan" "White")
fg_colors=("30" "31" "32" "33" "34" "35" "36" "37" "90" "91" "92" "93" "94" "95" "96" "97")
bg_colors=("40" "41" "42" "43" "44" "45" "46" "47" "100" "101" "102" "103" "104" "105" "106" "107")
# Table fields separator
text=" myTest"

# Screen cleaning
clear

# Cycle to display a table of text and background combinations
for fg_color in "${fg_colors[@]}"; do
    echo -en "${name_color[@]}"
    for bg_color in "${bg_colors[@]}"; do
        echo -en " \e[${fg_color};${bg_color}m${text} \e[0m"
    done
    echo # Move to new line
done

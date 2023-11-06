# Screen cleaning
Clear-Host

# Array of ANSI colors
$colors = @("Black", "DarkBlue", "DarkGreen", "DarkCyan", "DarkRed", "DarkMagenta", "DarkYellow", "Gray",
    "DarkGray", "Blue", "Green", "Cyan", "Red", "Magenta", "Yellow", "White")

# Cycle to display a table of text and background combinations
$index = 0
for ($row = 0; $row -lt 8; $row++) {
    for ($col = 0; $col -lt 2; $col++) {
        $textColor = $colors[$index]
        $bgColor = "Black"
        $colorCombo = "$textColor on $bgColor"
        Write-Host $colorCombo -NoNewline
        # Displaying a block of characters
        Write-Host "████████".PadRight(80 - $colorCombo.Length)
        $index++
    }
}

# Restoring standard colors
Write-Host "White on Black"

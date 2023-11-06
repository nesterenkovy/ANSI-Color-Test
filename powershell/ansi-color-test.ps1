# Screen cleaning
Clear-Host

# Array of ANSI colors
$colors = @("Black", "DarkBlue", "DarkGreen", "DarkCyan", "DarkRed", "DarkMagenta", "DarkYellow", "Gray",
    "DarkGray", "Blue", "Green", "Cyan", "Red", "Magenta", "Yellow", "White")

# Cycle to display a table of text and background combinations
Foreach ($bgcolor in $colors) {
    Foreach ($fgcolor in $colors) { Write-Host "$fgcolor|"  -ForegroundColor $fgcolor -BackgroundColor $bgcolor -NoNewLine }
    Write-Host " on $bgcolor"
}

# Restoring standard colors
Write-Host "White on Black"

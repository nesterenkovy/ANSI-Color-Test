# Screen cleaning
Clear-Host

# Get ANSI colors
$colors = [enum]::GetValues([System.ConsoleColor])

# Cycle to display a table of text and background combinations
Foreach ($bgcolor in $colors) {
    Foreach ($fgcolor in $colors) { Write-Host "$fgcolor|"  -ForegroundColor $fgcolor -BackgroundColor $bgcolor -NoNewLine }
    Write-Host " on $bgcolor"
}

# Restoring standard colors
Write-Host "White on Black"

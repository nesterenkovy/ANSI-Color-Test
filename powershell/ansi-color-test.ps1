# Screen cleaning
Clear-Host

# Table fields separator
$separator = " "
$cellText = " myTest "

# Specify cell length
$cellLength = 8

# Get ANSI colors 
$listColors = [enum]::GetValues([System.ConsoleColor])

# Move to new line
Write-Host ""

# Background color name string
foreach ($bgColor in $listColors) {
    $colorName = $bgColor.ToString().Replace("Dark", "D_").Replace("Magenta", "Purple")
    # Right-filled formatting
    # $formattedHead = $colorName.PadRight($cellLength)
    # Left-filled formatting
    # $formattedHead = $colorName.PadLeft($cellLength)
    # Centering formatting
    $formattedHead = $colorName.PadLeft(($cellLength + $colorName.Length) / 2).PadRight($cellLength)
    Write-Host -NoNewline "$separator$formattedHead"
}

# Move to new line
Write-Host ""


# Cycle to display a table of text and background combinations
Foreach ($FGcolor in $listColors) {
    Foreach ($BGcolor in $listColors) {
        Write-Host -NoNewline "$separator"
        Write-Host -NoNewline "$cellText" -ForegroundColor $FGcolor -BackgroundColor $BGcolor
    }
    Write-Host ""
}

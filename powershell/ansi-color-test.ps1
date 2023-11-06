# Screen cleaning
Clear-Host

# Table fields separator
$tableHead = "ANSI"
$separator = " "
$cellText = "myTest"

# Array of color names and PS-values
$listColors = @(
    @{ Name = "Black"; Color = "Black" },
    @{ Name = "Red"; Color = "DarkRed" },
    @{ Name = "Green"; Color = "DarkGreen" },
    @{ Name = "Yellow"; Color = "DarkYellow" },
    @{ Name = "Blue"; Color = "DarkBlue" },
    @{ Name = "Purple"; Color = "DarkMagenta" },
    @{ Name = "Cyan"; Color = "DarkCyan" },
    @{ Name = "Gray"; Color = "Gray" },
    @{ Name = "D_Gray"; Color = "DarkGray" },
    @{ Name = "L_Red"; Color = "Red" },
    @{ Name = "L_Green"; Color = "Green" },
    @{ Name = "L_Yellow"; Color = "Yellow" },
    @{ Name = "L_Blue"; Color = "Blue" },
    @{ Name = "L_Purple"; Color = "Magenta" },
    @{ Name = "L_Cyan"; Color = "Cyan" },
    @{ Name = "White"; Color = "White" },
    @{ Name = "Default"; Color = "none" }
)

# Calculate maximum length of color name
$cellLength = ($listColors.Name | ForEach-Object { $_.Length } | Measure-Object -Maximum).Maximum

# Move to new line
Write-Host ""

# Create and display an empty row headers field
$emptyField = $tableHead.PadLeft(($cellLength + $bgColor.Name.Length) / 2).PadRight($cellLength)
Write-Host $emptyField -NoNewline
# Display color names with the same width
foreach ($bgColor in $listColors) {
    # Right-filled formatting
    # $formattedHead = $bgColor.Name.PadRight($cellLength)
    # Left-filled formatting
    # $formattedHead = $bgColor.Name.PadLeft($cellLength)
    # Centering formatting
    $formattedHead = $bgColor.Name.PadLeft(($cellLength + $bgColor.Name.Length) / 2).PadRight($cellLength)
    Write-Host "$separator" -NoNewline
    Write-Host "$formattedHead" -NoNewline
}

Write-Host ""
# Cycle to display a table of text and background combinations
foreach ($foreground in $listColors) {
    # Row header - name of the foreground color
    $formattedHead = $foreground.Name.PadLeft($cellLength)
    Write-Host -NoNewline "$formattedHead"
    # Generate and output strings
    foreach ($background in $listColors) {
        $formattedCell = $cellText.PadLeft(($cellLength + $cellText.Length) / 2).PadRight($cellLength)
        Write-Host -NoNewline "$separator"
        # Check for "none" and set the color parameters
        if ($foreground.Color -ne "none" -and $background.Color -ne "none") {
            Write-Host $formattedCell -NoNewline -ForegroundColor $foreground.Color -BackgroundColor $background.Color
        }
        elseif ($foreground.Color -ne "none") {
            Write-Host $formattedCell -NoNewline -ForegroundColor $foreground.Color
        }
        elseif ($background.Color -ne "none") {
            Write-Host $formattedCell -NoNewline -BackgroundColor $background.Color
        }
        else {
            Write-Host $formattedCell -NoNewline
        }
    }
    Write-Host ""
}
Write-Host ""

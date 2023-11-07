# Function for show color table
function Show-ColorTable {
    param (
        [array] $listColors
    )

    # Table fields separator
    $tableHead = "ANSI"
    $separator = " "
    $cellText = "myTest"

    # Calculate maximum length of color name
    $cellLength = ($listColors.Name | ForEach-Object { $_.Length } | Measure-Object -Maximum).Maximum

    # Move to new line
    Write-Host ""

    # Create and display an empty row headers field
    $emptyField = $tableHead.PadLeft(($cellLength + $tableHead.Length) / 2).PadRight($cellLength)
    Write-Host -NoNewline "$emptyField"
    # Display color names with the same width
    foreach ($bgColor in $listColors) {
        # Right-filled formatting
        $formattedHead = $bgColor.Name.PadRight($cellLength)
        # Left-filled formatting
        # $formattedHead = $bgColor.Name.PadLeft($cellLength)
        # Centering formatting
        # $formattedHead = $bgColor.Name.PadLeft(($cellLength + $bgColor.Name.Length) / 2).PadRight($cellLength)
        Write-Host -NoNewline "$separator$formattedHead"
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
                Write-Host -NoNewline "$formattedCell" -ForegroundColor $foreground.Color -BackgroundColor $background.Color
            }
            elseif ($foreground.Color -ne "none") {
                Write-Host -NoNewline "$formattedCell" -ForegroundColor $foreground.Color
            }
            elseif ($background.Color -ne "none") {
                Write-Host -NoNewline "$formattedCell" -BackgroundColor $background.Color
            }
            else {
                Write-Host -NoNewline "$formattedCell"
            }
        }
        Write-Host ""
    }
    Write-Host ""
}

# Screen cleaning
Clear-Host

# Array of color names and PS-values
$listColors = @(
    @{ Name = "Default"; Color = "none" },
    @{ Name = "Black"; Color = "Black" },
    @{ Name = "Red"; Color = "DarkRed" },
    @{ Name = "Green"; Color = "DarkGreen" },
    @{ Name = "Yellow"; Color = "DarkYellow" },
    @{ Name = "Blue"; Color = "DarkBlue" },
    @{ Name = "Purple"; Color = "DarkMagenta" },
    @{ Name = "Cyan"; Color = "DarkCyan" },
    @{ Name = "White"; Color = "Gray" },
    @{ Name = "L_Black"; Color = "DarkGray" },
    @{ Name = "L_Red"; Color = "Red" },
    @{ Name = "L_Green"; Color = "Green" },
    @{ Name = "L_Yellow"; Color = "Yellow" },
    @{ Name = "L_Blue"; Color = "Blue" },
    @{ Name = "L_Purple"; Color = "Magenta" },
    @{ Name = "L_Cyan"; Color = "Cyan" },
    @{ Name = "L_White"; Color = "White" },
    @{ Name = "Default"; Color = "none" }
)

# Call the function to write a color table
Show-ColorTable $listColors

# Array of color names and PS-values
$listColors = @(
    @{ Name = "Default"; Color = "none" },
    @{ Name = "Black"; Color = "Black" },
    @{ Name = "L_Black"; Color = "DarkGray" },
    @{ Name = "Red"; Color = "DarkRed" },
    @{ Name = "L_Red"; Color = "Red" },
    @{ Name = "Green"; Color = "DarkGreen" },
    @{ Name = "L_Green"; Color = "Green" },
    @{ Name = "Yellow"; Color = "DarkYellow" },
    @{ Name = "L_Yellow"; Color = "Yellow" },
    @{ Name = "Blue"; Color = "DarkBlue" },
    @{ Name = "L_Blue"; Color = "Blue" },
    @{ Name = "Purple"; Color = "DarkMagenta" },
    @{ Name = "L_Purple"; Color = "Magenta" },
    @{ Name = "Cyan"; Color = "DarkCyan" },
    @{ Name = "L_Cyan"; Color = "Cyan" },
    @{ Name = "White"; Color = "Gray" },
    @{ Name = "L_White"; Color = "White" },
    @{ Name = "Default"; Color = "none" }
)

# Call the function to write a color table
Show-ColorTable $listColors

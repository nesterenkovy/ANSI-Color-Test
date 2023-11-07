# Function for outputting color table
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
                Write-Host -NoNewline "$($PSStyle.Background.($background.Color))$($PSStyle.Foreground.($foreground.Color))$formattedCell"
            }
            elseif ($foreground.Color -ne "none") {
                Write-Host -NoNewline "$($PSStyle.Foreground.($foreground.Color))$formattedCell"
            }
            elseif ($background.Color -ne "none") {
                Write-Host -NoNewline "$($PSStyle.Background.($background.Color))$formattedCell"
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
    @{ Name = "Red"; Color = "Red" },
    @{ Name = "Green"; Color = "Green" },
    @{ Name = "Yellow"; Color = "Yellow" },
    @{ Name = "Blue"; Color = "Blue" },
    @{ Name = "Purple"; Color = "Magenta" },
    @{ Name = "Cyan"; Color = "Cyan" },
    @{ Name = "White"; Color = "White" },
    @{ Name = "L_Black"; Color = "BrightBlack" },
    @{ Name = "L_Red"; Color = "BrightRed" },
    @{ Name = "L_Green"; Color = "BrightGreen" },
    @{ Name = "L_Yellow"; Color = "BrightYellow" },
    @{ Name = "L_Blue"; Color = "BrightBlue" },
    @{ Name = "L_Purple"; Color = "BrightMagenta" },
    @{ Name = "L_Cyan"; Color = "BrightCyan" },
    @{ Name = "L_White"; Color = "BrightWhite" },
    @{ Name = "Default"; Color = "none" }
)

# Call the function to write a color table
Show-ColorTable $listColors

# Array of color names and PS-values
$listColors = @(
    @{ Name = "Default"; Color = "none" },
    @{ Name = "Black"; Color = "Black" },
    @{ Name = "L_Black"; Color = "BrightBlack" },
    @{ Name = "Red"; Color = "Red" },
    @{ Name = "L_Red"; Color = "BrightRed" },
    @{ Name = "Green"; Color = "Green" },
    @{ Name = "L_Green"; Color = "BrightGreen" },
    @{ Name = "Yellow"; Color = "Yellow" },
    @{ Name = "L_Yellow"; Color = "BrightYellow" },
    @{ Name = "Blue"; Color = "Blue" },
    @{ Name = "L_Blue"; Color = "BrightBlue" },
    @{ Name = "Purple"; Color = "Magenta" },
    @{ Name = "L_Purple"; Color = "BrightMagenta" },
    @{ Name = "Cyan"; Color = "Cyan" },
    @{ Name = "L_Cyan"; Color = "BrightCyan" },
    @{ Name = "White"; Color = "White" },
    @{ Name = "L_White"; Color = "BrightWhite" },
    @{ Name = "Default"; Color = "none" }
)

# Call the function to write a color table
Show-ColorTable $listColors

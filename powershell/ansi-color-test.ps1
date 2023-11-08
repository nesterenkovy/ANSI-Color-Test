# Function to get color table
function Show-ColorTable {
    param (
        [array] $listColors
    )

    # Table title, fields and offset
    $text = "myTest"
    $title = "ANSI-16"
    $offset = " "
    
    # The ANSI escape sequences
    $ansiReset = $PSStyle.Reset
    $ansiReverse = $PSStyle.Reverse

    # Calculate the maximum length of color name
    $cellLength = ($listColors.Name | ForEach-Object { $_.Length } | Measure-Object -Maximum).Maximum

    # Formatting title and offset to center
    $titleField = $ansiReverse + $title.PadRight($cellLength) + $ansiReset
    $text = $text.PadLeft(($cellLength + $text.Length) / 2).PadRight($cellLength)

    # Show the title of the table in the first line
    Write-Host -NoNewline "`n$titleField"
    # Display color names with the same width
    foreach ($bgColor in $listColors) {
        # Right-filled formatting
        $formattedHead = $bgColor.Name.PadRight($cellLength)
        # Left-filled formatting
        # $formattedHead = $bgColor.Name.PadLeft($cellLength)
        # Centering formatting
        # $formattedHead = $bgColor.Name.PadLeft(($cellLength + $bgColor.Name.Length) / 2).PadRight($cellLength)
        Write-Host -NoNewline "$offset$formattedHead"
    }
    Write-Host ""
    
    # Cycle to show a table of text and background combinations
    foreach ($foreground in $listColors) {
        # Row header - name of the foreground color
        $formattedHead = $foreground.Name.PadLeft($cellLength)
        Write-Host -NoNewline "$formattedHead"
        # Generate and show strings
        $formattedCell = $text.PadLeft(($cellLength + $text.Length) / 2).PadRight($cellLength)
        foreach ($background in $listColors) {
            Write-Host -NoNewline "$offset"
            # Check for "Default" and set the color parameters
            if (($foreground.Color -ne "Default" -and $foreground.Color -ne "Reverse") -and
                ($background.Color -ne "Default" -and $background.Color -ne "Reverse")) {
                Write-Host -NoNewline "$($PSStyle.Background.($background.Color))$($PSStyle.Foreground.($foreground.Color))$formattedCell"
            }
            elseif ($foreground.Color -eq "Reverse" -and $background.Color -eq "Reverse") {
                Write-Host -NoNewline "$($PSStyle.Reverse)$formattedCell$($PSStyle.ReverseOff)"
            }
            elseif ($foreground.Color -eq "Reverse") {
                Write-Host -NoNewline "$($PSStyle.Background.($background.Color))$($PSStyle.Reverse)$formattedCell$($PSStyle.ReverseOff)"
            }
            elseif ($background.Color -eq "Reverse") {
                Write-Host -NoNewline "$($PSStyle.Foreground.($foreground.Color))$($PSStyle.Reverse)$formattedCell$($PSStyle.ReverseOff)"
            }
            elseif ($foreground.Color -ne "Default") {
                Write-Host -NoNewline "$($PSStyle.Foreground.($foreground.Color))$formattedCell"
            }
            elseif ($background.Color -ne "Default") {
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

# Array of color names and values of $PSStyle
$listColors = @(
    @{ Name = "Default"; Color = "Default" },
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
    @{ Name = "Reverse"; Color = "Reverse" }
)

# Calling a function to show the color table
Show-ColorTable $listColors

# Array of color names and values of $PSStyle
$listColors = @(
    @{ Name = "Default"; Color = "Default" },
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
    @{ Name = "Reverse"; Color = "Reverse" }
)

# Calling a function to show the color table
Show-ColorTable $listColors

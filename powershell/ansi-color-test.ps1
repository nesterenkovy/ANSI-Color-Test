# Function to get color table
function Get-ColorTable {
    [CmdletBinding(SupportsShouldProcess = $false)]
    param (
        [array] $listColors
    )

    process {
        # Table title, fields and offset
        $text = "myTest"
        $title = "ANSI-16"
        $offset = "$($PSStyle.Foreground.Black)|$($PSStyle.Reset)"

        # The ANSI escape sequences
        $ansiReset = $PSStyle.Reset
        $ansiReverse = $PSStyle.Reverse

        # Calculate the maximum length of color name
        $cellLength = ($listColors.Name | ForEach-Object { $_.Length } | Measure-Object -Maximum).Maximum

        # Formatting title and offset to center
        $title = $ansiReverse + $title.PadRight($cellLength) + $ansiReset
        $text = $text.PadLeft(($cellLength + $text.Length) / 2).PadRight($cellLength)

        # Get the title of the table in the first line
        $colorTable = "`n" + $title
        # Get first line - names of background colors
        foreach ($columnColor in $listColors) {
            # Right-filled formatting
            $colorTable += $offset + $columnColor.Name.PadRight($cellLength)
        }
        
        # Table rows generation cycles
        foreach ($fgColors in $listColors) {
            $colorTable += "`n"
            # Row header - name of the foreground color
            $colorTable += $fgColors.Name.PadRight($cellLength)
            $fgColor = $fgColors.Color

            # Generate strings
            switch ($fgColor) {
                "Default" { $ansiFG = "" }
                "Reverse" { $ansiFG = $ansiReverse }
                default { $ansiFG = $PSStyle.Foreground.($fgColor) }
            }

            # Cycle of generating cells in a row
            foreach ($bgColors in $listColors) {
                $bgColor = $bgColors.Color
                switch ($bgColor) {
                    "Default" { $ansiBG = "" }
                    "Reverse" { $ansiBG = $ansiReverse }
                    default { $ansiBG = $PSStyle.Background.($bgColor) }
                }            
                $colorTable += $offset + $ansiFG + $ansiBG + $text + $ansiReset
            }
        }
        # Return the resulting color table
        $colorTable
    }
}

# Screen cleaning
Clear-Host

# Get and display terminal window size
$windowWidth = $host.UI.RawUI.WindowSize.Width
$windowHeight = $host.UI.RawUI.WindowSize.Height
Write-Host "WindowSize: $windowWidth x $windowHeight"

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
$colorTable = Get-ColorTable $listColors

# Display the color table
Write-Host "$colorTable"

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
$colorTable = Get-ColorTable $listColors

# Display the color table
Write-Host "$colorTable"

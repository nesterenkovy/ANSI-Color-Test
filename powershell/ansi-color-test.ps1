# Function to get color palette from a color list
function Get-ColorPalette {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline = $true)]
        [array] $colorList
    )

    process {
        $colorPalette = [System.Collections.ArrayList]@()
        $colorList | ForEach-Object {
            switch ($_) {
                "Default" {
                    $ansiFG = ""
                    $ansiBG = ""
                }
                "Reverse" {
                    $ansiFG = $PSStyle.Reverse
                    $ansiBG = $ansiFG 
                }
                default {
                    $ansiFG = $PSStyle.Foreground.$_
                    $ansiBG = $PSStyle.Background.$_ 
                }
            }
            $colorEntry = [PSCustomObject]@{
                Name   = $_.Replace("Bright", "L_").Replace("Magenta", "Purple")
                Color  = $_
                ansiFG = $ansiFG
                ansiBG = $ansiBG
            }
            [void]$colorPalette.Add($colorEntry)
        }
        Write-Output $colorPalette
    }
}

# Function to get color table from color palette
function Get-ColorTable {
    [CmdletBinding(SupportsShouldProcess = $false)]
    param (
        [Parameter(ValueFromPipeline = $true)]
        [array] $colorPalette
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
        $cellLength = ($colorPalette.Name | ForEach-Object { $_.Length } | Measure-Object -Maximum).Maximum

        # Formatting text fot cell
        $text = $text.PadLeft(($cellLength + $text.Length) / 2).PadRight($cellLength)

        # Get the title of the table in the first line
        $colorTable = "`n" + $ansiReverse + $title.PadRight($cellLength) + $ansiReset
        # Get first line - names of background colors
        $colorPalette | ForEach-Object {
            # Formatting color names to the left
            $colorTable += $offset + $_.Name.PadRight($cellLength)
        }
        
        # Table rows generation cycles
        $colorPalette | ForEach-Object {
            $colorTable += "`n"
            # Row header - name of the foreground color
            $colorTable += $_.Name.PadRight($cellLength)
            $ansiFG = $_.ansiFG

            # Cycle of generating cells in a row
            $colorPalette | ForEach-Object {
                $ansiBG = $_.ansiBG
                $colorTable += $offset + $ansiFG + $ansiBG + $text + $ansiReset
            }
        }
        # Return the resulting color table
        Write-Output $colorTable
    }
}


# Calculate table size
function Get-TableSize {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline)]
        [string] $tableText
    )

    process {
        # Remove ANSI control codes
        $cleanedTable = $tableText -replace '\e\[\d+(;\d+)?m', ''

        # Split into lines and measure maximum length
        $lineLengths = $cleanedTable -split "`n" | ForEach-Object { $_.Length }

        # Calculation of maximum width and height
        $tableSize = $lineLengths | Measure-Object -Maximum | Select-Object @{Name = "Width"; Expression = { [int]$_.Maximum } }, 
        @{Name = "Height"; Expression = { [int]$_.Count } }

        $tableSize
    }
}

# Screen cleaning
Clear-Host

# Get and display terminal window size
$windowWidth = $host.UI.RawUI.WindowSize.Width
$windowHeight = $host.UI.RawUI.WindowSize.Height
Write-Output "WindowSize: $windowWidth x $windowHeight"

# List of colors for 1st palette
$colorList1 = @("Default", "Black", "Red", "Green", "Yellow", "Blue", "Magenta", "Cyan", "White", "BrightBlack", "BrightRed", "BrightGreen", "BrightYellow", "BrightBlue", "BrightMagenta", "BrightCyan", "BrightWhite", "Reverse")

# List of colors for 2nd palette
$colorList2 = @("Default", "Black", "BrightBlack", "Red", "BrightRed", "Green", "BrightGreen", "Yellow", "BrightYellow", "Blue", "BrightBlue", "Magenta", "BrightMagenta", "Cyan", "BrightCyan", "White", "BrightWhite", "Reverse")

# Get a palette from the list of colors
# $colorPalette1 = Get-ColorPalette -colorList $colorList1
# $colorPalette2 = Get-ColorPalette -colorList $colorList2
$colorPalette1 = $colorList1 | Get-ColorPalette
$colorPalette2 = $colorList2 | Get-ColorPalette

# Get a color table from the palette
$colorTable1 = Get-ColorTable -colorPalette $colorPalette1
$colorTable2 = Get-ColorTable -colorPalette $colorPalette2

# Get table sizes
$tableSize1 = Get-TableSize -tableText $colorTable1
$tableSize2 = Get-TableSize -tableText $colorTable2

# Show color tables and their sizes
Write-Output $colorTable1, "TableSize: $($tableSize1.Width) x $($tableSize1.Height)"
Write-Output $colorTable2, "TableSize: $($tableSize2.Width) x $($tableSize2.Height)"

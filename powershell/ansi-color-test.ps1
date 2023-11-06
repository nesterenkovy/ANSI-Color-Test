# Table fields separator
$separator = " "
$cellText = " myTest "

# Screen cleaning
Clear-Host

# Get ANSI colors 
$FGcolors = [enum]::GetValues([System.ConsoleColor])
$BGcolors = $FGcolors

# Cycle to display a table of text and background combinations
Foreach ($FGcolor in $FGcolors) {
    Foreach ($BGcolor in $BGcolors) {
        Write-Host -NoNewline "$cellText" -ForegroundColor $FGcolor -BackgroundColor $BGcolor
        Write-Host -NoNewline "$separator"
    }
    Write-Host ""
}

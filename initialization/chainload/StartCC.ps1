# StartCC.ps1 - script to start console config script
#$path = initialization\chainload\ConsoleConfig.ps1

# THE PROBLEM IS IN THE NEXT 3 LINES
#$path2 = "\Desktop\V2\initialization\chainload\ConsoleConfig.ps1"
#$path = $Home+$path2
# Start-Process PowerShell.exe -ArgumentList "-NoProfile -NoExit -ExecutionPolicy Bypass -File $path" -Verb RunAs
$path = Split-Path -Parent $MyInvocation.MyCommand.Path
$path -replace ".{24}$" # V2\
Start-Process PowerShell.exe -ArgumentList "-NoProfile -NoExit -ExecutionPolicy Bypass -File $path\initialization\chainload\ConsoleConfig.ps1" -Verb RunAs

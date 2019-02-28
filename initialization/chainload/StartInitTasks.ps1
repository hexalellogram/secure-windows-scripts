# StartInitTasks.ps1 - script to start initialization tasks

# $path = initialization\InitializationTasks.ps1
Read-Host "press enter to start initialization tasks"
#$path2 = "\Desktop\V2\initialization\InitializationTasks.ps1"
#$path = $Home + $path2
#Start-Process PowerShell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File $path" -Verb RunAs
$path = Split-Path -Parent $MyInvocation.MyCommand.Path
$newPath = $path -replace ".{24}$" # V2\initialization
#Start-Process PowerShell.exe -ArgumentList "-NoProfile -NoExit -ExecutionPolicy Bypass -File `"$path\InitializationTasks.ps1`"" -Verb RunAs
Write-Host "Starting transcription of all commands and output to this console to the file results\ScriptTranscript.txt"
Start-Transcript $newPath\results\ScriptTranscript.txt
Invoke-Expression "& '$newPath\initialization\InitializationTasks.ps1'"

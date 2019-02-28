# InitializationTasks.ps1 - Script to run all the initialization tasks
Read-Host "welcome to initialization tasks, press enter to continue"

$Global:scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$Global:ScriptPath = $Global:scriptPath -replace ".{14}$" # V2\

#Invoke-Expression initialization\CheckAdmin.ps1
Invoke-Expression "& '$Global:scriptPath\initialization\CheckAdmin.ps1'"
#Invoke-Expression initialization\PowerShellVersionCheck.ps1
Invoke-Expression "& '$Global:scriptPath\initialization\PowerShellVersionCheck.ps1'"
#Invoke-Expression initialization\TOS.ps1
Invoke-Expression "& '$Global:scriptPath\initialization\TOS.ps1'"
Write-Host "Initialization Tasks done. Launching main script."

#$path = (Resolve-Path .\).Path
#Invoke-Expression $path\Launcher.ps1
#Invoke-Expression $Global:scriptPath\Launcher.ps1
Invoke-Expression "& '$Global:scriptPath\variables\SetVariables.ps1'"

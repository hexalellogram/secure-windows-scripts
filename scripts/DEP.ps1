# DEP.ps1 - Script to enable Data Execution Prevention
Invoke-Expression "bcdedit.exe /set nx AlwaysOn"
Write-Host "DEP Enabled"
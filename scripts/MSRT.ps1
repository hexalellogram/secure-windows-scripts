# MSRT.ps1 - script to execute the vbs script

Write-Host "Running MSRT Script in new window..."
Start-Process cscript.exe "$Global:scriptPath\dependencies\MSRT.vbs"

@echo off
REM script to restart powershell to apply new color scheme
REM taskkill /F /IM powershell.exe
REM kill previous powershell instance with weird colors
echo Starting Starter of Initialization Tasks in 5 seconds..
timeout /t 5
REM start PowerShell.exe -NoProfile -NoExit -File %USERPROFILE%\Desktop\V2\initialization\chainload\InitializationTasks.ps1 -Verb RunAs 
REM powershell -noprofile -command "&{ Start-Process powershell -ArgumentList '-noprofile -file %~dp0\StartInitTasks.ps1' -verb RunAs}"
REM start PowerShell.exe -NoExit -NoProfile -File %~dp0\StartInitTasks.ps1 -Verb RunAs 
REM above line does not start the script as an administrator
start PowerShell.exe -NoProfile -File "%~dp0\StartInitTasks.ps1" -Verb RunAs
echo Exiting in 3 seconds...
timeout /t 3

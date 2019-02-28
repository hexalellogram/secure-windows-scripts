@echo off
echo Starting run of scripts...

REM regedit /s %~dp0\dependencies\registry\ExecPolicy.reg 
reg ADD HKLM\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell /v Path /t REG_SZ /d C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe /f
reg ADD HKLM\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell /v ExecutionPolicy /t REG_SZ /d Unrestricted /f
REM Sets Execution Policy for PowerShell scripts to unrestricted
echo Execution Policy Configured...
timeout /t 3

echo Copying script folder path to text file...
echo %~dp0 > "%~dp0\results\path"

echo Running Console Configuration...
start PowerShell.exe -NoProfile -File "%~dp0\SetPath.ps1" -Verb RunAs
echo Exiting in 3 seconds...
timeout /t 3

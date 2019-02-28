# UAC.ps1 - script to enable User Account Control
Write-Host "Enabling UAC"
Invoke-Expression 'reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 1 /f'
Write-Host "UAC enabled"

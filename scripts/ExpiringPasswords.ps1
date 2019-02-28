# ExpiringPasswords.ps1 - script to set all users passwords to expire

Write-Host "Making all user passwords expiring..."
Invoke-Expression "$env:SystemDrive\Windows\System32\cmd.exe /C wmic path Win32_UserAccount where PasswordExpires=false set PasswordExpires=true"
Write-Warning "All user passwords have been set to expiring."

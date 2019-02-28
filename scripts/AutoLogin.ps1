# AutoLogin.ps1 - script to disable automatic login - now with automatic registry configuration

$regcheck = Test-Path $Global:scriptPath\dependencies\registry\AutoLogon.reg
if ($regcheck -eq $True)
{
    Write-Host "Disabling automatic login..."
    Invoke-Expression "regedit /s dependencies\AutoLogon.reg"
    Write-Host "Automatic login disabled."
    Write-Warning "Please remember that the password for all the user accounts is 'Competition1!' (without the quotes)"
}
else 
{
    Write-Warning "AutoLogon.reg not found!"
    Write-Host "Skipping autologon configuration"
}

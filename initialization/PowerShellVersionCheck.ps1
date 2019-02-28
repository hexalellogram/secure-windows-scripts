# PowerShellVersionCheck.ps1 - Check the Powershell Version

Write-Host "Checking for adequate version of Powershell"
if ($PSVersionTable.PSVersion -eq "1")
{
    Write-Warning "Insufficient verison of Powershell, you have version 1 and we need 2.0 or above."
    Write-Host "Terminating..."
    Stop-Transcript
    throw "Error: Insufficient version of Powershell detected"
}
else 
{
    Write-Host "Detected Powershell version 2.0 or greater, proceeding..."
}
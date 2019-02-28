# CheckAdmin - Script to check if we have administrator privileges.

Write-Host "Checking for administrator privileges..."
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
			[Security.Principal.WindowsBuiltInRole] "Administrator"))
{
	Write-Warning "You do not have Administrator rights to run this script!`nPlease re-run this script as an Administrator!"
	Write-Host "Terminating..."
#	Stop-Transcript
	throw "Error: No Administrator privileges detected."
}
else
{
    Write-Host "Administrator privileges detected, proceeding"
}
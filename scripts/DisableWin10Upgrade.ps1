# DisableWin10Upgrade.ps1 - script to disable Microsoft's automatic Windows 10 upgrade
function Disable-W10Upgrade
{

	Invoke-Expression 'reg ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v DisableOSUpgrade /t REG_DWORD /d 00000001 /f' 
	Invoke-Expression 'reg ADD HKLM\SOFTWARE\SOFTWARE\Policies\Microsoft\Windows\GWX /v DisableGWX /t REG_DWORD /d 00000001 /f' 
}

if ($Global:operatingSystem -Like "*Windows 7*" -or $Global:operatingSystem  -Like "*Windows 8 *" -or $Global:operatingSystem  -Like "*Windows 8.1*")
{
	Disable-W10Upgrade
}
else
{
	Write-Host "There is no need to run this script if you are on Windows 10 or later."
	Write-Host "All it does is disable the automatic upgrade to Windows 10 on Windows 7, 8, and 8.1, so running it on Windows Vista (not eligible for the upgrade) or Windows 10 is pointless."
	Write-Host "There is also no need to run this script if the Registry indicators have been deleted"
	Write-Host "No Registry indicators indicates that the upgrade has already been disabled."
}

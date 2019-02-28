# RemoteDesktop.ps1 - script to disable remote desktop
Write-Warning "Please be sure that you want to disable remote desktop and that the README does not specify for it to be enabled!"
Write-Warning "As of 2016 there is a bug in the Competition Scoring Engine that does not reward points for Remote Desktop being reenabled after being disabled if it was required!"
Write-Warning "We do not know if this bug has been fixed!"
Write-Warning "If you disable Remote Desktop and the README calls for it to be enabled, you WILL NOT be able to recover the points lost!"
$disablerdp = Read-Host "Would you like to disable Remote Desktop? [Y/n]"
if ($disablerdp -ne "n")
{
	# set registry values to disable remote desktop
	Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server' -Name fDenyTSConnections -Value 1
	Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name UserAuthentication -Value 1
}
else
{
	Write-Host "You have chosen to skip disabling Remote Desktop"
	Write-Host "Disable it anytime by clicking Start Menu -> Right Click on Computer -> Properties -> Remote settings (in the sidebar)"
}

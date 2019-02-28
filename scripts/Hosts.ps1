# Hosts.ps1 - script to replace hosts file with stock hosts file

if ($Global:operatingSystem -Like "*Windows 10*")
{

	Invoke-Expression "copy `"$env:SystemDrive\Windows\System32\drivers\etc\hosts`" `"$Global:scriptPath\results\HostsBackup`"" # backup old hosts file
	Invoke-Expression "copy `"$Global:scriptPath\dependencies\hosts\HostWin10`" `"$env:SystemDrive\Windows\System32\drivers\etc\hosts`"" # replace old hosts file with new clean one
	Write-Host "host file copied. a backup is in results\HostBackup if anything went wrong"
	
}
elseif ($Global:operatingSystem -Like "*Windows 8 *")
{

	Invoke-Expression "copy `"$env:SystemDrive\Windows\System32\drivers\etc\hosts`" `"$Global:scriptPath\results\HostsBackup`"" # backup old hosts file
	Invoke-Expression "copy `"$Global:scriptPath\dependencies\hosts\HostWin8`" `"$env:SystemDrive\Windows\System32\drivers\etc\hosts`"" # replace old hosts file with new clean one
	Write-Host "host file copied. a backup is in results\HostBackup if anything went wrong"

}
elseif ($Global:operatingSystem -Like "*Windows 8.1*")
{

	Invoke-Expression "copy `"$env:SystemDrive\Windows\System32\drivers\etc\hosts`" `"$Global:scriptPath\results\HostsBackup`"" # backup old hosts file
	Invoke-Expression "copy `"$Global:scriptPath\dependencies\hosts\HostWin8`" `"$env:SystemDrive\Windows\System32\drivers\etc\hosts`"" # replace old hosts file with new clean one
	Write-Host "host file copied. a backup is in results\HostBackup if anything went wrong"

}
elseif ($Global:operatingSystem -Like "*Windows 7*")
{
	
	Invoke-Expression "copy `"$env:SystemDrive\Windows\System32\drivers\etc\hosts`" `"$Global:scriptPath\results\HostsBackup`"" # backup old hosts file
	Invoke-Expression "copy `"$Global:scriptPath\dependencies\hosts\HostWin7`" `"$env:SystemDrive\Windows\System32\drivers\etc\hosts`"" # replace old hosts file with new clean one
	Write-Host "host file copied. a backup is in results\HostBackup if anything went wrong"
}

elseif ($Global:operatingSystem -Like "*Windows Vista*")
{
	
	Invoke-Expression "copy `"$env:SystemDrive\Windows\System32\drivers\etc\hosts`" `"$Global:scriptPath\results\HostsBackup`"" # backup old hosts file
	Invoke-Expression "copy `"$Global:scriptPath\dependencies\hosts\HostWinVista`" `"$env:SystemDrive\Windows\System32\drivers\etc\hosts`"" # replace old hosts file with new clean one
	Write-Host "host file copied. a backup is in results\HostBackup if anything went wrong"
	
}
elseif ($Global:operatingSystem -Like "*Windows Server 2012 R2*")
{

	Invoke-Expression "copy `"$env:SystemDrive\Windows\System32\drivers\etc\hosts`" `"$Global:scriptPath\results\HostsBackup`"" # backup old hosts file
	Invoke-Expression "copy `"$Global:scriptPath\dependencies\hosts\HostWin8`" `"$env:SystemDrive\Windows\System32\drivers\etc\hosts`"" # replace old hosts file with new clean one
	Write-Host "host file copied. a backup is in results\HostBackup if anything went wrong"
	
}
elseif ($Global:operatingSystem -Like "*Windows Server 2012*")
{
	
	Invoke-Expression "copy `"$env:SystemDrive\Windows\System32\drivers\etc\hosts`" `"$Global:scriptPath\results\HostsBackup`"" # backup old hosts file
	Invoke-Expression "copy `"$Global:scriptPath\dependencies\hosts\HostWin8`" `"$env:SystemDrive\Windows\System32\drivers\etc\hosts`"" # replace old hosts file with new clean one
	Write-Host "host file copied. a backup is in results\HostBackup if anything went wrong"

}
elseif ($Global:operatingSystem -Like "*Windows Server 2008 R2*")
{
	
	Invoke-Expression "copy `"$env:SystemDrive\Windows\System32\drivers\etc\hosts`" `"$Global:scriptPath\results\HostsBackup`"" # backup old hosts file
	Invoke-Expression "copy `"$Global:scriptPath\dependencies\hosts\HostWin7`" `"$env:SystemDrive\Windows\System32\drivers\etc\hosts`"" # replace old hosts file with new clean one
	Write-Host "host file copied. a backup is in results\HostBackup if anything went wrong"
	
}
elseif ($Global:operatingSystem -Like "*Windows Server* 2008*")
{
	
	Invoke-Expression "copy `"$env:SystemDrive\Windows\System32\drivers\etc\hosts`" `"$Global:scriptPath\results\HostsBackup`"" # backup old hosts file
	Invoke-Expression "copy `"$Global:scriptPath\dependencies\hosts\HostWinVista`" `"$env:SystemDrive\Windows\System32\drivers\etc\hosts`"" # replace old hosts file with new clean one
	Write-Host "host file copied. a backup is in results\HostBackup if anything went wrong"
}

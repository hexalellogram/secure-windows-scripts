# DeleteAdmins.ps1 - script to delete unnecessary administrators


Get-Content $Global:scriptPath\files\ProtectAdmins.txt | Write-Host # parse ProtectAdmins.txt file
$contentcheck = Read-Host "Does ProtectAdmins.txt (displayed above) include the Administrator, as well as all Administrators listed in the README? [Y/n]"
if ($contentcheck -ne "n")
{
	if (Test-Path $Global:scriptPath\files\ProtectAdmins.txt)
	{
		$array = Get-WmiObject -Query "select * from Win32_UserAccount" | ?{ (Get-Content $Global:scriptPath\files\ProtectAdmins.txt) -notcontains $_.name } # select administrators to delete
		$object = $array | Foreach-Object {"$($_.Caption)"}
		Foreach ($string in $object)
		{
			$output = net localgroup Administrators $string /delete 2>&1 # delete administrators
			Write-Host "User $string removed from Administrators OR $string was not an administrator to begin with"
			Clear-Variable -Name output
		}
		Write-Host "Administrators removed."
		Invoke-Expression "& '$Global:scriptPath\dependencies\AddAdmin.ps1'"
	}
	else
	{
		Write-Warning "ProtectAdmins.txt not found in the proper location!"
		Write-Host "Please move the ProtectAdmins.txt file to its proper location and try again."
	}
}
else
{
	Write-Host "Please add Administrator to the ProtectAdmins.txt file if they are not already there."
	Write-Host "You have specified that the administrators listed above in ProtectAdmins.txt are not fully correct."
	Write-Host "Skipping administrator deletion."
}

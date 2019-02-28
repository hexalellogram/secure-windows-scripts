# DeleteUsers.ps1 - script to delete unnecessary users

Get-Content $Global:scriptPath\files\ProtectUsers.txt | Write-Host
$contentcheck = Read-Host "Does ProtectUsers.txt (displayed above) include all users listed in the README? [Y/n]"
if ($contentcheck -ne "n")
{
	if (Test-Path $Global:scriptPath\files\ProtectUsers.txt)
	{
		$array = Get-WmiObject -Query "select * from Win32_UserAccount" | ?{ (Get-Content $Global:scriptPath\files\ProtectUsers.txt) -notcontains $_.name } # select users to delete
		$object = $array | Foreach-Object {"$($_.Name)"}
		Foreach ($string in $object)
		{
			if ($string -ne "HomeGroupUser$")
			{
				$output = net user $string /delete 2>&1 # delete users
				Write-Host "User $string deleted."
				Clear-Variable -Name output
			}

		}
	}
	else
	{
		Write-Warning "ProtectUsers.txt not found in the proper location!"
		Write-Host "Please move the ProtectUsers.txt file to its proper location and try again."
	}
	Invoke-Expression "& '$Global:scriptPath\dependencies\AddUser.ps1'"
}
else
{
	Write-Host "Please add Administrator and Guest to the ProtectUsers.txt file if they are not already there."
	Write-Host "You have specified that the users listed above in ProtectUsers.txt are not fully correct."
	Write-Host "Skipping user deletion"
}


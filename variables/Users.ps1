# Users.ps1 - Script to set known good users

$txtcheck = Test-Path $Global:scriptPath\files\ProtectUsers.txt
if ($txtcheck -eq $true)
{
	Write-Host "Notepad will open the ProtectUsers.txt file so you can add the users necessary from the README."
	Invoke-Expression "notepad.exe $Global:scriptPath\files\ProtectUsers.txt"
	Write-Warning "Please do not continue until ProtectUsers.txt is edited and saved!"
	Read-Host "Press enter to continue..."
    $fileContent = Get-Content $Global:scriptPath\files\ProtectUsers.txt
    $adminCheck = $fileContent -notcontains "Administrator"
    $guestCheck = $fileContent -notcontains "Guest"
	if ($adminCheck -or $guestCheck)
	{
		Write-Host "System Administrator or Guest account not found!"
        Write-Host "Re-running script to set users"
        Invoke-Expression $Global:scriptPath\variables\Users.ps1
	}
	else 
	{
		Write-Host $fileContent
	}
}
else
{
	Write-Warning "ProtectUsers.txt not found in the proper location!"
	Write-Host "Please move the ProtectUsers.txt file to its proper location and try again."
}

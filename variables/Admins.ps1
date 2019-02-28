# Admins.ps1 - Script to set known good administrators

$txtcheck = Test-Path $Global:scriptPath\files\ProtectAdmins.txt
if ($txtcheck -eq $true)
{
	Write-Host "Notepad will open the ProtectAdmins.txt file so you can add the users necessary from the README."
	Invoke-Expression "notepad.exe $Global:scriptPath\files\ProtectAdmins.txt"
	Write-Warning "Please do not continue until ProtectAdmins.txt is edited and saved!"
	Read-Host "Press enter to continue..."
    $fileContent = Get-Content $Global:scriptPath\files\ProtectAdmins.txt
    $adminCheck = $fileContent -notcontains "Administrator"
	if ($adminCheck -eq $true)
	{
		Write-Host "System Administrator account not found!"
        Write-Host "Re-running script to set admins"
        Invoke-Expression $Global:scriptPath\variables\Admins.ps1
	}
	else 
	{
		Write-Host $fileContent
	}
}
else
{
	Write-Warning "ProtectAdmins.txt not found in the proper location!"
	Write-Host "Please move the ProtectAdmins.txt file to its proper location and try again."
}

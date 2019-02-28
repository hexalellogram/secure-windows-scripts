# UserGroups.ps1 - script to display user groups

Write-Host "These are the current User groups"
[string[]]$output = Invoke-Expression "net localgroup" # list user groups

New-Item $Global:scriptPath\results\Groups.txt -type file | Out-Null
foreach ($str in $output)
{
    Add-Content $Global:scriptPath\results\Groups.txt $str
    Write-Host $str
}

$path = Get-ChildItem $Global:scriptPath\results\Groups.txt
Write-Host "Output of user groups saved to:" $path

$openusergroups = Read-Host "Do you want to modify these user groups? [Y/n]"
if ($openusergroups -ne "n")
{
	Invoke-Expression "& '$Global:scriptPath\dependencies\ModifyUserGroup.ps1'" # run script to modify user groups
}
else
{
	Write-Host "Proceeding to next script"
}

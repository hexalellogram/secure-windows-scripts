# ModifyUserGroup.ps1 - script to modify user groups
$choosepath = Read-Host "Remove user from a group (1) or remove group (2), or s to skip? [1/2/s]"
if ($choosepath -eq "1")
{
  $choosegroup = Read-Host "Specify group to act on"
  $removeUserFromGroup = Read-Host "Specify user to remove from group $choosegroup"
  $confirm = "Are you sure you want to remove $removeUserFromGroup from $choosegroup? [Y/n]"
  if ($confirm -ne "n")
  {
    Invoke-Expression "net localgroup $choosegroup $removeUserFromGroup /delete" # remove user from group
    Write-Host "Removed user $removeUserFromGroup from group $choosegroup. Returning to prompt"
    Invoke-Expression "& '$Global:scriptPath\dependencies\ModifyUserGroup.ps1'"
  }
  else
  {
    Write-Host "Did not remove $removeUserFromGroup from $choosegroup. Returning to prompt"
    Invoke-Expression "& '$Global:scriptPath\dependencies\ModifyUserGroup.ps1'"
  }
}
elseif ($choosepath -eq "2")
{
  $removeGroup = Read-Host "Specify group to act on"
  $confirm = "Are you sure you want to remove group $removeGroup? [Y/n]"
  if ($confirm -ne "n")
  {
    Invoke-Expression "net localgroup $removeGroup /delete" # remove group
    Write-Host "Removed group $removeGroup. Returning to prompt."
    Invoke-Expression "& '$Global:scriptPath\dependencies\ModifyUserGroup.ps1'"
  }
}
elseif ($choosepath -eq "s")
{
  Write-Host "Proceeding to next script"
}
else
{
  Write-Host "Invalid choice. Returning to prompt"
  Invoke-Expression "& '$Global:scriptPath\dependencies\ModifyUserGroup.ps1'"
}

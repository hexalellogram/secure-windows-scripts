# DeleteFromProgramFiles.ps1 - script to delete folders from Program Files

$delitem = Read-Host "Type the EXACT name of the folder you want to remove (s to skip, cp to run Control Panel to get to the Add or Remove Programs page)"
if ($delitem -eq "s")
{
  Write-Host "Moving on to next script"
}
elseif ($delitem -eq "cp")
{
  Write-Host "Opening Control Panel to Add or Remove Programs..."
  Invoke-Expression "appwiz.cpl"
  Write-Host "Returning to Program Files prompt..."
  Invoke-Expression "& '$Global:scriptPath\dependencies\DeleteFromProgramFiles.ps1'"
}
else
{
  $confirm = Read-Host "Confirm deletion of $delitem? [Y/n]"
  if ($confirm -ne "n")
  {
    Remove-Item "$env:SystemDrive\Program Files\$delitem" -Recurse -Force -erroraction silentlycontinue
    Remove-Item "$env:SystemDrive\Program Files (x86)\$delitem" -Recurse -Force -erroraction silentlycontinue
    Write-Host "$delitem has been removed"
    Write-Host "Returning to prompt..."
    Invoke-Expression "& '$Global:scriptPath\dependencies\DeleteFromProgramFiles.ps1'"
  }
  else
  {
    Write-Host "Deletion cancelled. Returning to prompt..."
    Invoke-Expression "& '$Global:scriptPath\dependencies\DeleteFromProgramFiles.ps1'"
  }
}

# DeleteTasks.ps1 - script to delete scheduled tasks
$taskname = Read-Host "Enter name of task to delete (s to skip)"
if ($taskname -eq "s")
{
  Write-Host "Proceeding to next script..."
}
else
{
  try
  {
    Invoke-Expression "schtasks /delete /tn $taskname"
    Write-Host "Returning to deletion prompt..."
  }
  catch
  {
    Write-Warning "Scheduled Task with name" $taskname "not found, please try again"
  }
    Invoke-Expression "& '$Global:scriptPath\dependencies\DeleteTasks.ps1'"
  
}


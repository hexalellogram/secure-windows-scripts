# ScheduledTasks.ps1 - Script to view Scheduled Tasks

Write-Host "Viewing non-Microsoft scheduled tasks..."
Invoke-Expression "& '$Global:scriptPath\dependencies\NormalScheduledTasks.ps1'"

Write-Host "Viewing Microsoft scheduled tasks..."
Invoke-Expression "schtasks /query /tn Microsoft\" # view microsoft scheduled tasks in command line

$choice = Read-Host "Would you like to delete scheduled tasks? [Y/n]"
if ($choice -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\dependencies\DeleteTasks.ps1'"
}
else 
{
    Write-Host "Deleting scheduled tasks skipped"
}

# AddUser.ps1 - script to add users that were accidentally deleted
$user1 = Read-Host "Deleted any unnecessary users? Type in the name of the user to re add (s to skip or if done)"
if ($user1 -ne 's')
{
    Invoke-Expression "net user $user1 /add" # add user
    Write-Host "Returning to screen if you need to add another user..."
    Invoke-Expression "& '$Global:scriptPath\dependencies\AddUser.ps1'"
}
else
{
    Write-Host "You have chosen to skip adding user configuration, or it is all done. You can re run AddUser.ps1 to come back at any time"
}

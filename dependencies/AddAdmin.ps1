# AddAdmin.ps1 - script to add users to Administrators

$admin = Read-Host "Deleted any unnecessary administrators? Type in the name of the administrator to re add (s to skip or if done)"
if ($admin -ne 's')
{
    Invoke-Expression "net localgroup Administrators $admin /add" # add user
    Write-Host "Returning to screen if you need to add another administrator..."
    Invoke-Expression "& '$Global:scriptPath\dependencies\AddAdmin.ps1'"
}
else
{
    Write-Host "You have chosen to skip adding administrator configuration, or it is all done. You can re run AddAdmin.ps1 to come back at any time"
}

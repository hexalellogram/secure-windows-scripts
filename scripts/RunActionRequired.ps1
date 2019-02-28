# RunActionRequired.ps1

Write-Host "Running scripts that require user input"

if ($Global:questionsHashTable.remoteDesktop -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\RemoteDesktop.ps1'" # done
}
if ($Global:questionsHashTable.computerProperties -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\ComputerProperties.ps1'" # done
}
if ($Global:questionsHashTable.logs -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\Logs.ps1'" # done
}
if ($Global:questionsHashTable.scheduledTasks -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\ScheduledTasks.ps1'" # done
}
if ($Global:questionsHashTable.shares -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\Shares.ps1'" # done
}
if ($Global:questionsHashTable.startupItems -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\StartupItems.ps1'" # done
}
if ($Global:questionsHashTable.deleteUsers -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\DeleteUsers.ps1'" # done
}
if ($Global:questionsHashTable.deleteAdmins -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\DeleteAdmins.ps1'" # done
}
if ($Global:questionsHashTable.userGroups -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\UserGroups.ps1'" # done
}
if ($Global:questionsHashTable.programFiles -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\ProgramFiles.ps1'"
}

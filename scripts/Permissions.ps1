# Permissions.ps1 - Reset All Permissions to Default

Write-Warning "This script takes forever. Please be sure you want to continue with it. It also may break things."
$continueStatus = Read-Host "Do you want to continue? [y/N]"

if ($continueStatus -eq "y")
{

    Write-Host "Please make note of any special file/folder permissions such as file shares"
    Write-Warning "Take a picture of the score report NOW because if something is going to go wrong, it is going to be during this script"
    Read-Host "Press enter to continue to reset all file permissions to default"

    Write-Host "Backing up permissions..."
    Invoke-Expression "icacls $Global:scriptPath\files\ACL-Backup /save perms.txt /t /c"

    Write-Host "Resetting permissions..."

    $sxsPath = "$env:SystemDrive\Windows\WinSxS"
    $cscPath = "$env:SystemDrive\Windows\CSC"
    $commonFilesPath = "$env:SystemDrive\Program Files\Common Files\"

    Get-ChildItem $env:SystemDrive\ -recurse | % {
        # failed filter attempt to filter out trustedinstaller owned objects is the comment below
        # Get-ChildItem $env:SystemDrive\ -recurse | Where-Object { ((Get-Acl -Path $_).Owner -notcontains "TrustedInstaller")} | foreach { Write-Host "success: " $_.FullName; Read-Host "enter to continue"}
        if ($_.FullName -notcontains $sxsPath -or $_.FullName -notcontains $csc -or $_.FullName -notcontains $commonFilesPath) 
        {
            Invoke-Expression "icacls `$_.FullName /Q /C /RESET >> $Global:scriptPath\results\icaclsErrors 2>&1" # Reset all permissions on C: Drive to default
            # stuff after the >> redirects to icaclsError file instead of spamming up cmd window
        }
        else 
        {
            Write-Host "This folder has been skipped!"
        }
    }

    $status = Read-Host "Any permissions noticeably broken or points missing due to this? [y/N]"
    if ($status -eq "N")
    {
        Read-Host "If you got any points from resetting permissions take note of them now. Press enter to continue and undo our permissions changes..."
        Write-Host "Restoring old permissions..."
        Invoke-Expression "icacls $env:SystemDrive /restore $Global:scriptPath\files\ACL-Backup /c /q"
    }
    else
    {
        Write-Host "If anything ends up broken later run icacls $env:SystemDrive /restore $Global:scriptPath\files\ACL-Backup /c /q to restore the old permissions "
    }
}
else 
{
    Write-Host "You can run this script at any time by running $Global:scriptPath\scripts\Permissions.ps1"
}


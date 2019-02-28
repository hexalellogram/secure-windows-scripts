# Questions.ps1 - A prettier Questions script to set global choice variables

[string[]]$optionsArr = @()
$optionsArr += "Enable Windows Update"
$optionsArr += "Run MSRT"
$optionsArr += "Start Caffeine"
$optionsArr += "Configure Firewall"
$optionsArr += "List Open Ports"
$optionsArr += "Set Expiring Passwords"
$optionsArr += "Disable Autologin"
$optionsArr += "Delete Media Files"
$optionsArr += "Check Shares"
$optionsArr += "Disable Services"
$optionsArr += "Disable Telnet"
$optionsArr += "Disable Remote Desktop"
$optionsArr += "Enable DEP"
$optionsArr += "View Processes"
$optionsArr += "View Logs in Event Viewer"
$optionsArr += "View Scheduled Tasks"
$optionsArr += "Find Hacking Tools"
$optionsArr += "Show Startup Items"
$optionsArr += "Reset IE to default"
$optionsArr += "Secure IE Settings"
$optionsArr += "View Computer Properties Dialog"
$optionsArr += "Disable Win10 Upgrade"
$optionsArr += "Uninstall QuickTime"
$optionsArr += "Delete Users"
$optionsArr += "Remove Administrators"
$optionsArr += "View User Groups"
$optionsArr += "Remove Win10 Bloat"
$optionsArr += "Replace Hosts File"
$optionsArr += "Create God Mode Shortcut"
$optionsArr += "Flush DNS Cache"
$optionsArr += "Set Up Secpol"
$optionsArr += "Enable UAC"
$optionsArr += "Clean Up Program Files"
$optionsArr += "Uninstall Common Programs"
$optionsArr += "Configure Group Policy"

[string[]]$varsArr = @()
$varsArr += $Global:autoUpdate
$varsArr += $Global:msrt
$varsArr += $Global:caffeine
$varsArr += $Global:firewall
$varsArr += $Global:ports
$varsArr += $Global:expiringPasswords
$varsArr += $Global:setPasswords
$varsArr += $Global:autoLogin
$varsArr += $Global:mediaFiles
$varsArr += $Global:shares
$varsArr += $Global:services
$varsArr += $Global:telnet
$varsArr += $Global:remoteDesktop
$varsArr += $Global:dep
$varsArr += $Global:processes
$varsArr += $Global:logs
$varsArr += $Global:scheduledTasks
$varsArr += $Global:hackingTools
$varsArr += $Global:startupItems
$varsArr += $Global:ieDefault
$varsArr += $Global:secureIE
$varsArr += $Global:computerProperties
$varsArr += $Global:disableWin10Upgrade
$varsArr += $Global:uninstallQuickTime
$varsArr += $Global:deleteUsers
$varsArr += $Global:deleteAdmins
$varsArr += $Global:userGroups
$varsArr += $Global:removeWin10Bloat
$varsArr += $Global:hosts
$varsArr += $Global:godMode
$varsArr += $Global:flushDNS
$varsArr += $Global:secpol
$varsArr += $Global:uac
$varsArr += $Global:ProgramFiles
$varsArr += $Global:uninstallCommon
$varsArr += $Global:groupPolicy

$longest = 0;
for($i = 0; $i -lt $optionsArr.length; $i++) # determine longest question
{
    if ($longest -lt $optionsArr[$i].length)
    {
        $longest = $optionsArr[$i].length
    }
}

# prompting in the array replaces the variable in the array with the input
for($i = 0; $i -lt $optionsArr.length; $i++)
{
    $string = "Do you want to: {0,$longest}" -f $optionsArr[$i]
    $varsArr[$i] = Read-Host $string "[Y/n]"
    if ($varsArr[$i] -ne "n")
    {
        $varsArr[$i] = "Y"
    }
    Write-Host $optionsArr[$i] "is set as" $varsArr[$i]
}

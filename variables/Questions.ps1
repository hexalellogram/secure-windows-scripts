# Questions.ps1 - A prettier Questions script to set global choice variables

# ADD NEW THINGS TO THE OPTIONS ARRAY AT THE BOTTOM OF THIS BLOCK
[string[]]$optionsArr = @()
$optionsArr += "Enable Windows Update"
$optionsArr += "Run MSRT"
$optionsArr += "Start Caffeine"
$optionsArr += "Configure Firewall"
$optionsArr += "List Open Ports"
$optionsArr += "Set Expiring Passwords"
$optionsArr += "Set Passwords to Competition1!"
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
$optionsArr += "Enable Randomized ASLR Protection"
$optionsArr += "Reset File Permissions"
$optionsArr += "Configure Baseline Group Policy Settings"

# ADD NEW THINGS TO THE HASH TABLE AT THE BOTTOM OF THIS BLOCK
$Global:questionsHashTable = New-Object System.Collections.Specialized.OrderedDictionary
$Global:questionsHashTable.Add("autoUpdate", "")
$Global:questionsHashTable.Add("msrt", "")
$Global:questionsHashTable.Add("caffeine", "")
$Global:questionsHashTable.Add("firewall", "")
$Global:questionsHashTable.Add("ports", "")
$Global:questionsHashTable.Add("expiringPasswords", "")
$Global:questionsHashTable.Add("setPasswords", "")
$Global:questionsHashTable.Add("autoLogin", "")
$Global:questionsHashTable.Add("mediaFiles", "")
$Global:questionsHashTable.Add("shares", "")
$Global:questionsHashTable.Add("services", "")
$Global:questionsHashTable.Add("telnet", "")
$Global:questionsHashTable.Add("remoteDesktop", "")
$Global:questionsHashTable.Add("dep", "")
$Global:questionsHashTable.Add("processes", "")
$Global:questionsHashTable.Add("logs", "")
$Global:questionsHashTable.Add("scheduledTasks", "")
$Global:questionsHashTable.Add("hackingTools", "")
$Global:questionsHashTable.Add("startupItems", "")
$Global:questionsHashTable.Add("ieDefault", "")
$Global:questionsHashTable.Add("secureIE", "")
$Global:questionsHashTable.Add("computerProperties", "")
$Global:questionsHashTable.Add("disableWin10Upgrade", "")
$Global:questionsHashTable.Add("uninstallQuickTime", "")
$Global:questionsHashTable.Add("deleteUsers", "")
$Global:questionsHashTable.Add("deleteAdmins", "")
$Global:questionsHashTable.Add("userGroups", "")
$Global:questionsHashTable.Add("removeWin10Bloat", "")
$Global:questionsHashTable.Add("hosts", "")
$Global:questionsHashTable.Add("godMode", "")
$Global:questionsHashTable.Add("flushDNS", "")
$Global:questionsHashTable.Add("secpol", "")
$Global:questionsHashTable.Add("uac", "")
$Global:questionsHashTable.Add("programFiles", "")
$Global:questionsHashTable.Add("uninstallCommon", "")
$Global:questionsHashTable.Add("groupPolicy", "")
$Global:questionsHashTable.Add("enableASLR", "")
$Global:questionsHashTable.Add("filePermissions", "")
$Global:questionsHashTable.Add("baselineGPO", "")

$longest = 0;
for($i = 0; $i -lt $optionsArr.length; $i++) # determine longest question
{
    if ($longest -lt $optionsArr[$i].length)
    {
        $longest = $optionsArr[$i].length
    }
}

$i = 0
$arr = @($Global:questionsHashTable.keys)
foreach ($key in $arr)
{
    $message = "Do you want to: {0,$longest}" -f $optionsArr[$i]
    $inputString = Read-Host $message "[Y/n]"
    if ($inputString -ne $null)
    {
        $inputString = $inputString.ToUpper()
    }    
    if ($inputString -ne "n")
    {
        $inputString = "Y"
    }
    $Global:questionsHashTable.$key = $inputString
    Write-Host $optionsArr[$i] "is set as" $Global:questionsHashTable.$key
    $i++
}

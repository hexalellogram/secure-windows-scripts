# AutoUpdate.ps1 - script to setup the windows update object and enable windows update
Write-Host 'Enabling automatic updating and including recommended updates...'

function Set-RegKey($regPath, $regName, $regValue)
{
    try
    {
        Set-ItemProperty -Path $regPath -Name $regName -Value $regValue -ErrorAction Stop
    }
    catch
    {        
        New-ItemProperty -Path $regPath -Name $regName -Value $regValue
    }
}

if ($Global:operatingSystem -NotLike '*Windows 10*' -or $Global:operatingSystem -NotLike '*Windows Server 2016*')
{
    $updateObject = (New-Object -com "Microsoft.Update.AutoUpdate").Settings # turn automatic updates on
    $updateObject.NotificationLevel = 4 # make sure recommended updates are included
    $updateObject.IncludeRecommendedUpdates = "true"
    $updateObject.save() # save the changes
}
else
{
    Set-RegKey -regPath HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate -regName DisableWindowsUpdateAccess -regValue 0 # windows update is enabled

    # commented out because it errors on Windows 10 and really the Windows Update website isn't really a thing anymore, not since XP
    # Set-Regkey -regPath HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explore -regName NoWindowsUpdate -regValue 0 # users can connect to windows update website

    # commented out for the same reason as the above one, seems to be related to the Windows Update website too
    #Set-RegKey -regPath HKLM:\SYSTEM\Internet` Communication` Management\Internet` Communication -regName DisableWindowsUpdateAccess -regValue 0 # windows update features are enabled

    # commented out for the same reason as the other 2, seems to also be related to the Windows Update website
    #Set-RegKey -regPath HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\WindowsUpdate -regName DisableWindowsUpdateAccess -regValue 0 # windows update features are available

    Set-RegKey -regPath HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU -regName NoAutoUpdate -regValue 0 # enable automatic updates

    Set-RegKey -regPath HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU -regName AUOptions -regValue 4 # auto download and schedule installation

    Set-RegKey -regPath HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU -regName ScheduledInstallDay -regValue 0 # scheduled install every day

    Set-RegKey -regPath HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU -regName ScheduledInstallTime -regValue 3 # scheduled install at 3-4ish in the morning (values start form 0 so I'm not 100% sure which it is)

    Set-RegKey -regPath HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU -regName RescheduleWaitTime -regValue 10 # wait up to 10 min after scheduled install time has passed

    Set-RegKey -regPath HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU -regName NoAutoRebootWithLoggedOnUsers -regValue 0 # auto reboot for updates enabled

    Set-RegKey -regPath HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU -regName UseWUServer -regValue 0 # use Microsoft update servers instead of corporate update servers
}

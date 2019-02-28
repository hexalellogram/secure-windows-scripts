# BaselineGPO.ps1 - Script to apply Microsoft GPO Baselines
Write-Warning "Please run this script AFTER letting the score report refresh and saving a picture. The baselines may contain settings that may cause us to lose points."
Read-Host "Press enter to continue..."

if ($Global:operatingSystem -Like "*Windows 10*")
{
    $w10version = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name ReleaseId).ReleaseId
    if ($w10version -eq "1607")
    {
        Write-Host "Windows 10 Version 1607 detected"
        Invoke-Expression "$Global:scriptPath\dependencies\baseline\W10Server2016\Local_Script\Client_Install.cmd"
    }
    else 
    {
        Write-Warning "Windows 10 Version 1607 not detected! Only 1607 is supported by this script at the moment."   
    }
}
elseif ($Global:operatingSystem -Like "*Windows Server 2016*")
{
    $role = "Is this server a Domain Controller (D) or Member Server (M)? [D/m]"
    if ($role -eq "m")
    {
        Write-Host "Member server selected."
        Invoke-Expression "$Global:scriptPath\dependencies\baseline\W10Server2016\Local_Script\Member_Server_Install.cmd"
    }
    else 
    {
        Write-Host "Domain controller selected."
        Invoke-Expression "$Global:scriptPath\dependencies\baseline\W10Server2016\Local_Script\Domain_Controller_Install.cmd"
    }
}
elseif ($Global:operatingSystem -Like '*Windows 8.1 *')
{
    Invoke-Expression "$Global:scriptPath\dependencies\baseline\Win81\Local_Script\81_Client_Install.cmd"
}
else
{
    Write-Warning "Detected Operating system $Global:operatingSystem not supported at this time!"
}


# Global:operatingSystem.ps1 - script to set OS version
function Set-AlternateOS
{
    $shortOS = Read-Host "Choose new OS [win10/win81/win8/win7/winvista/server2012r2/server2012/server2008r2/server2008]"
    if ($shortOS -eq "win10")
    {
        $Global:operatingSystem = "Windows 10"
    }
    elseif ($shortOS -eq "win81")
    {
        $Global:operatingSystem = "Windows 8.1"
    }
    elseif ($shortOS -eq "win8")
    {
        $Global:operatingSystem = "Windows 8"
    }
    elseif ($shortOS -eq "win7")
    {
        $Global:operatingSystem = "Windows 7"
    }
    elseif ($shortOS -eq "winvista")
    {
        $Global:operatingSystem = "Windows Vista"
    }
    elseif ($shortOS -eq "server2012r2")
    {
        $Global:operatingSystem = "Windows Server 2012 R2"
    }
    elseif ($shortOS -eq "server2012")
    {
        $Global:operatingSystem = "Windows Server 2012"
    }
    elseif ($shortOS -eq "server2008r2")
    {
        $Global:operatingSystem = "Windows Server 2008 R2"
    }
    elseif ($shortOS -eq "server2008")
    {
        $Global:operatingSystem = "Windows Server 2008"
    }
    else
    {
        Write-Host "The following input:" $shortOS "is invalid input."
        Set-AlternateOS
    }
}

$Global:operatingSystem = (Get-WmiObject -class Win32_operatingSystem).Caption
$confirm = Read-Host "Please confirm the operating system is:"$Global:operatingSystem"[Y/n]"
if ($confirm -eq "n")
{
    Set-AlternateOS
}
Write-Host "Operating system set as:" $Global:operatingSystem"."

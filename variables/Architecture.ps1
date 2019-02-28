# Architecture.ps1 - script to set archivecture (32/64 bit)
function Set-AlternateArch
{
    $shortArch = Read-Host "Please set new architecture [32/64]: "
    if ($shortArch -eq "32")
    {
        $Global:arch = "32-bit"
    }
    elseif ($shortArch -eq "64")
    {
        $Global:arch = "64-bit"
    }
    else 
    {
        Write-Host "Invalid input!"
        Set-AlternateArch
    }
}


$Global:arch = (Get-WmiObject -class Win32_OperatingSystem).OSArchitecture
$confirm = Read-Host "Please confirm the architecture is:" $Global:arch "[Y/n]"
if ($confirm -eq "n")
{
    Set-AlternateArch
}
Write-Host "OS Architecture set as:" $Global:arch"."
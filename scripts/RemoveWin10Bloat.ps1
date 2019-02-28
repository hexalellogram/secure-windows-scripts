# RemoveWin10Bloat.ps1 - script to run the remove win10 bloat scripts

if ($Global:operatingSystem -Like "*Windows 10*")
{
    Invoke-Expression $Global:scriptPath\dependencies\win10Bloat\RemoveW10Bloat.bat # run first win10 bloat script
    $broken = Read-Host "Is anything noticeably broken? [y/N]"
    if ($broken -eq "y")
    {
        Invoke-Expression $Global:scriptPath\dependencies\win10Bloat\PutBackW10Bloat.bat # run reversal script
        Write-Host "That should have just put everything back."
        Write-Host "If it didn't work as intended, please run dependencies\win10Bloat\PutBackW10Bloat.bat to try and fix any problems."
    }
    else
    {
        Write-Host "If nothing seems broken, you are fine. If anything seems broken later, please run dependencies\win10Bloat\PutBackW10Bloat.bat to fix it."
    }
    Write-Host "Running Windows 10 Hardening Scripts"
    Invoke-Expression $Global:scriptPath\dependencies\win10Bloat\W10Hardening1.ps1 # run second win10 bloat script
    Invoke-Expression $Global:scriptPath\dependencies\win10Bloat\W10Hardening2.bat # run third win10 bloat script
    Write-Host "If anything seems broken, take a look at the scripts W10Hardening1.ps1 and W10Hardening2.bat and comment out and uncomment the requisite parts."
    
}
else
{
    Write-Host "You are not on Windows 10 so this script is unnecessary."
}

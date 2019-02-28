# Launcher.ps1 - main launcher script

Write-Host "Begin running scripts..."

#Invoke-Expression $Global:scriptPath\variables\SetVariables.ps1

$path = "$Global:scriptPath\scripts\Downloads.ps1"
Start-Process PowerShell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$path`"" -Verb RunAs # run downloads in background

Invoke-Expression "& '$Global:scriptPath\scripts\RunActionRequired.ps1'"

Write-Host "auto update choice is: $Global:autoUpdate"
if ($Global:questionsHashTable.autoUpdate -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\AutoUpdate.ps1'" # done
}
if ($Global:questionsHashTable.msrt -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\MSRT.ps1'" # done
}
if ($Global:questionsHashTable.caffeine -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\Caffeine.ps1'" # done
}
if ($Global:questionsHashTable.firewall -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\Firewall.ps1'" # done
}
if ($Global:questionsHashTable.ports -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\Ports.ps1'" # done
}
if ($Global:questionsHashTable.expiringPasswords -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\ExpiringPasswords.ps1'" # done
}
if ($Global:questionsHashTable.setPasswords -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\SetPasswords.ps1'" # done
}
if ($Global:questionsHashTable.autoLogin -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\AutoLogin.ps1'" # done
}
if ($Global:questionsHashTable.mediaFiles -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\MediaFiles.ps1'" # done
}
if ($Global:questionsHashTable.services -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\Services.ps1'" # done
}
if ($Global:questionsHashTable.telnet -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\Telnet.ps1'" # done
}
if ($Global:questionsHashTable.dep -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\DEP.ps1'" # done
}
if ($Global:questionsHashTable.processes -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\Processes.ps1'" # done
}
if ($Global:questionsHashTable.hackingTools -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\HackingTools.ps1'" # done
}
if ($Global:questionsHashTable.ieDefault -ne "n")
{
    Write-Host "Running Default IE Settings script in new window..."
    $path = "$Global:scriptPath\scripts\IEDefault.ps1"
    Start-Process PowerShell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$path`"" -Verb RunAs # done
}
if ($Global:questionsHashTable.secureIE -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\SecureIE.ps1'" # done
}
if ($Global:questionsHashTable.disableWin10Upgrade -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\DisableWin10Upgrade.ps1'" # done
}
if ($Global:questionsHashTable.uninstallQuickTime -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\UninstallQuickTime.ps1'" # done
}
if ($Global:questionsHashTable.removeWin10Bloat -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\RemoveWin10Bloat.ps1'" # done
}
if ($Global:questionsHashTable.hosts -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\Hosts.ps1'" # done
}
if ($Global:questionsHashTable.godMode -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\GodMode.ps1'" # done
}
if ($Global:questionsHashTable.flushDNS -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\FlushDNS.ps1'" # done
}
if ($Global:questionsHashTable.secpol -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\Secpol.ps1'" # done
}
if ($Global:questionsHashTable.uac -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\UAC.ps1'" # done
}
if ($Global:questionsHashTable.uninstallCommon -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\uninstallCommon.ps1'" # done
}
if ($Global:questionsHashTable.groupPolicy -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\GroupPolicy.ps1'"
}
if ($Global:questionsHashTable.enableASLR -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\EnableASLR.ps1'"
}
if ($Global:questionsHashTable.filePermissions -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\Permissions.ps1'"
}
if ($Global:questionsHashTable.baselineGPO -ne "n")
{
    Invoke-Expression "& '$Global:scriptPath\scripts\BaselineGPO.ps1'"
}

Write-Host "Finished running scripts..."
Read-Host "Press enter to close scripts and stop transcription"
Stop-Transcript

# GroupPolicy.ps1 - Script to set group policy settings according to CIS benchmarks

function Write-NonfunctionalMessage()
{
    Write-Host "Group Policy script under construction and currently not fully functional. Come back later."
    Write-Host "Only the following operating systems are supported at this time: Windows 7, Windows 8.1, Windows Server 2016"
}

Write-Warning "Please check gpedit first for settings that may have been previously changed. There might be some in there that we may need to enable/disable, and it's hard to find them once this script is run."
Read-Host "Press enter to continue and check gpedit..."
Invoke-Expression "gpedit.msc"

Read-Host "Finished checking gpedit? Press enter to continue..."

if ($Global:operatingSystem -Like '*Windows 10*')
{
    Write-NonfunctionalMessage
}
elseif ($Global:operatingSystem -Like '*Windows 8.1*')
{
    $gpoPath = Get-ChildItem $Global:scriptPath\dependencies\gpo\Win81
    Invoke-Expression "& '$Global:scriptPath\dependencies\gpo\LGPO.exe' /g '$Global:scriptPath\dependencies\gpo\Win81\$gpoPath'"
}
elseif ($Global:operatingSystem -Like '*Windows 8 *')
{
    Write-NonfunctionalMessage
}
elseif ($Global:operatingSystem -Like '*Windows 7*')
{
    $gpoPath = Get-ChildItem $Global:scriptPath\dependencies\gpo\Win7
    Invoke-Expression "& '$Global:scriptPath\dependencies\gpo\LGPO.exe' /g '$Global:scriptPath\dependencies\gpo\Win7\$gpoPath'"
}
elseif ($Global:operatingSystem -Like '*Windows Vista*')
{
    Write-NonfunctionalMessage
}
elseif ($Global:operatingSystem -Like '*Windows Server 2016*')
{
    $gpoPath = Get-ChildItem $Global:scriptPath\dependencies\gpo\Server2016
    Invoke-Expression "& '$Global:scriptPath\dependencies\gpo\LGPO.exe' /g '$Global:scriptPath\dependencies\gpo\Server2016\$gpoPath'"
}
elseif ($Global:operatingSystem -Like '*Windows Server 2012 R2*')
{
    Write-NonfunctionalMessage
}
elseif ($Global:operatingSystem -Like '*Windows Server 2012*')
{
    Write-NonfunctionalMessage
}
elseif ($Global:operatingSystem -Like '*Windows Server 2008 R2*')
{
    Write-NonfunctionalMessage
}
elseif ($Global:operatingSystem -Like '*Windows Server* 2008*')
{
    Write-NonfunctionalMessage
}
else
{
    Write-Host "Unsupported OS detected. This can all be applied manually"
}

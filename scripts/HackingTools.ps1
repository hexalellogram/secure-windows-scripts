# HackingTools.ps1 - script to find hacking tools
Write-Host "listing possible hacking tools readmes..."
Write-Host "Note that just because a readme is here does not mean that it is linked to a hacking tool"
Write-Host "There may be legitimate readmes here too, use your best judgment."
[string[]]$output = Get-ChildItem -Path $env:SystemDrive\ -Include readme* -recurse -erroraction silentlycontinue
New-Item $Global:scriptPath\results\HackingToolsReadmes.txt -type file | Out-Null
foreach ($str in $output)
{
    Add-Content $Global:scriptPath\results\HackingToolsReadmes.txt $str
    Write-Host $str
}
Write-Host "Readmes often correspond to hacking tools. Investigate these files and the folders they are in."
Write-Host "Ignore the readme for the scripts and the one for the VM on the Desktop"
$path = Get-ChildItem $Global:scriptPath\results\HackingToolsReadmes.txt
Write-Host "Output of network shares saved to:" $path
Write-Host "Running second Hacking Tool detection script"

if ($Global:arch -eq "32-bit")
{
  Invoke-Expression "& '$Global:scriptPath\dependencies\FindHackingTools32.bat'"
}
else
{
  Invoke-Expression "& '$Global:scriptPath\dependencies\FindHackingTools64.bat'"
}

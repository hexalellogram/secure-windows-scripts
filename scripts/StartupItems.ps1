# StartupItems.ps1 - script to show startup items
$output = Get-WmiObject Win32_StartupCommand | out-string
New-Item $Global:scriptPath\results\StartupItems.txt -type file | Out-Null
foreach ($str in $output)
{
    Add-Content "$Global:scriptPath\results\StartupItems.txt" $str
    Write-Host $str
}

$path = Get-ChildItem $Global:scriptPath\results\StartupItems.txt
Write-Host "Output of startup items saved to:" $path

$deleteStartupItems = Read-Host "Would you like to delete any startup items? [Y/n]"
if ($deleteStartupItems -ne "n")
{
  Write-Host "Running startup item deletion script..."
  Invoke-Expression "& '$Global:scriptPath\dependencies\DeleteStartupItems.ps1'"
}

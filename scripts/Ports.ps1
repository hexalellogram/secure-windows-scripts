# Ports.ps1 - script to list open firewall ports

Write-Host "These are the ports that are open in the firewall"
[string[]]$output =Invoke-Expression "netstat -ano" # list open firewall ports

New-Item $Global:scriptPath\results\OpenPorts.txt -type file | Out-Null
foreach ($str in $output)
{
    Add-Content $Global:scriptPath\results\OpenPorts.txt $str
    Write-Host $str
}

$path = Get-ChildItem $Global:scriptPath\results\OpenPorts.txt
Write-Host "Output of open ports saved to:" $path
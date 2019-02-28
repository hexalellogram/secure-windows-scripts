# Shares.ps1 - Script to show shares

Write-Host "These are the current network shares"
[string[]]$output = Invoke-Expression "net share" # list shares

New-Item $Global:scriptPath\results\Shares.txt -type file | Out-Null
foreach ($str in $output)
{
    Add-Content $Global:scriptPath\results\Shares.txt $str
    Write-Host $str
}

$path = Get-ChildItem $Global:scriptPath\results\Shares.txt
Write-Host "Output of network shares saved to:" $path

Write-Warning "TELL BRYCE if there are any other shares than C$, ADMIN$, and IPC$ please!"

Invoke-Expression "& '$Global:scriptPath\dependencies\DeleteShares.ps1'"

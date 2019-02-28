# ProgramFiles.ps1 - script to get content and list contents of C:\Program FIles

Write-Host "Listing folders in Program Files"
[string[]]$32output = Get-ChildItem "$env:SystemDrive\Program Files" -Name -Force
if ($Global:arch -eq "64-bit")
{
    [string[]]$64output = Get-ChildItem "$env:SystemDrive\Program Files (x86)" -Name -Force
}
New-Item $Global:scriptPath\results\ProgramFilesList.txt -type file | Out-Null
foreach ($str in $32output)
{
    Add-Content $Global:scriptPath\results\ProgramFilesList.txt $str
    Write-Host $str
}
if ($64output -ne $null)
{
    foreach ($str in $64output)
    {
        Add-Content $Global:scriptPath\results\ProgramFilesList.txt $str
        Write-Host $str
    }
}

$path = Get-ChildItem $Global:scriptPath\results\ProgramFilesList.txt
Write-Host "Output of program files saved to:" $path

Invoke-Expression "& '$Global:scriptPath\dependencies\DeleteFromProgramFiles.ps1'"

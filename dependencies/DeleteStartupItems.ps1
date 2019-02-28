# DeleteStartupItems.ps1 - script to delete startup items
Write-Host "Notepad will now open a new text file. Please enter the startup items to delete in the file, one per line."
Read-Host "Press enter to continue."
Invoke-Expression "notepad.exe $Global:scriptPath\files\StartupItems.txt"
Read-Host "Press enter to continue."
Get-Content "$Global:scriptPath\files\StartupItems.txt"
Read-Host "Are these the startup items you want to delete? (Press enter to continue)"
$content = Get-Content "$Global:scriptPath\files\StartupItems.txt"
if (Test-Path $Global:scriptPath\files\StartupItems.txt)
{
  $array = Get-WmiObject -Query "select * from Win32_StartupCommand" | ?{ ($content) -contains $_.caption } # select startup items to delete
  $object = $array | Foreach-Object {"$($_.Caption)"}
  Foreach ($string in $object)
  {
    $output = Remove-ItemProperty -Path "HKLM:Software\Microsoft\Windows\CurrentVersion\Run" -name "$string" -erroraction silentlycontinue # remove startup items from HKLM Run
    Clear-Variable -Name output
    $output = Remove-ItemProperty -Path "HKLM:Software\Microsoft\Windows\CurrentVersion\RunOnce" -name "$string" -erroraction silentlycontinue # remove startup items from HKLM Run Once
    Clear-Variable -Name output
    $output = Remove-ItemProperty -Path "HKCU:Software\Microsoft\Windows\CurrentVersion\Run" -name "$string" -erroraction silentlycontinue # remove startup items from HKCU Run
    Clear-Variable -Name output
    $output = Remove-ItemProperty -Path "HKCU:Software\Microsoft\Windows\CurrentVersion\RunOnce" -name "$string" -erroraction silentlycontinue # remove startup items from HKCU Run Once
    Clear-Variable -Name output
    $output = Remove-ItemProperty -Path "HKU:ProgID\Software\Microsoft\Windows\CurrentVersion\Run" -name "$string" -erroraction silentlycontinue # remove startup items from HKU Run
    Clear-Variable -Name output
    $output = Remove-Item "$env:systemdrive\Users\All Users\Start Menu\Programs\Startup\$string" -erroraction silentlycontinue # remove startup items from All Users startup folder
    Clear-Variable -Name output
    $output = Remove-Item "$env:userprofile\Start Menu\Programs\Startup\$string" -erroraction silentlycontinue # remove startup items from Current User startup folder
    Clear-Variable -Name output
  }
}
else
{
  Write-Warning "StartupItems.txt not found in the proper location!"
  Write-Host "Please move the StartupItems.txt file to its proper location and try again."
}

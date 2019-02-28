# UninstallPrograms.ps1 - script to uninstall programs commonly found on Competition virtual machines
if (Test-Path "$env:SystemDrive\Program Files\USTechSupport\PC Optimizer\USTSPCOuninstaller.exe")
{
  Write-Host "PC Optimizer found!"
  Write-Warning "We can't uninstall this automatically, so you will need to do it manually. Note that this does require a restart."
}
else
{
  Write-Host "PC Optimizer not foud."
}
if (Test-Path "$env:SystemDrive\Program Files\PS3 Media Server\uninst.exe")
{
  Write-Host "PS3 Media Server found! Uninstalling.."
  Invoke-Expression "$env:SystemDrive\Program Files\PS3 Media Server\uninst.exe /S"
  Write-Host "PS3 Media Server uninstalled."
}
else
{
  Write-Host "PS3 Media Server not found"
}

# MP3Jam
if (Test-Path "$env:SystemDrive\Program Files\MP3jam\unins000.exe")
{
  Write-Host "MP3Jam found! Uninstalling.."
  Invoke-Expression "$env:SystemDrive\Program Files\MP3jam\unins000.exe /silent"
  Remove-Item "$env:SystemDrive\Program Files\MP3jam" -Recurse
  Write-Host "MP3Jam uninstalled."
}
else
{
  Write-Host "MP3Jam not found."
}

# WeatherBug
if (Test-Path "$env:SystemDrive\ProgramData\{3A83B8C4-5F70-453E-A723-B5672F107885")
{
  Write-Host "WeatherBug found! Uninstalling.."
  Invoke-Expression "$env:SystemDrive\ProgramData\{3A83B8C4-5F70-453E-A723-B5672F107885\WeatherBugSetup.exe REMOVE=TRUE MODIFY=FALSE /s"
  Remove-Item "$env:SystemDrive\ProgramData\{3A83B8C4-5F70-453E-A723-B5672F107885" -Recurse
  Write-Host "WeatherBug uninstalled."
}
else
{
  Write-Host "WeatherBug not found."
}

# Pluto TV
if (Test-Path "$env:AppData\Pluto TV\unins000.exe")
{
  Write-Host "Pluto TV found! Uninstalling.."
  Set-Location "$env:AppData\Pluto TV"
  Invoke-Expression ".\unins000.exe /silent"
  Set-Location "$env:WinDir\System32"
  Write-Host "Pluto TV uninstalled."
}
else
{
  Write-Host "Pluto TV not found."
}

# SlimCleaner - not working
# if (Test-Path "$env:SystemDrive\Program Files\SlimCleaner Plus\UninstallStub.exe")
# {
#  Write-Host "SlimCleaner Plus found! Uninstalling.."
#  Set-Location "$env:SystemDrive\Program Files\SlimCleaner Plus"
#  Invoke-Expression ".\UninstallStub.exe"
#  Write-Host "SlimCleaner Plus uninstalled."
#}
#else
#{
#  Write-Host "SlimCleaner Plus not found."
#}

Write-Host "We just scanned for common programs on competition VMs that often need to be removed but this is not a comprehensive list at all."
Write-Host "Visit Control Panel to uninstall items manually."

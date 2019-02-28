# Telnet.ps1 - Script to disable Telnet as a Windows Feature

$serverOutput = DISM /online /disable-feature /featurename:TelnetServer
if ($serverOutput -notcontains "Error: 87")
{
  Write-Host $serverOutput
  Write-Host "Telnet Server disabled."
}

$clientOutput = DISM /online /disable-feature /featurename:TelnetClient
if ($clientOutput -notcontains "Error: 87")
{
  Write-Host $clientOUtput
  Write-Host "Telnet Client disabled."
}

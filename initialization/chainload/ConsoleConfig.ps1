# ConsoleConfig.ps1 - script to configure console to be bigger and better, basically blue and bigger instead of black and smaller

Write-Host "Configuring Console Settings..."

$console = $host.ui.rawui
$buffer = $console.BufferSize
$window = $console.WindowSize

Read-Host "Press enter to continue"

# set regular console colors
[console]::backgroundcolor = "darkmagenta"
[console]::foregroundcolor = "darkyellow"

# set special colors
$OScheck = (Get-WmiObject -class Win32_OperatingSystem).Caption
if ($OScheck -Like "*Windows 7*" -or $OScheck -Like '*Windows Server* 2008*' -or $OScheck -Like '*Windows Server 2008 R2*')
{
  Push-Location
  Set-Location HKCU:\Console
  New-Item ".\%SystemRoot%_system32_WindowsPowerShell_v1.0_powershell.exe"
  Set-Location ".\%SystemRoot%_system32_WindowsPowerShell_v1.0_powershell.exe"

  New-ItemProperty . ColorTable00 -type DWORD -value 0x00562401
  New-ItemProperty . ColorTable07 -type DWORD -value 0x00f0edee
  New-ItemProperty . FaceName -type STRING -value "Lucida Console"
  New-ItemProperty . FontFamily -type DWORD -value 0x00000036
  New-ItemProperty . FontSize -type DWORD -value 0x000c0000
  New-ItemProperty . FontWeight -type DWORD -value 0x00000190
  New-ItemProperty . HistoryNoDup -type DWORD -value 0x00000000
  New-ItemProperty . QuickEdit -type DWORD -value 0x00000001
  New-ItemProperty . ScreenBufferSize -type DWORD -value 0x0bb80078
  New-ItemProperty . WindowSize -type DWORD -value 0x00320078
  Pop-Location
}

Read-Host "Press enter to continue"
Clear-Host

Write-Host "Console Configured."

Write-Host "Restarting PowerShell..."
$path = Split-Path -Parent $MyInvocation.MyCommand.Path # v2\initialization\chainload
Write-Host $path
Invoke-Expression "& '$path\RestartPS.bat'"
#Invoke-Expression $Global:scriptPath\initialization\chainload\RestartPS.bat
#Invoke-Expression "$Home\Desktop\V2\initialization\chainload\RestartPS.bat"

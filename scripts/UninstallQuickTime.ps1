# UninstallQuickTime.ps1 - script to uninstall Apple QuickTime
# for more information see http://blog.trendmicro.com/urgent-call-action-uninstall-quicktime-windows-today/
$findQT = Test-Path HKLM:\SOFTWARE\*Apple*
if ($findQT -eq $True)
{
    $qtVer = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall  |
        Get-ItemProperty |
            Where-Object {$_.DisplayName -match "quicktime" } |
                Select-Object -Property DisplayName, UninstallString

    ForEach ($ver in $qtVer) {

        If ($ver.UninstallString) {

            $uninst = $ver.UninstallString
            $uninst = $uninst -replace "/I", "/x "
            Start-Process cmd -ArgumentList "/c $uninst /quiet /norestart" -NoNewWindow
        }
    }
}
else 
{
    Write-Host "Apple QuickTime not found!"
    Write-Host "Proceeding to next script..."   
}

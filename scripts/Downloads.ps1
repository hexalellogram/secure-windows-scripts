# Downloads.ps1 - Script to download installers

$Global:scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$Global:ScriptPath = $Global:scriptPath -replace ".{7}$" # V2\
Import-Module BitsTransfer

Write-Host "Asking Download Setting Questions..."
Invoke-Expression "& '$Global:scriptPath\variables\DownloadQuestions.ps1'"

function Invoke-ProgramDownload($programName, $url, $path)
{
    Write-Host $programname "installer downloading..."
    $downloadName = $programName+" Download"
    Invoke-WebRequest -Uri $url -OutFile $path
    Write-Host "$programName installer downloaded."
}

$Global:arch = (Get-WmiObject -class Win32_OperatingSystem).OSArchitecture
$Global:operatingSystem = (Get-WmiObject -class Win32_operatingSystem).Caption

$str = $Global:downloadHashTable.firefox
Write-Host "firefox choice is: $str"
if ($Global:downloadHashTable.firefox -ne "n")
{
    if ($Global:arch -eq "64-bit")
    {
        $path = "$Global:scriptPath\download\FirefoxSetup.exe"
        Invoke-ProgramDownload -programName "Firefox 64-bit" -url "https://download.mozilla.org/?product=firefox-stub&os=win64&lang=en-US" -path $path
    }
    elseif ($Global:arch -eq "32-bit")
    {
        $path = "$Global:scriptPath\download\FirefoxSetup.exe"
        Invoke-ProgramDownload -programName "Firefox 32-bit" -url "https://download.mozilla.org/?product=firefox-stub&os=win&lang=en-US" -path $path
    }
    else 
    {
        Write-Host "Error in architecture detection?"   
    }
}
else 
{
    Write-Host "Firefox download skipped."
}

if ($Global:downloadHashTable.mbam -ne "n")
{
    $path = "$Global:scriptPath\download\MalwarebytesSetup.exe"
    Invoke-ProgramDownload -programName "Malwarebytes Anti-Malware" -url "https://downloads.malwarebytes.org/file/mbam_current/" -path $path
}
else 
{
    Write-Host "Malwarebytes download skipped."
}

if ($Global:downloadHashTable.hitmanPro -ne "n")
{
    if ($Global:arch -eq "64-bit")
    {
        $path = "$Global:scriptPath\download\HitmanProSetup.exe"
        Invoke-ProgramDownload -programName "Hitman Pro 64-bit" -url "http://dl.surfright.nl/HitmanPro_x64.exe" -path $path
    }
    elseif ($Global:arch -eq "32-bit")
    {
        $path = "$Global:scriptPath\download\HitmanProSetup.exe"
        Invoke-ProgramDownload -programName "Hitman Pro 32-bit" -url "http://dl.surfright.nl/HitmanPro.exe" -path $path
    }
    else 
    {
        Write-Host "Error in architecture detection?"   
    }
}
else 
{
    Write-Host "Hitman Pro download skipped."
}

Read-Host "Press enter to continue to program installation"
Invoke-Expression "& '$Global:scriptPath\scripts\InstallPrograms.ps1'"

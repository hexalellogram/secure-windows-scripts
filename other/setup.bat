@echo off

GOTO MAINTHREAD

:MAINTHREAD
SET /P syn=Do you need to install Synergy [y/n]
IF %syn%==y GOTO SYNERGY
GOTO CAFFEINE
SET /P obs=Do you need to install OBS [y/n]
IF %obs%==y GOTO OBS
echo Is the Linux image going to be here or Windows?
echo 1) Linux
echo 2) Windows
SET /P M=Type 1 or 2, then press ENTER:
IF %M%==1 GOTO LINUX
IF %M%==2 GOTO WINDOWS
echo Safely remove USB? Close the window if you do not want to...
RunDll32.exe shell32.dll,Control_RunDLL hotplug.dll
echo Starting Synergy...
echo|set /p=7B76313B62617369633B62727963652074737579756B693B313B627279636574737579756B694069636C6F75642E636F6D3B3B303B307D|clip
echo Serial key is in the clipboard!
start "" "C:\Program Files\Synergy\synergy.exe"
echo Starting caffeine...
start "" "%userprofile%\Downloads\caffeine\caffeine.exe"
echo DONE!
pause
exit



:SYNERGY
echo Downloading Synergy 1.8.6...
echo Save it as synergy-v1.8.6-stable-2ab21aa-Windows-x64.msi in Downloads
pause
explorer http://symless.com/files/packages/synergy-v1.8.6-stable-2ab21aa-Windows-x64.msi?v32
echo After the download is complete...
pause
echo Installing Synergy...
msiexec /i %userprofile%\Downloads\synergy-v1.8.6-stable-2ab21aa-Windows-x64.msi /quiet /qn /norestart


:CAFFEINE
echo Downloading Caffeine...
echo Save it as caffeine.zip in Downloads
pause
explorer http://www.zhornsoftware.co.uk/caffeine/caffeine.zip
echo after caffeine has been downloaded...
pause
echo Attempting to extract caffeine...
7z.exe -version >nul 2>&1 && (
    echo 7Zip is installed, extracting...
    7z.exe x %userprofile%\Downloads\caffeine.zip
) || (
    echo 7Zip not installed, please extract caffeine in the window that opens...
    pause
    start %userprofile%\Downloads
    echo Did you extract?
    pause
)
echo Caffeine will be started later


:OBS
echo Downloading open broadcast software
echo Save it as OBS-Studio-17.0-Full-Installer.exe in Downloads
pause
explorer https://github.com/jp9000/obs-studio/releases/download/17.0.0/OBS-Studio-17.0-Full-Installer.exe
echo after OBS has downloaded...
pause
echo Installing OBS
%userprofile%\Downloads\OBS-Studio-17.0-Full-Installer.exe
pause
cls



:LINUX
cls
echo You chose 'Linux'
echo Enter the drive letter containing the 'util' folder (such as F:)
set /p drive="Enter drive (with colon): "
echo Copying util folder to Desktop
mkdir %userprofile%\Desktop\util
robocopy %drive%\util %userprofile%\Desktop\util\ /s /e
echo Done copying!
pause
cls


:WINDOWS
cls
echo You chose 'Windows'
echo Opening github login on firefox...
"C:\Program Files (x86)\Mozilla Firefox\firefox.exe" https://github.com/login
pause

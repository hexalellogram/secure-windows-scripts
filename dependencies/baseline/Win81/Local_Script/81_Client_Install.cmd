@echo off
ECHO ===============================================================================
ECHO ===============================================================================
ECHO.
ECHO This script installs security baselines into local policy for Windows 8.1.
ECHO.
ECHO Press Ctrl+C to stop the installation, or press any other key to continue...
ECHO.
ECHO ===============================================================================
ECHO ===============================================================================
PAUSE > nul

:: Make the directory where this script lives the current dir.
PUSHD %~dp0
SET SECGUIDE=%CD%
SET SECGUIDELOGS=%SECGUIDE%\LOGS
MD "%SECGUIDELOGS%" 2> nul

:: Install and Apply EMET Settings
if exist "EMET\EMET Setup.msi" goto InstallEmet
ECHO.
ECHO ====================================
ECHO WARNING: "EMET Setup.msi" NOT FOUND.
ECHO ====================================
ECHO.
ECHO EMET 5.0 can be downloaded from this location:
ECHO.    http://www.microsoft.com/en-us/download/details.aspx?id=43714
ECHO.
ECHO When downloaded, please copy "EMET Setup.msi" to this directory:
ECHO.    "%SECGUIDE%\EMET"
ECHO.
ECHO Press Ctrl+C to stop this script.
ECHO You can re-run this script after downloading EMET.
ECHO Or press any other key to continue installing settings without EMET...
Pause > nul
Goto AfterEmet

:InstallEmet
ECHO Installing EMET...
start /wait msiexec.exe /i "%SECGUIDE%\EMET\EMET Setup.msi" ALLUSERS=1 /passive /norestart /log "%SECGUIDELOGS%\EMET-install.log"
TIMEOUT /t 5
copy EMET\EMET.admx %SystemRoot%\PolicyDefinitions
copy EMET\EMET.adml %SystemRoot%\PolicyDefinitions\en-US
echo EMET Installed
:AfterEmet

:: Expose MSS Settings
ECHO Expose MSS settings in the security editor...
cd MSS_Extension
cscript //NoLogo localgpo.wsf /ConfigSCE
echo MSS Settings Exposed
cd ..


ECHO Installing Windows 8.1 security settings and policies...

:: Apply Windows 8.1 Security Template
start /wait Tools\Apply_LGPO_Delta.exe Windows_8_1\GptTmpl.inf /log "%SECGUIDELOGS%\Win81-gpttmpl.log" /error "%SECGUIDELOGS%\Win81-gpttmpl.err"
echo Windows 8.1 Security Template Applied

:: Apply Windows 8.1 Computer Configuration
start /wait Tools\ImportRegPol.exe /m Windows_8_1\machine_registry.pol /log "%SECGUIDELOGS%\Win81MachineSettings.log" /error "%SECGUIDELOGS%\Win81MachineSettings.err"
:: Apply Windows 8.1 User Configuration
start /wait Tools\ImportRegPol.exe /u Windows_8_1\user_registry.pol    /log "%SECGUIDELOGS%\Win81UserSettings.log"    /error "%SECGUIDELOGS%\Win81UserSettings.err"
echo Windows 8.1 Local Policy Applied


ECHO Installing Internet Explorer 11 policies...

:: Apply Internet Explorer 11 Local Policy
start /wait Tools\ImportRegPol.exe /m IE_11\machine_registry.pol /log "%SECGUIDELOGS%\IEMachineSettings.log" /error "%SECGUIDELOGS%\IEMachineSettings.err"
start /wait Tools\ImportRegPol.exe /u IE_11\user_registry.pol    /log "%SECGUIDELOGS%\IEUserSettings.log"    /error "%SECGUIDELOGS%\IEUserSettings.err"
echo Internet Explorer 11 Local Policy Applied


:: Apply Advanced Audit Settings
ECHO Applying advanced audit settings...
md "%SYSTEMROOT%\System32\GroupPolicy\Machine\Microsoft\Windows NT\Audit" 2> nul
copy Windows_8_1\audit.csv "%SYSTEMROOT%\System32\GroupPolicy\Machine\Microsoft\Windows NT\Audit\Audit.csv"
auditpol /clear /y
auditpol /restore /file:"%SYSTEMROOT%\System32\GroupPolicy\Machine\Microsoft\Windows NT\Audit\Audit.csv"
echo Windows 8.1 Advanced Auditing Applied


:: Copy Custom Administrative Template
ECHO Copying custom administrative template for Pass the Hash mitigations
copy Templates\PtH.admx %SystemRoot%\PolicyDefinitions
copy Templates\PtH.adml %SystemRoot%\PolicyDefinitions\en-US


::Display Notifications
ECHO.
ECHO.
ECHO ===============================================================================
ECHO ===============================================================================
ECHO.
ECHO In order to test properly, create a new non-administrative user account and
ECHO reboot.
ECHO.
ECHO Additionally, check log files located in this directory:
ECHO.    %SECGUIDELOGS%
ECHO.
ECHO Feedback can be directed to the following:  SecGuide@Microsoft.com
ECHO.
ECHO ===============================================================================
ECHO ===============================================================================
ECHO.
POPD

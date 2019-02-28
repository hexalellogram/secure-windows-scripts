@echo off
ECHO ===============================================================================
ECHO ===============================================================================
ECHO.
ECHO This script installs security baselines into local policy for
ECHO Windows Server 2012 R2 Member Server.
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


ECHO Installing Windows Server 2012 R2 Member Server security settings and
ECHO policies...

:: Apply Windows Server 2012 R2 Member Server Security Template
start /wait Tools\Apply_LGPO_Delta.exe Server_2012_R2_MS\GptTmpl.inf /log "%SECGUIDELOGS%\Win2012R2MS-gpttmpl.log" /error "%SECGUIDELOGS%\Win2012R2MS-gpttmpl.err"
echo Windows Server 2012 R2 Member Server Security Template Applied

:: Apply Windows Server 2012 R2 Member Server Computer Configuration
start /wait Tools\ImportRegPol.exe /m Server_2012_R2_MS\machine_registry.pol /log "%SECGUIDELOGS%\Win2012R2MSMachineSettings.log" /error "%SECGUIDELOGS%\Win2012R2MSMachineSettings.err"
:: Apply Windows Server 2012 R2 Member Server User Configuration
start /wait Tools\ImportRegPol.exe /u Server_2012_R2_MS\user_registry.pol    /log "%SECGUIDELOGS%\Win2012R2MSUserSettings.log"    /error "%SECGUIDELOGS%\Win2012R2MSUserSettings.err"
echo Windows Server 2012 R2 Member Server Local Policy Applied


ECHO Installing Internet Explorer 11 policies...

:: Apply Internet Explorer 11 Local Policy
start /wait Tools\ImportRegPol.exe /m IE_11\machine_registry.pol /log "%SECGUIDELOGS%\IEMachineSettings.log" /error "%SECGUIDELOGS%\IEMachineSettings.err"
start /wait Tools\ImportRegPol.exe /u IE_11\user_registry.pol    /log "%SECGUIDELOGS%\IEUserSettings.log"    /error "%SECGUIDELOGS%\IEUserSettings.err"
echo Internet Explorer 11 Local Policy Applied


:: Apply Advanced Audit Settings
ECHO Applying advanced audit settings...
md "%SYSTEMROOT%\System32\GroupPolicy\Machine\Microsoft\Windows NT\Audit" 2> nul
copy Server_2012_R2_MS\audit.csv "%SYSTEMROOT%\System32\GroupPolicy\Machine\Microsoft\Windows NT\Audit\Audit.csv"
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

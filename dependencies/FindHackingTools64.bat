@echo off
cd results
dir /b /s "%HOMEDRIVE%\Program Files\" > programfiles.flashed
dir /b /s "%HOMEDRIVE%\Program Files (x86)\" >> programfiles.flashed
echo Finding hacking tools...
findstr "Cain" programfiles.flashed
if %errorlevel%==0 (
echo Cain detected. Please take note, then press any key.
pause >NUL
)
findstr "nmap" programfiles.flashed
if %errorlevel%==0 (
echo Nmap detected. Please take note, then press any key.
pause >NUL
)
findstr "keylogger" programfiles.flashed
if %errorlevel%==0 (
echo Potential keylogger detected. Please take note, then press any key.
pause >NUL
)
findstr "Armitage" programfiles.flashed
if %errorlevel%==0 (
echo Potential Armitage detected. Please take note, then press any key.
pause >NUL
)
findstr "Metasploit" programfiles.flashed
if %errorlevel%==0 (
echo Potential Metasploit framework detected. Please take note, then press any key.
pause >NUL
)
findstr "nc" programfiles.flashed
if %errorlevel%==0 (
echo Potential netcat binary detected. Please take note, then press any key.
pause >NUL
)
findstr "netcat" programfiles.flashed
if %errorlevel%==0 (
echo Potential netcat binary detected. Please take note, then press any key.
pause >NUL
)
echo Done. Moving to next script.
timeout /t 3

# SeucreIE.ps1 - Script to secure Internet Explorer settings

Write-Host "Enabling Do Not Track in Internet Explorer"
Invoke-Expression 'reg ADD "HKCU\Software\Microsoft\Internet Explorer\Main" /v DoNotTrack /t REG_DWORD /d 1 /f'
Invoke-Expression 'reg ADD "HKCU\Software\Microsoft\Internet Explorer\Download" /v RunInvalidSignatures /t REG_DWORD /d 1 /f'
Invoke-Expression 'reg ADD "HKCU\Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_LOCALMACHINE_LOCKDOWN\Settings" /v LOCALMACHINE_CD_UNLOCK /t REG_DWORD /d 1 /f'
Invoke-Expression 'reg ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v WarnonBadCertRecving /t REG_DWORD /d 1 /f'
Invoke-Expression 'reg ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v WarnOnPostRedirect /t REG_DWORD /d 1 /f'
Invoke-Expression 'reg ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v WarnonZoneCrossing /t REG_DWORD /d 1 /f'
Write-Host "Do Not Track settings set"

Write-Host "Disabling passowrd caching"
Invoke-Expression 'reg ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v DisablePasswordCaching /t REG_DWORD /d 1 /f'

Write-Host "Enabling SmartScreen for IE 8"
Invoke-Expression 'reg ADD "HKCU\Software\Microsoft\Internet Explorer\PhishingFilter" /v EnabledV8 /t REG_DWORD /d 1 /f'

Write-Host "Enabling SmartScreen for IE 9 and above"
Invoke-Expression 'reg ADD "HKCU\Software\Microsoft\Internet Explorer\PhishingFilter" /v EnabledV9 /t REG_DWORD /d 1 /f'

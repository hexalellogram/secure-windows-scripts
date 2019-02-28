# EnableASLR.ps1 - Script to Enable ASLR protection
# https://www.extremetech.com/computing/259350-key-windows-10-antimalware-technology-critically-broken

Write-Host "Enabling ASLR..."
Invoke-Expression 'reg ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v MitigationOptions /t REG_BINARY /d 00010100000000000000000000000000 /f' 

# notes: REG_BINARY = hex, and the data value is the hex value minus the commas
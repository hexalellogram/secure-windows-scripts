# Caffeine.ps1 - Script to start caffeine.exe to prevent the VM from sleeping

Invoke-Expression "& '$Global:scriptPath\dependencies\caffeine.exe'"
Write-Host "Caffeine enabled."
Write-Warning "This script does not prevent the host from sleeping unless it is also run separately on the host! Please make sure to do that as well!"

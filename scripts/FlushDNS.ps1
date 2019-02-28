# FlushDNS.ps1 - script to flush DNS cache
Write-Host "Flushing DNS Cache"
Invoke-Expression "ipconfig /flushdns"
Write-Host "DNS Cache flushed"

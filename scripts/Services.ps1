# Services.ps1 - A Script to disable services

function Disable-Service($shortName, $longName)
{
    $service  = Get-Service | Where-Object {$_.Name -eq $shortName}
    if ($service -ne $null)
    {
        Set-Service $shortName -startuptype "disabled" -verbose
	    Stop-Service $shortname -force
	    $str = $longName + " has been disabled"
        Write-Host $str
        Add-Content $Global:scriptPath\results\DisabledServices.txt -value $str
    }
    else
    {
        Write-Host "Service" $longName "not found."
    }   
}

function Enable-Service($shortName, $longName)
{
    $service  = Get-Service | Where-Object {$_.Name -eq $shortName}
    if ($service -ne $null)
    {
        Set-Service $shortName -startuptype "automatic" -verbose
	    Start-Service $shortname
	    $str = $longName + " has been enabled and started"
        Write-Host $str
        Add-Content $Global:scriptPath\results\EnabledServices.txt -value $str
    }
    else
    {
        Write-Host "Service" $longName "not found."
    }
}
New-Item $Global:scriptPath\results\DisabledServices.txt -type file | Out-Null
New-Item $Global:scriptPath\results\EnabledServices.txt -type file | Out-Null

Disable-Service -shortName "Fax" -longName "Fax"
Disable-Service -shortName "iphlpsvc" -longName "IP Helper"
Disable-Service -shortName "RemoteRegistry" -longName "Remote Registry"
Disable-Service -shortName "p2pimsvc" -longName "Peer Networking Identity Manager"
Disable-Service -shortName "pnrpsvc" -longName "Peer Name Resolution Protocol"
Disable-Service -shortName "p2psvc" -longName "Peer Networking Grouping"
Disable-Service -shortName "LanmanServer" -longName "Server"
Disable-Service -shortName "seclogon" -longName "Secondary Logon"
Disable-Service -shortName "UmRdpService" -longName "Remote Desktop Service UserMode Port Redirector"
Disable-Service -shortName "UmRdpService" -longName "Remote Desktop Services"
Disable-Service -shortName "UmRdpService" -longName "Remote Desktop Configuration"
Disable-Service -shortName "RasAuto" -longName "Remote Access Auto Connection Manager"
Disable-Service -shortName "PNRPAutoReg" -longName "PNRP Machine Name Publication Service"
Disable-Service -shortName "NetTcpPortSharing" -longName "Net.Tcp Port Sharing Service"
Disable-Service -shortName "MSiSCSI" -longName "Microsoft iSCSI Initiator Service"
Disable-Service -shortName "Mcx2Svc" -longName "Media Center Extender Service"
Disable-Service -shortName "lltdsvc" -longName "Link-Layer Topology Discovery Mapper"
Disable-Service -shortName "SharedAccess" -longName "Internet Connection Sharing (ICS)"
Disable-Service -shortName "HomeGroupProvider" -longName "HomeGroup Provider"
Disable-Service -shortName "HomeGroupListener" -longName "HomeGroup Listener"
Disable-Service -shortName "PeerDistSvc" -longName "BranchCache"
Disable-Service -shortName "bthserv" -longName "Bluetooth Support Service"
Disable-Service -shortName "TlntSvr" -longName "Telnet"
Disable-Service -shortName "AJRouter" -longName "AllJoyn Router Service"
Disable-Service -shortName "BthHFSrv" -longName "Bluetooth Handsfree Service"
Disable-Service -shortName "Browser" -longName "Computer Browser"
Disable-Service -shortName "CDPSvc" -longName "Connected Devices Platform Service"
Disable-Service -shortName "DiagTrack" -longName "Connected Devices Platform Service"
Disable-Service -shortName "lfsvc" -longName "Geolocation Service"
Disable-Service -shortName "irmon" -longName "Infrared Monitor Service"
Disable-Service -shortName "wlidsvc" -longName "Microsoft Account Sign-in Assistant"
Disable-Service -shortName "Netlogon" -longName "Netlogon"
Disable-Service -shortName "NcdAutoSetup" -longName "Network Connected Devices Auto-Setup"
Disable-Service -shortName "PhoneSvc" -longName "Phone Service"
Disable-Service -shortName "RetailDemo" -longName "Retail Demo Service"
Disable-Service -shortName "RemoteAccess" -longName "Routing and Remote Access"
Disable-Service -shortName "TapiSrv" -longName "Telephony"
Disable-Service -shortName "WinRM" -longName "Windows Remote Management (WS-Management)"
Disable-Service -shortName "workfolderssvc" -longName "Work Folders"
Disable-Service -shortName "XblAuthManager" -longName "Xbox Live Auth Manager"
Disable-Service -shortName "XblGameSave" -longName "Xbox Live Game Save"
Disable-Service -shortName "XboxNetApiSvc" -longName "XboxNetApiSvc"
Disable-Service -shortName "fdPHost" -longName "Function Discovery Provider Host"
Disable-Service -shortName "FDResPub" -longName "Function Discovery Resource Publication"
Disable-Service -shortName "WMPNetworkSvc" -longName "Windows Media Player Network Sharing Service"
Disable-Service -shortName "upnphost" -longName "UPnP Device Host"

Write-Host "Insecure services have been disabled."

Enable-Service -shortName "wuauserv" -longName "Windows Update"
Enable-Service -shortName "MpsSvc" -longName "Windows Firewall"
Enable-Service -shortName "EventLog" -longName "Windows Event Log"

Write-Host "Secure services have been enabled."

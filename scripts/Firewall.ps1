# Firewall.ps1 - Configure the firewall

Write-Host "Configuring firewall..."

$isRecentConsumer = ($Global:operatingSystem -Like "*Windows 10*") -or ($Global:operatingSystem -Like "*Windows 8.1*") -or ($Global:operatingSystem -Like "*Windows 8 *")
$isRecentServer = ($Global:operatingSystem -Like "*Windows Server 2016*") -or ($Global:operatingSystem -Like "*Windows Server 2012 R2*") -or ($Global:operatingSystem -Like "*Windows Server 2012*")

$isOlderConsumer = ($Global:operatingSystem -Like "*Windows 7*") -or ($Global:operatingSystem -Like "*Windows Vista*")
$isOlderServer = ($Global:operatingSystem -Like "*Windows Server 2008 R2*") -or ($Global:operatingSystem -Like "*Windows Server* 2008*")

if ($isRecentConsumer -or $isRecentServer)
{
    Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True # enable all firewall profiles
}
elseif($isOlderConsumer -or $isOlderServer)
{
    Invoke-Expression "netsh advfirewall set allprofiles state on" # enable all firewall profiles
}
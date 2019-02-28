# InstallBitdefender.ps1 - script to install bitdefender

if ($Global:operatingSystem -notlike "*Windows Server* 2008*")
{

		if (Test-Path $Global:scriptPath\download\BitdefenderSetup.exe)
		{
			Write-Host 'Found bitdefender, installing...'
			Invoke-Expression $Global:scriptPath\download\BitdefenderSetup.exe /bdparams /silent #start bitdefender installer
			Write-Host 'This may take some time.'
			Write-Host 'bitdefender is installed, check the start menu to make sure'
			Write-Warning "Please make sure to sign into Bitdefender using your own credentials."
			Write-Warning "If you do not sign in, protection WILL NOT work!!!"
		}
		else
		{
			Write-Warning "Bitdefender installer BitdefenderSetup.exe not found!"
		}
}
else
{
	Write-Host "For some reason Bitdefender will NOT install on Server 2008."
	Write-Host "We will install Microsoft Security Essentials instead."
	Invoke-Expression $Global:scriptPath\dependencies\InstallMSE.ps1
}

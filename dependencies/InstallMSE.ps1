# InstallMSE.ps1 - A Script to install Microsoft Security Essentials

Write-Host "Microsoft Security Essentials installer downloading..."
$Url = "http://mse.dlservice.microsoft.com/download/A/3/8/A38FFBF2-1122-48B4-AF60-E44F6DC28BD8/enus/x86/mseinstall.exe"
$Path = $Global:scriptPath\download\MSESetup.exe
#$Username = ""
#$Password = ""
$WebClient = New-Object System.Net.WebClient
#$WebClient.Credentials = New-Object System.Net.Networkcredential($Username, $Password)
$WebClient.DownloadFile( $url, $path)
Write-Host "Microsoft Security Essential installer downloaded."


if (Test-Path $Global:scriptPath\download\MSESetup.exe)
{
	Write-Host 'Found MSE Installer, installing...'
	Invoke-Expression $Global:scriptPath\download\MSESetup.exe #start MSE installer
	Write-Host 'This may take some time.'
     Write-Host 'MSE is installed, check the start menu to make sure'
}
else
{
     Write-Warning "MSE installer MSESetup.exe not found!."
}


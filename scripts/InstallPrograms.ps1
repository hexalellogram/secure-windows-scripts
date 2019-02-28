# InstallPrograms.ps1 - script to install programs

$Global:scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$Global:ScriptPath = $Global:scriptPath -replace ".{7}$" # V2\

function Install-Program($path, $programName, $installArgs)
{
   
	if (Test-Path $path) 
	{
		Write-Host 'Found' $programName ', installing...'
		Invoke-Expression "& '$path' $installArgs"
		Write-Host 'This may take some time.'
		Write-Host $programName 'is installed, check the start menu to make sure'
	}
	else 
	{
		Write-Warning "$programName installer $path not found!"
	}
    
}

if ($Global:downloadHashTable.firefox -ne "n")
{
    Install-Program -path "$Global:scriptPath\download\FirefoxSetup.exe" -programName "Firefox" -installArgs "-ms"
}

if ($Global:downloadHashTable.mbam -ne "n")
{
    Install-Program -path "$Global:scriptPath\download\MalwarebytesSetup.exe" -programName "Malwarebytes" -installArgs "/silent"
}

if ($Global:downloadHashTable.hitmanPro -ne "n")
{
    Install-Program -path "$Global:scriptPath\download\HitmanProSetup.exe" -programName "Hitman Pro" -installArgs "/scan /noinstall /quiet"
}

Read-Host "Program installation complete! Press enter to close this window"

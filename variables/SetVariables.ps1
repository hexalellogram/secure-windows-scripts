# setVariables.ps1 - script to set universal variables

Write-Host "Setting Universal Variables..."

Write-Host "Setting operating system..."
Invoke-Expression "& '$Global:scriptPath\variables\OperatingSystem.ps1'"

Write-Host "Setting architecture..."
Invoke-Expression "& '$Global:scriptPath\variables\Architecture.ps1'"

Write-Host "Setting good users..."
Invoke-Expression "& '$Global:scriptPath\variables\Users.ps1'"

Write-Host "Setting good administrators..."
Invoke-Expression "& '$Global:scriptPath\variables\Admins.ps1'"

Write-Host "Asking Questions..."
Invoke-Expression "& '$Global:scriptPath\variables\Questions.ps1'"

Write-Host "Running Launcher..."
Invoke-Expression "& '$Global:scriptPath\Launcher.ps1'"

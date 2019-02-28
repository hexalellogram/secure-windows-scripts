# SetPath.ps1 - script to define a variable containing the path of the script folder


$Global:scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path # set path
Invoke-Expression "& '$Global:scriptPath\initialization\chainload\ConsoleConfig.ps1'"

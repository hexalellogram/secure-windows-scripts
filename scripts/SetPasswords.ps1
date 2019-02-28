# SetPasswords.ps1 - script to set user passwords to Competition1!

Write-Host 'Do you want to set all user passwords to "Competition1!" (continued on next line)?'
Write-Warning "This is a quick, easy way to ensure all accounts on your image are password protected, but IT SHOULD NEVER BE DONE ON A PRODUCTION MACHINE! [Y/n]"

$password = 'Competition1!' # set what the user password will be (you can change this)
$accounts = Get-wmiobject Win32_UserAccount -filter 'LocalAccount=TRUE' | select-object -expandproperty Name # get a list of user accounts
foreach ($i in $accounts) 
{
    if ($i -eq 'HomeGroupUser$') { continue } # We don't need to worry about the homegroup user
    Invoke-Expression "$env:SystemDrive\Windows\System32\cmd.exe /C net user $i $password" # set the user password to the password defined above --^
}
Write-Warning "All user passwords have been set to 'Competition1!' (without the quotes) so please do not forget that so we don't get locked out."


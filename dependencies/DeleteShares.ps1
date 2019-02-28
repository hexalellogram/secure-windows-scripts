# DeleteShares.ps1 - script to delete shares
Invoke-Expression "net share"
$delshare = Read-Host "Type in the name of the share you want to delete (s to skip)"
if ($delshare -ne "s")
{
    try
    {
        Invoke-Expression "net share $delshare /delete" # delete share
        Write-Host "Share deleted. Running share selection again."
    }
    catch
    {
        Write-Warning "Share with name" $delshare "not found. Please try again."
    }
    Invoke-Expression $Global:scriptPath\dependencies\DeleteShares.ps1 # loop back to beginning
}
else
{
    Write-Host "Share deletion skipped. Return to the share deletion dialog by running dependencies\DeleteShares.ps1 any time."
}

# SecPol.ps1 - script to configure Secpol settings
$checkWin10 = Test-Path $Global:scriptPath\dependencies\secpol\SecpolWin10.inf
$checkWin81 = Test-Path $Global:scriptPath\dependencies\secpol\SecpolWin81.inf
$checkWin8 = Test-Path $Global:scriptPath\dependencies\secpol\SecpolWin8.inf
$checkWin7 = Test-Path $Global:scriptPath\dependencies\secpol\SecpolWin7.inf
$checkWinVista = Test-Path $Global:scriptPath\dependencies\secpol\SecpolWinVista.inf
$checkWinServer08 = Test-Path $Global:scriptPath\dependencies\secpol\SecpolWinServer08.inf
$checkWinServer08R2 = Test-Path $Global:scriptPath\dependencies\secpol\SecpolWinServer08R2.inf
$checkWinServer12 = Test-Path $Global:scriptPath\dependencies\secpol\SecpolWinServer12.inf
$checkWinServer12R2 = Test-Path $Global:scriptPath\dependencies\secpol\SecpolWinServer12R2.inf

if ($Global:operatingSystem -Like '*Windows 10*')
{
    
    if ($checkWin10 -eq $True)
    {
        Invoke-Expression "secedit /configure /db `"$Global:scriptPath\dependencies\secpol\SecPolWin10.sdb`" /cfg `"$Global:scriptPath\dependencies\secpol\SecPolWin10.inf`"" # write secpol settings
        Write-Host "Secpol settings for Windows 10 successfully written."
    }
    else
    {
        Write-Warning "Secpol configuration files not found!"
        Write-Host "Please move the files to $Global:scriptPath\dependencies\secpol and retry."
    }
        
}
elseif ($Global:operatingSystem -Like '*Windows 8 *')
{
    if ($checkWin8 -eq $True)
    {
        Invoke-Expression "secedit /configure /db `"$Global:scriptPath\dependencies\secpol\SecPolWin8.sdb`" /cfg `"$Global:scriptPath\dependencies\secpol\SecPolWin8.inf`"" # write secpol settings
        Write-Host "Secpol settings for Windows 8 successfully written."
    }
    else
    {
        Write-Warning "Secpol configuration files not found!"
        Write-Host "Please move the files to $Global:scriptPath\dependencies\secpol and retry."
    }
       
}
elseif ($Global:operatingSystem -Like '*Windows 8.1 *')
{
    if ($checkWin81 -eq $True)
    {
        Invoke-Expression "secedit /configure /db `"$Global:scriptPath\dependencies\secpol\SecPolWin81.sdb`" /cfg `"$Global:scriptPath\dependencies\secpol\SecPolWin81.inf`"" # write secpol settings
        Write-Host "Secpol settings for Windows 8.1 successfully written."
    }
    else
    {
        Write-Warning "Secpol configuration files not found!"
        Write-Host "Please move the files to $Global:scriptPath\dependencies\secpol and retry."
    }
        
}
elseif ($Global:operatingSystem -Like '*Windows 7*')
{
    if ($checkWin7 -eq $True)
    {
        Invoke-Expression "secedit /configure /db `"$Global:scriptPath\dependencies\secpol\SecPolWin7.sdb`" /cfg `"$Global:scriptPath\dependencies\secpol\SecPolWin7.inf`"" # write secpol settings
        Write-Host "Secpol settings for Windows 7 successfully written."
    }
    else
    {
        Write-Warning "Secpol configuration files not found!"
        Write-Host "Please move the files to $Global:scriptPath\dependencies\secpol and retry."
    }
}
elseif ($Global:operatingSystem -Like '*Windows Vista*')
{
    if ($checkWinVista -eq $True)
    {
        Invoke-Expression "secedit /configure /db `"$Global:scriptPath\dependencies\secpol\SecPolWinVista.sdb`" /cfg `"$Global:scriptPath\dependencies\secpol\SecPolWinVista.inf`"" # write secpol settings
        Write-Host "Secpol settings for Windows Vista successfully written."
    }
    else
    {
        Write-Warning "Secpol configuration files not found!"
        Write-Host "Please move the files to $Global:scriptPath\dependencies\secpol and retry."
    }
}
elseif ($Global:operatingSystem -Like '*Windows Server 2012 R2*')
{
    if ($checkWinServer12R2 -eq $True)
    {
        Invoke-Expression "secedit /configure /db `"$Global:scriptPath\dependencies\secpol\SecPolWinServer12R2.sdb`" /cfg `"$Global:scriptPath\dependencies\secpol\SecPolWinServer12R2.inf`"" # write secpol settings
        Write-Host "Secpol settings for Windows Server 2012 R2 successfully written."
    }
    else
    {
        Write-Warning "Secpol configuration files not found!"
        Write-Host "Please move the files to $Global:scriptPath\dependencies\secpol and retry."
    }
}
elseif ($Global:operatingSystem -Like '*Windows Server 2012*')
{
    if ($checkWinServer12 -eq $True)
    {
        Invoke-Expression "secedit /configure /db `"$Global:scriptPath\dependencies\secpol\SecPolWinServer12.sdb`" /cfg `"$Global:scriptPath\dependencies\secpol\SecPolWinServer12.inf`"" # write secpol settings
        Write-Host "Secpol settings for Windows Server 2012 successfully written."
    }
    else
    {
        Write-Warning "Secpol configuration files not found!"
        Write-Host "Please move the files to $Global:scriptPath\dependencies\secpol and retry."
    }
}
elseif ($Global:operatingSystem -Like '*Windows Server 2008 R2*')
{
    if ($checkWinServer08R2 -eq $True)
    {
        Invoke-Expression "secedit /configure /db `"$Global:scriptPath\dependencies\secpol\SecPolWinServer08R2.sdb`" /cfg `"$Global:scriptPath\dependencies\secpol\SecPolWinServer08R2.inf`"" # write secpol settings
        Write-Host "Secpol settings for Windows Server 2008 R2 successfully written."
    }
    else
    {
        Write-Warning "Secpol configuration files not found!"
        Write-Host "Please move the files to $Global:scriptPath\dependencies\secpol and retry."
    }
}
elseif ($Global:operatingSystem -Like '*Windows Server* 2008*')
{
    if ($checkWinServer08 -eq $True)
    {
        Invoke-Expression "secedit /configure /db `"$Global:scriptPath\dependencies\secpol\SecPolWinServer08.sdb`" /cfg `"$Global:scriptPath\dependencies\secpol\SecPolWinServer08.inf`"" # write secpol settings
        Write-Host "Secpol settings for Windows Server 2008 successfully written."
    }
    else
    {
        Write-Warning "Secpol configuration files not found!"
        Write-Host "Please move the files to $Global:scriptPath\dependencies\secpol and retry."
    }
}


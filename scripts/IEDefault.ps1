# IEDefault.ps1 - script to reset all Internet Explorer Settings to default
#+-------------------------------------------------------------------+   
#| = : = : = : = : = : = : = : = : = : = : = : = : = : = : = : = : = |   
#|{>/-------------------------------------------------------------\<}|            
#|: | Author:  Aman Dhally                                        | :|            
#| :| Email:   amandhally@gmail.com 
#|: | Purpose: Reset Internet Explorer Setting to Default   
#| :|       
#|: |  more info: http://newdelhipowershellusergroup.blogspot.in/                                                           
#| :|           
#|: |                 Date: 23 - July - 2012 
#|: |                            16:29 
#| :|     /^(o.o)^\    Version: 1                                    |: |  
#|{>\-------------------------------------------------------------/<}| 
#| = : = : = : = : = : = : = : = : = : = : = : = : = : = : = : = : = | 
#+-------------------------------------------------------------------+ 
 
 
## Load Assembly ## 
[void][reflection.assembly]::Load("System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089") 
#-  
 
"`n" 
Write-Host  "  ============================================" -ForegroundColor 'Green' 
Write-Host  "   [ Resetting IE To Default Settings]" -ForegroundColor 'Red'  
Write-Host  "  ============================================" -ForegroundColor 'Green' 
"`n" 
###  
"`n" 
 
$arrOfficeProcs = "iexplore" 
$continue = $false 
cls 
 
#Check for open Office apps 
do { 
    $arrRunning = @() 
     
    foreach ($proc in $arrofficeProcs) { 
        if(((get-process $proc -ea SilentlyContinue) -ne $Null)){ $arrRunning += $proc }        
    } 
         
    if ($arrRunning.length -gt 0 ) {   
        $d = [System.Windows.Forms.MessageBox]::Show( 
        "There are currently one or more Internet Explorer windows Open.`n`nYou must close down all Internet explorer windows before reset it to default.",  
        "Reset IE Settings to Default...",  
        [System.Windows.Forms.MessageBoxButtons]::RetryCancel,  
        [System.Windows.Forms.MessageBoxIcon]::Warning ) 
 
        if ($d -eq [Windows.Forms.DialogResult]::Cancel) { exit } 
 
    } else {  
        $continue = $true 
        Write-Host "  No IE process are currently running"  -ForegroundColor 'Green' 
        "`n" 
        Write-Host "  Please TICK on `"Delete personal Settings`" and then click on `"Reset`" button   <====" -ForegroundColor 'Yellow'  
        "`n" 
        & RunDll32.exe InetCpl.cpl,ResetIEtoDefaults | Out-Null 
        "`n" 
        Write-Host "  ====> Please Launch Internet Explorer Now" -ForegroundColor 'Magenta'  
         
 
"`n" 
Write-Host  "  ============================================" -ForegroundColor 'Green' 
Write-Host  "   [ Resetting Done]" -ForegroundColor 'Red'  
Write-Host  "  ============================================" -ForegroundColor 'Green' 
"`n" 
     
     
    } 
 
 
} while ( $continue -eq $false ) 
 
 
#### End of the Script #### A m a n     D h a l l y ---- amandhally@gmail.com
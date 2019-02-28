# TOS - Script to display the TOS.

Write-Host "TERMS OF SERVICE:"
Write-Host "`n"
Write-Host "Scripts (C) Bryce Tsuyuki"
Write-Host "`n"
Write-Host "Your warranty is now VOID."
Write-Host "- Bryce Tsuyuki will NOT provide technical help or assistance if you are an idiot and don't follow directions."
Write-Host "- You are using these scripts at your own risk. If any real-life consequences happen as a result of this (you getting fired, hackers hacking your entire company network, etc.) Bryce Tsuyuki is NOT responsible for any damages."
Write-Host "- Essentially, any problems are your fault, not ours."
Write-Host "- If you have any concerns related to your usage of these scripts and the effects they may have, DO NOT USE THEM."
Write-Host "- Usage of these scripts is limited to those explicitly granted access by Bryce Tsuyuki."
Write-Host "- Bryce Tsuyuki reserves the right to revoke access rights at any point without prior notification or reason."
Write-Host "- Bryce Tsuyuki reserves the right to grant and disallow usage to any person or group at will."
Write-Host "- Any prior clauses regarding the website brycetsuyukipowershell.wordpress.com are struck out and rendered null and void."
Write-Host "- Bryce Tsuyuki reserves the right to override these Terms of Service at will."

$agreement = Read-Host "Do you agree to to the above TOS? [Y/n]"
if ($agreement -ne "n")
{
    Write-Host "Thank you for agreeing to the terms of service, proceeding..."
}
else 
{
    Write-Warning "You have not agreed to the terms of service, therefore you may not use these scripts."
    Write-Host "Terminating..."
    Stop-Transcript
    throw "Error: TOS not accepted."
}

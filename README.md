# Generic Cybersecurity Competition PowerShell Scripts - Generation 2 - README

#### Generation 2 - Newer, Faster, Better

Welcome to my Cybersecurity Windows Script Repository.

## **WARNING: DO NOT USE THESE SCRIPTS IN PRODUCTION.**
THEY DO NOT NECESSARILY FOLLOW BEST PRACTICES, AND IN AT LEAST ONE INSTANCE, DIRECTLY CONTRADICT THEM.

THESE SCRIPTS WERE DESIGNED TO GAIN POINTS IN A RAPID FASHION. THIS REPOSITORY SERVES AS AN ARCHIVAL DESTINATION FOR THESE SCRIPTS ONLY. I (HEXALELLOGRAM) AM NOT LIABLE FOR ANY DAMAGE INCURRED BY YOUR USING THESE SCRIPTS OR ANY CONSEQUENCES OF IT.

MOST LIKELY THESE WILL BREAK YOUR SYSTEM IN SOME WAY, SHAPE, OR FORM.

## Attribution Notice

The following scripts were downloaded from the internet years ago and integrated into these scripts. I do not remember where these scripts were found or who wrote them. If anyone manages to track that information down, I am willing to add an appropriate attribution here. The below list is based off of my memory and may not be completely comprehensive.
- `dependencies/FindHackingTools32.bat`
- `dependencies/FindHackingTools64.bat`
- `dependencies/MSRT.vbs`
- `scripts/AutoUpdate.ps1`
- `scripts/ExpiringPasswords.ps1`
- `scripts/SetPasswords.ps1`
- `scripts/UninstallQuickTime.ps1`

The following scripts were based upon a template script for downloading and installing programs that I found a long time ago. I have since lost track of that original template. If anyone finds out who wrote the orignal template, I would be willing to add an attribution here.
- `dependencies/InstallBitDefender.ps1`
- `dependencies/InstallMSE.ps1`

`CLI Git for dummies.txt` and `setup.bat` were written by [cool00geek](https://www.github.com/cool00geek).

Credit for the script `scripts\IEDefault.ps1` is included in that file and below:
```
+-------------------------------------------------------------------+   
| = : = : = : = : = : = : = : = : = : = : = : = : = : = : = : = : = |   
|{>/-------------------------------------------------------------\<}|            
|: | Author:  Aman Dhally                                        | :|            
| :| Email:   amandhally@gmail.com 
|: | Purpose: Reset Internet Explorer Setting to Default   
| :|       
|: |  more info: http://newdelhipowershellusergroup.blogspot.in/                                                           
| :|           
|: |                 Date: 23 - July - 2012 
|: |                            16:29 
| :|     /^(o.o)^\    Version: 1                                    |: |  
|{>\-------------------------------------------------------------/<}| 
| = : = : = : = : = : = : = : = : = : = : = : = : = : = : = : = : = | 
+-------------------------------------------------------------------+ 
```


## Run Instructions
1. Download the `coexist-scripts` repository anywhere on your hard drive. Please try to keep the path as short as possible due to NTFS file system limitations, so a location on the root of your hard drive is suggested.
1. Run the file `RunScripts.bat` as an administrator.
1. The scripts should chainload everything else and take care of the rest.

## Supplementary Files
- A .txt file named `ProtectUsers.txt` that specifies the users to protect as stated in the README should be placed in `files`.

	- Note about `ProtectUsers.txt` Do NOT remove the system built-in Administrator and Guest accounts.

- A .txt file named `ProtectAdmin.txt` that specifies the Administrators to protect as stated in the README should be placed in `files`.

	- Note about `ProtectAdmin.txt`: Do NOT remove the system built-in Administrator account.

## Prerequisites
- Windows XP or greater
- PowerShell 2.0 or greater (Comes installed by default on Windows 7/Server 2008 R2 and above, must be manually installed on Vista, XP, Server 2003, and Server 2008)
- .NET Framework 3.5 or greater (only necessary if upgrading to PS 2.0) 

Note: Program Installation download functionality requires PowerShell 3.0 or greater

## Windows Operating System Verified Compatibility
| Operating System        | Tested Status | Last Tested Date | Notes                                 |
| ----------------------- | ------------- | ---------------- | ------------------------------------- |
| Windows XP              | N             |                  |                                       |
| Windows Vista           | N             |                  |                                       |
| Windows 7               | Y             | 02/10/2018       |                                       |
| Windows 8               | N             |                  |                                       |
| Windows 8.1             | Y             | 02/02/2019       |                                       |
| Windows 10 Version 1507 | N             |                  |                                       |
| Windows 10 Version 1511 | N             |                  |                                       |
| Windows 10 Version 1607 | Y             | 01/11/2019       | Tested on Windows 10 LTSB, 1607       |
| Windows 10 Version 1703 | N             |                  |                                       |
| Windows 10 Version 1709 | N             |                  |                                       |
| Windows Server 2003     | N             |                  |                                       |
| Windows Server 2008     | Y             | 01/20/2018       |                                       |
| Windows Server 2008 R2  | N             |                  |                                       |
| Windows Server 2012     | N             |                  |                                       |
| Windows Server 2012 R2  | N             |                  |                                       |
| Windows Server 2016     | Y             | 02/02/2019       | Ran into issues with Active Directory |

#### Note on Compatibility:
Windows XP, Vista, and Server 2003 will never be tested.

XP, Server 2003, and Vista are out of support from Microsoft.

## Script Functionality
- Display Computer Properties
- Enable Data Execution Prevention
- Delete Unnecessary Administrators
- Delete Unnecessary Users
- Disable Remote Desktop
- Disable Unnecessary Services
- Disable Windows Feature: Telnet
- Disable Windows 10 Upgrade
- Enable Windows Update
- Find Hacking Tools
- Enable Firewall
- Reset Internet Explorer to Default Settings
- Install Firefox, Hitman Pro, Classic Shell, and Malwarebytes
- List Open Ports
- List Processes
- Remove Non Work-Related Media
- Remove Windows 10 Bloat and Telemetry
- Reset Hosts File to Default
- Examine Scheduled Tasks
- Apply Local Security Policy Settings
- Install Service Packs
- Set Expiring Passwords and User Passwords
- Examine Network Shares
- Uninstall Apple QuickTime
- Examine User Groups
- View Logs
- Disable Automatic Login
- Run Malicious Software Removal Tool (MSRT)
- Flush DNS Cache
- Enable ASLR Randomization Protection
- Apply Group Policy Settings according to CIS benchmarks (work in progress)
- Reset File System Permissions to default
- Apply Group Policy Settings according to Microsoft security baselines (work in progress)

## Known Issues
There are a lot. Some are listed in `TODO.md` but that list is not comprehensive.

## Terms of Service

PowerShell Scripts - Generation 2 

Copyright Bryce Tsuyuki

Your warranty is now VOID.

- Bryce Tsuyuki will NOT provide technical help or assistance if you are an idiot and don't follow directions.

- You are using these scripts at your own risk. If any real-life consequences happen as a result of this (you getting fired, hackers hacking your entire company network, etc.) Bryce Tsuyuki is NOT responsible for any damages.

- Essentially, any problems are your fault, not ours.

- If you have any concerns related to your usage of these scripts and the effects they may have, DO NOT USE THEM.

- Usage of these scripts is limited to those explicitly granted access by Bryce Tsuyuki.

- Bryce Tsuyuki reserves the right to revoke access rights at any point without prior notification or reason.

- Bryce Tsuyuki reserves the right to grant and disallow usage to any person or group at will.

- Any prior clauses regarding the website brycetsuyukipowershell.wordpress.com are struck out and rendered null and void.

- Bryce Tsuyuki reserves the right to override these Terms of Service at will.

## The `other` Folder
- Running `setup.bat` will download and install the necessary software for competition (Synergy, OBS, Caffeine), and open GitHub to download scripts.
- `CLI Git for dummies.txt` is a basic guide to using Git on the command line.

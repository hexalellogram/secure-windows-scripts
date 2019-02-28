'vbscript
' I. Atkin & D. Collins 14:35 25/10/2012
' Downloads and executes Microsoft's Malicious Software Removal Tool
' Inspired by Nathan's function http://vbscriptautomation.net/73/download-files-using-vbscript/

' v1.0 Initial release to Symantec Connect
' v1.1 Introduced a loop for major version numbers to give script a longer life and simplifed OS-bit check


'_______________________________________________________________________________________
' Description
' ===========
' Each month, the filename of the removal tool slightly changes which makes downloading
' a pain. This script downloads all the tools from the download folder using the naming convention
' Windows-KB890830-Vx.y by programatically cycling through the version numbers.
' The last successfully downloaded removal tool is executed.

' Executing this script permits a scripted initiation of the automatic updates process to not require
' the tools download. This bypasses the problems resulting from the automatic updates api continually
' thinking that the tool download is required.


'' Downloads KB890830 to the %temp% folder as KB890830.exe and executes
'' Progress logged to %temp%\KB890830.log
'_______________________________________________________________________________________


Option Explicit

Dim StrURL,StrFullURL,StrFile,StrLogfile,StrRun,Is32BitOS
Dim IntMajor,IntMajorMin,IntMajorMax
Dim IntMinor,IntMinorMin,IntMinorMax
Dim i,ret
Dim WshShell

IntMajorMin=5
IntMajorMax=6

IntMinorMin=1
IntMinorMax=100

Set WshShell=CreateObject("WScript.Shell")

StrFile=wshShell.ExpandEnvironmentStrings("%temp%\KB890830.exe")
StrLogFile=wshShell.ExpandEnvironmentStrings("%temp%\KB890830.Log")


WriteLog("")
WriteLog("Starting KB890830 (Malicious Software Removal Tool) Downloader")



'We need the correct download URL for the executing system OS architecture
Is32BitOS=(GetObject("winmgmts:root\cimv2:Win32_Processor='cpu0'").AddressWidth = 32)

if Is32BitOS then
  writelog("32-bit OS detected")
  StrURL="http://download.microsoft.com/download/4/a/a/4aa524c6-239d-47ff-860b-5b397199cbf8/Windows-KB890830-V"
else
  writelog("64-bit OS detected")
  StrURL="http://download.microsoft.com/download/2/C/5/2C563B99-54D9-4D85-A82B-45D3CD2F53CE/Windows-KB890830-x64-V"
end if




WriteLog("URL Root: " &  Left(StrURL,InStrRev(StrURL,"/")))

  For IntMajor=IntMajorMin to IntMajorMax

    For i = IntMinorMin to IntMinorMax

      StrFullURL=StrURL & IntMajor & "." & i & ".exe"

      ret = fDownloadFiles(StrFullURL, StrFile)
      if ret = 0 then
        WriteLog " Successfully downloaded " & Right(StrFullURL,Len(StrFullURL)-InStrRev(StrFullURL,"/")) & " as " & StrFile
      else
        WriteLog " Cannot find " & Right(StrFullURL,Len(StrFullURL)-InStrRev(StrFullURL,"/"))
      end if
    Next

  Next

WriteLog " Executing " & StrFile
ret = WshShell.Run (StrFile & " -F:Y",1,True)
writeLog " Return code: " & ret

writeLog "Script Complete"

Function fDownloadFiles(sFileURL, sTarget)
    Dim temp, objXMLHTTP, objADOStream, fso 
    'create xmlhttp object
    Set objXMLHTTP = CreateObject("MSXML2.XMLHTTP")

    'get the remote file
    objXMLHTTP.Open "GET", sFileURL, false

    'send the request
    objXMLHTTP.Send()

   
    'if the data has downloaded sucessfully
    If objXMLHTTP.Status = 200 Then
        'create binary stream object
        Set objADOStream = CreateObject("ADODB.Stream")
        objADOStream.Open

        'adTypeBinary
        objADOStream.Type = 1
        objADOStream.Write objXMLHTTP.ResponseBody

        'Set the stream position to the start
        objADOStream.Position = 0    

        'create file system object to allow the script to check for an existing file
        Set fso = Createobject("Scripting.FileSystemObject")

        'check if the file exists, if it exists then delete it
        If fso.FileExists(sTarget) Then fso.DeleteFile sTarget

        'destroy file system object
        Set fso = Nothing

        'save the ado stream to a file
        objADOStream.SaveToFile sTarget

        'close the ado stream
        objADOStream.Close

        'destroy the ado stream object
        Set objADOStream = Nothing

        temp = 0
    Else
        temp = 1
    End If

    'destroy xml http object
    Set objXMLHTTP = Nothing

    fDownloadFiles = temp
End function

Sub WriteLog(sTxt)
    'Uses strLogfile
    Dim sLogFile, fso, ts
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set ts = fso.OpenTextFile(StrLogFile, 8, True)
    ts.WriteLine Now() & " - " & sTxt
    ts.close
    Set ts = Nothing
    Set fso = Nothing
End Sub

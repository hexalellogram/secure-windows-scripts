# RemoveMedia.ps1 - script to find media files and remove them
New-Item $Global:scriptPath\results\MediaFiles.txt -type file
$media = Get-ChildItem -Path $env:SystemDrive\Users -Include *.mp3,*.mp4,*.wma,*.mov,*.wmv,*.wav,*.jpg,*.jpeg,*.png,*.gif,*.bmp,*.tiff,*.mpeg,*.m4v,*.aac,*.avi,*.asf  -Recurse # find media files
if ($media -ne $null)
{
    foreach ($i in $media)
    {
        Remove-Item $i # remove media files
        Write-Host "Removed $i"
    }
    Write-Host 'Media Files removed.'
}
else
{
    Write-Host "No media files found so none will be deleted."
}

foreach ($str in $media)
{
    Add-Content $Global:scriptPath\results\MediaFiles.txt $str
}

$path = Get-ChildItem $Global:scriptPath\results\MediaFiles.txt
Write-Host "Output of found and removed media files saved to:" $path

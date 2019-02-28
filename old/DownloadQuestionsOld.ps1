# DownloadQuestions.ps1 - Script to ask questions regarding downloading of programs

[string[]]$optionsArr = @()
$optionsArr += "Download Firefox"
$optionsArr += "Download MBAM"
$optionsArr += "Download Hitman Pro"
$optionsArr += "Download Classic Shell"

[string[]]$varsArr = @()
$varsArr += [string]$Global:firefox
$varsArr += [string]$Global:mbam
$varsArr += [string]$Global:hitmanPro
$varsArr += [string]$Global:classicShell

$longest = 0;
for($i = 0; $i -lt $optionsArr.length; $i++) # determine longest question
{
    if ($longest -lt $optionsArr[$i].length)
    {
        $longest = $optionsArr[$i].length
    }
}

# for($i = 0; $i -lt $optionsArr.length; $i++)
# {
#     $string = "Do you want to: {0,$longest}" -f $optionsArr[$i]
#     $varsArr[$i] = Read-Host $string "[Y/n]"
#     if ($varsArr[$i] -ne "n")
#     {
#         $varsArr[$i] = "Y"
#     }
#     Write-Host $optionsArr[$i] "is set as" $varsArr[$i]
# }

for($i = 0; $i -lt $optionsArr.length; $i++)
{
    $string = "Do you want to: {0,$longest}" -f $optionsArr[$i]
    [string]$input = ""
    $input = Read-Host $string "[Y/n]"
    $input = $input.toUpper()
    if ($input -ne "n")
    {
        $input = "Y"
    }
    $varsArr[$i].insert(0, $input)
    Write-Host $optionsArr[$i] "is set as" $varsArr[$i]
    Remove-Variable -Name "input"
}
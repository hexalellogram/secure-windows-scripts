# DownloadQuestions.ps1 - Script to ask questions regarding downloading of programs

# ADD NEW THINGS TO THE OPTIONS ARRAY AT THE BOTTOM OF THIS BLOCK
[string[]]$optionsArr = @()
$optionsArr += "Download Firefox"
$optionsArr += "Download MBAM"
$optionsArr += "Download Hitman Pro"

# ADD NEW THINGS TO THE HASH TABLE AT THE BOTTOM OF THIS BLOCK
$Global:downloadHashTable = New-Object System.Collections.Specialized.OrderedDictionary
$Global:downloadHashTable.Add("firefox", "")
$Global:downloadHashTable.Add("mbam", "")
$Global:downloadHashTable.Add("hitmanPro", "")

$longest = 0;
for($i = 0; $i -lt $optionsArr.length; $i++) # determine longest question
{
    if ($longest -lt $optionsArr[$i].length)
    {
        $longest = $optionsArr[$i].length
    }
}


$i = 0
$arr = @($Global:downloadHashTable.keys)
foreach ($key in $arr)
{
    $message = "Do you want to: {0,$longest}" -f $optionsArr[$i]
    $inputString = Read-Host $message "[Y/n]"
    if ($inputString -ne $null)
    {
        $inputString = $inputString.ToUpper()
    }    
    if ($inputString -ne "n")
    {
        $inputString = "Y"
    }
    $Global:downloadHashTable.$key = $inputString
    Write-Host $optionsArr[$i] "is set as" $Global:downloadHashTable.$key
    $i++
}
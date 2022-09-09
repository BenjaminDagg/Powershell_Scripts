$filePath = "C:\Program Files (x86)\Diamond Game Enterprises\RetailWebApi\appsettings.json"
$targetKey = "SecondsToWait"
$newValue = "`"10`""

if(Test-Path -Path $filePath -PathType Leaf){
    Write-Host "File found"

    $res = foreach($line in Get-Content $filePath){
        
        if($line.Contains($targetKey)){
            
            $startIndex = $line.IndexOf(":") + 1
            $totalLength = $line.Length
            $currentLength = $totalLength - $startIndex

            $currentValue = $line.Substring($startIndex,$currentLength)

            $line = $line.Replace($currentValue,$newValue)

        }
        
        $line
        
    }

    Set-Content -Path $filePath $res
}
else {
    Write-Host "Filepath $filePath not found"
}
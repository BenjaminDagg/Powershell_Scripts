
$filePath =  "$(ExtractedPath)\TestConnectionString\POS\appsettings.json"
$newConnectionString = "$(POSConnectionString)"

if((Test-Path -Path $filePath -PathType Leaf)) {
    
    #remove comments from json
    $file = (Get-Content $filePath -raw)
    $file = $file -replace '(?m)(?<=^([^"]|"[^"]*")*)//.*' -replace '(?ms)/\*.*?\*/'

    #convert to json
    $json =  $file | ConvertFrom-Json

    #replace connection string
    $json.ConnectionStrings.ApplicationConnectionString = $newConnectionString
    $json | ConvertTo-Json -depth 35 | Out-File $filePath
    
}
else {
    Write-Host "File $filePath not found"
}


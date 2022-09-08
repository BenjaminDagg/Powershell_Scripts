$filePath = "C:\Program Files (x86)\Diamond Game Enterprises\LRDealImport\LRDealImport.exe.config"

if(Test-Path -Path $filePath -PathType Leaf){
    Write-Host "File found"

    $res = foreach($line in Get-Content $filePath){
        
        if($line.Contains("(local)")){
            Write-Host $line
            $line = "<value>10.0.50.229</value>"
        }
        
        $line
        
    }

    Set-Content -Path $filePath $res
}
else {
    Write-Host "Filepath $filePath not found"
}
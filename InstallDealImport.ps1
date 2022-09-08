
#$appName = "Lottery Retail Deal Import"
#$path = "C:\Install\TPTest\OLG Lottery Version 4.0.6A\Retail\LotteryRetailDealImport\setup.exe"
#$app = Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq $appName}

#if($app){
    
    #Write-Host "$appName is installed. Uninstalling..."
    #$app.Uninstall()
#}
#else {
    #Write-Host "Software is not installed"
#}

#Install DealImport
#start-Process -Wait -FilePath $path -ArgumentList "/quiet" -PassThru

#start service
#$service = Get-Service "Transaction Portal"
#$service.start()

$Acl = Get-Acl "C:\Program Files (x86)\Diamond Game Enterprises\LRDealImport"
$Ar = New-Object System.Security.AccessControl.FileSystemAccessRule("Everyone","FullControl","ContainerInherit,ObjectInherit","None","Allow")
$Acl.SetAccessRule($Ar)
Set-Acl "C:\Program Files (x86)\Diamond Game Enterprises\LRDealImport" $Acl

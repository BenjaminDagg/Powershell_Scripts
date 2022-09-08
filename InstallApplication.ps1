
$appName = "Lottery Retail Deal Import"
$path = "C:\Install\TPTest\OLG Lottery Version 4.0.6A\Retail\LotteryRetailDealImport\setup.exe"
$app = Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq "Transaction Portal"}

if($app){
    
    Write-Host "$appName is installed. Uninstalling..."
    $app.Uninstall()
}
else {
    Write-Host "Software is not installed"
}

$service = Get-WmiObject -Class Win32_Service -Filter "Name='Transaction Portal'"
if($service){
    Write-Host "Service found"
    #Stop-Service -Name $service.Name

    #$service.delete()
}

#Install TP
#Start-Process -Wait -FilePath $path -ArgumentList "/quiet" -PassThru

#start service
#$service = Get-Service "Transaction Portal"
#$service.start()

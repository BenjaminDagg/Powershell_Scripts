$Acl = Get-Acl "C:\Program Files (x86)\Diamond Game Enterprises\LRDealImport"
$Ar = New-Object System.Security.AccessControl.FileSystemAccessRule("Everyone","FullControl","ContainerInherit,ObjectInherit","None","Allow")
$Acl.SetAccessRule($Ar)
Set-Acl "C:\Program Files (x86)\Diamond Game Enterprises\LRDealImport" $Acl
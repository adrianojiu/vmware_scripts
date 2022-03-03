#Create an user called zbx_monitor(readonly) in esxi servers.
$rootUser = 'root'
$rootPswd = 'ESXi_root_password'
$userName = 'zbx_monitor'
$Pswd = 'New_user_password'

foreach($esx in (Get-VMHost -Name ( Get-VMHost )))
{
    Connect-VIServer -Server $esx.Name -User $rootUser -Password $rootPswd -Force > $null
    Try{ $user = Get-VMHostAccount -User $userName -Server $esx.Name -ErrorAction Stop }
    Catch{ $user = New-VMHostAccount -Id $userName -Password $pswd -Server $esx.Name }

    $perm = Get-VIPermission -Principal $userName -Server $esx.Name

    if(!$perm){
        $root = Get-Folder -Name root -Server $esx.Name
        New-VIPermission -Entity $root -Principal $userName -Role readonly -Server $esx.Name
    }

    Disconnect-VIServer -Server $esx.Name -Confirm:$false
}
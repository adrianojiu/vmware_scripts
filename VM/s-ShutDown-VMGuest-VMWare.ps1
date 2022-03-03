# Shutdow guest Vm gracefull 
$vcenter_host = "vcenter.br.example.online"
Connect-VIServer -Server $vcenter_host -force

$vm = "TESTSLZSRV40OTR01"

Shutdown-VMGuest -vm $vm

Disconnect-VIServer -Server $vcenter_host -Confirm:$false

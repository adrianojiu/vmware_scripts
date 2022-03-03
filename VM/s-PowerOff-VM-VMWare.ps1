
# Poweroff VM.

$vcenter_host = "vcenter.br.example.online"
$vm = "TESTSLZSRV40OTR01"

Connect-VIServer -Server $vcenter_host -force

stop-vm -vm $vm

Disconnect-VIServer -Server $vcenter_host -Confirm:$false
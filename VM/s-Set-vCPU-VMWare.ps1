# Set VM cpu.

$vcenter_host = "vcenter.br.example.online"
Connect-VIServer -Server $vcenter_host -force

$vm = "TESTSLZSRV40OTR01"

Get-vm $vm | set-vm -NumCpu 4

Disconnect-VIServer -Server $vcenter_host -Confirm:$false

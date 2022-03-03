# Get VM disk for specific filter.
$vcenter_host = "vcenter.br.example.online"
Connect-VIServer -Server $vcenter_host -force

$vcenter_folder = "*BigIP - F5*"

Get-Folder | Where-Object {$_.name -like $vcenter_folder} | get-vm | Get-HardDisk | Select-Object Parent,Name,CapacityGB

Disconnect-VIServer -Server $vcenter_host -Confirm:$false